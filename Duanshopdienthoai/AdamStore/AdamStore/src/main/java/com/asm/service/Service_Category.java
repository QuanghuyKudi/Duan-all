package com.asm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.asm.entity.Category;
import com.asm.entity.Product;

@Service
public interface Service_Category {

	List<Category> findAll();
	
	Category findById(String categoryID);
	
	Category create(Category category);

	Category update(Category category);

	void delete(String id);
}
