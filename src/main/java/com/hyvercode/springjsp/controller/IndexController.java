package com.hyvercode.springjsp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class IndexController {

	@GetMapping("")
	public String showLoginPage(ModelMap model) {
		model.put("name", "Spring boot + JSP + H2 tutorial, by <a href='https://www.hyvercode.com' _target='blank' >hyvercode.com</a>");
		return "index";
	}

}
