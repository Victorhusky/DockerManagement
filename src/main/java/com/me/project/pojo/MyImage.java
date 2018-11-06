package com.me.project.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="images")
public class MyImage {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id", unique = true, nullable = false)
	private int id;
	
	
	@Column(name="name")
	private String name;
	@Column(name="createdtime")
	private Date createdTime;
	
	@Column(name="description")
	private String description;
	

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public MyImage() {
		super();
	}
	
}
