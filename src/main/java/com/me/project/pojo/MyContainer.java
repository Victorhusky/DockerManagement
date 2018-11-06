package com.me.project.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.github.dockerjava.api.model.*;




@Entity
@Table(name="containers")
public class MyContainer {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id", unique = true, nullable = false)
	private int id;
	@Column(name="name")
	private String name;
	
	@Column(name="fromimage")
	
	private String fromImage;
	
	@Column(name="createdtime")
	private Date createdTime;
	@Column(name="ports")
	private String ports;

		public MyContainer() {
		
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		
		
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getFromImage() {
			return fromImage;
		}

		public void setFromImage(String fromImage) {
			this.fromImage = fromImage;
		}

		public Date getCreatedTime() {
			return createdTime;
		}

		public void setCreatedTime(Date createdTime) {
			this.createdTime = createdTime;
		}

		public String getPorts() {
			return ports;
		}

		public void setPorts(String ports) {
			this.ports = ports;
		}
		
		
}
