package com.hyvercode.springjsp.controller;

import java.util.List;

import javax.servlet.ServletException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyvercode.springjsp.model.entity.User;
import com.hyvercode.springjsp.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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

		try {
			userService.create(user);
		} catch (Exception e) {
			log.error("Craate user {}" + e.getMessage());
			model.put("error", "Internal server error");

			return "redirect:/users";
		}

		return "redirect:/users";
	}

	@GetMapping("/user/{id}")
	public String edit(ModelMap model, @PathVariable("id") String id) {

		User user = userService.show(id);
		if (user == null) {
			model.put("error", "User not found");
			return "redirect:/users";

		}
		model.put("user", user);

		return "user-edit";
	}

	@PostMapping("/user/update")
	public String update(ModelMap model, User user) {

		userService.update(user);

		return "redirect:/users";
	}

	@GetMapping("/delete/{id}")
	public String user(ModelMap model, @PathVariable("id") String id) {

		User user = userService.show(id);
		if (user == null) {
			model.put("error", "User not found");
			return "redirect:/users";
		}

		userService.delete(id);

		return "redirect:/users";
	}

}
