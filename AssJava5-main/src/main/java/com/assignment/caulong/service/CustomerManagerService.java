package com.assignment.caulong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.assignment.caulong.models.Customer;
import com.assignment.caulong.repository.CustomerManagerRepository;

@Service
public class CustomerManagerService {

	private CustomerManagerRepository repo;
	
	@Autowired
	public CustomerManagerService(CustomerManagerRepository repo) {
		this.repo = repo;
	}
	
	public Page<Customer> findSearch(String searchName, String searchPhone, String searchAddress, int page) {
		Pageable pageable = PageRequest.of(page - 1, 10);
		
		if(searchName != null) {
			if(!searchName.isBlank())
				searchName = "%" + searchName + "%";
			else
				searchName = null;
		}
		
		if(searchPhone != null) {
			if(!searchPhone.isBlank())
				searchPhone = "%" + searchPhone + "%";
			else
				searchPhone = null;
		}
		
		if(searchAddress != null) {
			if(!searchAddress.isBlank())
				searchAddress = "%" + searchName + "%";
			else
				searchAddress = null;
		}
		
		return repo.findSearch(searchName, searchPhone, searchAddress, pageable);
	}
	
}
