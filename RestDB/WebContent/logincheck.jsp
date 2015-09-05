<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*" %>
<%

 /*connect to database*/

	int ind=0;
    String uid=request.getParameter("uid");
    String pwd=request.getParameter("pwd");
	
	session.setAttribute("uid",uid);
	session.setAttribute("pwd",pwd);
	
  /*	PreparedStatement st=con.prepareStatement("select * from clogin where uid=? and pwd=?");
	st.setString(1,uid);
	st.setString(2,pwd);
	
	ResultSet rs=st.executeQuery(); 
	
	if(rs.next())
	{	ind=rs.getInt(4);
 	
		if(ind==1)
		{	session.setAttribute("id",uid);
			response.sendRedirect("user.jsp");
		}
	}
	else{ response.sendRedirect("loginfailure.jsp");}
	//response.sendRedirect("user.jsp");*/
	if(uid.equals("varun") && pwd.equals("varun"))
	{		session.setAttribute("id",uid);
			response.sendRedirect("user.jsp");
	}	
	else
		response.sendRedirect("failure.jsp");
	
%>