package com.me.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.me.project.dao.*;
import com.me.project.pojo.User;

@Controller
@RequestMapping(value="/",method=RequestMethod.GET)
public class UserController{
	@RequestMapping(value="login",method=RequestMethod.GET)
		public String Login(
				HttpServletRequest request,
	            HttpServletResponse response) {
			return "login";
}
	@RequestMapping(value="register",method=RequestMethod.GET)
	public String Register(HttpServletRequest request,
            HttpServletResponse response) {
		return "register";
	}
	@RequestMapping(value="userlogin",method=RequestMethod.POST)
	
	public String UserLogin(HttpServletRequest request,
            HttpServletResponse response,
            UserDao userDao) throws Exception {
		
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		
		HttpSession session =request.getSession();
		if(request.getAttribute("flag").equals(false)) {
			return "error";
		}
		if(userDao.Auth(name, password).equals(true)){
			System.out.println("Successfully login");
			String newrole= userDao.GetRole(name);
			session.putValue("role",newrole);
			return "setting";
		}else {
			
			return "login";
		}
	}
	
		@RequestMapping(value="userregister",method=RequestMethod.POST)
	 public String UserRegister(HttpServletRequest request,
	            HttpServletResponse response,
	            UserDao userDao
			 ) throws Exception {
	 	String newname=request.getParameter("name");
		String newpassword = request.getParameter("password");
		String role=request.getParameter("role");
		
		
		System.out.println(role);
		User newuser= new User();
		newuser.setName(newname);
		newuser.setPassword(newpassword);
		newuser.setRole(role);
		userDao.addUser(newuser);
		
		return  "login";
}
	
}