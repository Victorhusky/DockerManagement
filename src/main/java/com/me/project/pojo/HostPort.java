package com.me.project.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="host")
public class HostPort {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id", unique = true, nullable = false)
		private int id;
	@Column(name="port")
		private String HostPort;
	@Column(name="ip")
		private String HostIp ="0.0.0.0";
		
		public HostPort() {
			
		}
		public HostPort(String hostPort) {
			this.HostPort =hostPort;
		}
		public HostPort(String hostPort, String hostIp) {
			
			HostPort = hostPort;
			HostIp = hostIp;
		}
		public String getHostPort() {
			return HostPort;
		}
		public void setHostPort(String hostPort) {
			HostPort = hostPort;
		}
		public String getHostIp() {
			return HostIp;
		}
		public void setHostIp(String hostIp) {
			HostIp = hostIp;
		}
		
		
}
