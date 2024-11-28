package com.assignment.caulong.util;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.assignment.caulong.service.BadmintonCustomUserDetailService;
import com.assignment.caulong.service.BadmintonEmployeeUserDetailService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	private BadmintonCustomUserDetailService badmintonCustomUserDetailService;
	private BadmintonEmployeeUserDetailService badmintonEmployeeUserDetailService;
	
	public SecurityConfig(BadmintonCustomUserDetailService badmintonCustomUserDetailService,BadmintonEmployeeUserDetailService badmintonEmployeeUserDetailService) {
		super();
		this.badmintonCustomUserDetailService = badmintonCustomUserDetailService;
		this.badmintonEmployeeUserDetailService=badmintonEmployeeUserDetailService;
	}
	
	@Bean
	public SecurityFilterChain filterChainEmployee(HttpSecurity http) throws Exception{
		return http.csrf(csrf->csrf.disable()).securityMatcher("/employee/**").authenticationProvider(authenticationProviderEmployee())
				.authorizeHttpRequests(
						authReq->{
									authReq.requestMatchers("/","/error","/favicon.ico","/views/**").permitAll();
									authReq.requestMatchers("/employee/**").hasRole("EMPLOYEE");
									authReq.anyRequest().authenticated();

						})
				.formLogin(l->{
					l.loginPage("/employee/loginEmployee").permitAll();
					l.loginProcessingUrl("/employee/loginEmployee");
					l.successHandler(new CustomerLoginSuccessHandler());
					l.defaultSuccessUrl("/");
				})
				.build();
	}
	@Bean
	public SecurityFilterChain filterChainUser(HttpSecurity http) throws Exception{
		return http.csrf(csrf->csrf.disable()).securityMatcher("/customer/**").authenticationProvider(authenticationProviderUser())
				.authorizeHttpRequests(
						authReq->{
									authReq.requestMatchers("/","/error","/favicon.ico","/views/**").permitAll();
									authReq.requestMatchers("/customer/**").hasRole("CUSTOMER");
									authReq.anyRequest().authenticated();
						})
				.formLogin(l->{
					l.loginPage("/customer/login").permitAll();
					l.successHandler(new CustomerLoginSuccessHandler());
					l.defaultSuccessUrl("/");
				})
				.build();
	}
//	@Bean
//	public UserDetailsService userDetailsService() {
//		return new InMemoryUserDetailsManager();
//	}
	@Bean
	public AuthenticationProvider authenticationProviderUser() {
		DaoAuthenticationProvider provider=new DaoAuthenticationProvider();
		provider.setPasswordEncoder(NoOpPasswordEncoder.getInstance());
		provider.setUserDetailsService(badmintonCustomUserDetailService);
		return provider;
	}
	@Bean
	public AuthenticationProvider authenticationProviderEmployee() {
		DaoAuthenticationProvider provider=new DaoAuthenticationProvider();
		provider.setPasswordEncoder(NoOpPasswordEncoder.getInstance());
		provider.setUserDetailsService(badmintonEmployeeUserDetailService);
		return provider;
	}

}