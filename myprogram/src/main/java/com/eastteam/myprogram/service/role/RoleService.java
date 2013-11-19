package com.eastteam.myprogram.service.role;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.RoleMybatisDao;
import com.eastteam.myprogram.entity.Function;
import com.eastteam.myprogram.entity.Module;
import com.eastteam.myprogram.entity.Role;
import com.eastteam.myprogram.entity.RoleFunction;
import com.eastteam.myprogram.service.PageableService;
import com.google.common.collect.Maps;

@Component
@Transactional
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

	public void save(Role role,List<String []> functions) {
		if(role.getId()!=null){
			roleDao.update(role);
		}else{
			role.setId(UUID.randomUUID().toString());
			roleDao.save(role);
		}
		roleDao.deleteRole_Function(role.getId());
		for (int i = 0; i < functions.size(); i++) {
			RoleFunction roleFunction=new RoleFunction();
			roleFunction.setRole_id(role.getId());
			String [] function_id= (String[]) functions.get(i);
			roleFunction.setFunction_id(function_id[0]);
			roleDao.saveRole_Function(roleFunction);
		}
	}
	
	public List findRoleByName(String name) {
		return roleDao.findRoleByName(name);
	}
	
	public Role getRole(String id) {
		return roleDao.getRole(id);
	}
	
	public List<Role> getAllRoles() {
		return roleDao.selectAll();
	}
	
	public List<Module> getAllModule(){
		return roleDao.getAllModule();
	}
	
	public void delete(String id){
		roleDao.deleteRole_Function(id);
		 roleDao.delete(id);
	}
}
