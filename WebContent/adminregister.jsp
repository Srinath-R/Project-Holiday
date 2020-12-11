
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
   <head>
   
    <meta charset="ISO-8859-1" name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
      <title> Home Page</title>
      <style> body{
       margin: 0;
        padding: 0;
        background: url("bg-01.jpg");
        background-size: cover;
        background-position: center;
        font-family: sans-serif;
		width: 100%;  
	min-height: 100vh;

	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
	padding: 15px;
		}
    .login-box{
        width: 1500px;
        height: 1500px;
        background: rgba(0, 0, 0, 0.5);
        color: #fff;
        /*top: 50%;
        left: 50%;*/
        position: center;
        /*transform: translate(-50%,-50%);*/
        box-sizing: border-box;
        padding: 70px 30px;
    }
    .avatar{
        width: 100px;
        height: 100px;
        border-radius: 50%;
        position: absolute;
        top: -30px;
        left: calc(50% - 50px);
    }
    h1{
        margin: 0;
        padding: 0 0 20px;
        text-align: center;
        font-size: 22px;
    }
    .login-box input[type="submit"]
    {
        border: none;
        outline: none;
        height: 40px;
        background: #1c8adb;
        color: #fff;
        font-size: 18px;
        border-radius: 20px;
    }
    .login-box input[type="submit"]:hover
    {
        cursor: pointer;
        background: #39dc79;
        color: #000;
    }
    
    .login-box a{
        text-decoration: none;
        font-size: 14px;
        color: #fff;
    }
    .login-box a:hover
    {
        color: #39dc79;
    }
	.input_box_text{
  font-family: Poppins-Regular;
  color: #FFFFFF;
  line-height: 1.2;
  font-size: 18px;

  display: block;
  width: 100%;
  background: transparent;
  height: 60px;
  padding: 0 20px;
}
.Text1{
	color: #FFFFFF;
	font-size: 20px;
	font-family: Montserrat-SemiBold

}

.login-form-btn {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;
  width: 100%;
  height: 60px;
  background-color: #333333;
  border-radius: 10px;

  font-family: Poppins-Medium;
  font-size: 16px;
  color: #fff;
  line-height: 1.2;

  
}
</style>    
      
          
  </head>
   <body>
    <script>
	   function myfunc(){
	     var a = document.getElementById("passwords").value;
		 var b = document.getElementById("passwordss").value;
		 var no= document.getElementById("number1").value;
		 var fname= document.getElementById("fname").value;
		 var email= document.getElementById("mail").value;
		 var dob= document.getElementById("dob").value;
		 var cid= document.getElementById("cid").value;
		 var username=document.getElementById("username").value;
		 var Exp = /((^[0-9]+[a-z]+)|(^[a-z]+[0-9]+))+[0-9a-z]+$/i;

	        if(!username.match(Exp)){
			document.getElementById("usernamee").innerHTML="<span style='color:red;'>* * Please enter alphanumeric ";
			return false;
			}
		 if(!(/^[A-Za-z]+$/.test(fname))){
			 document.getElementById("fnamee").innerHTML="<span style='color:red;'>* * Please fill only alphabets ";
				return false;
		}
		
		 if(a==""){
		    document.getElementById("messages").innerHTML="<span style='color:red;'>* * Please fill password ";
			return false;
			}
		 if(a.lenght < 8){
		    document.getElementById("messages").innerHTML="<span style='color:red;'>* * Please set password with atleast 8 characters ";
			return false;
			}
		 if(a.lenght > 25){
		    document.getElementById("messages").innerHTML="<span style='color:red;'>* * Password lenght must be less than 25  ";
			return false;
			}
		 if(a!=b){
		    document.getElementById("messages").innerHTML="<span style='color:red;'>* * Passwords does not match</span> ";
			return false;
			}
		if(no.length > 10){
		    document.getElementById("messagesss").innerHTML="<span style='color:red;'>* * Invalid Number</span> ";
			return false;
		
			}
		if(no.length<10){
		    document.getElementById("messagesss").innerHTML="<span style='color:red;'>* * Invalid Number</span> ";
			return false;
		
			}
		if(fname==""){
		    document.getElementById("fnamee").innerHTML="<span style='color:red;'>* * Please fill First Name ";
			return false;
			}
		if(email==""){
		    document.getElementById("emaill").innerHTML="<span style='color:red;'>* * Please fill Email-ID ";
			return false;
			}
		if(dob==""){
		    document.getElementById("dobb").innerHTML="<span style='color:red;'>* * This field cannot be empty";
			return false;
			}
		if(cid==""){
		    document.getElementById("cidd").innerHTML="<span style='color:red;'>* * This field needs to be filled  ";
			return false;
			}
			
		}
	</script>
		 
	   
	   <div class="login-box">
      <img src="avatar.png" class="avatar">
      <h1 class="display-1">Register Here</h1>
         <form  action="<%= request.getContextPath() %>/register" onsubmit="return myfunc()" method = "POST">
         <p class="Text1" style="font-size:20px;"><em><b>Username</b></em></p>
         <input class="input_box_text" type="text" name="username" class="form-control" placeholder="Enter username" id="username" >
		 <span id="usernamee" class="alert"> </span>
         <p class="Text1" style="font-size:20px;"><em><b>First Name</b></em></p>
         <input class="input_box_text" type="text" name="firstName" class="form-control" placeholder="Enter firstname" id="fname" >
		 <span id="fnamee" class="alert"><br><br> </span>
         <p class="Text1" style="font-size:20px;"><em><b>Last name</b></em></p>
         <input class="input_box_text" type="text" name="lastName" class="form-control" placeholder="Enter lastname" id="lname">
         <span id="fnamee" class="alert"><br><br> </span>
         <p class="Text1" style="font-size:20px;"><em><b>Contact number</b></em></p>
         <input class="input_box_text" type="tel" name="contact" class="form-control"  placeholder="Enter phonenumber" id="number1">
		 <span id="messagesss" class="alert"> </span>
         <p class="Text1" style="font-size:20px;"><em><b>Email id</b> </em></p>
         <input class="input_box_text" type="text" name="email" class="form-control" placeholder="Enter email" id="mail">
		 <span id="emaill" class="alert"> </span>
         <p class="Text1" style="font-size:20px;"><em><b>Password</b></em></p>
         <input class="input_box_text" type="password" name="password" class="form-control" id="passwords" placeholder=" Enter your password" id="password">
		 <span id="messages" class="alert"> </span>
		 <p class="Text1" style="font-size:20px;"><em><b>Confirm Password</b></em></p>
         <input class="input_box_text" type="password" name="confirmpassword" class="form-control" id="passwordss" placeholder=" Enter your password" id="password">
		 <span id="messagess" class="alert"> </span>
         <p class="Text1" style="font-size:20px;"><em><b>Enter Date of birth</b></em></p>
         <input class="input_box_text" type="date" id="dob" class="form-control" name="dob">
		 <span id="dobb" class="alert"> </span>
         <p class="Text1" style="font-size:20px;"><em><b>Enter College ID</b></em></p>
         <input class="input_box_text" type="text" name="cid" class="form-control" placeholder="Enter college ID" id="cid">
		 <span id="cidd" class="alert"> </span>
         <p class="Text1" style="font-size:20px;"><em><b>Are you a faculty or student</b></em></p>
         <input type="radio" id="Faculty" class="form-control"  name="typef" value="Faculty">
         <label class="Text1"  style="font-size:20px;" for="Faculty"><em><b>Faculty</b></em></label><br>
         <input type="radio" id="Student" class="form-control"  name="typef" value="Student">
         <label class="Text1" style="font-size:20px;" for="Student"><em><b>Student</b></em></label><br>
         <input  type="submit" id="submit" name="submit"  class="form-control" value="submit">
         </form>
      
      </div>
   </body>
</html> 