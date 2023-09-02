package com.asm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.asm.entity.Order;
import com.fasterxml.jackson.databind.JsonNode;


@Service
public interface Service_Order {
	Order create(JsonNode orderData);

	Order findById(Long id);
	
	List<Order> findAll();

	List<Order> findByUsername(String username);
	
	Order findByIdAndUsername(Long id, String username);

	Long getToDayOrder();

	Long totalOrder();
	
	Order update(Order order);

	void delete(Long id);

	List<Object[]> getRevenueLast7Days();
	
	public List<Order> findNewChangeByUsername(String username);
}
