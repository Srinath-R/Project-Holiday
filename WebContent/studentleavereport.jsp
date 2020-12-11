<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<!doctype html>
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

    <main class="main">
      <div class="main-header" style="height: 150px;">
        <div class="main-header__intro-wrapper">
          <div class="main-header__welcome">
            <div class="main-header__welcome-title text-light">Student Leave Report</div>
          </div>

        </div>
      </div>
      <div class="card">
        <div class="card-body">
          <div id="table" class="table-editable">

            <table class="table table-bordered table-responsive-md table-striped text-center">
              <thead>
                <tr>
                    <th>From Date</th>
                    <th>TO Date</th>
                    <th>Type</th>
                    <th>Reason</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="pt-3-half">"04-11-2020"</td>
                    <td class="pt-3-half">"19-11-2020"</td>
                    <td class="pt-3-half">"Medical"</td>
                    <td class "pt-3-half">"Undergoing a Surgery"</td>
                </tr>
                <tr>
                    <td class="pt-3-half">"01-12-2020"</td>
                    <td class="pt-3-half">"10-12-2020"</td>
                    <td class="pt-3-half">"On duty"</td>
                    <td class "pt-3-half">"ICPC competition"</td>
                </tr>
                <tr>
                    <td class="pt-3-half">"01-12-2020"</td>
                    <td class="pt-3-half">"12-12-2020"</td>
                    <td class="pt-3-half">"On duty"</td>
                    <td class "pt-3-half">"competition"</td>
                </tr>
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
  <script src="./script.js"></script>
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
    