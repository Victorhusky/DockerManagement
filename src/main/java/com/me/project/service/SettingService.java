package com.me.project.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

import com.github.dockerjava.api.DockerClient;
import com.github.dockerjava.api.model.Info;
import com.github.dockerjava.api.model.Version;
import com.me.project.dao.HostDao;
import com.me.project.pojo.HostPort;




@Service
public class SettingService {
	@Autowired
	DockerService docker;
	@Autowired
	HostDao hostdao;
	public HostPort GetHostPort(){
		return new HostPort("47.90.209.189","2375");
		
	}
	public void SetHostPort(HostPort value) {
		  docker.setDockerPath(String.format("http://%s:%s", value.getHostIp(),
	                value.getHostPort()));
	}
	  public String getHostPortUrl() {
	        HostPort hostPort = GetHostPort();
	        return String.format("http://%s:%s", hostPort.getHostIp(),
	                hostPort.getHostPort());
	    }
	
	  public Info info() {
	        DockerClient cli = docker.getDockerClient();
	        if (cli == null)
	            return null;
	        return cli.infoCmd().exec();
	    }
	    public Version version() {
	        DockerClient cli = docker.getDockerClient();
	        if (cli == null)
	            return null;
	        return cli.versionCmd().exec();
	        
	        
	    }
	  
	  
	  
}
