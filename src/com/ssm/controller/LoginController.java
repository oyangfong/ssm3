package com.ssm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.smbms.tools.Constants;
import cn.smbms.tools.PageSupport;

import com.ssm.pojo.User;
import com.ssm.service.UserService;

@Controller
public class LoginController {
	@Resource
	private UserService userService;

	/*
	 * 登录页面(ok)
	 */

	@RequestMapping("/login.html")
	public String login() {
		return "login";
	}

	/*
	 * 登录(ok)
	 */
	@RequestMapping(value = "/dologin.html", method = RequestMethod.POST)
	public String doLogin(User user, String valiCode,
			HttpServletRequest request, Model model) {
		String code = (String) request.getSession().getAttribute("_code");
		request.getSession().removeAttribute("_code");
		if (valiCode == null || !valiCode.toLowerCase().equals(code)) {
			model.addAttribute("error", "验证码不正确！");
			return "login";
		}

		User ret = userService.login(user);
		if (ret != null) {
			// 保存到session中
			request.getSession().setAttribute(Constants.USER_SESSION, ret);
			model.addAttribute("teacherList", userService.findAll());
			return "redirect:/sys/user/list";
		} else {
			// 保存错误信息
			model.addAttribute("error", "用户名或密码不正确！");
			return "login";
		}

	}

	/*
	 * 主页
	 */
	@RequestMapping("/sys/main.html")
	public String main(Model model) {
		model.addAttribute("teacherList", userService.findAll());
		return "frame";
	}

	/*
	 * 注销
	 */
	@RequestMapping("logout.html")
	public String logout(HttpSession session) {
		session.removeAttribute(Constants.USER_SESSION);
		return "login";
	}

	/**
	 * 显示用户列表(分页)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("list")
	public String list(PageSupport page, Model model) {

		model.addAttribute("userList", userService.getUserListByPage(page));
		model.addAttribute("page", page);

		return "user/userlist";
	}
}
