package com.asm.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm.dao.DAO_Order;
import com.asm.dao.DAO_OrderDetail;
import com.asm.entity.OrderDetail;
import com.asm.service.Service_OrderDetail;
import com.asm.util.XDate;

@Service
public class ServiceImpl_OrderDetail implements Service_OrderDetail{

	@Autowired private DAO_OrderDetail daoDetail;
	@Autowired private XDate xdate;
	@Autowired private DAO_Order dao;
		
	@Override
	public Double getTodayIncome() {
		return daoDetail.findAll().stream().filter(e->e.getOrder().getCreateDate().toString().equals(xdate.convertToPattern(new Date(), "yyyy-MM-dd"))).mapToDouble(item->item.getPrice()*item.getQuantity()).sum();
	}
	@Override
	public Double getTotalIncome() {
		return daoDetail.findAll().stream().mapToDouble(item->item.getPrice()*item.getQuantity()).sum();
	}
	@Override
	public List<OrderDetail> findByOrderId(Long id) {
		return dao.findById(id).get().getOrderDetails();
	}

}
