package com.assignment.caulong.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.assignment.caulong.models.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, String> {
	
	Employee findByUsername(String userName);
	List<Employee> findByNameIgnoreCaseContaining(String name);
	List<Employee> findByRoleLike(String role);

}
