<%--
  Created by IntelliJ IDEA.
  User: kumar
  Date: 27-11-2020
  Time: 02:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>

<%@ page import="indra.Absentees_table" %>

<!DOCTYPE html>
<% String uname = (String)session.getAttribute("uname"); %>
<% String f_name = (String)session.getAttribute("first_name"); %>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <title>Leave Management System</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link rel="shortcut icon" type="image/png" href="#">
    <link rel="stylesheet" href="./css/style.css">

    <script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.3.2,npm/fullcalendar@5.3.2/main.min.js,npm/chart.js@2.9.3/dist/Chart.bundle.min.js,npm/chart.js@2.9.3/dist/Chart.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.3.2/main.min.css,npm/fullcalendar@5.3.2/main.min.css,npm/chart.js@2.9.3/dist/Chart.min.css">
    <style>
        table {
            border-collapse: collapse;
            width: 70%;
            margin: 50px;
        }

        th, td {
            padding: 4px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            margin-right: 2px;
        }

        tr:hover {background-color:#f5f5f5;}
    </style>
<body>
<!-- partial:index.partial.html -->
<div class="grid">
    <header class="header">
        <i class="fas fa-bars header__menu"></i>
        <div class="header__search">
            <input class="header__input" placeholder="Search..." />
        </div>
        <div class="header__avatar">
            <div class="dropdown">
                <ul class="dropdown__list">
                    <li class="dropdown__list-item">
                        <span class="dropdown__icon"><i class="far fa-user"></i></span>
                        <span class="dropdown__title">My profile</span>
                    </li>
                    <li class="dropdown__list-item">
                        <span class="dropdown__icon"><i class="fas fa-clipboard-list"></i></span>
                        <span class="dropdown__title">My account</span>
                    </li>
                    <li class="dropdown__list-item">
                        <span class="dropdown__icon"><i class="fas fa-sign-out-alt"></i></span>
                        <span class="dropdown__title">Log out</span>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <aside class="sidenav">

        <div class="sidenav__profile">
            <div class="sidenav__profile-avatar"></div>
            <div class="sidenav__profile-title text-light">User</div>
        </div>
        <div class="row row--align-v-center row--align-h-center">
            <ul class="navList">
                <li class="navList__heading">Functionalities<i class="far fa-file-alt"></i></li>
                <li>
                    <div class="navList__subheading row row--align-v-center">
                        <span class="navList__subheading-icon"><i class="fas fa-briefcase-medical"></i></span>
                        <span class="navList__subheading-title">Leave Management</span>
                    </div>
                    <ul class="subList subList--hidden">
                        <a href="./applyLeave">
                            <li class="subList__item">Apply for a Leave</li>
                        </a>
                        <a href="./reviewLeave">
                            <li class="subList__item">Approve Leave requests</li>
                        </a>
                        <a href="./viewLeave">
                            <li class="subList__item">View Leave requests</li>
                        </a>
                        <a href="./studentleavereport.jsp">
                            <li class="subList__item">View Student Leave report</li>
                        </a>


                    </ul>
                </li>
                <li>
                    <a href='./Servlet'>

                        <div class="navList__subheading row row--align-v-center">
                            <span class="navList__subheading-icon"><i class="fas fa-calendar"></i></span>
                            <span class="navList__subheading-title">Calendar</span>
                        </div>
                    </a>
                    

                    <a href='./logout'>

                        <div class="navList__subheading row row--align-v-center">
                            <span class="navList__subheading-icon"><i class="fas fa-arrow-left"></i></span>
                            <span class="navList__subheading-title">Log Out</span>
                        </div>
                    </a>
                </li>
            </ul>

        </div>
    </aside>
    <div style="text-align:center;align-content: center" >
        <h2>Calendar Inferences</h2>

        <table style="text-align: center">
            <h4>Details about absentees</h4>
            <tr>
                <th>Roll No</th>
                <th>Student Name</th>
                <th>Class</th>
                <th>No of Hrs</th>



            </tr>
            <c:forEach var="absentees_table" items="${listspecDate}">
            <tr>
                <td><c:out value="${absentees_table.rollno}" /></td>
                <td><c:out value="${absentees_table.name}" /></td>
                <td><c:out value="${absentees_table.class_year}" /></td>
                <td><c:out value="${absentees_table.no_of_hrs}" /></td>


            </tr>
            </c:forEach>
    </div>
    </table>

    <main class="main" style="width: 300px; height: 300px; margin-left: 20%; display: flex; background-color: white;">


        <canvas id="myChart" width="100" height="100"  style="margin-left:10%;"></canvas>
        <script>


        </script>
        <canvas id="myChart2" width="100" height="100"  style="margin-left: 30%; "></canvas>
        <script>
            var date = <%= request.getAttribute("id") %>

            <% ArrayList<Absentees_table> list1 = (ArrayList<Absentees_table>) request.getAttribute("listspecDate"); %>
                <% ArrayList<Absentees_table> list2 = (ArrayList<Absentees_table>) request.getAttribute("listDate"); %>

            bgcolor_template=['rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)']
            bordercolor_template=[ 'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)']
            bgcolor=[]
            list_size=<%out.print(list1.size());%>
            for (let i=0;i<list_size;i++){
                bgcolor.push(bgcolor_template[Math.floor(Math.random()*bgcolor_template.length)])
            }
            bordercolor=[]
            for (let i=0;i<list_size;i++){
                bordercolor.push(bordercolor_template[Math.floor(Math.random()*bordercolor_template.length)])
            }


                <%
                String [] class_array=new String[list1.size()];
                Set<String> setUniqueClass = new LinkedHashSet<String>();
                int i=0;
                for(Absentees_table item:list1)

                            {
                                setUniqueClass.add(item.getClass_year().toString());
                                i=i+1;
                            };
                 String [] class_array2=new String[list2.size()];
                Set<String> setUniqueClass2 = new LinkedHashSet<String>();
                i=0;
                for(Absentees_table item:list2)

                            {
                                setUniqueClass2.add(item.getClass_year());
                                i=i+1;
                            };
                %>
            labels=[<%
            Iterator<String> it=setUniqueClass.iterator();
            while(it.hasNext()){
                out.print('\'');
                out.print(it.next());
                out.print('\'');

                if (it.hasNext()){
                    out.print(',');
                }
            }
            %>]
            labels2=[<%
            it=setUniqueClass2.iterator();
            while(it.hasNext()){
                out.print('\'');
                out.print(it.next());
                out.print('\'');

                if (it.hasNext()){
                    out.print(',');
                }
            }
            %>]
            data= [<% i=0;
            for(Absentees_table item:list1)
                            {

                                out.print('\'');
                                out.print(item.getClass_year());
                                out.print('\'');


                                if (list1.size()>i){
                                    out.print(',');
                                }

                                 i=i+1;}
                        %>]
            data2= [<% i=0;
            for(Absentees_table item:list2)
                            {

                                out.print('\'');
                                out.print(item.getClass_year());
                                out.print('\'');


                                if (list2.size()>i){
                                    out.print(',');
                                }

                                 i=i+1;}
                        %>]
            count=[]
            let val=0
            for(let i=0;i<labels.length;i++){
                for (let j=0;j<data.length;j++){
                    if(labels[i]==data[j]){
                        val+=1;
                    }

                }
                count.push(val);
                val=0;
            };
            count2=[]
             val=0
            for(let i=0;i<labels2.length;i++){
                for (let j=0;j<data2.length;j++){
                    if(labels2[i]==data2[j]){
                        val+=1;
                    }

                }
                count2.push(val);
                val=0;
            };
            var ctx = document.getElementById('myChart2');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels:labels,
                    datasets: [{
                        label: 'Not a Good day for a test?',
                        data: count,
                        backgroundColor: bgcolor,
                        borderColor: bordercolor,
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            });


            var ctx2 = document.getElementById('myChart');
            var myChart2 = new Chart(ctx2, {
                type: 'pie',
                data: {
                    labels:labels2,
                    datasets: [{
                        data: count2,
                        backgroundColor: bgcolor,
                        borderColor:bordercolor,
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            });
        </script>
    </main>


</div>



</div>
<!-- partial -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src='https://www.amcharts.com/lib/3/amcharts.js'></script>
<script src='https://www.amcharts.com/lib/3/serial.js'></script>
<script src='https://www.amcharts.com/lib/3/themes/light.js'></script>
<script src="./javascript/script.js"></script>

</body>


</html>