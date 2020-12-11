package net.javaguides.admin.controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.admin.dao.adminDao;
import net.javaguides.admin.model.aadmin;

@WebServlet("/register")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
private adminDao AdminDao;
	
	public void init() {
		AdminDao = new adminDao();
	}
	
	//private admin
	
//   private adminDao admindao=new adminDao();
//  private adminDao AdminDao;
//	
//	public void init() {
//		AdminDao = new adminDao();
//	}
//    public AdminServlet() {
//       super();
//    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("/adminregister.jsp");
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String firstname=request.getParameter("firstName");
		String lastname=request.getParameter("lastName");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		//String confirmpassword=request.getParameter("confirmpassword");
		String dob=request.getParameter("dob");
		String collegeid=request.getParameter("cid");
		String Profession=request.getParameter("typef");
		
		
		
		//response.sendRedirect("employeedetails.jsp");
		
		aadmin admin=new aadmin();
		admin.setusername(username);
		admin.setFirstname(firstname);
		admin.setLastname(lastname);
		admin.setContact(contact);
		admin.setEmail(email);
		admin.setPassword(password);
		//admin.setConfirmpassword(confirmpassword);
		admin.setDob(dob);
		admin.setCollegeid(collegeid);
		admin.setProfession(Profession);
		
		try {
			AdminDao.registeradmin(admin);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		RequestDispatcher dispatcher=request.getRequestDispatcher("/admindetails.jsp");
		dispatcher.forward(request,response);
	
	}

}


