<%@ page import="indra.Absentees_table" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.LinkedHashSet" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>


<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
    
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
    
<!DOCTYPE html>
<% String uname = (String)session.getAttribute("uname"); %>
<% String f_name = (String)session.getAttribute("first_name"); %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Leave Management System</title>
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
  <link href='./css/main.css' rel='stylesheet' />

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
    integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
  <link rel="stylesheet" href="./css/main.css">
  <link rel="shortcut icon" type="image/png" href="#">
  <link rel="stylesheet" href="./css/style.css">
  <script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.3.2,npm/fullcalendar@5.3.2/main.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.3.2/main.css,npm/fullcalendar@5.3.2/main.min.css">
  <script>
    <% ArrayList<Absentees_table> list1 = (ArrayList<Absentees_table>) request.getAttribute("listDate"); %>
    list_size=<%out.print(list1.size());%>
            <%
                 String [] class_array=new String[list1.size()];
                 Set<String> setUniqueClass = new LinkedHashSet<String>();
                 int i=0;
                 for(Absentees_table item:list1)
                             {
                                 setUniqueClass.add(item.getDate());

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
    data= [<% i=0;
            for(Absentees_table item:list1)
                            {
                                out.print('\'');
                                out.print(item.getDate());
                                out.print('\'');

                                i=i+1;
                                if (list1.size()>i){
                                    out.print(',');
                                }
                            }
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


    calendar_data=[]
    for(let i=0;i<labels.length;i++){
      calendar_data.push({'title':'Total Absentees: '+count[i],'start':labels[i]})
    }



    document.addEventListener('DOMContentLoaded', function() {





      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        dateClick: function(info) {
        	
        	var myJSON = JSON.stringify(info.dateStr);
        	
        	window.location = "./Servlet?type=calendar_click&id="+myJSON;


        },
      events: calendar_data

      });
      calendar.render();
    });
	 

  </script>
</head>

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
              <a href="./logout"> <span class="dropdown__title">Log out</span></a>
            </li>
          </ul>
        </div>
      </div>
    </header>

    <aside class="sidenav">

      <div class="sidenav__profile">
          <div class="sidenav__profile-avatar"></div>
        <div class="sidenav__profile-title text-light"><%=uname%></div>
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
    <main class="main" style="background-color: white;">
   


      <div id='calendar' style="max-width:1000px;margin: 40px auto;" ></div>


    </main>

  </div>
  <!-- partial -->
  <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
  <script src='https://www.amcharts.com/lib/3/amcharts.js'></script>
  <script src='https://www.amcharts.com/lib/3/serial.js'></script>
  <script src='https://www.amcharts.com/lib/3/themes/light.js'></script>
  <script src="./javascript/script.js"></script>

</body>

</html>