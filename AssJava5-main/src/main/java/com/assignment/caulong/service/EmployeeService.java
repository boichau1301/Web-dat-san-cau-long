package com.assignment.caulong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.assignment.caulong.models.Employee;
import com.assignment.caulong.repository.EmployeeRepository;

@Service
public class EmployeeService {
	
	private EmployeeRepository repo;

	@Autowired
	public EmployeeService(EmployeeRepository repo) {
		this.repo = repo;
	}

	public Employee getByUserName(String userName) {
		return repo.findByUsername(userName);
	}

	public Employee save(Employee emp) {
		return repo.save(emp);
	}
	
	public Page<Employee> findSearch(int page) {
		Pageable pageable = PageRequest.of(page - 1, 10);
		return repo.findAll(pageable);
	}
}
