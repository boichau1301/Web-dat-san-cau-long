package com.assignment.caulong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment.caulong.models.Customer;
import com.assignment.caulong.models.Employee;
import com.assignment.caulong.repository.EmployeeRepository;

@Service
public class LoginService {
	private CustomerService cusService;
	private EmployeeService empService;

	@Autowired
	public LoginService(CustomerService cusService,EmployeeService empService) {
		super();
		this.cusService = cusService;
		this.empService=empService;
	}

	public Boolean CheckLogin(String userName, String password) {
		Boolean checkKhachHang = false;
		Customer cus = cusService.getByUsername(userName);
		if (cus != null) {
			if (password.equals(cus.getPassword())) {
				checkKhachHang = true;
			}
		}
		return checkKhachHang;
	}
	
	public Boolean CheckLoginEm(String userName, String password)
	{
		Boolean checkNhanVien=false;
		Employee emp=empService.getByUserName(userName);
		if(emp!=null)
		{
			if(password.equals(emp.getPassword()))
			{
				checkNhanVien=true;
			}
		}
		return checkNhanVien;
	}
}
