package com.hyvercode.springjsp.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyvercode.springjsp.model.entity.User;
import com.hyvercode.springjsp.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController {

	private UserService userService;

	public UserController(UserService userService) {
		this.userService = userService;
	}

	@GetMapping("")
	public String users(ModelMap model) {
		List<User> users = userService.all();
		model.put("users", users);

		return "users";
	}

	@GetMapping("/user")
	public String user(ModelMap model) {

		return "user";
	}

	@PostMapping("/user")
	public String user(ModelMap model, User user) {

		userService.create(user);

		return "redirect:/users";
	}

	@GetMapping("/edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") String id) {

		return "redirect:/user";
	}

	
	@GetMapping("/delete/{id}")
	public String user(ModelMap model, @PathVariable("id") String id) {

		userService.delete(id);

		return "redirect:/users";
	}

}
