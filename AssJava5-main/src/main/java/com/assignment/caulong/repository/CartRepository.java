package com.assignment.caulong.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.assignment.caulong.models.Cart;
import com.assignment.caulong.models.CartId;

public interface CartRepository extends JpaRepository<Cart, CartId> {
	List<Cart> findByCustomerId(Integer customerId);
	
	 Optional<Cart> findByCustomerIdAndProductMaSanPham(Integer customerId, String productId);
}
