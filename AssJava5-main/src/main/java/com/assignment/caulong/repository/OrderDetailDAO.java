package com.assignment.caulong.repository;



import org.springframework.data.jpa.repository.JpaRepository;

import com.assignment.caulong.models.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
}