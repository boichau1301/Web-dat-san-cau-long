package com.assignment.caulong.util;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.assignment.caulong.models.Employee;

public class EmployeePrincipal implements UserDetails {
	private Employee employee;

	public EmployeePrincipal(Employee employee) {
		super();
		this.employee=employee;
		// TODO Auto-generated constructor stub
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> permisson=new ArrayList<>();
		permisson.add(new SimpleGrantedAuthority("ROLE_EMPLOYEE"));
		return permisson;
	}

	@Override
	public String getPassword() {
		return employee.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return employee.getUsername();
	}

}
