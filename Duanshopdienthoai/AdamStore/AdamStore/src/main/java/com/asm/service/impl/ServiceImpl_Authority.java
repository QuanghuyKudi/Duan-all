package com.asm.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm.dao.DAO_Account;
import com.asm.dao.DAO_Authority;
import com.asm.entity.Account;
import com.asm.entity.Authority;
import com.asm.service.Service_Authority;

@Service
public class ServiceImpl_Authority implements Service_Authority{
	
	@Autowired private DAO_Authority authdao;
	@Autowired private DAO_Account accdao;
	
	@Override
	public List<Authority> findAuthoritiesOfAdministrators() {
		List<Account> accounts = accdao.getAdministrators();
		return authdao.authoritiesOf(accounts);
	}

	@Override
	public List<Authority> findAll() {
		return authdao.findAll();
	}

	@Override
	public Authority create(Authority auth) {
		return authdao.save(auth);
	}

	@Override
	public void delete(Integer id) {
		authdao.deleteById(id);
	}

	@Override
	public List<Authority> getOneByRole(String username) {
		return authdao.getOneByRole(username);
	}

	@Override
	public void deleteByUsername(String username) {
		authdao.deleteByUserName(username);
	}

	/*Summary*/
	@Override
	public Long getTotalCustomer() {
		return authdao.findAll().stream().filter(e->e.getRole().getName().equals("Customers")).count();
	}

	@Override
	public List<Authority> getAuthoritiesOfRole(String role) {
		List<Account> accounts =accdao.findAll().stream().filter(acc-> 
		acc.getAuthorities().stream().anyMatch(au -> au.getRole().getId().equals(role))).collect(Collectors.toList());
		return authdao.authoritiesOf(accounts);
	}
	
}
