package com.withJo.util.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class welcomePageController{

	@GetMapping("/")
	public String index() {
		return "index";
	}
	
}
