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

@WebServlet("/UpdateAppointmentServlet")
public class UpdateAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int appointmentId =  Integer.parseInt(request.getParameter("apptId"));
		String hospitalId = (String)session.getAttribute("hospitalId");
		String docId =  request.getParameter("docId");
		String date =  request.getParameter("date");
		String startTime =  request.getParameter("startTime");
		String endTime =  request.getParameter("endTime");
		
		System.out.println(appointmentId);
		boolean updateSuccess = HospitalDBUtil.updateApptDet(appointmentId, docId, date, startTime, endTime, hospitalId);
		
		if(updateSuccess==true) {
			RequestDispatcher dispatch = request.getRequestDispatcher("hospital_updateAppointment.jsp");
			dispatch.forward(request, response);
			System.out.println("no error");
		} else {
			RequestDispatcher dispatch = request.getRequestDispatcher("hospital_updateAppointment.jsp");
			dispatch.forward(request, response);
			System.out.println("error");
		}
	}

}
