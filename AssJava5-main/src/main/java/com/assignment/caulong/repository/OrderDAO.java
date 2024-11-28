package com.assignment.caulong.repository;



import org.springframework.data.jpa.repository.JpaRepository;

import com.assignment.caulong.models.Order;

public interface OrderDAO extends JpaRepository<Order, Long>{
	
}
