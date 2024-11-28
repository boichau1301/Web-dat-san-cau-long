package com.assignment.caulong.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.assignment.caulong.models.CourtOrder;
import com.assignment.caulong.models.Customer;
import com.assignment.caulong.repository.CustomerRepository;

@RestController
public class RestCustomerController {
	private final CustomerRepository cusRepository;

	public RestCustomerController(CustomerRepository cusRepository) {
		super();
		this.cusRepository = cusRepository;
	}
	@GetMapping("customer/{id}/orders")
	public List<CourtOrder> getOrders(@PathVariable Integer id){
		Customer cus= cusRepository.findById(id).orElse(null);
		if(cus==null) {
			return null;
		}
		return cus.getOrders();
	}
}
