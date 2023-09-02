package com.asm.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm.dao.DAO_Order;
import com.asm.dao.DAO_OrderDetail;
import com.asm.entity.Order;
import com.asm.entity.OrderDetail;
import com.asm.service.Service_Order;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;

@Service
public class ServiceImpl_Order implements Service_Order{

	@Autowired private DAO_Order dao;
	@Autowired private DAO_OrderDetail ddao;
	@Override
	public Order create(JsonNode orderData) {
		ObjectMapper mapper = new ObjectMapper();
		
		Order order = mapper.convertValue(orderData, Order.class);
		dao.save(order);
		
		TypeReference<List<OrderDetail>> type = new TypeReference<List<OrderDetail>>() {};
		List<OrderDetail> details = mapper.convertValue(orderData.get("orderDetails"), type)
				.stream().peek(d->d.setOrder(order)).collect(Collectors.toList());
		ddao.saveAll(details);
		
		return order;
	}
	@Override
	public Order findById(Long id) {
		return dao.findById(id).get();
	}
	
	@Override
	public List<Order> findByUsername(String username) {
		return dao.findByUsername(username);
	}
	/* Summary section */
	
	@Override
	public Long getToDayOrder() {
		return dao.getTodayOrder();
	}
	@Override
	public Long totalOrder() {
		return dao.count();
	}
	@Override
	public List<Object[]> getRevenueLast7Days() {
		return dao.getRevenueLast7Days();
	}
	
	@Override
	public List<Order> findNewChangeByUsername(String username) {
		List<Order> list = findByUsername(username);
		return list.stream().filter(o-> o.getStatus()>0 && !o.getRead1())
				.sorted((o1,o2) -> o2.getChangedate().compareTo(o1.getChangedate())).collect(Collectors.toList());
	}
	
	@Override
	public Order findByIdAndUsername(Long id, String username) {
		Order order = dao.findById(id).orElse(new Order());
		return !order.equals(new Order()) && order.getAccount().getUsername().equals(username)?order:new Order();
	}
	@Override
	public List<Order> findAll() {
		return dao.findAll();
	}
	@Override
	public Order update(Order order) {
		// TODO Auto-generated method stub
		return dao.save(order);
	}
	@Override
	public void delete(Long id) {
		dao.deleteById(id);
	}
	
}
