package com.asm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.asm.entity.Role;


@Service
public interface Service_Role {
	List<Role> findAll();
}
