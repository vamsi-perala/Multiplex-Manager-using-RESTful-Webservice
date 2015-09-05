<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ticket</title>
</head>
<% HttpSession ss= request.getSession(true);
ResultSet rs= (ResultSet) ss.getAttribute("ResultSet");
String screen = (String)rs.getString(2);
String movie =  (String)rs.getString(3);
String date = (String)rs.getString(4);
String show = (String)rs.getString(5);
int seat =  (Integer)rs.getInt(6);
String ref = (String)rs.getString(7);
try{
	rs.next();
%>
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
<td width="200"><p id="fieldnames">Screen Name: </p></td><td width="200"><p id="fieldnames1"> <%=screen%> </p></td>
</tr>

<tr>
<td><p id="fieldnames">Movie Name: </p></td><td><p id="fieldnames1"><%=movie%></p></td>
</tr>

<tr>
<td><p id="fieldnames">Date: </p></td><td><p id="fieldnames1"> <%=date %> </p></td>
</tr>

<tr>
<td><p id="fieldnames">Show Timing:</p></td><td><p id="fieldnames1"> <%=show%> </p></td>
</tr>

<tr>
<td><p id="fieldnames">Number of Tickets: </p></td><td><p id="fieldnames1"> <%=seat%> </p></td>

</tr>
<tr>
  <td><p id="fieldnames">Reference Number:</p></td><td><p id="fieldnames1"> <%=ref%> </p></td>
</tr>
</table>
<%}
catch(SQLException e)
{
	System.out.println("in jsp exception");
	}%>
<p>&nbsp;</p>
<p><a href="javascript:window.print()"><img src="print.png" width="102" height="77" alt="print" /></a></p>
</center>
</body>
</html>