package com.assignment.caulong.util;

import java.io.IOException;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CustomerLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	HttpSessionRequestCache requestCache=new HttpSessionRequestCache();
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		SavedRequest savedRequest=requestCache.getRequest(request, response);
		System.out.println("is Success");
		if(savedRequest ==null) {
			super.onAuthenticationSuccess(request, response, authentication);	
			return;
		}
		System.out.println(savedRequest.getRedirectUrl());
		String targetUrl=savedRequest.getRedirectUrl();
		getRedirectStrategy().sendRedirect(request, response, targetUrl);
	}

}