package com.ssm.mapper.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.smbms.tools.QueryCondition;

import com.ssm.pojo.User;
@Repository
public interface UserMapper {
  public List<User> findAll();
  
  public List<User> findAllByUserName(String userName);
  
  public User getUserByUserCode(User user);
  
  public List<User> getUserListByPage(@Param("from") int from,@Param("pageSize") int pageSize);
  public List<User> getUserListByPageWithCondition(Map<String,Object> map);

  public List<User> findAllByPageIndex(@Param("from") int from,@Param("pageSize")int pageSize);
  
  public User selectById(int id);
  
  
  public int getTotalCount();
  public int getTotalCountWithCondition(QueryCondition condition);
  
  public int update(User user);
  
  public int updateState(int[] ids);
  
  public List<String> getInstitutionList();
  
  /****************************************/
  public int add(User user);
  public int delete(int id);
  
}
