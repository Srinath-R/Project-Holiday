package in.co.NCP_Project;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username");
        String pword = request.getParameter("password");
        try
        {

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ncp","root","admin");
            Statement cr = con.createStatement();
            ResultSet result_set = cr.executeQuery("SELECT * FROM ADMIN ;");

//            System.out.println("uname: " + uname);
//            System.out.println("pword: " + pword);
            String f_name="";
            String profession="";
            String user_id="";
            int flag=0;
            while(result_set.next())
            {
                String check_uname = result_set.getString("username");
                String check_password = result_set.getString("password");
                if(check_uname.equals(uname) && check_password.equals(pword))
                {
                    flag=1;
                    f_name=result_set.getString("firstname");
                    profession=result_set.getString("profession");
                    user_id=result_set.getString("college_ID");
                    break;
                }
            }
            String page;
            if(flag == 0)
            {
                // Invalid credentials
                page=request.getContextPath()+"/login";
            }
            else
            {
                // Valid credentials
                HttpSession c_session=request.getSession();
                c_session.setAttribute("uname",uname);
                c_session.setAttribute("first_name",f_name);
                c_session.setAttribute("profession",profession);
                c_session.setAttribute("user_id",user_id);
                if(profession.equals("FACULTY"))
                    page=request.getContextPath()+"/faculty";
                else if(profession.equals("ADMIN"))
                	page=request.getContextPath()+"/register";
                else
                    page=request.getContextPath()+"/student";
            }
//            RequestDispatcher dd=request.getRequestDispatcher(page);
//            dd.forward(request, response);
            response.sendRedirect(page);
        }
        catch(Exception e)
        {
            System.out.println("Exception occured "+e);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
//        response.sendRedirect("login_page.jsp");
        HttpSession session = request.getSession();
        if (session != null) {
            if (session.getAttribute("uname") != null) {
                if(session.getAttribute("profession").equals("STUDENT"))
                    request.getRequestDispatcher("/student").forward(request,response);
                else if(session.getAttribute("profession").equals("FACULTY"))
                    request.getRequestDispatcher("/faculty").forward(request,response);
                else if(session.getAttribute("profession").equals("ADMIN"))
                	request.getRequestDispatcher("/register").forward(request,response);
            }
            response.sendRedirect("login_page.jsp");
        }

    }
}
