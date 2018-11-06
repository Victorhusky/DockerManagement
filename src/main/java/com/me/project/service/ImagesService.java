package com.me.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.dockerjava.api.DockerClient;
import com.github.dockerjava.api.command.InspectImageResponse;
import com.github.dockerjava.api.model.AuthConfig;
import com.github.dockerjava.api.model.Image;

@Service
public class ImagesService {
@Autowired
DockerService docker;
		
		public String PullImage(String name) {
			  DockerClient cli = docker.getDockerClient();
		        if (cli == null)
		            {return null;}
		        else {
		        	System.out.println("Now I am Doing Pull");
		        	cli.pullImageCmd(name).withRegistry("dockerhub").withTag("latest").withRepository(name).exec();
		        	
		        	return "SuccessFully";
		        }
			
		}

		
		public List<Image> List() {
			DockerClient cli = docker.getDockerClient();
	        if (cli == null)
	            {return null;}
	        else {
	        	System.out.println("I am Trying to List All Images");
	        	 List<Image> list =cli.listImagesCmd().exec();
	        	 return list;
	        }
			
			
		}
		 public InspectImageResponse info(String name) {
		        DockerClient cli = docker.getDockerClient();
		        if (cli == null)
		            return null;
		        return cli.inspectImageCmd(name).exec();
		    }
		 public void push(String name) {
				DockerClient cli = docker.getDockerClient();
				if (cli == null)
		        return;
				System.out.println("I am Pushing ");
				AuthConfig config = new AuthConfig();
				config.setUsername("victorhusky");
				
				config.setPassword("2222z2222");
				config.setEmail("li.yang5@husky.neu.edu");
				cli.pushImageCmd(name).withAuthConfig(config).exec();
		}
		 
		 public void tag(String id, String tag) {
		        DockerClient cli = docker.getDockerClient();
		        if (cli == null)
		            return;
		        String[] tags = tag.split(":");
		        if (tags.length == 2)
		            cli.tagImageCmd(id, tags[0], tags[1]).exec();
		        else
		            cli.tagImageCmd(id, tag, null).exec();
		    }
		 public void delete(String name) {
		        DockerClient cli = docker.getDockerClient();
		        if (cli == null)
		            return;
		        cli.removeImageCmd(name).exec();
		    }

	

}
