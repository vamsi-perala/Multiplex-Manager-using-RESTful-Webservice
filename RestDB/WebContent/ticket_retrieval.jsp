<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Ticket Retrieval</title>
<script>
function call()
{
	if(document.ref.reference_number.value=="")
	{
		alert("Please Enter Reference Number");
		document.ref.reference_number.setFocus=true;
		return false;
	}	
}
</script>
</head>

<body>
<p><a href="homepage.jsp" target="_self"><img src="logo.jpg" width="286" height="90" alt="logo" /></a></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<center>
<form action="MultServlet" method="get" name="ref" target="_self" onsubmit='return call()'>
<input type="text" name="form" value="retrival" style="visibility: hidden" />
<p>
  <b>Enter the Reference Number:</b> <input name="reference_number" type="text" size="20" maxlength="11" />
  <input name="SUBMIT" type="submit" value="SUBMIT" />
</p>
</form>
</center>
</body>
</html>