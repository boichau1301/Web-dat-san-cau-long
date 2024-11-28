package com.assignment.caulong.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.assignment.caulong.models.BadmintonCourt;
import com.assignment.caulong.models.Customer;
import com.assignment.caulong.models.User;
import com.assignment.caulong.repository.BadmintonCourtRepository;
import com.assignment.caulong.service.CustomerService;
import com.assignment.caulong.service.EmployeeService;
import com.assignment.caulong.service.LoginService;

@Controller
public class LoginController {
	
	private LoginService loginService;
	private CustomerService cusService;
	private EmployeeService empService;
	
	@Autowired
	BadmintonCourtRepository badmintonRepo;
	
	public LoginController(LoginService loginService,CustomerService cusService,EmployeeService empService) {
		super();
		this.loginService = loginService;
		this.cusService= cusService;
		this.empService=empService;
	}
	
//	@GetMapping("customer/login")
//	public String getLogin(Model model)
//	{
//		User user=new User();
//		model.addAttribute("user", user);
//		return "DangNhap";
//	}
	
	@GetMapping("customer/signup")
	public String getSignUp(Model model)
	{
		Customer cus=new Customer();
		model.addAttribute("customer", cus);
		return "DangKy";
	}
	
	@GetMapping("/productDetail/{id}")
	public String GetInformation(@PathVariable int id,Model model)
	{
		BadmintonCourt sanCau=new BadmintonCourt();
		//Câu lệnh lấy sân có id tương ứng
		model.addAttribute("san",sanCau);
		return "ChiTietSan";
	}
	
	@PostMapping("/login") 
	public String GetLogin(Model model,@ModelAttribute() User user) 
	{
		return "redirect:/";
//		if(loginService.CheckLogin(user.getUsername(), user.getPassword()))
//		{
//			return "redirect:/";
//		}
//		else
//		{
//			model.addAttribute("Message", "Login failed, there is an error during the login process");
//			return "redirect:/login";
//		}
		
	}
	
	@PostMapping("/signup")
	public String GetSignUp(@ModelAttribute Customer customer,Model model)
	{
		
		if(customer!=null)
		{
			cusService.save(customer);
			return "redirect:/";
		}
		else
		{
			model.addAttribute("Message", "Sign up failed, there is an error during registration ");
			return "redirect:/signup";
		}
	}
	
	@GetMapping("/employee/loginEmployee")
	public String GetLoginEmployee(Model model)
	{
		User user=new User();
		model.addAttribute("user", user);
		return "nhanvien/DangNhapNhanVien";
	
	}
	
	@PostMapping("/employee/loginEmployee")
	public String Checklogin(Model model,@ModelAttribute() User user)
	{
		return "redirect:/";
//		if(loginService.CheckLoginEm(user.getUsername(), user.getPassword()))
//		{
//			System.out.println("Login Pass");
//			return "redirect:/"; 
//			
//		}
//		else
//		{
//			System.out.println("Login Fail");
//			model.addAttribute("Message", "Login failed, there is an error during the login process");
//			return "redirect:/loginEmployee";
//		}
		
	}
	
	
}
