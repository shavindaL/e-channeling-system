package com.hospital;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AppointmentInfoServlet
 */
@WebServlet("/AppointmentInfoServlet")
public class AppointmentInfoServlet extends HttpServlet {
	
	HttpSession session;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String hosId = (String) session.getAttribute("hospitalId");
									
		try {
			java.util.List<com.hospital.Session> sess = com.hospital.HospitalDBUtil.getSessionInfoHos(hosId);
			req.setAttribute("session", sess);
			RequestDispatcher dispatch = req.getRequestDispatcher("hospital_viewAppointment.jsp");
			dispatch.forward(req, resp);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}
}
