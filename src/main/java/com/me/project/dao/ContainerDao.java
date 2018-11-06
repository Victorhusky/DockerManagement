package com.me.project.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.me.project.pojo.MyContainer;
import com.me.project.pojo.MyImage;;

@Service
public class ContainerDao extends Dao {
	 public MyContainer addContainer(MyContainer container) throws Exception {
	       try {
	    	   begin();
	    	   System.out.println("Before Save container");
	    	   getSession().save(container);
	    	   System.out.println("After Save container");
	    	   commit();
	    	   return container;
	       } catch(HibernateException e) {
	      	 rollback();
	    	 throw new Exception("Exception while creating Container", e);
	     }
}
	 
	 
	 public ArrayList<MyContainer> SearchByName(String keyword) throws Exception {
		 try {
			 begin();
			 Query q=null;
			  q = getSession().createQuery("from MyContainer where name like '%" + keyword + "%'");
			  List<MyContainer> list = q.list();
			  commit();
			  return (ArrayList)list;
			  
			  
		 }catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not list the Containers", e);
	 }
	 }
	 //Should Find A way to Compare Time
	 
	 public ArrayList<MyContainer> SearchByTime(Date date) throws Exception {
		 try {
			 begin();
			 Criteria criteria = getSession().createCriteria(MyImage.class);
			 criteria.add(Restrictions.ge("createdTime",date));
			 ArrayList<MyContainer> list = (ArrayList<MyContainer>)criteria.list();
			  return list;
			  
			  
		 }catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not list the Containers", e);
	 }
	 }
	 
	 
		
}
