<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Payment Page</title>
<style type='text/css'>
 a img { display:none; }
 a:hover img { display:block; }
 .cvv {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-style: normal;
	color: #CCC;
	text-decoration: none;
}
#fieldnames {
	font-family: "Comic Sans MS", cursive;
	font-size: 20px;
	font-style: italic;
	font-weight: bold;
	color: #FFF;
}
.paymentdiv {
	width: 100px;
}
</style>
<script type="text/javascript">
<!--
function call()
{
	if(document.f.pwd2.value == "0" )
		{
		alert("Please Select Month");
		f.pwd2.focus=true;
		return false;
		}
	else if(document.f.pwd3.value == "0" )
		{
		alert("Please Select Year");
		f.pwd3.focus=true;
		return false;
		}
	}


</script>
</head>

<body background="b.jpg">
 <%
 String amount=request.getParameter("cost");
 
 
 int tkt_count=(Integer.parseInt(amount)/10);
 System.out.println(tkt_count);
 HttpSession ss=request.getSession(true);
 System.out.println("in payment: "+ss.getAttribute("userName"));
 ss.setAttribute("ticket_count",tkt_count);%> 

  <p><img src="logo.jpg" width="286" height="90" alt="logo" /></p>
	
<center>
<font size="+2" color="#FFFF00" family=""Comic Sans MS", cursive"><h2><b><i>Enter the Payment Details</i></b></h2></font>
  <form action="MultServlet" method="get" name="paymentinfo"  name="f" target="_self" onSubmit="return call()">
    <input type="text" name="form" value="pay" style="visibility: hidden" />
  <table width="632" height="241">
  <tr>
 	
 		<td width="190" height="43"><p id="fieldnames">Amount payable: $<%= amount %></b></td>
	</tr>
    
 	<tr>
 	
 		<td width="190" height="43"><p id="fieldnames">Name on the Card*:</b></td><td width="284"><input type="text" required name="name" ></td>
	</tr>
    
    <tr>
 		<td height="55"><p id="fieldnames">Card Number*:</b></td><td><input type="text" required name="cnumber" pattern="[0-9]{16}" maxlength="16"></td>
	</tr>

    <tr>
    	<td><p id="fieldnames">Card Expiry*:</b></td><td><p id="fieldnames">Month:
            <select name="pwd2" onchange="MM_jumpMenu('parent',this,0)">
			<option value="0">Select</option>
              <option value="1">January (01)</option>
              <option value="2">February (02)</option>
              <option value="3">March (03)</option>
              <option value="4">April (04)</option>
              <option value="5">May (05)</option>
              <option value="6">June (06)</option>
              <option value="7">July (07)</option>
              <option value="8">August (08)</option>
              <option value="9">September (09)</option>
              <option value="10">October (10)</option>
              <option value="11">November (11)</option>
              <option value="12">December (12)</option>
            </select>
          <p id="fieldnames">YEAR:
            <select name="pwd3" onchange="MM_jumpMenu('parent',this,0)">
			<option value="0">Select</option>
              <option value="2014">2014</option>
              <option value="2015">2015</option>
              <option value="2016">2016</option>
              <option value="2017">2017</option>
              <option value="2018">2018</option>
              <option value="2019">2019</option>
              <option value="2020">2020</option>
              <option value="2021">2021</option>
              <option value="2022">2022</option>
              <option value="2023">2023</option>
              <option value="2024">2024</option>
              <option value="2025">2025</option>
              <option value="2026">2026</option>
              <option value="2027">2027</option>
              <option value="2028">2028</option>
              <option value="2029">2029</option>
              <option value="2030">2030</option>
            </select>
          
            </td>
    </tr>
	
    <tr> 
		<td height="61"><p id="fieldnames">CVV*:</b></td><td><input name="pwd" type="password" size="3" pattern="[0-9]{3}" required maxlength="3"> 
		                </td>
	</tr>

	

  </table>
  <br />
   <input type="submit" name="pay" value=" Pay "> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="reset" value="  RESET  ">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name=back  value="   BACK   " onClick="window.location='homepage.jsp'">
        </form>
</center>

</body>

</html>