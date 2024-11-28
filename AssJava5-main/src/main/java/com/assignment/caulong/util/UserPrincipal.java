package com.assignment.caulong.util;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.assignment.caulong.models.Customer;

public class UserPrincipal implements UserDetails {

	private Customer customer;
	

	public UserPrincipal(Customer customer) {
		super();
		this.customer = customer;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> permisson=new ArrayList<>();
		permisson.add(new SimpleGrantedAuthority("ROLE_CUSTOMER"));
		return permisson;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return customer.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return customer.getUsername();
	}

}
