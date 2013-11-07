package com.eastteam.myprogram.service.role;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import com.eastteam.myprogram.dao.RoleMybatisDao;
import com.eastteam.myprogram.service.PageableService;
import com.google.common.collect.Maps;

public class RoleService extends PageableService {
	@Autowired
	private RoleMybatisDao roleDao;
	
	@Override
	public List search(Map parameters, Pageable pageRequest) {
		//这里必须new一个新的Map作为Mybatis的传入参数，以防改变parameters的values，进而影响URL的生成。
				Map param = Maps.newHashMap(parameters);
				param.put("offset", pageRequest.getOffset());
				param.put("pageSize", pageRequest.getPageSize());
				param.put("sort", this.getOrderValue(pageRequest.getSort()));
				return roleDao.search(param);
	}

	@Override
	public Long getCount(Map parameters) {
		// TODO Auto-generated method stub
		return roleDao.getCount(parameters);
	}

}
