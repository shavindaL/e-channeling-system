package com.hospital;

public class Session {
	private int appointmentID;
	private String date;
	private String startTime;
	private String endTime;
	private String hospitalId;
	private	String docId;
	
	public Session(int appointmentID, String date, String startTime, String endTime, String hospitalId, String docId) {
		super();
		this.appointmentID = appointmentID;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.hospitalId = hospitalId;
		this.docId = docId;
		
		
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

	public String getDocId() {
		return docId;
	}

	public void setDocId(String docId) {
		this.docId = docId;
	}
	
}
