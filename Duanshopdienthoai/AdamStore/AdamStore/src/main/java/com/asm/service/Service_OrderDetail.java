package com.asm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.asm.entity.Order;
import com.asm.entity.OrderDetail;

@Service
public interface Service_OrderDetail {

	Double getTodayIncome();

	Double getTotalIncome();
	
	List<OrderDetail> findByOrderId(Long id);
}
