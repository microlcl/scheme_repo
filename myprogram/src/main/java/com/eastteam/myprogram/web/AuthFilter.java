package com.eastteam.myprogram.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.eastteam.myprogram.entity.User;
import com.eastteam.myprogram.service.account.AccountService;

@Component("AuthFilter")
public class AuthFilter implements Filter {
	
	private final String[] LOGIN_URL = {"/login", "/"};
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
		if (uri.equalsIgnoreCase(LOGIN_URL[0]) || uri.equalsIgnoreCase(LOGIN_URL[1])) {
			chain.doFilter(request, response);
		} else {
			User user = (User)req.getSession().getAttribute("user");
			if (user == null) {
				// TODO 重定向到login界面
				throw new ServletException("authorization failed: please login firstly.");
			}
			
			if (isAccessable(uri, user)) {
				chain.doFilter(request, response);
			} else {
				// TODO 405 error，重定向到405 error 页面
				throw new ServletException("auth failed:" + uri);
			}
		}
//		
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
	private boolean isAccessable(String uri, User user) {
		List<String> authorizedUriList = user.getAuthorizedUriList();
		
		if (authorizedUriList == null || authorizedUriList.isEmpty())
			return false;
		
		for (String authorizedUri : authorizedUriList) {
			if (StringUtils.startsWith(uri,authorizedUri)) {
				return true;
			}
		}
		
		return false;		
	}

}
