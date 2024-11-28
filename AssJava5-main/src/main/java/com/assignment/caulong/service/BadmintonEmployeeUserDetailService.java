package com.assignment.caulong.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.assignment.caulong.models.Employee;
import com.assignment.caulong.repository.EmployeeRepository;
import com.assignment.caulong.util.EmployeePrincipal;

@Service
public class BadmintonEmployeeUserDetailService implements UserDetailsService{
	private EmployeeRepository employeeRepo;
	

	public BadmintonEmployeeUserDetailService(EmployeeRepository employeeRepo) {
		super();
		this.employeeRepo = employeeRepo;
	}


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Employee employee=employeeRepo.findByUsername(username);
		if(employee==null) {
			throw new UsernameNotFoundException("Employee "+username+ " Not found");
		}
		return new EmployeePrincipal(employee);
	}

	

}
