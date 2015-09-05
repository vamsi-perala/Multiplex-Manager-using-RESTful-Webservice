<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta author="varun" keywords="multiplex, ticket, printing" />
<title>Home Page</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="stylesheet.css">


<style type="text/css">
.body {
	background-attachment: fixed;
	background-image: url(back%20ground.jpg);
	background-repeat: no-repeat;
}
#loginbox {
	text-align: center;
	vertical-align: top;
	position: relative;
	visibility: visible;
	width: 100px;
}

.h1 {
	font-family:Georgia, "Times New Roman", Times, serif;
}
.greeting {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 16px;
	color: #63F;
	font-weight: bold;
	position: absolute;
	right: 40px;
}
</style>

<script > function call() { if(document.f1.date.value == "") { alert("Please Select a Date"); f1.date.focus=true; return false; } } </script>

</head>

<body>
<% HttpSession ss = request.getSession(true);
String userName=(String)ss.getAttribute("userName");

if(userName== null)
{
	System.out.println("user name is " + userName);
	ss.setAttribute("userName","Guest");
	
}
userName=(String) ss.getAttribute("userName");
System.out.println("user name is not null " + userName);

%>
	<a href="homepage.jsp" target="_self"><img src="logo.jpg" width="286" height="90" alt="logo" /></a><span class="greeting">Hi, <%= userName %></span>
	<p><div2 style="width:100%; height:100%"; align="right" position="absolute"><a href="login.jsp" target="_self"><img src="login.jpg" width="142" height="48" alt="login"  align="right" position="absolute" /></a><a href="registration.jsp" target="_self"><img src="register.jpg" width="142" height="48" alt="register" align="right" position="absolute"/></a><a href="ticket_retrieval.jsp" target="_self"><img src="print_ticket1.jpg" width="142" height="48" alt="register" align="right" position="absolute"/></a></div2></p>
	
<div style="width:100%; height:100%"; align="center"><p style="animation-play-state: running; animation-iteration-count: infinite;">
<br />
<center><h1 class="h1">Welcome to BVV Multiplex Theatre</h1></p></div></center>    
  
<center>
<form method="get" action="MultServlet" name="f1" onSubmit='return call()'>
<select name="date" id="jumpMenu"> 
<option value="">Please Select a Date</option> 
<option value="2014-05-01">Today, May 1st</option>
 <option value="2014-05-02">Tomorrow, May 2nd</option> 
 <option value="2014-05-03">May 3rd, 2014</option> 
 </select> <br /><br />
  <input type="submit" value="Submit" />
  </div> 
  <br />
  <input type="text" name="form" value="homepage" style="visibility: hidden" /> 
  </form>
  </center>
<center>
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="800" height="425">
  <param name="flash_component" value="ImageViewer.swc" />
  <param name="movie" value="imageslide.swf" />
  <param name="quality" value="high" />
  <param name="FlashVars" value="flashlet={imageLinkTarget:'_blank',captionFont:'Verdana',titleFont:'Verdana',showControls:true,frameShow:false,slideDelay:2,captionSize:10,captionColor:#333333,titleSize:10,transitionsType:'Random',titleColor:#333333,slideAutoPlay:true,imageURLs:['theatre2.jpg','theatre4.jpg','theatre5.jpg','theatre6.jpg','theatre7.jpg'],slideLoop:true,frameThickness:2,imageLinks:['homepage.jsp','homepage.jsp','homepage.jsp','homepage.jsp','homepage.jsp'],frameColor:#333333,bgColor:#FFFFFF,imageCaptions:[]}" />
  <embed src="imageslide.swf" quality="high" flashvars="flashlet={imageLinkTarget:'_blank',captionFont:'Verdana',titleFont:'Verdana',showControls:true,frameShow:false,slideDelay:2,captionSize:10,captionColor:#333333,titleSize:10,transitionsType:'Random',titleColor:#333333,slideAutoPlay:true,imageURLs:['theatre2.jpg','theatre4.jpg','theatre5.jpg','theatre6.jpg','theatre7.jpg'],slideLoop:true,frameThickness:2,imageLinks:['homepage.jsp','homepage.jsp','homepage.jsp','homepage.jsp','homepage.jsp'],frameColor:#333333,bgColor:#FFFFFF,imageCaptions:[]}" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="800" height="425"> </embed>
</object>
</center>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>