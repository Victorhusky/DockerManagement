package com.me.project.controller;

import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.dockerjava.api.command.InspectImageResponse;
import com.github.dockerjava.api.model.Image;
import com.me.project.dao.ImageDao;
import com.me.project.service.DockerService;
import com.me.project.service.EmailService;
import com.me.project.service.ImagesService;
import com.me.project.service.SearchService;
import com.me.project.service.SettingService;
import com.me.project.pojo.*;

@Controller
@RequestMapping("/")
public class ImagesController {
	
	@Autowired
	DockerService docker;
	@Autowired
	ImagesService imageSrv;
	@Autowired 
	SettingService settingSrv;
	@Autowired 
	ImageDao imageDao;
	@Autowired 
	EmailService emailSrv;
	
	
	@RequestMapping(value="pull",method=RequestMethod.GET)
	public ModelAndView SearchResult(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String name=request.getParameter("imagename");
		String des=request.getParameter("imagedes");
		System.out.println(name);
		
		imageSrv.PullImage(name);
		
		
		System.out.println("IN the image Controller I try to save a image when pull");
		// Save the image info to local DB
		MyImage im = new MyImage();
		im.setName(name);
		im.setCreatedTime((new Date()));
		im.setDescription(des);
		imageDao.addImage(im);
		
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("info", settingSrv.info());
		map.put("version", settingSrv.version());
		ModelAndView model=new ModelAndView("main","map",map);
		return model;
	}
	
	
	@RequestMapping(value="images",method=RequestMethod.GET)
	public ModelAndView ImagesList(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		List<Image> resultlist =imageSrv.List();
		System.out.println("Here is repo");
		String[] repo =resultlist.get(0).getRepoTags();
		System.out.println("Size of repo"+ repo.length);
		System.out.println(" repo Info"+ repo[0]);
		
		
		ModelAndView model=new ModelAndView("imageslist","list",resultlist);
		return model;
	}
	
	 @RequestMapping(value="images/addc",method=RequestMethod.POST)
	    public String addContainers(Model mode,
	            @RequestParam(value = "name") String title,
	            @RequestParam(value = "rurl") String rurl) {
		 
	        mode.addAttribute("info", imageSrv.info(title));
	        mode.addAttribute("title", title);
	        mode.addAttribute("rurl", rurl);
	        return "addc";
	    }
	 
	 
	 @RequestMapping(value="images/tag",method=RequestMethod.POST)
	    public @ResponseBody String tagImage(@RequestParam(value = "id") String id,
	            @RequestParam(value = "tag") String tag) {
	        imageSrv.tag(id, tag);
	       return "ok";
	    }

	    @RequestMapping("images/imgtag")
	    public String tag(Model model, @RequestParam(value = "id") String id) {
	        model.addAttribute("id", id);
	        System.out.println("I am In Images Controller");
	        return "imagetag";
	    }
	    
		@RequestMapping(value="images/name/json",method=RequestMethod.POST)
	    public String info(Model mode, @RequestParam(value = "name") String title) {
	        InspectImageResponse resp = imageSrv.info(title);
	        mode.addAttribute("info", resp);
	        mode.addAttribute("title", title);
	        return "imagesinfo";
	    }
		
	    @RequestMapping(value="images/delete",method=RequestMethod.POST)
	    public ModelAndView delete(@RequestParam(value="name") String name) {
	        imageSrv.delete(name);
			emailSrv.sendEmail(name,"Image");
	        System.out.println("I am In Images Controller delete Method!");
	        List<Image> resultlist =imageSrv.List();
			System.out.println("Here is repo");
			String[] repo =resultlist.get(0).getRepoTags();
			System.out.println("Size of repo"+ repo.length);
			System.out.println(" repo Info"+ repo[0]);
			
			ModelAndView model=new ModelAndView("imageslist","list",resultlist);
			return model;
	    }
	    
	    @RequestMapping(value="images/push",method=RequestMethod.POST)
	    public ModelAndView push(@RequestParam(value="name") String name) {
	        imageSrv.push(name);
	        System.out.println("I am Pushing a Image!");
	        List<Image> resultlist =imageSrv.List();
			System.out.println("Here is repo");
			String[] repo =resultlist.get(0).getRepoTags();
			System.out.println("Size of repo"+ repo.length);
			System.out.println(" repo Info"+ repo[0]);
			ModelAndView model=new ModelAndView("imageslist","list",resultlist);
			return model;
	    }


	

}
