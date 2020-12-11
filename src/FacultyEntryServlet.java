

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Faculty")
public class FacultyEntryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   private LeaveDAO leaveDAO;

	   public void init() {
	       String jdbcURL = getServletContext().getInitParameter("jdbcURL");
	       String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
	       String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

	       leaveDAO = new LeaveDAO(jdbcURL, jdbcUsername, jdbcPassword);

	   }

	   protected void doPost(HttpServletRequest request, HttpServletResponse response)
	           throws ServletException, IOException {
	       doGet(request, response);
	   }

	   protected void doGet(HttpServletRequest request, HttpServletResponse response)
	           throws ServletException, IOException {
	       //String action = request.getServletPath();
	       //System.out.println(action);
	       String actionType = request.getParameter("action");
	       if(actionType == null)
	       {
	    	   actionType = "NULL";
	       }
	       String id = request.getParameter("id");
	       HttpSession session = request.getSession();
	       String user_id = (String) session.getAttribute("user_id");
	       try {
	           switch (actionType) {
	           case "apply":
	               updateLeave(request, response);
	               break;
	           case "approve":
	               updateLeave(request, response);
	               break;
	           case "view":
	               updateLeave(request, response);
	               break;
	           case "/update":
	               updateLeave(request, response);
	               break;
	           default:
	               listLeave(request, response);
	               break;
	           }
	       } catch (SQLException ex) {
	           throw new ServletException(ex);
	       }
	   }

	   private void listLeave(HttpServletRequest request, HttpServletResponse response)
	           throws SQLException, IOException, ServletException {
		   
	       List<Leave> listLeave = leaveDAO.listAllLeaves((String)request.getSession().getAttribute("user_id"));
	       //System.out.println(listLeave.size());
	       request.setAttribute("listLeave", listLeave);
	       RequestDispatcher dispatcher = request.getRequestDispatcher("viewLeave.jsp");
	       dispatcher.forward(request, response);
	   }


	   private void updateLeave(HttpServletRequest request, HttpServletResponse response)
	           throws SQLException, IOException {
	       int id = Integer.parseInt(request.getParameter("id"));
	       String applied_from = request.getParameter("applied_from");
	       String applied_till = request.getParameter("applied_till");
	       String type = request.getParameter("type");
	       String purpose = request.getParameter("purpose");
	       String status = request.getParameter("status");

	       Leave leave = new Leave(id, applied_from, applied_till, type, purpose, status);
	       leaveDAO.updateLeave(leave);
	       response.sendRedirect("reviewLeave");
	   }
	
}
