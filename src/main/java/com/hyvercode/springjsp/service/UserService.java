package com.hyvercode.springjsp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hyvercode.springjsp.model.entity.User;
import com.hyvercode.springjsp.repository.UserRepository;

@Service
public class UserService {

	private UserRepository repository;

	public UserService(UserRepository repository) {
		this.repository = repository;
	}

	public List<User> all() {
		Iterable<User> iterable = repository.findAll();
		List<User> uList = new ArrayList<>();
		iterable.forEach(user -> uList
				.add(User.builder().userId(user.getUserId()).name(user.getName()).email(user.getEmail()).build()));

		return uList;
	}

	public User create(User user) {
		User userStore = User.builder().userId(user.getUserId()).name(user.getName()).email(user.getEmail()).build();

		return repository.save(userStore);
	}

	public void delete(String id) {
		repository.deleteById(id);
	}

}
