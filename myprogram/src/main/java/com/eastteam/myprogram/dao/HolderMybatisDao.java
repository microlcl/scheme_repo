package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import com.eastteam.myprogram.entity.Holders;
import com.eastteam.myprogram.entity.SpaceAttribute;
import com.eastteam.myprogram.entity.Spaces;

@MyBatisRepository
public interface HolderMybatisDao {
	void saveSpace(Spaces space);
	void saveHolder(Holders holder);
	List<Spaces> search(Map<String, Object> parameters);
	Long getCount(Map<String, Object> parameters);
	void update(Spaces space);
	Spaces getSpaces(long id);
	Holders getHolders(long id);
	void updateHolder(Holders holder);
	void deleteSpacesByHolderId(long id);
	void saveSpaceAttribute(SpaceAttribute spaceAttribute);
	void deleteSpaceAttribute(long space_id);
	List<SpaceAttribute> getSpaceAttributeBySpaceId(long space_id);
}
