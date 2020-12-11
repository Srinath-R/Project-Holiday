package indra;

import java.io.IOException;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ApplyLeaveServlet
 */
@WebServlet(name = "applyLeave", urlPatterns ="/applyLeave")
public class ApplyLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ApplyLeaveDAO obj2;

	/**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
		obj2 = new ApplyLeaveDAO(jdbcURL, jdbcUsername, jdbcPassword);
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("applyleave.jsp");
		dispatcher.forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//HttpSession session = request.getSession(false);
		//int id = (int)session.getAttribute("id");
		
		int id = 5;
//		try {
//			id = obj2.getMaxId() + 1;
//		} catch (SQLException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		String college_id = (String)request.getSession().getAttribute("user_id");
//		String college_id = "CB.EN.U4CSE17361";
		String type = request.getParameter("type");
		String applied_from = request.getParameter("applied_from");
		String applied_till = request.getParameter("applied_till");
		String purpose = request.getParameter("purpose");
		String status = "Pending";
		String faculty_name=request.getParameter("faculty");
		ApplyLeave obj = new ApplyLeave(id, college_id, applied_from, applied_till, type, purpose, status,faculty_name);
			try {
			obj2.insertApplyLeave(obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("id: " + id);
		System.out.println("college_id: " + college_id);
		System.out.println("type: " + type);
		System.out.println("applied_from: " + applied_from);
		System.out.println("applied_till: " + applied_till);
		System.out.println("purpose: " + purpose);
		System.out.println("status: " + status);
		RequestDispatcher dispatcher ;
		response.sendRedirect("viewLeave");
	}

}
