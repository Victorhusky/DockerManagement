package com.me.project.dao;


import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.me.project.pojo.*;

@Service
public class UserDao extends Dao{
	 public User addUser(User user) throws Exception {
	       try {
	    	   begin();
	    	   System.out.println("Before Save User");
	    	   getSession().save(user);
	    	   System.out.println("After Save User");
	    	   commit();
	    	   return user;
	       } catch(HibernateException e) {
	      	 rollback();
	    	 throw new Exception("Exception while creating User", e);
	     }
}
	 
	 public Boolean Auth(String name,String password) throws Exception{
		 try {
			 begin();
			 
			 String q = "from User where name = ? and password =?";
			 List<User>list = getSession().createQuery(q).setString(0, name).setString(1, password).list();
			 if(list.isEmpty()) {
				 System.out.println("false");
				 return false;
			 }
			 else {
				 System.out.println("true");
				 return true;
			 }
		 }catch(HibernateException e) {
	      	 rollback();
	      	 System.out.println("Faced Hibernate Exception!");
	    	 throw new Exception("Exception while searching User", e);
		 
	 }
	 
	 
}
	 public String GetRole(String name)throws Exception{
		 try {
			 begin();
			 String q = "from User where name = ?";
			 List<User>list = getSession().createQuery(q).setString(0, name).list();
			 String role =list.get(0).getRole();
			 System.out.println("You log in with the role: " +role);
			 return role;
			 
		 }
		 catch(HibernateException e) {
	      	 rollback();
	      	 System.out.println("Faced Hibernate Exception!");
	    	 throw new Exception("Exception while Finding User role", e);
		 
	 }
}
}
