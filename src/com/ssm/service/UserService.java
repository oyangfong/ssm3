package com.ssm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import cn.smbms.tools.PageSupport;
import cn.smbms.tools.QueryCondition;

import com.ssm.pojo.User;

public interface UserService {
	public List<User> findAll();
	public List<User> findAllByPageIndex(int from,int pageSize);
	public List<User> getUserListByPage(PageSupport page);
	public List<User> getUserListByPage(QueryCondition queryCondition,PageSupport page);
	
	public User selectById(int id);
	public User login(User user);
	
	public boolean update(User user);
	
	public boolean updateState(int[] uids);
	
	public List<String> getInstitutionList();
	
	/****************************************/
	  public int add(User user);
	  public int delete(int id);
	  
	  public User checkUserExist(User user);

}
