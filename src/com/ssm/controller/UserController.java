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
public class UserController {
	@Resource(name = "userService")
	private UserService userService;
	@Resource(name = "roleService")
	private RoleService roleService;

	/**
	 * 显示用户列表(分页)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("list")
	public String list(String method, PageSupport page, Model model) {

		model.addAttribute("teacherList", userService.getUserListByPage(page));
		model.addAttribute("page", page);

		return "user/userlist";
	}

	/**
	 * 按条件查询用户列表(分页)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("list2")
	public String list2(QueryCondition queryCondition, PageSupport page,
			Model model) {

		model.addAttribute("teacherList",
				userService.getUserListByPage(queryCondition, page));
		model.addAttribute("page", page);
		model.addAttribute("queryUserCode", queryCondition.getQueryUserCode());
		model.addAttribute("queryUserName", queryCondition.getQueryUserName());
		return "user/userlist";
	}

	/**
	 * 修改用户信息页面
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("modify")
	public String toModify(int uid, Model model) {
		model.addAttribute("user", userService.selectById(uid));
		model.addAttribute("roleList", roleService.getRoleList());
		model.addAttribute("institutionList", userService.getInstitutionList());
		return "user/usermodify";
	}

	/**
	 * @RequestParam(value="a_idPicPath",required=false) MultipartFile attach
	 *                                                   //使用CommonsMultipartResolver处理上传文件时
	 *                                                   ，用@RequestParam
	 * 
	 * @param user
	 * @param uid
	 * @param request
	 * @param attach
	 * @return
	 */
	@RequestMapping("domodify")
	public String doModify(
			User user,
			int uid,
			HttpServletRequest request,
			@RequestParam(value = "a_idPicPath", required = false) MultipartFile attach) {
		user.setId(uid);
		/*
		 * if(userService.update(user)){ return "success"; }
		 */

		/*
		 * *********处理身份证等证件照文件上传************************
		 */

		String idPicPath = null;
		String path = request.getSession().getServletContext()
				.getRealPath("statics" + File.separator + "uploadfiles");
		// 判断是否有文件上传
		if (!attach.isEmpty()) {

			String fileName = attach.getOriginalFilename();// 原文件名
			String suffix = FilenameUtils.getExtension(fileName);// 取文件后缀

			int fileSize = 1000000;// 1M大小

			if (attach.getSize() > fileSize) {
				request.setAttribute("uploadFileError", " * 上传大小不得超过1M");
				return "redirect:modify.html";// 返回至修改用户页面
			} else if (suffix.equalsIgnoreCase("jpg")
					|| suffix.equalsIgnoreCase("jpeg")
					|| suffix.equalsIgnoreCase("png")
					|| suffix.equalsIgnoreCase("pneg")) {// 根据文件扩展名判断上传文件类型是否是图片文件格式
				String saveFileName = System.currentTimeMillis()
						+ RandomUtils.nextInt(1000000) + "_Personal.jpg";
				File targetFile = new File(path, saveFileName);// 创建文件对象
				/*
				 * if(!targetFile.exists()){ targetFile.mkdirs();//创建文件夹 }
				 */

				// 保存文件
				try {
					attach.transferTo(targetFile);
				} catch (Exception e) {
					e.printStackTrace();
					request.setAttribute("uploadFileError", " * 上传失败！");
					return "redirect:modify.html";
				}
				idPicPath =File.separator+"statics" + File.separator + "uploadfiles" + File.separator + saveFileName;
			} else {
				request.setAttribute("uploadFileError", " * 上传图片格式不正确！");
				return "redirect:modify.html";
			}
		}

		// 获取登录用户的id
		// int loginUserId=((User)(request.getSession().getAttribute(Constants.USER_SESSION))).getId();

		user.setIdPicPath(idPicPath);

		if (userService.update(user)) {
			return "redirect:list.html";
		}
		return "redirect:modify.html";

	}

	/**
	 * 禁用单个用户
	 * 
	 * @param uid
	 * @return
	 */
	@RequestMapping("dodelete")
	public @ResponseBody
	String doModifyState(int uid) {
		if (userService.updateState(new int[] { uid })) {
			return "success";
		}
		return "failure";
	}

	/**
	 * 批量禁用
	 * 
	 * @param uids
	 * @return
	 */
	@RequestMapping("domodifyStates")
	public String doModifyStates(String uids) {

		String[] checkIds = uids.split(",");

		int[] ids = new int[checkIds.length];
		for (int i = 0; i < checkIds.length; i++) {
			ids[i] = Integer.parseInt(checkIds[i]);
		}
		userService.updateState(ids);
		return "redirect:/sys/user/list";
	}
}
