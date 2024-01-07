package com.hospital;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Hospital_LoginServlet")
public class HospitalLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpSession session = request.getSession(false);		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		boolean loginValid;
			
		
		
		
		
		try {
			con = JDBC.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM medi_test.hospital h WHERE h.username = '" + username + "';";
			rs = stmt.executeQuery(sql);
			
			loginValid = HospitalDBUtil.validateHospitalLoginInfo(username, password);
			
			if(loginValid == true) {
				while(rs.next()) {
					String hospitalId = rs.getNString(1);
					String name = rs.getNString(2);
					String location = rs.getNString(3);
					String phoneNo = rs.getNString(4); 
					String usernameHos = rs.getNString(5);
					String passwordHos = rs.getNString(6);
					
					
					session.setAttribute("hospitalId", hospitalId);
					session.setAttribute("name", name);
					session.setAttribute("location", location);
					session.setAttribute("phoneNo", phoneNo);
					session.setAttribute("usernameHos", usernameHos);
					session.setAttribute("passwordHos", passwordHos);
					RequestDispatcher dispatch = request.getRequestDispatcher("hospital_Dashboard.jsp");
					dispatch.forward(request, response);
				}
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
			
	}
}	