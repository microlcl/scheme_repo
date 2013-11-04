package com.eastteam.myprogram.service.account;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.UserMybatisDao;
import com.eastteam.myprogram.entity.User;
import com.eastteam.myprogram.service.PageableService;
import com.google.common.collect.Maps;

@Component
@Transactional
public class AccountService extends PageableService {
	
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
		//这里必须new一个新的Map作为Mybatis的传入参数，以防改变parameters的values，进而影响URL的生成。
		Map param = Maps.newHashMap(parameters);
		param.put("offset", pageRequest.getOffset());
		param.put("pageSize", pageRequest.getPageSize());
		param.put("sort", this.getOrderValue(pageRequest.getSort()));
		return userDao.search(param);
	}
	
	public Long getCount(Map parameters) {
		return userDao.getCount(parameters);
	}
	
	public User findUserByLoginName(String loginName) {
//		return userDao.findByLoginName(loginName);
		return null;
	}
	
	/**
	 * 目前在Sort.order里面只保存了一个排序用对象，所以只取第一个的value。如有需要，今后可以扩展。
	 */
	public String getOrderValue(Sort sort) {
		if (sort == null)
			return null;
		
		Iterator<Order> iterator = sort.iterator();
		String orderBy = null;
		if (iterator.hasNext()) {
			Order order = iterator.next();
			orderBy = order.getProperty();
		}
		
		return orderBy;		
	}

}
