<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.xyz.pojo.Movies"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div align="center">

<h3 style="color: black; font-size: 28px">Books Availability</h3>
<table border="1">
<tr>
<th>Screen</th>
<th>Movie</th>

</tr>

<%
ArrayList<Movies> armovie=(ArrayList<Movies>)request.getAttribute("data");
for(int a=0;a<armovie.size();a++) {
%>
<tr>
	 <td><%= armovie.get(a).getScreen()%></td>
   <td><%= armovie.get(a).getMovie()%></td>


</tr>
<% }%>
</table>
</div>
</body>
</html>