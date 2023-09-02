package com.asm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.asm.entity.Account;


@Service
public interface Service_Account {
	Account findById(String username);

	List<Account> getAdministrators();

	List<Account> findAll();
	
	List<Account> getAccountByRole(String role);

	Account create(Account account);

	Account update(Account account);

	void delete(String id);
	
	Long getTotalAccount();

	List<Object[]> top10Customer();





	


}
