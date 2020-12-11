<%--
  Created by IntelliJ IDEA.
  User: vikramchandrasekaran
  Date: 12/6/20
  Time: 1:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String uname = (String)session.getAttribute("uname"); %>
<% String f_name = (String)session.getAttribute("first_name"); %>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <title>Leave Management System</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<%--    <link rel="stylesheet" href="css/main.css">--%>
    <link rel="shortcut icon" type="image/png" href="#">
    <link rel="stylesheet" href="./css/style.css">

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
                        <a href="./viewLeave">
                		<li class="subList__item">View Leave requests</li>
              			</a>
                        <a href="./studentleavereport.jsp">
                            <li class="subList__item">View Student Leave report</li>
                        </a>



                    </ul>
                </li>
                <li>
                    <a href='./logout'>

                        <div class="navList__subheading row row--align-v-center">
                            <span class="navList__subheading-icon"><i class="fas fa-arrow-left"></i></span>
                            <span class="navList__subheading-title">Log Out</span>
                        </div>
                    </a>
                </li>


    </aside>
    <main class="main">
        <div class="main-header">
            <div class="main-header__intro-wrapper">
                <div class="main-header__welcome">
                    <div class="main-header__welcome-title text-light">Welcome, <strong><%=f_name%></strong></div>
                    <div class="main-header__welcome-subtitle text-light">How are you today?</div>
                </div>
                <div class="quickview">
                    <div class="quickview__item">
                        <div class="quickview__item-total">27&deg;</div>
                        <div class="quickview__item-description">
                            <i class="fas fa-map-marker-alt"></i>
                            <span class="text-light">Coimbatore</span>
                        </div>
                    </div>
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

</body>

</html>