package com.ssm.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.smbms.tools.VerifyCodeUtils;

import com.ssm.pojo.User;
import com.ssm.service.UserService;

@Controller
public class IndexController {
	@Resource(name = "userService")
	private UserService userService;

	@RequestMapping("/index.html")
	public String index(Model model) {
		model.addAttribute("userList", userService.findAll());
		return "index";
	}
	
	@RequestMapping("/frameTest.html")
	public String frameTest(Model model) {
		model.addAttribute("userList", userService.findAll());
		return "frameTest";
	}

	
	
	@RequestMapping("/index2.html")
	public @ResponseBody List<User> findAllByPageIndex(int from){
		return userService.findAllByPageIndex(from, 5);
	}

	
    @RequestMapping(value="/getValidateCode.html",method=RequestMethod.GET)
    public void getValidateCode(HttpServletResponse response,HttpServletRequest request){
    	try {
    		response.setHeader("Pragma", "No-cache");  
            response.setHeader("Cache-Control", "no-cache");  
            response.setDateHeader("Expires", 0);  
            response.setContentType("image/jpeg");  
              
            //生成随机字串  
            String verifyCode = VerifyCodeUtils.generateVerifyCode(4);  
            //存入会话session  
            HttpSession session = request.getSession(true);  
            session.setAttribute("_code", verifyCode.toLowerCase());  
            //生成图片  
            int w = 146, h = 33;  
            VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);  
    	} catch (Exception e) {
    		request.setAttribute("errMsg","获取验证码异常");
    	}
    }
}
