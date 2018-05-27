package com.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.smbms.tools.Constants;
import cn.smbms.tools.PageSupport;
import cn.smbms.tools.QueryCondition;

import com.ssm.pojo.User;
import com.ssm.service.RoleService;
import com.ssm.service.UserService;

@RequestMapping("/sys/user")
@Controller
public class UserController2 {
	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "roleService")
	private RoleService roleService;

	/****************************************/

	/**
	 * 检测账户是否已存在
	 */
	@RequestMapping("checkUserExist")
	@ResponseBody
	public String checkUserExist(User user){
		if(user==null){
			return "isempty";
		}
		if(userService.checkUserExist(user)!=null){
			//存在，账户不可用
			return "exist";
		}
		//不存在，账户可用
		return "ok";
	}
	/**
	 * 新增用户信息页面
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("add")
	public String add(Model model) {

		model.addAttribute("roleList", roleService.getRoleList());
		model.addAttribute("institutionList", userService.getInstitutionList());
		return "user/useradd";
	}

	/**
	 * 执行添加用户信息请求
	 * 
	 * @RequestParam(value="a_idPicPath",required=false) MultipartFile attach
	 *                                                   //使用CommonsMultipartResolver处理上传文件时
	 *                                                   ，用@RequestParam
	 * 
	 * @param user
	 * @param uid
	 * @param request
	 * @param attach
	 * @return
	 * 
	 * 验证框架
	 * @Valid User user,BindingResult bindingResult,HttpServletRequest request,
	 */
	@RequestMapping("doadd")
	public String doAdd(
			User user,
			HttpServletRequest request,
			@RequestParam(value = "a_idPicPath", required = false) MultipartFile photo) {

		/*
		 * *********处理身份证等证件照文件上传************************
		 */

		String idPicPath = null;
		String path = request.getSession().getServletContext()
				.getRealPath("statics" + File.separator + "uploadfiles");
	

		/*
		 * *********处理工作证等证件照文件上传************************
		 */
		
		// 判断是否有文件上传
		if (photo != null) {
			String saveFileName = System.currentTimeMillis()
					+ RandomUtils.nextInt(1000000) + "_Work.jpg";
			try {
				photo.transferTo(new File(path, saveFileName));
				idPicPath = File.separator + "statics" + File.separator
						+ "uploadfiles" + File.separator + saveFileName;
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 获取登录用户的id
		/*int loginUserId = ((User) (request.getSession()
				.getAttribute(Constants.USER_SESSION))).getId();
		user.setCreatedBy(loginUserId);*/
		user.setCreationDate(new Date());
		user.setIdPicPath(idPicPath);
		//user.setUserState(1);//默认状态为正常
		if (userService.add(user) > 0) {
			return "redirect:list2.html";
		}

		return "redirect:add.html";

	}

	

	/**
	 * 删除
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("dodelete2")
	public @ResponseBody
	String doDelete2(int uid) {
		if (userService.delete(uid) > 0) {
			return "success";
		}
		return "failure";
	}

	/****************************************/
}
