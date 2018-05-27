package junit.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.smbms.tools.PageSupport;
import cn.smbms.tools.QueryCondition;

import com.ssm.pojo.User;
import com.ssm.service.UserService;

public class SsmTest {

	@Test
	public void test() {
	  ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
	  UserService userService=ctx.getBean("userService",UserService.class);
	  System.out.println(userService.findAll().size());
	}
	
	@Test
	public void test2() {
		 ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		  UserService userService=ctx.getBean("userService",UserService.class);
		  QueryCondition queryCondition=new QueryCondition();
		  queryCondition.setQueryUserCode("ad");
		  PageSupport page=new PageSupport();
		  List<User> list=userService.getUserListByPage(queryCondition, page);
		  System.out.println(list.size());
	}

}
