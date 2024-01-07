package com.hospital;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateHospitalServlet
 */
@WebServlet("/UpdateHospitalServlet")
public class UpdateHospitalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hosId = request.getParameter("hosId");
		String hosName =  request.getParameter("hosName");
		String username =  request.getParameter("userName");
		String location =  request.getParameter("location");
		String phoneNo =  request.getParameter("phone");
		String password =  request.getParameter("password");
		
		boolean updateSuccess = HospitalDBUtil.updateHospitalDet(hosId, location, phoneNo, password);
		
		if(updateSuccess==true) {	
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
		
			out.println("<script type='text/javascript' src='js/updateSuccess.js'></script>");
		} else {
			RequestDispatcher dispatch = request.getRequestDispatcher("unsuccess.jsp");
			dispatch.forward(request, response);
		}
	}

}
