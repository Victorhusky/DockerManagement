package com.me.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.dockerjava.api.DockerClient;
import com.github.dockerjava.api.model.Info;
import com.github.dockerjava.api.model.SearchItem;

@Service
public class SearchService {
	@Autowired
	DockerService docker;
	
	public List<SearchItem> serachRst(String keyword) {
		  
		        DockerClient cli = docker.getDockerClient();
		        if (cli == null)
		            {return null;}
		        else {
		        	
		        		System.out.println(cli.pingCmd());
		        		System.out.println(keyword);
		        return cli.searchImagesCmd(keyword).exec();
		
	}
	
	}
}
