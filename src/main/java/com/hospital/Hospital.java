package com.hospital;

public class Hospital {
	private String hospitalId;
	private String name;
	private String location;
	private String phoneNo;
	private String username;
	private String password;
	
	public Hospital(String hospitalId, String name, String location, String phoneNo, String username, String password) {
		this.hospitalId = hospitalId;
		this.name = name;
		this.location = location;
		this.phoneNo = phoneNo;
		this.username = username;
		this.password = password;
	}
	
	public Hospital(String hospitalId, String name) {
		this.hospitalId = hospitalId;
		this.name = name;
	}

	public String getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(String hospitalId) {
		this.hospitalId = hospitalId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
