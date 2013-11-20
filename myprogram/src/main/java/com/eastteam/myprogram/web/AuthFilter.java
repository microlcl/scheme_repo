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
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.eastteam.myprogram.entity.User;
import com.eastteam.myprogram.service.account.AccountService;

@Component("AuthFilter")
public class AuthFilter implements Filter {
	
	private final String[] IGNORED_URL = {"/account/register"};
	
	private static Logger logger = LoggerFactory.getLogger(AuthFilter.class);
	
	@Autowired
	AccountService accountService;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		HttpServletResponse httpServletResponse = (HttpServletResponse)response;
		String uri = WebUtils.getPathWithinApplication(httpServletRequest);
//		User user = accountService.getUser("userid1");
		logger.info("in filter: uri=" + uri);
		if (uri.equalsIgnoreCase(IGNORED_URL[0])) {
			chain.doFilter(request, response);
		} else {
			User user = (User)httpServletRequest.getSession().getAttribute("user");
			if (user == null) {
				logger.info("没有登陆，即将跳转到登陆页面");				
				httpServletResponse.sendRedirect(WebUtils.getContextPath(httpServletRequest) + "/login");
				return;
			}
			
			if (isAccessable(uri, user)) {
				chain.doFilter(request, response);
			} else {
				// TODO 401 error，重定向到405 error 页面
				logger.info("没有授权访问此资源");	
//				httpServletResponse.setHeader("status", "404");
				
//				chain.doFilter(request, httpServletResponse);
				throw new AuthorizationException("auth failed:" + uri);
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
