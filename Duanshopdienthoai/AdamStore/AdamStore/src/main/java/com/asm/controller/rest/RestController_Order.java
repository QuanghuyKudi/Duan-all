package com.asm.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.asm.entity.Order;
import com.asm.entity.OrderDetail;
import com.asm.entity.Product;
import com.asm.service.Service_Order;
import com.asm.service.Service_OrderDetail;
import com.fasterxml.jackson.databind.JsonNode;

@CrossOrigin("*")
@RestController
@RequestMapping("rest/orders")
public class RestController_Order {
	@Autowired private Service_Order ordertService;
	@Autowired private Service_OrderDetail detailService;
	
	@PostMapping()
	public Order create(@RequestBody JsonNode orderData) {
		return ordertService.create(orderData);
	}
	
	@GetMapping()
	public List<Order>getAll(){
		return ordertService.findAll().stream().sorted((o1,o2) -> o2.getId().compareTo(o1.getId())).toList();
	}
	
	@GetMapping("{id}")
	public Order getOne(@PathVariable("id")Long id) {
		return ordertService.findById(id);
	}
	@GetMapping("detail/{id}")
	public List<OrderDetail> getlist(@PathVariable("id")Long id) {
		return detailService.findByOrderId(id);
	}
	
	
	@PutMapping("{id}")
	public Order update(@RequestBody Order product,@PathVariable("id")Long id) {
		return ordertService.update(product);
	}
	
	@DeleteMapping("{id}")
	public void delete(@PathVariable("id")Long id) {
		ordertService.delete(id);
	}
}
