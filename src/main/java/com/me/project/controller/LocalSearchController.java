package com.me.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.me.project.dao.ContainerDao;
import com.me.project.dao.DockerFileDao;
import com.me.project.dao.ImageDao;
import com.me.project.dao.UserDao;
import com.me.project.pojo.MyContainer;
import com.me.project.pojo.MyDockerFile;
import com.me.project.pojo.MyImage;
@Controller

public class LocalSearchController {
	@Autowired
	ImageDao imageDao;
	@Autowired
	ContainerDao containerDao;
	@Autowired 
	DockerFileDao fileDao;
	@Autowired
	UserDao userDao;
	
	
	@RequestMapping("/sl")
	public String gotopage() {
		return "localdata";
	}
	@RequestMapping("/searchdb")
	public ModelAndView dbresult(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String type=request.getParameter("type");
		String item =request.getParameter("item");
		System.out.println("By name or time " +type);
		System.out.println("ITem "+item);
		ModelAndView model = null;
		if(type.equals("byname")&&item.equals("image")) {
			String keyword=request.getParameter("keyword");
			ArrayList<MyImage> result =imageDao.SearchByName(keyword);
			System.out.println("image Size"+result.size());
			 model = new ModelAndView("localimages","result",result);
		}
		else if(type.equals("byname")&&item.equals("container")) {
			String keyword=request.getParameter("keyword");
			ArrayList<MyContainer> result =containerDao.SearchByName(keyword);
			System.out.println("container Size"+result.size());
			 model = new ModelAndView("localcontainers","result",result);
		}
		
		else if(type.equals("bytime")&&item.equals("image")) {
			String sdate = request.getParameter("date");
			System.out.println(sdate);
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			sdf.setLenient(false);
			Date date;
			date=sdf.parse(sdate);
			System.out.println("In date Formate " +date);
			
			
			ArrayList<MyImage> result =imageDao.SearchByTime(date);
			System.out.println("Here is image time number:" + result.size());
			model = new ModelAndView("localimages","result",result);
		}
			else if(type.equals("bytime")&&item.equals("container")) {
				String sdate = request.getParameter("date");
				System.out.println(sdate);
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				sdf.setLenient(false);
				Date date;
				date=sdf.parse(sdate);
				
				ArrayList<MyContainer> result =containerDao.SearchByTime(date);
				System.out.println("Here is image time number:" + result.size());
				model = new ModelAndView("localcontainers","result",result);
		}
		
		return model;
	
	}
	@RequestMapping("/build")
	public ModelAndView Build(HttpServletRequest request) throws Exception {
		String role = (String)request.getSession().getAttribute("role");
		System.out.println("The role is "+ role);
		
		ArrayList<MyDockerFile> result = fileDao.showAll();
		Map map =new HashMap();
		map.put("result", result);
		map.put("role", role);
		return new ModelAndView("buildfile","map",map);
	}
	
	@RequestMapping("/savefile")
	public ModelAndView SaveFile(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String name=request.getParameter("name");
		String text=request.getParameter("text");
		MyDockerFile mynew = new MyDockerFile();
		mynew.setName(name);
		mynew.setText(text);
		fileDao.addFile(mynew);
		
		String role = (String)request.getSession().getAttribute("role");
		System.out.println("The role is "+ role);
		ArrayList<MyDockerFile> result = fileDao.showAll();
		Map map =new HashMap();
		map.put("result", result);
		map.put("role", role);
		return new ModelAndView("buildfile","map",map);
	}
	
	
}
