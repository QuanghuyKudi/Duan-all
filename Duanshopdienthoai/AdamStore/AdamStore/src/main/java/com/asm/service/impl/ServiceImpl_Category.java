package com.asm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm.dao.DAO_Category;
import com.asm.entity.Category;
import com.asm.service.Service_Category;

@Service
public class ServiceImpl_Category implements Service_Category{
	@Autowired private DAO_Category cateDao;

	@Override
	public List<Category> findAll() {
		return cateDao.findAll();
	}
	
	@Override
	public Category findById(String categoryID) {
		return cateDao.findById(categoryID).orElse(new Category(null,"All",null));
	}

	@Override
	public Category create(Category category) {
		return cateDao.save(category);
	}

	@Override
	public Category update(Category category) {
		// TODO Auto-generated method stub
		return cateDao.save(category);
	}

	@Override
	public void delete(String id) {
		cateDao.deleteById(id);
		
	}
}
