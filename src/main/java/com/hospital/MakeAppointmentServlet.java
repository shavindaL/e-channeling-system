package com.hospital;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MakeAppointmentServlet")
public class MakeAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		String appointId = request.getParameter("apptId");
		String total = request.getParameter("total");
		//String cardType = request.getParameter("cardtype");
		System.out.println(appointId);
		String patientId = "1"; 
	    //System.out.println(dateTime);
	    
	    boolean makeSuccess = HospitalDBUtil.makeAnAppointment(appointId, patientId, total);
	    PrintWriter out = response.getWriter();
	    
	    if (makeSuccess==true) {
	    	//RequestDispatcher dispatch = request.getRequestDispatcher("patient_newAppointment.jsp");
			//dispatch.forward(request, response);
			out.println("<script type='text/javascript' src='js/makeApptSuccess.js'></script>");
		}
	}

}
