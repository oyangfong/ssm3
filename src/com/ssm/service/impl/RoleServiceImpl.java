package com.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;




import com.ssm.mapper.role.RoleMapper;
import com.ssm.pojo.Role;
import com.ssm.service.RoleService;
@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Resource
	private RoleMapper roleMapper;

	public List<com.ssm.pojo.Role> getRoleList() {
		return roleMapper.getRoleList();
	}

	
}
