
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Controller
 */
@WebServlet(name="/viewLeave", urlPatterns ="/viewLeave")

/**
* This servlet acts as a page controller for the application, handling all
* requests from the user.
*/
public class Controller extends HttpServlet {
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
       String actionType = request.getParameter("type");
       if(actionType == null)
       {
    	   actionType = "NULL";
       }
       String id = request.getParameter("id");
       HttpSession session = request.getSession();
       String user_id = (String) session.getAttribute("user_id");
       try {
           switch (actionType) {
//           case "/studentleavereport.jsp":
//               showNewForm(request, response);
//               break;
           case "/insert":
               insertLeave(request, response);
               break;
           case "delete":
               deleteLeave(request, response);
               break;
           case "/edit":
               showEditForm(request, response);
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
       RequestDispatcher dispatcher;
       if(request.getSession().getAttribute("profession").equals("FACULTY"))
    	   dispatcher = request.getRequestDispatcher("view_Leave.jsp");
       else
    	   dispatcher = request.getRequestDispatcher("viewLeave.jsp");
       dispatcher.forward(request, response);
   }

   private void showNewForm(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       RequestDispatcher dispatcher = request.getRequestDispatcher("studentleavereport.jsp");
       dispatcher.forward(request, response);
   }

   private void showEditForm(HttpServletRequest request, HttpServletResponse response)
           throws SQLException, ServletException, IOException {
       int id = Integer.parseInt(request.getParameter("id"));
       Leave existingLeave = leaveDAO.getLeave(id, (int)request.getSession().getAttribute("user_id"));
       RequestDispatcher dispatcher = request.getRequestDispatcher("LeaveForm.jsp");
       request.setAttribute("leave", existingLeave);
       dispatcher.forward(request, response);

   }

   private void insertLeave(HttpServletRequest request, HttpServletResponse response)
           throws SQLException, IOException {
	   String applied_from = request.getParameter("applied_from");
       String applied_till = request.getParameter("applied_till");
       String type = request.getParameter("type");
       String purpose = request.getParameter("purpose");
       String status = request.getParameter("status");

       Leave newLeave = new Leave(applied_from, applied_till, type, purpose, status);
       leaveDAO.insertLeave(newLeave);
       response.sendRedirect("list");
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

   private void deleteLeave(HttpServletRequest request, HttpServletResponse response)
           throws SQLException, IOException {
       int id = Integer.parseInt(request.getParameter("id"));

       Leave leave = new Leave(id);
       leaveDAO.deleteLeave(leave, (String)request.getSession().getAttribute("user_id"));
       response.sendRedirect("viewLeave");

   }
}
