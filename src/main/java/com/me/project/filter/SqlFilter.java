package com.me.project.filter;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class SqlFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Demo1Filter init....");

	}

	 static String reg = "(?:')|(?:--)|(/\\*(?:.|[\\n\\r])*?\\*/)|"  
    		 + "(\\b(select|update|and|or|delete|insert|trancate|char|into|substr|ascii|"
    		 + "declare|exec|count|master|into|drop|execute)\\\\b)";
    
    static Pattern sqlPattern = Pattern.compile(reg, Pattern.CASE_INSENSITIVE); 
    
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		 
		HttpServletRequest req = (HttpServletRequest)request;
		
	    String name=req.getParameter("name");
        String password=req.getParameter("password");
		
		String flag= "true";
		
		if(isValid(name)&&isValid(password)) {
			flag="true";
			System.out.println("Input Valid!");
		}
		else {
			flag="false";
			System.out.println("Input not Valid!");
		}
		
		request.setAttribute("flag",flag);
		chain.doFilter(request, response);
	}
	 public static boolean isValid(String str) {  
	        if (sqlPattern.matcher(str).find()) { 
	        	return false;
   	  }
			return true;
	  }  
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}