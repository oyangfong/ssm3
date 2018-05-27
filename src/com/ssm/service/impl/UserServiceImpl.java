package com.ssm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import cn.smbms.tools.PageSupport;
import cn.smbms.tools.QueryCondition;

import com.ssm.mapper.user.UserMapper;
import com.ssm.pojo.User;
import com.ssm.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
	private UserMapper userMapper;

    /**
     * 登录
     */
	public User login(User user) {
		User ret = null;
		try {
			ret = userMapper.getUserByUserCode(user);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ret;
	}
	
	/**
	 * 分页获取用户列表
	 */
	@Override
	public List<User> getUserListByPage(PageSupport page) {
		int from =(page.getCurrentPageNo()-1)*page.getPageSize();
		page.setTotalCount(userMapper.getTotalCount());
		return userMapper.getUserListByPage(from, page.getPageSize());
	}

	/**
	 * 根据查询条件，执行动态SQL，分页获取用户列表
	 */
	@Override
	public List<User> getUserListByPage(QueryCondition queryCondition,PageSupport page) {
		int from =(page.getCurrentPageNo()-1)*page.getPageSize();
		page.setTotalCount(userMapper.getTotalCountWithCondition(queryCondition));
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("queryUserCode", queryCondition.getQueryUserCode());
		map.put("queryUserName", queryCondition.getQueryUserName());
		map.put("from",from);
		map.put("pageSize", page.getPageSize());
		return userMapper.getUserListByPageWithCondition(map);
	}
	
	@Override
	public List<User> findAll() {
		return userMapper.findAll();
	}

	

	@Override
	public List<User> findAllByPageIndex(int from, int pageSize) {
		// TODO Auto-generated method stub
		return userMapper.findAllByPageIndex(from, pageSize);
	}

	/**
	 * 根据ID查询
	 */
	@Override
	public User selectById(int id) {
		// TODO Auto-generated method stub
		return userMapper.selectById(id);
	}

	/**
	 * 修改用户信息
	 */
	@Override
	public boolean update(User user) {
		try {
			userMapper.update(user);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
    
	/**
	 * 更改用户状态信息（1　：正常　　０：禁用）
	 */
	public boolean updateState(int[] uids){
		try {
			userMapper.updateState(uids);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	
	/**
	 * 获取事业单位列表(用于修改用户信息时，填充下拉列表)
	 */
	@Override
	public List<String> getInstitutionList() {
		// TODO Auto-generated method stub
		return userMapper.getInstitutionList();
	}

	
	/****************************************/
	  public int add(User user){
		  return userMapper.add(user);
	  }
	  public int delete(int id){
		  return userMapper.delete(id);
	  }

	@Override
	public User checkUserExist(User user) {
		// TODO Auto-generated method stub
		return userMapper.getUserByUserCode(user);
	}
	
}
