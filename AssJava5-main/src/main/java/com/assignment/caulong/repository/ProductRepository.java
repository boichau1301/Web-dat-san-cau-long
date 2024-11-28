package com.assignment.caulong.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.assignment.caulong.models.Product;

public interface ProductRepository extends JpaRepository<Product, String> {
	
	

}
