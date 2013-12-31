package com.eastteam.myprogram.service.holder;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.eastteam.myprogram.dao.HolderMybatisDao;
import com.eastteam.myprogram.entity.Holders;
import com.eastteam.myprogram.entity.SpaceAttribute;
import com.eastteam.myprogram.entity.Spaces;
import com.eastteam.myprogram.entity.User;
import com.eastteam.myprogram.service.PageableService;
import com.google.common.collect.Maps;

@Component
@Transactional
public class HolderService extends PageableService {
	@Autowired
	private HolderMybatisDao holderDao;
	@Override
	public List search(Map parameters, Pageable pageRequest) {
		//这里必须new一个新的Map作为Mybatis的传入参数，以防改变parameters的values，进而影响URL的生成。
				Map param = Maps.newHashMap(parameters);
				param.put("offset", pageRequest.getOffset());
				param.put("pageSize", pageRequest.getPageSize());
				param.put("sort", this.getOrderValue(pageRequest.getSort()));
				return holderDao.search(param);
	}

	@Override
	public Long getCount(Map parameters) {
		// TODO Auto-generated method stub
		return holderDao.getCount(parameters);
	}
	
	public void save(Holders holder){
		holderDao.saveHolder(holder);
		for (Iterator iterator = holder.getSpaces().iterator(); iterator.hasNext();) {
			Spaces space = (Spaces) iterator.next();
			if(space.getSpace_name()!=null&&!space.getSpace_name().equals("")){
				space.setHolders(holder);
				holderDao.saveSpace(space);
				List<SpaceAttribute> spaceAttributes = space
						.getSpaceAttributes();
				if (spaceAttributes != null) {
					for (Iterator iterator2 = spaceAttributes.iterator(); iterator2
							.hasNext();) {
						SpaceAttribute spaceAttribute = (SpaceAttribute) iterator2
								.next();
						if (spaceAttribute.getAttribute_id() != null
								&& !spaceAttribute.getAttribute_id().equals("")) {
							spaceAttribute.setSpace_id(space.getId());
							holderDao.saveSpaceAttribute(spaceAttribute);
						}
					}
				}
			}
		}
	}
	
	public void update(Spaces space){
		holderDao.update(space);
	}
	
	public void doUpdate(Holders holder) {
		holderDao.updateHolder(holder);
		holderDao.deleteSpacesByHolderId(holder.getId());
		for (Iterator iterator = holder.getSpaces().iterator(); iterator
				.hasNext();) {
			Spaces space = (Spaces) iterator.next();
			if (space.getSpace_name() != null
					&& !space.getSpace_name().equals("")) {
				space.setHolders(holder);
				holderDao.saveSpace(space);
				holderDao.deleteSpaceAttribute(space.getId());
				List<SpaceAttribute> spaceAttributes = space
						.getSpaceAttributes();
				if (spaceAttributes != null) {
					for (Iterator iterator2 = spaceAttributes.iterator(); iterator2
							.hasNext();) {
						SpaceAttribute spaceAttribute = (SpaceAttribute) iterator2
								.next();
						if (spaceAttribute.getAttribute_id() != null
								&& !spaceAttribute.getAttribute_id().equals("")) {
							spaceAttribute.setSpace_id(space.getId());
							holderDao.saveSpaceAttribute(spaceAttribute);
						}
					}
				}
			}
		}
	}
	
	public List<SpaceAttribute> getSpaceAttributeBySpaceId(long space_id){
		return holderDao.getSpaceAttributeBySpaceId(space_id);
	}
	
	public Spaces getSpace(long id) {
		return this.holderDao.getSpaces(id);
	}
	
	public Holders getHolder(long id) {
		Holders holder= holderDao.getHolders(id);
		List<Spaces> spaces =holder.getSpaces();
		for (Iterator iterator = spaces.iterator(); iterator.hasNext();) {
			Spaces space = (Spaces) iterator.next();
			space.setSpaceAttributes(holderDao.getSpaceAttributeBySpaceId(space.getId()));
		}
		return holder;
	}
}
