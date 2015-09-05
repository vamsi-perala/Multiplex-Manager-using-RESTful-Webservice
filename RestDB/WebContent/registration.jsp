<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Registration Page</title>
<style type="text/css">
#fieldnames {
	font-family: "Comic Sans MS", cursive;
	font-size: 20px;
	font-style: italic;
	font-weight: bold;
	color: #FFF;
}
</style>
</head>
<script >
function call()
{
if(document.f.id.value==""){
alert("Please Enter Customer Id");
document.f.id.setFocus=true;
return false;
}
if(document.f.pwd.value==""){
alert("Please Enter Ur Password");
return false;
}
 if(!((document.f.pwd.value)==(document.f.pwd1.value)))
	{
	 alert("Both Passwords donot match");
	 return false;
	}
}
</script>
<body bgcolor="#FFFF99" background="theatre.jpg">
<div style="width:100%; height:100%"; align="left" id="registernow"><a href="registration.jsp" target="_self"><img src="register.jpg" width="237" height="115" alt="register" /></a><font size="+2" color="#FF5C0F"></font>
<a href="registration.jsp" target="_self"><img src="registration_FORM.jpg" width="237" height="115" alt="register" /></a></div>
<center>
  <font size="+2" color="#FFFF00" family=""Comic Sans MS", cursive"><h2><b><i>Welcome To Multiplex Ticketing System</i></b></h2></font>
<br>
 
	<form  method="get" action="MultServlet" name="f" onSubmit='return call()'>
	<input type="text" name="form" value="registration" style="visibility: hidden" />
 	<table>
 	<tr>
 		<td><p id="fieldnames">User Name*:</b></td><td><input type="text" required name="uname" maxlength="10" pattern="[a-zA-Z]+"></td>
	</tr>
    
    <tr>
 		<td><p id="fieldnames">Email*:</b></td><td><input type="text" required name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}" ></td>
	</tr>
    
    <tr>
 		<td><p id="fieldnames">Phone Number*:</b></td><td><input type="text" required name="phone" pattern="[0-9]{10}" maxlength="10"></td>
	</tr>
	
    <tr> 
		<td><p id="fieldnames">Password*:</b></td><td><input type="password" required name="pwd"></td>
	</tr>
	
    <tr> 
		<td><p id="fieldnames">Retype Password*:</b></td><td><input type="password" required name="pwd1"></td>	
	</tr>

</table>
<p id="fieldnames">*ALL  FIELDS  ARE  MANDATORY</p>
<br>
 <input type="submit" name="Registration"value="Registration"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="reset" value="  RESET  ">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name=back  value="   BACK   " onClick="window.location='homepage.jsp'">
 </form>
<br>

</center>

</body>
</html>