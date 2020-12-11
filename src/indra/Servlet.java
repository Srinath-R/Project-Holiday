package indra;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "Servlet", urlPatterns ="/Servlet")
public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Absentees_table_dao bookDAO;

    public void init() {
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
        bookDAO = new Absentees_table_dao(jdbcURL, jdbcUsername, jdbcPassword);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        String actionType = request.getParameter("type");

        try {
            if(actionType==null){
                actionType="hallelujah";
            }
            switch (actionType) {
                case "calendar_click":
                    calendar_click(request,response);
                    break;

                default:
                    listALL(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listALL(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Absentees_table> listDate = bookDAO.listAllDates();
        System.out.println(listDate.size());

        request.setAttribute("listDate", listDate);
        RequestDispatcher dispatcher = request.getRequestDispatcher("retrieve.jsp");
        dispatcher.forward(request, response);
    }


    private void calendar_click(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        System.out.println(id.split("-")[0].replace("\"",""));
        int year1=Integer.parseInt(id.split("-")[0].replace("\"",""));
        int year2=year1-1;
        int year3=year2-1;
        List<Absentees_table> listDate = bookDAO.listselDates(Integer.toString(year1)+"-"+id.split("-")[1].replace("\"","")+"-"+id.split("-")[2].replace("\"",""),Integer.toString(year2)+"-"+id.split("-")[1].replace("\"","")+"-"+id.split("-")[2].replace("\"",""),Integer.toString(year3)+"-"+id.split("-")[1].replace("\"","")+"-"+id.split("-")[2].replace("\"",""));
        List<Absentees_table> listspecificDate=bookDAO.listspecDates(Integer.toString(year1)+"-"+id.split("-")[1].replace("\"","")+"-"+id.split("-")[2].replace("\"",""));
        System.out.println(listDate.size());

        request.setAttribute("listDate", listDate);
        request.setAttribute("listspecDate", listspecificDate);

        request.setAttribute("id", id);

        RequestDispatcher dispatcher = request.getRequestDispatcher("hello.jsp");
        dispatcher.forward(request, response);
    }




}
