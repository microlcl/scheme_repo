package com.eastteam.myprogram.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.eastteam.myprogram.service.account.AccountService;

@Component("AuthFilter")
public class AuthFilter implements Filter {
	
	private final String LOGIN_URL1 = "/login";
	@Autowired
	AccountService accountService;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		String uri = WebUtils.getPathWithinApplication(req);
//		User user = accountService.getUser("userid1");
		System.out.println("in filter: uri=" + uri);
//		throw new ServletException("auth failed");
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
