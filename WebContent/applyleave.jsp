<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
  <script>
      function formVal() {
        var a = document.getElementById("type").value;
        var b = document.getElementById("applied_from").value;
        var c = document.getElementById("applied_till").value;
        var d = document.getElementById("purpose").value;
        if(a == "") {
            alert("Please specify the leave type");
			return false;
        }
        if(b == "") {
            alert("Please specify the leave from date");
            return false;
        }
        if(c == "") {
            alert("Please specify the leave to date");
            return false;
        }
        if(d == "") {
            alert("Please specify the purpose for leave");
            return false;
        }
        if(d == "Bunking") {
            alert("Please give a valid purpose for leave");
            return false;
        }
        }
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
            <div class="main-header__welcome-title text-light">Apply Leave</div>
          </div>

        </div>
      </div>
      <div class="card">

        <div class="card-body">
          <form onsubmit="return formVal()" name="applyleave" class="pure-form pure-form-stacked" method="post" action="<%= request.getContextPath() %>/applyLeave">
            <fieldset>
                <div class="position-relative form-group">
                    <label for="type" class="">Leave type</label>
                    <input placeholder="default" type="text" id="type" name="type" class="mb-2 form-control">
                </div>
                <br>
                <div class="position-relative form-group">
                    <label for="applied_from" class="">From</label>
                    <input style="font-size: 11px" type="datetime-local" id="applied_from" name="applied_from"/>
                </div>
                <br>
                <div class="position-relative form-group">
                    <label for="applied_till" class="">To</label>
                    <input style="font-size: 11px" type="datetime-local" id="applied_till" name="applied_till"/>
                </div>
                <br>
                <div class="position-relative form-group">
                    <label for="purpose" class="">Purpose</label>
                    <input placeholder="default" type="text" id="purpose" name="purpose" class="mb-2 form-control">
                </div>
                <br>
                <div class="position-relative form-group">
                    <label for="faculty" class="">Faculty</label>
                    <input placeholder="default" type="text" id="faculty" name="faculty" class="mb-2 form-control">
                </div>
                <br>
                <div class="position-relative form-group">
                    <label for="exampleFile" class="">Attach proof(OD form/MC) if applicable</label>
                    <input name="file" id="exampleFile" type="file" class="form-control-file" multiple>
                </div>
                <br>
                <button class="mt-1 btn btn-primary">Submit</button>
            </fieldset>
          </form>
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