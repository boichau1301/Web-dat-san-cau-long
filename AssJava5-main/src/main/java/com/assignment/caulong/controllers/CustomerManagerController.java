package com.assignment.caulong.controllers;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.caulong.models.Customer;
import com.assignment.caulong.models.Employee;
import com.assignment.caulong.repository.CustomerManagerRepository;
import com.assignment.caulong.service.CustomerManagerService;
import com.assignment.caulong.util.UrlString;

@Controller
@RequestMapping("/employee")
public class CustomerManagerController {
	
	private CustomerManagerRepository repo;
	private CustomerManagerService service;
	
	@Autowired
	public CustomerManagerController(CustomerManagerRepository repo, CustomerManagerService service) {
		this.repo = repo;
		this.service = service;
	}
	
	@GetMapping("/customerManager")
	public String customer(Model model,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@RequestParam(value = "searchName", required = false) String searchName,
			@RequestParam(value = "searchPhone", required = false) String searchPhone,
			@RequestParam(value = "searchAddress", required = false) String searchAddress) {
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("searchName", searchName);
		params.put("searchPhone", searchPhone);
		params.put("searchAddress", searchAddress);
		String urlString = UrlString.param(model, params);
		model.addAttribute("urlString", urlString);
		
		model.addAttribute("customer", new Customer());
		if (page < 1)
            return "redirect:/employee/customerManager";
		
		Page<Customer> list = service.findSearch(searchName, searchPhone, searchAddress, page);
		model.addAttribute("customers", list);
		model.addAttribute("currentPage", page);
		return "nhanvien/quanlykhachhang";
	}
	
	@GetMapping("/customerManager/{id}")
	public String editCustomer(Model model,
			@PathVariable("id") Optional<Integer> id,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@RequestParam(value = "searchName", required = false) String searchName,
			@RequestParam(value = "searchPhone", required = false) String searchPhone,
			@RequestParam(value = "searchAddress", required = false) String searchAddress) {
		Map<String, Object> params = new LinkedHashMap<>();
		params.put("searchName", searchName);
		params.put("searchPhone", searchPhone);
		params.put("searchAddress", searchAddress);
		String urlString = UrlString.param(model, params);
		model.addAttribute("urlString", urlString);
		if (page < 1)
            return "redirect:/employee/customerManager/" + id.get();

		Page<Customer> list = service.findSearch(searchName, searchPhone, searchAddress, page);
		Optional<Customer> customerFound = repo.findById(id.orElse(-1));
		Customer customer = new Customer();
		if(customerFound.isPresent())
			customer = customerFound.get();
		else
			model.addAttribute("errorNotFound", "Không tìm thấy khách hàng " + id.orElse(-1));
		
		model.addAttribute("customer", customer);
		model.addAttribute("customers", list);
		model.addAttribute("currentPage", page);
		return "nhanvien/quanlykhachhang";
	}

	@PostMapping("/customerUpdate")
	public String updateCustomer(Model model, 
			@ModelAttribute("customer") Customer customer) {
		Optional<Customer> found = repo.findById(customer.getId());
		if(found.isPresent())
			repo.save(customer);
		return "redirect:/employee/customerManager";
	}

	@GetMapping("/customerRemove/{id}")
	public String removeCustomer(Model model, 
			@PathVariable("id") Optional<Integer> id) {
		if (!id.isEmpty()) {
			Optional<Customer> customer = repo.findById(id.orElse(-1));
			if (customer.isPresent()) {
				repo.delete(customer.get());
				model.addAttribute("message", "Xóa khách hàng thành công");
			} else {
				model.addAttribute("message", "Xóa khách hàng thất bại");
			}
		} else {
			model.addAttribute("message", "Xóa khách hàng thất bại");
		}
		return "redirect:/employee/customerManager";
	}

}
