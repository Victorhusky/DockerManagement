package com.me.project.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.github.dockerjava.api.model.SearchItem;
import com.me.project.service.DockerService;
import com.me.project.service.SearchService;

@Controller
@RequestMapping(value="/",method=RequestMethod.GET)
public class SearchController {
	
	
	@Autowired
	DockerService docker;
	@Autowired
	SearchService searchSrv;
	
	@RequestMapping(value="searchimages",method=RequestMethod.POST)
	public ModelAndView SearchResult(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String keyword= request.getParameter("keyword");
	
		
		List<SearchItem> result =searchSrv.serachRst(keyword);
		
		System.out.println("result Number :" +result.size() );
		HashMap map =new HashMap();
		map.put("result", result);
		map.put("size",result.size());
		return new ModelAndView("searchresult","map",map);
	}
	
	}
