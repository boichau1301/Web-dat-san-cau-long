package com.assignment.caulong.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.assignment.caulong.models.Promotion;

public interface PromotionRepository extends JpaRepository<Promotion, Integer> {
	
	List<Promotion> findByStartAfter(Date start);
	List<Promotion> findByPercentageBetween(double min, double max);

}
