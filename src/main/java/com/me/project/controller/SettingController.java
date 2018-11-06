package com.me.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.project.dao.HostDao;
import com.me.project.pojo.HostPort;
import com.me.project.service.EmailService;
import com.me.project.service.PdfService;
import com.me.project.service.SettingService;

@Controller
@RequestMapping(value="/",method=RequestMethod.GET)

public class SettingController {
	
	@Autowired
	SettingService settingSrv;
	@Autowired 
	PdfService pdfSrv;
	@Autowired
    HostDao hostDao;
	
	
	@RequestMapping(value="setting",method=RequestMethod.POST)
	
	public ModelAndView SetIpPort(
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		if(!request.getParameter("ipaddr").isEmpty()) {
		String ipaddr=request.getParameter("ipaddr");
		String port=request.getParameter("port");
		HostPort hostPort= new HostPort(ipaddr,port);
		settingSrv.SetHostPort(hostPort);
		hostPort.setHostIp(ipaddr);
		hostPort.setHostIp(port);
		hostDao.addHost(hostPort);
		
		HttpSession session=request.getSession();
		
		session.putValue("hostPort", hostPort);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("info", settingSrv.info());
		map.put("version", settingSrv.version());
		ModelAndView model=new ModelAndView("main","map",map);
		
		
		return model;}
		
		else {
			HostPort hostPort=(HostPort)request.getSession().getAttribute("hostPort");
			settingSrv.SetHostPort(hostPort);
			HttpSession session=request.getSession();
			session.putValue("hostPort", hostPort);
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("info", settingSrv.info());
			map.put("version", settingSrv.version());
			ModelAndView model=new ModelAndView("main","map",map);
			
			
			return model;
		}
		
		
		
		
	}
	
	@RequestMapping("pdf")
		public ModelAndView excel(){
			pdfSrv.PrintPDF(settingSrv.info(),settingSrv.version());
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("info", settingSrv.info());
			map.put("version", settingSrv.version());
			
			return new ModelAndView("main","map",map);
				}

                
    }



