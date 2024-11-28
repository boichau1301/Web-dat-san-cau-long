package com.assignment.caulong.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.assignment.caulong.models.Customer;

@Repository
public interface CustomerManagerRepository extends JpaRepository<Customer, Integer>{

	@Query("select c from Customer c "
			+ "where c.name like coalesce(:searchName, c.name) "
			+ "and c.phoneNumber like coalesce(:searchPhone, c.phoneNumber) "
			+ "and c.address = coalesce(:searchAddress, c.address)")
	Page<Customer> findSearch(String searchName, String searchPhone, String searchAddress, Pageable pageable);
	
}
