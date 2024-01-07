package com.hospital;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteAppointmentServlet
 */
@WebServlet("/DeleteAppointmentServlet")
public class DeleteAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String apptId = request.getParameter("apptId");
		
		boolean deleteSuccess = false;
		
		deleteSuccess = HospitalDBUtil.deleteUpdateDet(apptId);
		
		if(deleteSuccess==true) {
			RequestDispatcher dispatch = request.getRequestDispatcher("hospital_viewAppointment.jsp");
			dispatch.forward(request, response);
		}else {
			System.out.println("Failed");
		}
		
	}

}
