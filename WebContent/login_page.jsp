<%--
  Created by IntelliJ IDEA.
  User: vikramchandrasekaran
  Date: 11/27/20
  Time: 1:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%--<script>--%>
<%--    function validate()--%>
<%--    {--%>
<%--        var email_regex=/^([A-Za-z\_])+([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;--%>
<%--        var alpha_numeric_regex=/^[A-Za-z]+[0-9]+[A-Za-z]/;--%>
<%--        var bt=document.getElementById("un")--%>
<%--        if (email_regex.test(bt.value))--%>
<%--            alert('Invalid Username');--%>
<%--        else--%>
<%--            alert('Valid Username');--%>
<%--    }--%>
<%--</script>--%>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="./css/log.css">
</head>
<body>
<div class="login_form_page" style="background-image : url(bg-01.jpg)">
    <div class="login_container_wrap">

        <form class="Sign_In_Form" method="post" action="<%= request.getContextPath() %>/login">
					<span class="Sign_In_Text">
						Sign In
					</span>
            <br>
            <br>
            <span class="Text1">
							Username
					</span>
            <div class="input_box">
                <input id="un" class="input_box_text" type="text" name="username" >
            </div>
            <br>
            <span class="Text1">
							Password
					</span>
            <div class="input_box">
                <input class="input_box_text" type="password" name="password" >
            </div>
            <br>
            <br>
            <div class="btn-container">
                <button id=sign_in class="login-form-btn">
                    Sign In
                </button>
            </div>
            <br>
       
        </form>
    </div>
</div>
</body>
</html>