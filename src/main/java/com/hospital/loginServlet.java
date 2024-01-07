package com.hospital;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medic", "root", "Abcd@1234");
			PreparedStatement pst = con.prepareStatement("select * from patient where Email = ? and Password = ?");
			pst.setString(1,email);
			pst.setString(2,password);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				session.setAttribute("email", rs.getString("Email"));
				session.setAttribute("name", rs.getString("Name"));
				session.setAttribute("dob", rs.getString("DOB"));
				session.setAttribute("password", rs.getString("Password"));
				session.setAttribute("gender", rs.getString("Gender"));
				session.setAttribute("nic", rs.getString("NIC"));
				session.setAttribute("pid", rs.getString("PID"));
				dispatcher = request.getRequestDispatcher("patient_home_page.jsp");
			}else {
				PreparedStatement pst1 = con.prepareStatement("select * from hospital where user_name = ? and password = ?");
				pst1.setString(1,email);
				pst1.setString(2,password);
				
				ResultSet rs1 = pst1.executeQuery();
				if(rs1.next()) {
					session.setAttribute("usernameHos", rs1.getString("user_name"));
					session.setAttribute("name", rs1.getString("name"));
					dispatcher = request.getRequestDispatcher("hospital_Dashboard.jsp");
				}else {
					
					PreparedStatement pst2 = con.prepareStatement("select * from doctor where user_name = ? and password = ?");
					pst2.setString(1,email);
					pst2.setString(2,password);
					
					ResultSet rs2 = pst2.executeQuery();
				    if(rs2.next()) {
						session.setAttribute("email", rs2.getString("Email"));
						session.setAttribute("name", rs2.getString("Name"));
						
						
						dispatcher = request.getRequestDispatcher("doctor log in.jsp");
					}else {
				
				          request.setAttribute("status","failed");
				          dispatcher = request.getRequestDispatcher("signin.jsp");
				          }
				}
			}	dispatcher.forward(request, response);
				
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
