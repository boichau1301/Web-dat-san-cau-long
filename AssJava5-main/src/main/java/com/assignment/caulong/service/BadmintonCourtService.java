package com.assignment.caulong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.assignment.caulong.models.BadmintonCourt;
import com.assignment.caulong.repository.BadmintonCourtRepository;

@Service
public class BadmintonCourtService {
	
	private BadmintonCourtRepository repo;

	@Autowired
	public BadmintonCourtService(BadmintonCourtRepository repo) {
		super();
		this.repo = repo;
	}
	
	public Page<BadmintonCourt> findAll(String searchName, String searchType, String searchCountry, int min, int max, String sort, int page) {
		Sort.Direction sortDir = Sort.Direction.ASC;
		String sortField = "id";
		if(sort != null) {
			sortField = "price";
			if(sort.equalsIgnoreCase("desc"))
				sortDir = Sort.Direction.DESC;
		}
		Sort sortPrice = Sort.by(sortDir, sortField);
		Pageable pageable = PageRequest.of(page - 1, 10, sortPrice);
		
		if(searchType != null)
			searchType = switch(searchType) {
				case "thuong" -> "Sân Thường";
				case "phothong" -> "Sân Phổ Thông";
				case "caocap" -> "Sân Cao Cấp";
				case "vip" -> "Sân VIP";
				default -> null;
			};

		if(searchCountry != null) {
			searchCountry = switch(searchCountry) {
				case "hanoi" -> "%Hà Nội";
				case "tphcm" -> "%Hồ Chí Minh";
				default -> null;
			};
		}
		
		if(searchName != null) {
			if(!searchName.isBlank())
				searchName = "%" + searchName + "%";
			else
				searchName = null;
		}
		
		return repo.findSearch(searchName, searchType, searchCountry, min, max, pageable);
	}

}
