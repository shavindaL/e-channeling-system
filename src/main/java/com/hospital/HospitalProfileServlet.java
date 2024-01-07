package com.hospital;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class HospitalProfileServlet
 */
@WebServlet("/HospitalProfileServlet")
public class HospitalProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {					
			HttpSession session = request.getSession();
			String username = (String)session.getAttribute(getServletName());
			List<Hospital> hospitalDet =  HospitalDBUtil.getHospitalInfo(username);								
			request.setAttribute("hospitalDet", hospitalDet);
			RequestDispatcher dispatch = request.getRequestDispatcher("hospital_profile.jsp");
			dispatch.forward(request, response);	
	} catch (Exception e) {
		System.out.println("Error on HospitalLogin Servlet\n" + e);
	}

}
}
