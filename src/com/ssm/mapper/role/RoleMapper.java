package com.ssm.mapper.role;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ssm.pojo.Role;


@Repository
public interface RoleMapper {
  public List<Role> getRoleList();
  public Role getUserListByRoleId(int roleId);
}
