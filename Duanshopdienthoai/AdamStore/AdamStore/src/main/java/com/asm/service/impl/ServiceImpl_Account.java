package com.asm.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asm.dao.DAO_Account;
import com.asm.entity.Account;
import com.asm.service.Service_Account;

@Service
public class ServiceImpl_Account implements Service_Account{
	@Autowired private DAO_Account accDao;

	@Override
	public Account findById(String username) {
		return accDao.findById(username).orElse(new Account());
	}

	@Override
	public List<Account> getAdministrators() {
		return accDao.getAdministrators();
	}

	@Override
	public List<Account> findAll() {
		return accDao.findAll();
	}

	@Override
	public Account create(Account account) {
		return accDao.save(account);
	}

	@Override
	public Account update(Account account) {
		return accDao.save(account);
	}
	/*Summary*/

	@Override
	public Long getTotalAccount() {
		return accDao.count();
	}

	@Override
	public List<Object[]> top10Customer() {
		return accDao.top10Customer();
	}

	@Override
	public void delete(String id) {
		accDao.deleteById(id);	
	}

	@Override
	public List<Account> getAccountByRole(String role) {
		return accDao.findAll().stream().filter(acc-> 
		acc.getAuthorities().stream().anyMatch(au -> au.getRole().getId().equals(role))).collect(Collectors.toList());
	}


	
}
