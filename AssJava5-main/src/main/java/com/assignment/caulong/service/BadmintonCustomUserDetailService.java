package com.assignment.caulong.service;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.assignment.caulong.models.Customer;
import com.assignment.caulong.repository.CustomerRepository;
import com.assignment.caulong.util.UserPrincipal;

@Service
public class BadmintonCustomUserDetailService implements UserDetailsService {
	private CustomerRepository cusRepo;
	
	public BadmintonCustomUserDetailService(CustomerRepository cusRepo) {
		super();
		this.cusRepo = cusRepo;
	}


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Customer customer=cusRepo.findByUsername(username);
		if(customer==null) {
			System.out.println("user not found");
			throw new UsernameNotFoundException("User "+ username+" not found!");
		}
		
		return new UserPrincipal(customer);
	}

}
