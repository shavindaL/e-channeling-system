package com.hospital;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MakeAppointment")
public class SearchAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String docName = request.getParameter("Doctor");
		String specialization = request.getParameter("Specialization");
		String hosName =  request.getParameter("Hospital");
		
		if (docName != null) {
			try {
				
				List<Appointment> apptInfo=HospitalDBUtil.getAppointmentInfoDocName(docName);
				request.setAttribute("apptInfo", apptInfo);
				
				RequestDispatcher dispatch = request.getRequestDispatcher("patient_availableAppointments.jsp");
				dispatch.forward(request, response);
				
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (specialization != null){
			
			List<Appointment> apptInfo=HospitalDBUtil.getAppointmentInfoSpecialization(specialization);
			request.setAttribute("apptInfo", apptInfo);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("patient_availableAppointments.jsp");
			dispatch.forward(request, response);
			
		}else if(hosName != null){
			List<Appointment> apptInfo=HospitalDBUtil.getAppointmentInfoHospital(hosName);
			request.setAttribute("apptInfo", apptInfo);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("patient_availableAppointments.jsp");
			dispatch.forward(request, response);
		}
		else {
			System.out.println("Error on SearchAppointment Servlet");
		}
		
		
		
		
		
	}

}
