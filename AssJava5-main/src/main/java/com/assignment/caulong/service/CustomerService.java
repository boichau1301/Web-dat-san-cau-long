package com.assignment.caulong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment.caulong.models.Customer;
import com.assignment.caulong.repository.CustomerRepository;

@Service
public class CustomerService {
	private CustomerRepository cusRepo;
	
	@Autowired
	public CustomerService(CustomerRepository cusRepo) {
		super();
		this.cusRepo = cusRepo;
	}

	public Customer getByUsername(String username) {
		return cusRepo.findByUsername(username);
	}
	public Customer save(Customer customer) {
		return cusRepo.save(customer);
	}
}
