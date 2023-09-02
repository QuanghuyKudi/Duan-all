package com.asm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.asm.service.Service_Category;
import com.asm.service.Service_Order;

@Component
public class GlobalInterceptor implements HandlerInterceptor{
	@Autowired private Service_Category cateService;
	@Autowired private Service_Order orderService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		request.setAttribute("cates", cateService.findAll());
		String username = request.getRemoteUser();
		if(username!=null) {
			request.setAttribute("news",orderService.findNewChangeByUsername(username));
		}
	}
}
