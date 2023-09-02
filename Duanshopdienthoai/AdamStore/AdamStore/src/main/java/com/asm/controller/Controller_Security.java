package com.asm.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asm.entity.Account;
import com.asm.entity.Authority;
import com.asm.entity.Order;
import com.asm.entity.Role;
import com.asm.service.Service_Account;
import com.asm.service.Service_Authority;
import com.asm.service.Service_Order;

@Controller
@RequestMapping("security")
public class Controller_Security {
	@Autowired
	Service_Account accountS;
	@Autowired
	Service_Authority authorityS;
	@Autowired
	private Service_Order orderService;

	@GetMapping({ "login/form" })
	public String login(Model model) {
		model.addAttribute("title", "Login");
		return "security/login";
	}

	@GetMapping({ "login/formz" })
	public String login2(Model model) {
		model.addAttribute("message", "Please login to continue");
		model.addAttribute("title", "Login");
		return "security/login";
	}

	@GetMapping("login/success")
	public String loginSuccess(Model model) {
		model.addAttribute("message", "Successful login");
		model.addAttribute("title", "Login Success");
		return "security/login";
	}

	@GetMapping("login/error")
	public String loginError(Model model) {
		model.addAttribute("message", "Incorrect account information");
		model.addAttribute("title", "Login");
		return "security/login";
	}

	@GetMapping("unauthorized")
	public String unauthorized(Model model) {
		model.addAttribute("message", "Access is denied");
		model.addAttribute("title", "Access Denied");
		return "security/unauthorized";
	}

	@GetMapping("logoff/success")
	public String logoffSuccess(Model model) {
		model.addAttribute("title", "Login");
		model.addAttribute("message", "You are logged out!");
		return "security/login";
	}

	@RequestMapping("login2/success")
	public String loginOauth2(OAuth2AuthenticationToken oauth2) {
		String email = oauth2.getPrincipal().getAttribute("email");
		String name = oauth2.getPrincipal().getAttribute("name");
		String password = Long.toHexString(System.currentTimeMillis());
		Account account = accountS.findById(email);
		String[] roles = null;
		if (account.getUsername() == null) {
			account.setEmail(email);
			account.setUsername(email);
			account.setFullname(name);
			account.setPassword(password);
			account.setPhoto("no_avatar.png");
			accountS.create(account);
			authorityS.create(new Authority(null, account, new Role("CUST", "Customers", null)));
			roles = new String[] { "CUST" };
		} else {
			roles = account.getAuthorities().stream().map(el -> el.getRole().getId()).collect(Collectors.toList())
					.toArray(new String[0]);
		}

		UserDetails user = User.withUsername(email).password(password).roles(roles).build();
		Authentication authentication = new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return "forward:/security/login/success";
	}

	@GetMapping("/profile")
	public String doGetProfile(Model model, HttpServletRequest request) {
		String username = request.getRemoteUser();
		Account account = accountS.findById(username);
		model.addAttribute("user", account);
		List<Order> orders = orderService.findByUsername(username).stream()
				.sorted((o1, o2) -> o2.getId().compareTo(o1.getId())).collect(Collectors.toList());
		model.addAttribute("orders", orders);
		model.addAttribute("totalAmount",
				orders.stream().mapToDouble(
						o -> o.getOrderDetails().stream().mapToDouble(d -> d.getPrice() * d.getQuantity()).sum())
						.sum());
		return "security/profile";
	}
}
