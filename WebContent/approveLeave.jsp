<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    
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
  <link rel="stylesheet" href="./css/main.css">
  <link rel="shortcut icon" type="image/png" href="#">
  <link rel="stylesheet" href="./css/style.css">
  <!-- Bootstrap core CSS -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
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
              <span class="dropdown__title">Log out</span>
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
          <!--  <a href='./new_analytics.html'>

            <div class="navList__subheading row row--align-v-center">
              <span class="navList__subheading-icon"><i class="fas fa-chart-bar"></i></span>
              <span class="navList__subheading-title">Analytics</span>
            </div>
          </a> -->

          <a href='./logout'>

            <div class="navList__subheading row row--align-v-center">
              <span class="navList__subheading-icon"><i class="fas fa-arrow-left"></i></span>
              <span class="navList__subheading-title">Log Out</span>
            </div>
          </a>
          </li>


    </aside>
    <main class="main">
      <div class="main-header" style="height: 150px;">
        <div class="main-header__intro-wrapper">
          <div class="main-header__welcome">
            <div class="main-header__welcome-title text-light">Approve Leave Requests</div>
          </div>

        </div>
      </div>
      <div class="card">

        <div class="card-body">
          <div id="table" class="table-editable">

            <table class="table table-bordered table-responsive-md table-striped text-center">
              <thead>
                <tr>
                  <th class="text-center">#</th>
                  <th>Applied From</th>
                  <th>Applied Till</th>
                  <th>Leave Type</th>
                  <th>Purpose/Reason</th>
                  <th class="text-center"><a href="./reviewLeave?action=view">Status</a></th>
                  <th class="text-center">Actions</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="leave" items="${listLeave}">
                <tr>
                  <td class="pt-3-half" contenteditable="true">${leave.id}</td>
                  <td class="pt-3-half" contenteditable="true">${leave.applied_from}</td>
                  <td class="pt-3-half" contenteditable="true">${leave.applied_till}</td>
                  <td class="pt-3-half" contenteditable="true">${leave.type}</td>
                  <td class="pt-3-half" contenteditable="true">${leave.purpose}</td>
                  <td class="pt-3-half" contenteditable="true">
                    <c:choose>
  						<c:when test="${leave.status == 'Rejected'}"><div class="badge badge-danger"><c:out value="${leave.status}" /></div></c:when>
  						<c:when test="${leave.status == 'Pending'}"><div class="badge badge-warning"><c:out value="${leave.status}" /></div></c:when>
  						<c:when test="${leave.status == 'Approved'}"><div class="badge badge-success"><c:out value="${leave.status}" /></div></c:when>
  						<c:otherwise></c:otherwise>
					</c:choose>
                  </td>
                  <td>
                    <span class="table-remove"><a href="./reviewLeave?action=update&id=<c:out value='${leave.id}' />&status=<c:out value='Approved' />"
                        class="btn btn-primary btn-rounded btn-sm my-0" >Approve</a></span>
                    <span class="table-remove"><a href="./reviewLeave?action=update&id=<c:out value='${leave.id}' />&status=<c:out value='Rejected' />"
                      class="btn btn-outline-danger btn-rounded waves-effect btn-sm">Reject</a></span>    
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </main>


  </div>
  <!-- partial -->
  <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
  <script src='https://www.amcharts.com/lib/3/amcharts.js'></script>
  <script src='https://www.amcharts.com/lib/3/serial.js'></script>
  <script src='https://www.amcharts.com/lib/3/themes/light.js'></script>
  <script src="./javascript/script.js"></script>
  <!-- JQuery -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js">
  </script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
</body>

</html>