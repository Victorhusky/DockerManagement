package com.me.project.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.stereotype.Service;

import com.me.project.pojo.HostPort;
import com.me.project.pojo.User;

@Service
public class HostDao extends Dao{
	 public HostPort addHost(HostPort hostport) throws Exception {
	       try {
	    	   begin();
	    	   System.out.println("Before Save Host");
	    	   
	    	   getSession().save(hostport);
	    	   System.out.println("After Save Host");
	    	   commit();
	    	   return hostport;
	       } catch(HibernateException e) {
	      	 rollback();
	    	 throw new Exception("Exception while creating User", e);
	     }
}
	 
	
	 
	 
}
