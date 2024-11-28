package com.assignment.caulong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.assignment.caulong.models.CourtOrder;
import com.assignment.caulong.repository.CourtOrderRepository;

@Service
public class CourtOrderService {
	
	private CourtOrderRepository repo;

	@Autowired
	public CourtOrderService(CourtOrderRepository repo) {
		super();
		this.repo = repo;
	}
	
	public Page<CourtOrder> findAll(String searchCustomer, String searchCourt, String status, int min, int max, int page) {
		Pageable pageable = PageRequest.of(page - 1, 10);
		
		if(searchCustomer != null) {
			if(!searchCustomer.isBlank())
				searchCustomer = "%" + searchCustomer + "%";
			else
				searchCustomer = null;
		}
		
		if(searchCourt != null) {
			if(!searchCourt.isBlank())
				searchCourt = "%" + searchCourt + "%";
			else
				searchCourt = null;
		}

		if(status != null) {
			status = switch(status) {
				case "thanhtoan" -> "Đã thanh toán";
				case "xuly" -> "Đang xử lý";
				default -> null;
			};
		}
		
		return repo.findSearch(searchCustomer, searchCourt, status, min, max, pageable);
	}

}
