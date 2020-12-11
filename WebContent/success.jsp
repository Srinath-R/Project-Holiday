<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: vikramchandrasekaran
  Date: 11/29/20
  Time: 1:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>Logged in</title>
</head>
<body>
<%
    String temp;
    if (session != null) {
        if (session.getAttribute("uname") != null) {
            String name = (String) session.getAttribute("uname");
            temp = "Hello, " + name + "  Welcome to ur Profile";
            out.println(temp);
        }
    }
    else {
        response.sendRedirect("login_page.jsp");}

%>
</body>
</html>
