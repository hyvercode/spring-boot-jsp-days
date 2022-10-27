package com.hyvercode.springjsp.model.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "users")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {

	@Id
	@Column(name = "user_id", length = 36, nullable = false, unique = true)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String userId;
	
	@Column(name = "name", length = 60, nullable = false)
	private String name;
	
	@Column(name = "email", length = 36, nullable = false,unique = true)
	private String email;
	
	@Column(name = "birth_date")
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date birthDate;
	
	@Column(name = "is_active")
	private Boolean isActive;
}
