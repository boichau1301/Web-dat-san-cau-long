package com.assignment.caulong.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.assignment.caulong.models.BadmintonCourt;

public interface BadmintonCourtRepository extends JpaRepository<BadmintonCourt, Integer> {
	
	@Query("select bc from BadmintonCourt bc "
			+ "where bc.name like coalesce(:searchName, bc.name) "
			+ "and bc.type like coalesce(:searchType, bc.type) "
			+ "and bc.address like coalesce(:searchCountry, bc.address) "
			+ "and bc.price between :min and :max")
	Page<BadmintonCourt> findSearch(String searchName, String searchType, String searchCountry, int min, int max, Pageable pageable);
	List<BadmintonCourt> findByPriceIsNull();
	List<BadmintonCourt> findByPriceBetween(double min, double max);
	List<BadmintonCourt> findByPrice(double price);
	List<BadmintonCourt> findByAddressContaining(String address);
	List<BadmintonCourt> findByTypeContaining(String type);
	
}
