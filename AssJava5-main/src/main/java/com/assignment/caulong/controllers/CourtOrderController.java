package com.assignment.caulong.controllers;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.caulong.models.CourtOrder;
import com.assignment.caulong.repository.CourtOrderRepository;
import com.assignment.caulong.service.CourtOrderService;
import com.assignment.caulong.util.UrlString;

@Controller
@RequestMapping("/employee")
public class CourtOrderController {

	private CourtOrderRepository courtOrderRepo;
	private CourtOrderService courtOrderService;
	
	@Autowired
	public CourtOrderController(CourtOrderRepository repo, CourtOrderService service) {
		this.courtOrderRepo = repo;
		this.courtOrderService = service;
	}
	
	@GetMapping("courtOrderManager")
	public String courtOrder(Model model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "searchCustomer", required = false) String searchCustomer,
			@RequestParam(value = "searchCourt", required = false) String searchCourt,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "minTime", required = false, defaultValue = "6") int minTime,
			@RequestParam(value = "maxTime", required = false, defaultValue = "22") int maxTime) { 
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("searchCustomer", searchCustomer);
		params.put("searchCourt", searchCourt);
		params.put("status", status);
		params.put("minTime", minTime);
		params.put("maxTime", maxTime);
		String urlString = UrlString.param(model, params);
		model.addAttribute("urlString", urlString);
		
		if (page < 1)
            return "redirect:/employee/courtOrderManager" + urlString;
		
		Page<CourtOrder> list = courtOrderService.findAll(searchCustomer, searchCourt, status, minTime, maxTime, page);
		System.out.println(list.getTotalPages());
		model.addAttribute("courtOrders", list);
		model.addAttribute("currentPage", page);
		return "nhanvien/quanlydatsan";
	}
	
	@GetMapping("courtOrderManager/{id}")
	public String courtOrderDetail(Model model, 
			@PathVariable("id") int id) { 
		CourtOrder courtOrder = courtOrderRepo.findById(id).orElse(null);
		if(courtOrder == null)
			model.addAttribute("errorNotFound", "Không tìm thấy thông tin đặt sân " + id);
		model.addAttribute("courtOrderDetail", courtOrder);
		return "nhanvien/chitietdondatsan";
	}
	
	@GetMapping("courtOrderChecked/{id}")
	public String checkedOrder(Model model, 
			@PathVariable("id") int id) { 
		CourtOrder courtOrder = courtOrderRepo.findById(id).orElse(null);
		if(courtOrder == null)
			return "redirect:/employee/courtOrderManager";
		courtOrder.setStatus("Đã thanh toán");
		courtOrderRepo.save(courtOrder);
		return "nhanvien/quanlydatsan";
	}

}
