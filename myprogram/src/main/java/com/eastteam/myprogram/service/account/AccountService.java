package com.eastteam.myprogram.service.account;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.UserMybatisDao;
import com.eastteam.myprogram.entity.User;

@Component
@Transactional
public class AccountService {
	
	@Autowired
	private UserMybatisDao userDao;
	
	@Autowired
	public void setUserDao(UserMybatisDao userDao) {
		this.userDao = userDao;
	}

	
	public void registerUser(User user) {
//		user.setRoles("user");
		userDao.save(user);
	}
	
	public List<User> search(Map parameters, Pageable pageRequest) {
		parameters.put("offset", pageRequest.getOffset());
		parameters.put("pageSize", pageRequest.getPageSize());
		return userDao.search(parameters);
	}
	
	public Long getCount(Map<String, Object> parameters) {
		return userDao.getCount(parameters);
	}
	
	public User findUserByLoginName(String loginName) {
//		return userDao.findByLoginName(loginName);
		return null;
	}

}
