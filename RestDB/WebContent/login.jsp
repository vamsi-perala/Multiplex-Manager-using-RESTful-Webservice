<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login Page</title>

</head>
<script >
function call()
{
if(document.f.uid.value==""){
alert("Please Enter Customer Id");
document.f.uid.setFocus=true;
return false;
}
if(document.f.pwd.value==""){
alert("Please Enter Ur Password");
return false;
}
}
</script>
<BODY bgcolor="#FFFFCC">

<center>
<BR><BR>
 
 <font size="+2" color="#FF5C0F"><h2><b>Welcome To Multiplex Ticketing System</b></h2></font>
<br>
 



<form  method="get" action="MultServlet" name="f" onSubmit='return call()'>
<input type="text" name="form" value="login" style="visibility: hidden" />
 <table>
 <tr>
 <td><b>User ID:</b></td><td><input type="text" name="uid" ></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr> 
<td><b> Password:</b></td><td><input type="password" name="pwd"></td>
</tr>
</table>
<br> <BR>

 <input type="submit" value="submit"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="reset" value="reset">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name=back  value="Home" onClick="window.location='homepage.jsp'">
 <center><h2><b><a href="registration.jsp"><font color="#FF5C0F"><BR>New User????? Click here</font> </a></b></h2></center>
 </form>
<br>

</center>

</BODY>
</html>