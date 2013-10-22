package com.eastteam.myprogram.service.account;

import org.springframework.beans.factory.annotation.Autowired;
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
		user.setRoles("user");
		userDao.save(user);
	}
	
	public User findUserByLoginName(String loginName) {
//		return userDao.findByLoginName(loginName);
		return null;
	}

}
