package com.hospital;

public class Doctor {
	private String docId;
	private String name;
	private String specialization;
	private String nic;
	private String gender;
	private String address;
	private String phone;
	private String userName;
	private String password;
	public Doctor(String docId, String name, String specialization, String nic, String gender, String address, String phone, String userName, String password) {
		
		this.docId = docId;
		this.name = name;
		this.specialization = specialization;
		this.nic = nic;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.userName = userName;
		this.password = password;
	}
	
	public Doctor(String name, String specialization) {
		this.name = name;
		this.specialization = specialization;
	}
	
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public String getNic() {
		return nic;
	}
	public void setNic(String nic) {
		this.nic = nic;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
