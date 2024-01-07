package com.hospital;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBC {
	private static String url = "jdbc:mysql://localhost:3306/medi_test";
	private static String username = "root";
	private static String password = "Abcd@1234";
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			System.out.println("Connection Unsuccess");
		}
		
		return con;
	}
}	