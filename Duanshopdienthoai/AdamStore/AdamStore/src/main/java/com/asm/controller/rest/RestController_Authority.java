package com.asm.controller.rest;

import java.io.File;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.asm.entity.Account;
import com.asm.entity.Authority;
import com.asm.service.Service_Account;
import com.asm.service.Service_Authority;
import com.asm.service.Service_Upload;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@CrossOrigin("*")
@RestController
@RequestMapping("rest")
public class RestController_Authority {
	@Autowired private Service_Authority authService;
	
	@GetMapping("authorities")
	public List<Authority> findAll(@RequestParam("admin")Optional <Boolean> admin,@RequestParam("role")Optional <String> role){
		if(admin.isPresent()) {
			return authService.findAuthoritiesOfAdministrators();
		}else if(role.isPresent()) {
			return authService.getAuthoritiesOfRole(role.get());
		}
		return authService.findAll();
	}
	
	@GetMapping("authoritiesOne")
	public List<Authority> getOneByRole(@RequestParam("username")String username){
		return authService.getOneByRole(username);
	}
	
	@PostMapping("authorities")
	public Authority post(@RequestBody Authority auth) {
		return authService.create(auth);
	}
	
	@DeleteMapping("authorities/{id}")
	public void delete(@PathVariable("id") Integer id) {
		authService.delete(id);
	}
	
	@DeleteMapping("authoritiesOne/{username}")
	public void deleteByUsername(@PathVariable("username") String username) {
		System.out.println("username del: "+username);
		authService.deleteByUsername(username);
	}
	
}
 