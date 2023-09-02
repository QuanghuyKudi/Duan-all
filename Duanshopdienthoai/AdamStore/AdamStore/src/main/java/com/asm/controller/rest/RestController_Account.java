package com.asm.controller.rest;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.asm.entity.Account;
import com.asm.service.Service_Account;

@CrossOrigin("*")
@RestController
@RequestMapping("rest")
public class RestController_Account {
	@Autowired private Service_Account accountService;
	
	@GetMapping("accounts")
	public List<Account>getAccounts(@RequestParam("admin")Optional <Boolean>admin ,@RequestParam("role")Optional <String> role){
		if(admin.isPresent()) {
			return accountService.getAdministrators();
		}else if(role.isPresent()) {
			return accountService.getAccountByRole(role.get());
		}
		return accountService.findAll();
	}
	
	@GetMapping("account")
	public Account getAccount(HttpServletRequest request){	
		return accountService.findById(request.getRemoteUser());
	}
	
	@PostMapping("accountsManage")
	public Account create(@RequestBody Account account) {
		return accountService.create(account);
	}
	
	@PutMapping("accounts/{id}")
	public Account update(@RequestBody Account account,@PathVariable("id")String username) {
		return accountService.update(account);
	}
	
	@DeleteMapping("accounts/{id}")
	public void delete(@PathVariable("id")String id) {
		accountService.delete(id);
	}
}
