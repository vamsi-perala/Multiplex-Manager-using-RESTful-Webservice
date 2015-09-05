<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ticket</title>
</head>
<% HttpSession ss= request.getSession(true);%>
<style>
#fieldnames {
	font-family: "Comic Sans MS", cursive;
	font-size: 20px;
	font-style: italic;
	font-weight: bold;
	color: #C06;
}
#fieldnames1 {
	font-family: "Comic Sans MS", cursive;
	font-size: 20px;
	font-style: italic;
	font-weight: bold;
	color: #093;
}
</style>

<body>
<p><a href="homepage.jsp" target="_self"><img src="logo.jpg" width="286" height="90" alt="logo" /></a></p>
<center>
<table width="555">
<tr>
<td width="200"><p id="fieldnames">Screen Name: </p></td><td width="200"><p id="fieldnames1"> <%=(String)ss.getAttribute("screenNumber")%> </p></td>
</tr>

<tr>
<td><p id="fieldnames">Movie Name: </p></td><td><p id="fieldnames1"><%=(String)ss.getAttribute("movieName")%></p></td>
</tr>

<tr>
<td><p id="fieldnames">Date: </p></td><td><p id="fieldnames1"> <%=(String)ss.getAttribute("date")%> </p></td>
</tr>

<tr>
<td><p id="fieldnames">Show Timing:</p></td><td><p id="fieldnames1"> <%=(String)ss.getAttribute("showTiming")%> </p></td>
</tr>

<tr>
<td><p id="fieldnames">Number of Tickets: </p></td><td><p id="fieldnames1"> <%=(Integer)ss.getAttribute("ticket_count")%> </p></td>

</tr>
<tr>
  <td><p id="fieldnames">Reference Number:</p></td><td><p id="fieldnames1"> <%=(String)ss.getAttribute("reference")%> </p></td>
</tr>
</table>
<p>&nbsp;</p>
<p><a href="javascript:window.print()"><img src="print.png" width="102" height="77" alt="print" /></a></p>
</center>
</body>
</html>