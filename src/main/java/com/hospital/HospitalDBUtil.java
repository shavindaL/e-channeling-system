package com.hospital;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;

public class HospitalDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	/*===================================================== Login Validation =====================================================*/
	public static boolean validateHospitalLoginInfo(String username, String password) {
		boolean isValid  = false;
		 try {
			 	con = JDBC.getConnection();
				stmt = con.createStatement();
				String sql = "SELECT * FROM medi_test.hospital h WHERE h.userName = '" + username + "' AND h.password ='" + password + "';";
				rs = stmt.executeQuery(sql);
				
				if(rs.next()) {
					 isValid = true;
					 
					 System.out.println("User Available");
				 }
				 else{
					isValid = false;
					System.out.println(username);
					System.out.println(password);
					System.out.println("User Unavailable");
				}
				
		} catch (Exception e) {
			System.out.println(e);
		}
		 
		return isValid;
	}
	
	/*===================================================== Retrieve hospital info from DB===================================================== */
	public static List<Hospital> getHospitalInfo(String username){
		
		//String user name = user name;
		
		ArrayList<Hospital> hospital = new ArrayList<>();
		
		
		try {
			con = JDBC.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM medi_test.hospital h WHERE h.username = '" + username + "';";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String hospitalId = rs.getNString(1);
				String name = rs.getNString(2);
				String location = rs.getNString(3);
				String phoneNo = rs.getNString(4); 
				String usernameHos = rs.getNString(5);
				String passwordHos = rs.getNString(6);
				
				Hospital hos = new Hospital(hospitalId, name, location, phoneNo, usernameHos, passwordHos);
				
				hospital.add(hos);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return  hospital;
	}
	
	//Insert Data to appointment table.
	public static boolean insertAppointment(String hosID, String docID, String date, String startTime, String endTime) {
		boolean insertSuccess = false;
		
		try {
			con = JDBC.getConnection();
			stmt = con.createStatement();
			String sql = "INSERT INTO medi_test.appointment(date, startTime, endTime, hosID, docId) VALUES('"+ date +"','"+ startTime + "','" + endTime + "','" + hosID + "','" + docID +"')";
			int executionStat = stmt.executeUpdate(sql);
			
			if(executionStat > 0) {
				insertSuccess = true;
				System.out.println("Success");
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return insertSuccess;
	}

	//Retrieve data from appointment table
	public static List<Session> getSessionInfoHos(String hospitalId) {
		
		ArrayList<Session> sess = new ArrayList<>();
		
		try {
			con = JDBC.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM medi_test.appointment a WHERE a.hosId = '"+ hospitalId +"';";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int appointmentID = rs.getInt(1);
				String date = rs.getString(2);
				String startTime = rs.getString(3);
				String endTime = rs.getString(4);
				String hosId = rs.getString(5);
				String doctorId = rs.getString(6);
				
				Session session = new Session(appointmentID, date, startTime, endTime, hosId, doctorId);
				sess.add(session);	
			}
			
		
		} catch (Exception e) {
			
		}
		
		return sess;
	}
	
	//Update data from appointment table
	public static boolean updateApptDet(int apptId,String docId, String date, String sTime, String eTime, String hosId) {
		boolean updateSuccess=false;
		
		try {
			System.out.println(hosId);
			con = JDBC.getConnection();
			stmt = con.createStatement();
			String sql = "UPDATE medi_test.appointment set date = '" + date +  "' , startTime = '" + sTime + "' , endTime = '" + eTime + "' WHERE hosID = '"+ hosId +"' AND aid ="+apptId;
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				updateSuccess = true;
				System.out.println("Success");
			}
			else {
				System.out.println("Unsuccess");
			}
			
		} catch (Exception e) {
			System.out.println(e);
			
		}
		
		return updateSuccess;
	}
	
	//Delete data from appointment table
	public static boolean deleteUpdateDet(String apptId) {
		boolean deleteSuccess = false;
				
		try {
			con = JDBC.getConnection();
			stmt = con.createStatement();
			String sql = "DELETE FROM medi_test.appointment WHERE aid = '" + apptId + "';";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				deleteSuccess = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return deleteSuccess;
	}
	
	
	//Retrieve Appointment information by Doctor Name
	public static List<Appointment> getAppointmentInfoDocName(String docName) {
		ArrayList<Appointment> appointment = new ArrayList<>();
		
		
		try {
			con = JDBC.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT a.aid, a.date, a.startTime, a.endTime, d.name, d.specialization, h.name, h.location FROM medi_test.appointment a, medi_test.doctor d, medi_test.hospital h WHERE d.name = '" + docName +"' AND d.docId=a.docId AND a.hosID = h.hospitalId;";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int appointmentID = rs.getInt(1);
				String date = rs.getString(2);
				String startTime = rs.getString(3);
				String endTime = rs.getString(4);				
				
				String name =  rs.getString( 5);
				String dSpecial = rs.getString(6);
				
				String hosName = rs.getString(7);
				String hosLocation = rs.getString(8);;
									
				Appointment appoint = new Appointment(appointmentID, date, startTime, endTime, hosName, hosLocation, name, dSpecial);
				appointment.add(appoint);	
				
				
			}

		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return appointment;
	}
	
	
	//Retrieve Appointment information by Specialization
	public static List<Appointment> getAppointmentInfoSpecialization(String docSpecial) {
		ArrayList<Appointment> appointment = new ArrayList<>();
		
		
		try {
			con = JDBC.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT a.aid, a.date, a.startTime, a.endTime, d.name, d.specialization, h.name, h.location FROM medi_test.appointment a, medi_test.doctor d, medi_test.hospital h WHERE d.specialization='" + docSpecial +"' AND d.docId=a.docId AND a.hosID = h.hospitalId;";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int appointmentID = rs.getInt(1);
				String date = rs.getString(2);
				String startTime = rs.getString(3);
				String endTime = rs.getString(4);				
				
				String name =  rs.getString( 5);
				String dSpecial = rs.getString(6);
				
				String hosName = rs.getString(7);
				String hosLocation = rs.getString(8);;
									
				Appointment appoint = new Appointment(appointmentID, date, startTime, endTime, hosName, hosLocation, name, dSpecial);
				appointment.add(appoint);	
				
				
			}

		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return appointment;
	}
	
	
	//Retrieve Appointment information by Hospital
	
	public static List<Appointment> getAppointmentInfoHospital(String hosName) {
		ArrayList<Appointment> appointment = new ArrayList<>();
		
		
		try {
			con = JDBC.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT a.aid, a.date, a.startTime, a.endTime, d.name, d.specialization, h.name, h.location FROM medi_test.appointment a, medi_test.doctor d, medi_test.hospital h WHERE h.name='" + hosName +"' AND d.docId=a.docId AND a.hosID = h.hospitalId;";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int appointmentID = rs.getInt(1);
				String date = rs.getString(2);
				String startTime = rs.getString(3);
				String endTime = rs.getString(4);				
				
				String name =  rs.getString( 5);
				String dSpecial = rs.getString(6);
				
				String hospitalName = rs.getString(7);
				String hosLocation = rs.getString(8);;
									
				Appointment appoint = new Appointment(appointmentID, date, startTime, endTime, hospitalName, hosLocation, name, dSpecial);
				appointment.add(appoint);	
				
				
			}

		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return appointment;
	}
	

	//Make Appointment
	public static boolean makeAnAppointment(String appointmentId, String patientId, String total){
		boolean makeSuccess = false;
		
		try {
			con = JDBC.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO medi_test.payment (appointmentId, patientId, datetime, amount) VALUES("+ appointmentId + "," + patientId +", NOW(),"+ total + ");";
						
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				makeSuccess = true;
			}
			else {
				System.out.println("query execution failed");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return makeSuccess;
		
	}
	
	//Update data hospital table
		public static boolean updateHospitalDet(String hospitalId, String location, String phoneNo, String password) {
			boolean updateSuccess=false;
			
			try {
				con = JDBC.getConnection();
				stmt = con.createStatement();
				String sql = "UPDATE medi_test.hospital set location = '" +location+ "', phone = '"+ phoneNo +"', password = '"+ password +"' WHERE hospitalId ='H001';";
				int rs = stmt.executeUpdate(sql);
				
				if(rs>0) {
					updateSuccess = true;
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("error");
			}
			
			return updateSuccess;
		}
	
}