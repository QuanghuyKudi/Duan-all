package com.asm.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.entity.Product;
import com.asm.service.Service_Category;
import com.asm.service.Service_Product;

@Controller
@RequestMapping("shop")
public class Controller_Product {
	@Autowired
	private Service_Product productService;
	@Autowired
	private Service_Category categoryService;

	@RequestMapping({ "all", "{category}" })
	public String list(Model model, @PathVariable(value = "category") Optional<String> cid,
			@RequestParam("page") Optional<Integer> p, @RequestParam(value = "sortBy") Optional<String> sort) {
	
		boolean up = sort.orElse("").contains("Up");
		Sort sortOption = Sort.by(up ? Direction.ASC : Direction.DESC
				, sort.orElse("createDate").replace("Down","").replace("Up", ""));
		Pageable pageable = PageRequest.of(p.orElse(1)-1, 9,sortOption);
		
		Page<Product> list = cid.isPresent() ? productService.findByCategoryID(cid.get(), pageable)
				: productService.findAll(pageable);
		model.addAttribute("items", list);
		model.addAttribute("cid", cid.orElse(""));
		model.addAttribute("sortBy",sort.orElse("createDateDown"));
		model.addAttribute("title", categoryService.findById(cid.orElse("")).getName());
		return "product/list";
	}

	@GetMapping("{category}/{id}")
	public String detail(Model model, @PathVariable("id") Integer productID) {
		Product item = productService.findById(productID);
		model.addAttribute("item", item);
		model.addAttribute("title", item.getName());
		return "product/detail";
	}

	@ModelAttribute("sortList")
	public Map<String, String> get() {
		Map<String, String> map = new LinkedHashMap<>();
		map.put("Date up", "createDateUp");
		map.put("Date down", "createDateDown");
		map.put("Price up", "priceUp");
		map.put("Price down", "priceDown");
		map.put("Name up", "nameUp");
		map.put("Name down", "nameDown");
		return map;
	}
}
