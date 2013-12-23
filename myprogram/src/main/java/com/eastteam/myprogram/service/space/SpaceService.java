package com.eastteam.myprogram.service.space;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.eastteam.myprogram.dao.SpaceMybatisDao;
import com.eastteam.myprogram.entity.Spaces;
import com.eastteam.myprogram.service.PageableService;
import com.google.common.collect.Maps;

@Component
@Transactional
public class SpaceService extends PageableService {
	@Autowired
	private SpaceMybatisDao spaceDao;
	@Override
	public List search(Map parameters, Pageable pageRequest) {
		//这里必须new一个新的Map作为Mybatis的传入参数，以防改变parameters的values，进而影响URL的生成。
				Map param = Maps.newHashMap(parameters);
				param.put("offset", pageRequest.getOffset());
				param.put("pageSize", pageRequest.getPageSize());
				param.put("sort", this.getOrderValue(pageRequest.getSort()));
				return spaceDao.search(param);
	}

	@Override
	public Long getCount(Map parameters) {
		// TODO Auto-generated method stub
		return spaceDao.getCount(parameters);
	}
	
	public void save(Spaces space){
		spaceDao.save(space);
	}
	
	public void update(Spaces space){
		spaceDao.update(space);
	}
}
