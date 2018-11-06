package com.me.project.dao;

import java.util.ArrayList;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.me.project.pojo.MyDockerFile;;

@Service
public class DockerFileDao extends Dao {
	 public MyDockerFile addFile(MyDockerFile file) throws Exception {
	       try {
	    	   begin();
	    	   System.out.println("Before Save Dockerfile");
	    	   getSession().save(file);
	    	   System.out.println("After Save Dockerfile");
	    	   commit();
	    	   return file;
	       } catch(HibernateException e) {
	      	 rollback();
	    	 throw new Exception("Exception while creating DockerFile", e);
	     }
}
	 
	 public ArrayList<MyDockerFile> showAll() throws Exception{
		 try {
			 begin();
			 Query q=null;
			 String keyword="FROM";
			  q = getSession().createQuery("from MyDockerFile where text like '%" + keyword + "%'");
			  ArrayList<MyDockerFile> result =(ArrayList<MyDockerFile>)q.list(); 
			  return result;
		 } catch(HibernateException e) {
	      	 rollback();
	    	 throw new Exception("Exception while Showing DockerFile", e);
		 
		 
	 }

}
}
