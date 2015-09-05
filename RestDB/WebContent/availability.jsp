<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.xyz.pojo.Availability" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Availability</title>
<style>
#fieldnames {
	font-family: "Comic Sans MS", cursive;
	font-size: 20px;
	font-style: italic;
	font-weight: bold;
	color: #6C0;
}
#fieldnames1 {
	font-family: "Comic Sans MS", cursive;
	font-size: 20px;
	font-style: italic;
	font-weight: bold;
	color: #093;
}
</style>
<script>
function call() { if(document.f.menu1.value=="" || document.f.menu1.value=="0"){ alert("Please select number of tickets"); document.f.menu1.setFocus=true; return false; } }
	function MM_jumpMenu()
	{
		var cost = document.f.menu1.value;
		document.getElementById("c").value=cost;
	}
</script>
</head>
<% HttpSession ss= request.getSession(true);%>
<body background="box-office.jpg">
<a href="homepage.jsp" target="_self"><img src="logo.jpg" width="286" height="90" alt="logo" /></a><img src="get-tickets-here.png" width="224" height="115" alt="login"  />
<form action="payment.jsp" method="get" name="f" onSubmit="return call()">
<input type="text" name="form" value="availabilityPage" style="visibility: hidden" />
<%
System.out.println("in availability: "+ss.getAttribute("userName"));
    Availability avail=(Availability)request.getAttribute("availability");
    System.out.println(avail.getAvailability()+", "+avail.getMovie());
    %>
<table width="744">
  <tr>
<td width="272"><p id="fieldnames">Screen Name:</p></td><td width="253"><p id="fieldnames1"><%=(String)ss.getAttribute("screenNumber")%></td>
</tr>

<tr>
<td><p id="fieldnames">Movie Name: </p></td><td><p id="fieldnames1"><%=avail.getMovie()%></p></td>
</tr>

<tr>
<td><p id="fieldnames">Date: </p></td><td><p id="fieldnames1"><%=(String)ss.getAttribute("date")%></p></td>
</tr>

<tr>
<td><p id="fieldnames">Show Timing:</p></td><td><p id="fieldnames1"><%=(String)ss.getAttribute("showTiming")%></p></td>
</tr>

<tr>
<td><p id="fieldnames">Number of Tickets Available: </p></td><td><p id="fieldnames1"><%=avail.getAvailability()%></p></td>


</tr>
<tr>
  <td><p id="fieldnames">Enter Number of Tickets to reserve:</p></td>
  <td><select name="menu1" onchange="MM_jumpMenu()">
    <option value="0">Select</option>
    <option value="10">1</option>
    <option value="20">2</option>
    <option value="30">3</option>
    <option value="40">4</option>
	<option value="50">5</option>
	<option value="60">6</option>
	<option value="70">7</option>
	<option value="80">8</option>
	<option value="90">9</option>
	<option value="100">10</option>
  </select></td>
  
	<td width="62"><p id="fieldnames">Cost:</p></td>
  <td width="141"><p id="fieldnames">$<input name="cost" type="text"  id="c" size="1" maxlength="3" readonly="true" />
  </p></td>
  
</tr>
</table>
<center> <input type="submit" value="  Pay  "></center>
</form>
    <div></div>
   
</body>
</html>