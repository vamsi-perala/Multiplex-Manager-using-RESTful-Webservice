<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.xyz.pojo.Movies" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Screens Page</title>
<style>
#fieldnames {
	font-family: "Comic Sans MS", cursive;
	font-size: 20px;
	font-style: italic;
	font-weight: bold;
	color: #FFF;
}
#fieldnames1 {
	font-family: "Comic Sans MS", cursive;
	font-size: 20px;
	font-style: italic;
	font-weight: bold;
	color:#F00;
}
</style>
<script type="text/javascript">
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function call(){
	
	if(document.screen_selection.jumpMenu1.value=="Select Show" && document.screen_selection.jumpMenu2.value=="Select Show" && document.screen_selection.jumpMenu3.value=="Select Show" && document.screen_selection.jumpMenu4.value=="Select Show")
	{
	alert("Please select any show timing");
	
	screen_selection.jumpMenu1.focus=true;
	return false;
	}
	else if(document.screen_selection.jumpMenu1.value=="Select Show" && document.screen_selection.jumpMenu2.value=="Select Show" && document.screen_selection.jumpMenu3.value=="Select Show" && document.screen_selection.jumpMenu4.value!="Select Show")
	{
		//alert("fourth selected");
	screen_selection.jumpMenu1.focus=true;
	return true;
		}
		else if(document.screen_selection.jumpMenu1.value=="Select Show" && document.screen_selection.jumpMenu2.value=="Select Show" && document.screen_selection.jumpMenu3.value!="Select Show" && document.screen_selection.jumpMenu4.value=="Select Show")
		{
			//alert("third selected");
	screen_selection.jumpMenu1.focus=true;
	return true;
		}
		else if(document.screen_selection.jumpMenu1.value=="Select Show" && document.screen_selection.jumpMenu2.value!="Select Show" && document.screen_selection.jumpMenu3.value=="Select Show" && document.screen_selection.jumpMenu4.value=="Select Show")
		{
			//alert("second selected selected");
	screen_selection.jumpMenu1.focus=true;
	return true;
		}
		else if(document.screen_selection.jumpMenu1.value!="Select Show" && document.screen_selection.jumpMenu2.value=="Select Show" && document.screen_selection.jumpMenu3.value=="Select Show" && document.screen_selection.jumpMenu4.value=="Select Show")
		{
			//alert("first selected");
	screen_selection.jumpMenu1.focus=true;
	return true;
		}
		else
		{
			alert("Make only one selection at a time");
			screen_selection.jumpMenu1.focus=true;
	return false;
			}
		
}

</script>
</head>
<% HttpSession ss= request.getSession(true);
System.out.println("in screen: "+ss.getAttribute("userName"));
%>
<body background="screensback.jpg">
<p><a href="homepage.jsp" target="_self"><img src="logo.jpg" width="286" height="90" alt="logo" /></a><font color="#FFFFFF"></font></p>
<center>
  <font color="#FFCC00"><h1><b>Movie List on Different Screens on: <%=(String)ss.getAttribute("date")%></b></h1>
  </font>
</center>
<center>
<form action="MultServlet" method="get" name= "screen_selection" onSubmit="return call()" >
	<input type="text" name="form" value="screen_selection" style="visibility: hidden" />
<table width="613" height="212">
 	<tr>
 		<td width="184" height="41"><p id="fieldnames1">Screen Name</td><td width="235"><p id="fieldnames1">Movie Name</td><td width="178"><p id="fieldnames1">Show Timings</td>
	</tr>
	

    

    <%
    
    ArrayList<Movies> ar=(ArrayList<Movies>)request.getAttribute("data");
    System.out.println("client jsp "+ar.get(0).getMovie());
    %>
  	<tr>
		<td height="31"><p name= "screen" id="fieldnames"><%=ar.get(0).getScreen()%></td><td><p name= "moviename" id="fieldnames1"><%=ar.get(0).getMovie()%></td><td><p id="fieldnames">
		  <select name="jumpMenu1" id="jumpMenu">
		    <option>Select Show</option>
		    <option>11:00 AM</option>
		    <option>3:00 PM</option>
		    <option>6:00 PM</option>
		    </select>
            </td>
      </tr>
  	<tr>
  	  <td height="31"><p name= "screen"  id="fieldnames"><%=ar.get(1).getScreen()%></td>
  	  <td><p name= "moviename" id="fieldnames1"><%=ar.get(1).getMovie()%></td>
  	  <td><select name="jumpMenu2" id="jumpMenu2">
  	    <option>Select Show</option>
  	     <option>11:00 AM</option>
		 <option>3:00 PM</option>
		 <option>6:00 PM</option>
	    </select></td>
	  </tr>
  	<tr>
  	  <td height="31"><p name= "screen"  id="fieldnames"><%=ar.get(2).getScreen()%></td>
  	  <td><p name= "moviename" id="fieldnames1"><%=ar.get(2).getMovie()%></td>
  	  <td><select name="jumpMenu3" id="jumpMenu3" >
  	    <option>Select Show</option>
  	     <option>11:00 AM</option>
		    <option>3:00 PM</option>
		    <option>6:00 PM</option>
	    </select></td>
	  </tr>
  	<tr>
  	  <td height="31"><p name= "screen"  id="fieldnames"><%=ar.get(3).getScreen()%></td>
  	  <td><p name= "moviename" id="fieldnames1"><%= ar.get(3).getMovie()%></td>
  	  <td><select name="jumpMenu4" id="jumpMenu4">
  	    <option>Select Show</option>
  	     <option>11:00 AM</option>
		    <option>3:00 PM</option>
		    <option>6:00 PM</option>
	    </select></td>
	  </tr>
  	
    
  </table>

  <br />
     <input type="submit" value="  SUBMIT " > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="reset" value="  RESET  ">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name=back  value="   BACK   " onClick="window.location='homepage.jsp'">
 </form>
</center>
</body>
</html>