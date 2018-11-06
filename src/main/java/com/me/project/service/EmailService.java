package com.me.project.service;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
	public void sendEmail(String id ,String type) {
		try {
			Email email = new SimpleEmail();
			email.setHostName("smtp.googlemail.com");
			email.setSmtpPort(465);
			email.setAuthenticator(new DefaultAuthenticator("contactapplication2018@gmail.com", "springmvc"));
			email.setSSLOnConnect(true);
			email.setFrom("li.yang5@husky.neu.edu"); // This user email does not									// exist
			email.setSubject("Delete Reminder");
			
			String message="You have delete your "+ type+ " which Name is "+id +", The operation could not be retrive ! We send this email to you for a kindly reminder!"; 
			
			email.setMsg(message); // Retrieve email from the DAO and send this
			email.addTo("liyanghusky@gmail.com");
			email.send();
		} catch (EmailException e) {
			System.out.println("Email cannot be sent");
		}
	
}
	
}
