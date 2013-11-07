package com.eastteam.myprogram.web.account;

import com.eastteam.myprogram.entity.Role;

/**
 * 方便在页面迭代出某用户所有拥有的role的JavaBean
 * @author lichlei
 *
 */
public class RoleBean extends Role {
	
	private boolean checked;

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	
}
