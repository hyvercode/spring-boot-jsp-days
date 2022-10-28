package com.hyvercode.springjsp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.hyvercode.springjsp.model.entity.User;
import com.hyvercode.springjsp.repository.UserRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserService {

	private UserRepository userRepository;

	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	public Page<User> findPaginated(Pageable pageable) {
		
		return userRepository.findAll(pageable);
	}

	public List<User> all() {
		Iterable<User> iterable = userRepository.findAll();
		List<User> uList = new ArrayList<>();
		iterable.forEach(user -> uList.add(User.builder().userId(user.getUserId()).name(user.getName())
				.email(user.getEmail()).birthDate(user.getBirthDate()).isActive(user.getIsActive()).build()));

		return uList;
	}

	public User create(User user) {
		User userStore = User.builder().name(user.getName()).email(user.getEmail()).birthDate(user.getBirthDate())
				.isActive(user.getIsActive()).build();
		return userRepository.save(userStore);

	}

	public User show(String id) {

		return userRepository.findByUserId(id);
	}

	public User update(User user) {

		User userStore = User.builder().userId(user.getUserId()).name(user.getName()).email(user.getEmail())
				.birthDate(user.getBirthDate()).isActive(user.getIsActive()).build();

		return userRepository.save(userStore);
	}

	public void delete(String id) {
		userRepository.deleteById(id);
	}

}
