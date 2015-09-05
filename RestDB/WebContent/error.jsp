<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Error</title>
<style>
#fieldnames {
	font-family: "Comic Sans MS", cursive;
	font-size: 20px;
	font-style: italic;
	font-weight: bold;
	color: #00F;
}
</style>
</head>
<% HttpSession ss = request.getSession(true);
%>
<body>
<p><a href="homepage.jsp" target="_self"><img src="logo.jpg" width="286" height="90" alt="logo" /></a></p>
<center><p id="fieldnames"><%= (String)ss.getAttribute("error")%></p></center>
<p>&nbsp;</p>
<center>
<p><img src="error.jpg" width="349" height="334" alt="error" /></p>
<p><a href="homepage.jsp" target="_self"><img src="home.jpg" width="286" height="90" alt="home" /></a></p>
</center>
</body>
</html>