/**
 * 
 */
package com.eastteam.myprogram.dao;

import java.util.List;
import java.util.Map;

import com.eastteam.myprogram.entity.Paper;


/**
 * @author LSS
 *
 */

@MyBatisRepository
public interface PaperMybatisDao {
	
	public List<Paper> search(Map<String, Object> parameters);
	public Long getCount(Map<String, Object> parameters);

}