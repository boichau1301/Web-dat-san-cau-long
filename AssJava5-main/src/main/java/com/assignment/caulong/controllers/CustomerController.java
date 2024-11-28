package com.assignment.caulong.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.assignment.caulong.models.Customer;
import com.assignment.caulong.repository.CustomerRepository;

//@RestController

@Controller
public class CustomerController {
	private final CustomerRepository cusRepository;

	public CustomerController(CustomerRepository cusRepository) {
		super();
		this.cusRepository = cusRepository;
	}
	
	@GetMapping("/customer/giohang")
	public String gioHang(Principal principal) {
		if(principal!=null) {
		System.out.println(principal.getName());
		}
		return "giohang";
	}
	
	@GetMapping("/thongtin")
	public String thongtin() {
		return "thongtincanhan";
	}


//	@GetMapping("/customer/{id}")
//	public String getCustomerById(@PathVariable int id, Model model) {
//		Customer cus = cusRepository.findById(id).orElse(null);
//		if (cus == null) {
//			return "errorNotFound";
//		}
//		System.out.println(cus.getName());
//		model.addAttribute("customer", cus);
//		return "/KhachHang/ChiTietKhachHang";
//	}


	@GetMapping("/customers")
	public String getAllCustomer(Model model) {
		List<Customer> customers = cusRepository.findAll();
		model.addAttribute("customers", customers);
		return "customers";
	}

	@GetMapping("/customer/edit/{id}")
	public String initCustomerCreateForm(@PathVariable int id,Model model,@ModelAttribute() Customer customer) {
		cusRepository.save(customer);
		return "KhachHang/ChiTietKhachHang";
	}

	@PostMapping("/customer/create")
	public String createCustomer(@ModelAttribute Customer customer) {
		cusRepository.save(customer);
		return "KhachHang/ChiTietKhachHang";
	}

	@GetMapping("customer/login")
	public String Login(Model model)
	{
		Customer cus=new Customer();
		model.addAttribute("user",cus);
		return "DangNhap";
	}

	@PostMapping("/customer/login")
	public String PostLogin() {
		return "redirect:/";
	}

}
// REST API
//	@GetMapping("/customer/{id}")
//	public Customer findCustomerById(@PathVariable Integer id) {
//		return cusRepository.findById(id).orElse(null);
//	}
//	@GetMapping("/customers")
//	public List<Customer> findAllCustomerById() {
//		return cusRepository.findAll();
//	}
//	@PostMapping("/customer/create")
//	public Customer createCus(@RequestBody Customer cus) {
//		return cusRepository.save(cus);
//	}
