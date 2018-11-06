package com.me.project.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;



import com.me.project.pojo.*;

@Service
public class ImageDao extends Dao {

	 public MyImage addImage(MyImage image) throws Exception {
	       try {
	    	   begin();
	    	   System.out.println("Before Save image");
	    	   getSession().save(image);
	    	   System.out.println("After Save image");
	    	   commit();
	    	   return image;
	       } catch(HibernateException e) {
	      	 rollback();
	    	 throw new Exception("Exception while creating Image", e);
	     }
}
	 
	 public ArrayList<MyImage> SearchByName(String keyword) throws Exception {
		 try {
			 begin();
			 Query q=null;
			  q = getSession().createQuery("from MyImage where name like '%" + keyword + "%'");
			  List<MyImage> list = q.list();
			  commit();
			  return (ArrayList)list;
			  
			  
		 }catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not list the categories", e);
	 }
	 }
		 
		 
		 //Should Find A way to Compare Time
	 public ArrayList<MyImage> SearchByTime(Date date) throws Exception {
		 try {
			 begin();
			 
			 Criteria criteria = getSession().createCriteria(MyImage.class);
			 criteria.add(Restrictions.ge("createdTime",date));
			 ArrayList<MyImage> list = (ArrayList<MyImage>)criteria.list();
			  return list;
			  
			  
		 }catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not list the categories", e);
	 }
	 }
		 
	 
}
