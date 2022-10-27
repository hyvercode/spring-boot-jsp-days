package com.hyvercode.springjsp.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.hyvercode.springjsp.model.entity.User;

@Repository
public interface UserRepository extends CrudRepository<User, String>{
	
	User findByUserId(String userId);

}
