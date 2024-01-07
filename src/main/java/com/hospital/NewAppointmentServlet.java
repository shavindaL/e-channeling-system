package com.hospital;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/NewAppointmentServlet")
public class NewAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String hosId = (String)session.getAttribute("hospitalId");
		String docId = request.getParameter("docId");
		String date = request.getParameter("date");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");		
		boolean insertSuccess;
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		insertSuccess = HospitalDBUtil.insertAppointment(hosId, docId, date, startTime, endTime);
		
		if(insertSuccess == true) {
			out.println("<script type='text/javascript' src='js/insertSuccess.js'></script>");
		}else {
			RequestDispatcher dispatch = request.getRequestDispatcher("unsuccess.jsp");
			dispatch.forward(request, response);
		}
	}
}
