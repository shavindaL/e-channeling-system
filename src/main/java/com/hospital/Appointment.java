package com.hospital;
//import java.time.*;

public class Appointment {
	private int appointmentID;
	private String date;
	private String startTime;
	private String endTime;
	private String hospitalId;
	private String hosName;
	private String location;
	private	String docId;
	private String docName;
	private String docSpecialization;
	
	public Appointment(int appointmentID, String date, String startTime, String endTime, String hospitalId, String hosName, String location, String docId, String docName, String docSpecialization) {
		
		this.appointmentID = appointmentID;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.hospitalId = hospitalId;
		this.hosName = hosName;
		this.location = location;
		this.docId = docId;
		this.docName = docName;
		this.docSpecialization = docSpecialization;
	}

public Appointment(int appointmentID, String date, String startTime, String endTime, String hosName, String location, String docName, String docSpecialization) {
		
		this.appointmentID = appointmentID;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.hosName = hosName;
		this.location = location;
		this.docName = docName;
		this.docSpecialization = docSpecialization;
	}
	
	public int getAppointmentID() {
		return appointmentID;
	}

	public void setAppointmentID(int appointmentID) {
		this.appointmentID = appointmentID;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(String hospitalId) {
		this.hospitalId = hospitalId;
	}

	public String getHosName() {
		return hosName;
	}

	public void setHosName(String hosName) {
		this.hosName = hosName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDocId() {
		return docId;
	}

	public void setDocId(String docId) {
		this.docId = docId;
	}

	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public String getDocSpecialization() {
		return docSpecialization;
	}

	public void setDocSpecialization(String docSpecialization) {
		this.docSpecialization = docSpecialization;
	}
	
}
