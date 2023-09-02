package com.asm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.asm.entity.Authority;


@Service
public interface Service_Authority {
	List<Authority> findAuthoritiesOfAdministrators();

	List<Authority> findAll();
	
	List<Authority> getAuthoritiesOfRole(String role);

	Authority create(Authority auth);

	void delete(Integer id);

	List<Authority> getOneByRole(String username);

	void deleteByUsername(String username);

	Long getTotalCustomer();

}
