package com.xyz.services;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Statement;
import com.xyz.client.MultiplexClient;
import com.xyz.pojo.Availability;
import com.xyz.pojo.Movies;
import com.xyz.services.MulConnection;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MultServlet extends HttpServlet
{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public MultServlet() 
	 {
	        super();
	        //System.out.println("hello constructor");
	  }
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
		 String error;
		 HttpSession ss=request.getSession(true);
		 String user = (String) ss.getAttribute("userName");
		 String date= request.getParameter("date");		 
		 String str=request.getParameter("form");
			if(str.equals("homepage"))
			{
								
				response.setContentType("text/html");
				MultiplexClient mc= new MultiplexClient();
				ArrayList<Movies> armovie= mc.getMovieInfo(date);				
				System.out.println("entered successfully");
				ss.setAttribute("date", date);
				request.setAttribute("data", armovie);
				//request.setAttribute("date", date);
				//ss.setAttribute("data", armovie);
				System.out.println("in home servlet "+user);
				request.getRequestDispatcher("screens.jsp").forward(request,response);
				//response.sendRedirect("./JSPs/screens.jsp");
				
			}
			 
			if(str.equals("screen_selection"))
			{
				/*String date= request.getParameter("date");				
				response.setContentType("text/html");
				MultiplexClient mc= new MultiplexClient();
				ArrayList<Movies> armovie= mc.getMovieInfo(date);*/
				
				System.out.println("entered successfully2");
				//request.setAttribute("data", armovie);
				//String date=(String)ss.getAttribute("date");
				String screen= null;// = (String)ss.getAttribute("screen");
				int show=0;// = (int)ss.getAttribute("show");
				String s1=request.getParameter("jumpMenu1");
				String s2=request.getParameter("jumpMenu2");
				String s3=request.getParameter("jumpMenu3");
				String s4=request.getParameter("jumpMenu4");
				date= (String)ss.getAttribute("date");
				if(!(s1.equalsIgnoreCase("Select Show")))
				{
					screen="Screen 01";
					if(s1.equals("11:00 AM"))
						show=1;
					if(s1.equals("3:00 PM"))
						show=2;
					if(s1.equals("6:00 PM"))
						show=3;
					ss.setAttribute("showTiming", s1);
				}
				if(!(s2.equalsIgnoreCase("Select Show")))
				{
					screen="Screen 02";
					
					if(s2.equals("11:00 AM"))
						show=1;
					if(s2.equals("3:00 PM"))
						show=2;
					if(s2.equals("6:00 PM"))
						show=3;
					ss.setAttribute("showTiming", s2);
				}
				if(!(s3.equalsIgnoreCase("Select Show")))
				{
					screen="Screen 03";
					if(s3.equals("11:00 AM"))
						show=1;
					if(s3.equals("3:00 PM"))
						show=2;
					if(s3.equals("6:00 PM"))
						show=3;
					ss.setAttribute("showTiming", s3);
				}
				if(!(s4.equalsIgnoreCase("Select Show")))
				{
					screen="Screen 04";
					if(s4.equals("11:00 AM"))
						show=1;
					if(s4.equals("3:00 PM"))
						show=2;
					if(s4.equals("6:00 PM"))
						show=3;
					ss.setAttribute("showTiming", s4);
				}
				ss.setAttribute("show_int", show);
				System.out.println(screen+", "+show+", "+date+" ,"+s1+", "+s2+", "+s3+", "+s4);
				MultiplexClient mc= new MultiplexClient();
				Availability availability=mc.getAvailability(screen,date,show);
				ss.setAttribute("movieName", availability.getMovie());
				
				request.setAttribute("availability",availability);				
				ss.setAttribute("screenNumber", screen);				
				//ss.setAttribute("availability",availability);
				//System.out.println("servlet availability"+availability);
				user = (String) ss.getAttribute("userName");
				 System.out.println("in screen servlet "+user);
				request.getRequestDispatcher("availability.jsp").forward(request,response);
				//response.sendRedirect("./JSPs/screens.jsp");
				
			}
if(str.equals("pay"))
				
			{
				int ticket_count=(Integer)ss.getAttribute("ticket_count");
				System.out.println("came from payment");
				String card=request.getParameter("cnumber");
				 int cvv=Integer.parseInt(request.getParameter("pwd"));
				  date=(String)ss.getAttribute("date");
				 int show=(Integer)ss.getAttribute("show_int");
				 String screen=(String)ss.getAttribute("screenNumber");
				float amt=ticket_count*10;
				System.out.println("date"+date+";;screen"+screen+";;show"+show+";;ticketcount"+ticket_count);
		 MultiplexClient mc= new MultiplexClient();
		 user = (String) ss.getAttribute("userName");
		 System.out.println("in payment servlet "+user);		
				String reference= mc.getStatus(card, cvv,ticket_count,screen,date,show, user);
				ss.setAttribute("reference", reference);
				request.getRequestDispatcher("payment_processing.jsp").forward(request,response);
			}
			
		
	 if(str.equals("login"))
	 {
		 error="User name and password doesn't match, please try again";
		 ss.setAttribute("error", error);
		 try{
			 String user_name=request.getParameter("uid");
				
				String pwd=request.getParameter("pwd");
			 	String query="select * from users where user_name='"+user_name+"' and password='"+pwd+"'";
			 	System.out.println(query);
			 	Connection con=MulConnection.connectDao();
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(query);
				if(rs.next()==true)
				{
					ss.setAttribute("userName",user_name);
					request.getRequestDispatcher("homepage.jsp").forward(request,response);
					//ss.setAttribute("loginStatus","loggedIn");
					
				}
				else
				{
					request.getRequestDispatcher("error.jsp").forward(request,response);
					
				}
				//request.getRequestDispatcher("./JSPs/homepage.jsp").forward(request,response);
				
				
				}
				catch(Exception e)
				{
					e.printStackTrace();
					//System.out.println("hello");
					//request.getRequestDispatcher("error.jsp").forward(request,response);
				}
	 }
	 if(str.equals("registration"))
	 {
		 String user_name=request.getParameter("uname");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String pwd=request.getParameter("pwd");
			error="User name is already taken, please register with a different one.";
			ss.setAttribute("error", error);
			ResultSet rs;
			String checkUser="select * from users where user_name='"+user_name+"'";		
			String query="insert into users values('"+user_name+"' ,'"+email+"' ,'"+pwd+"' ,'"+phone+"' )";
			System.out.println(query);
			try{
			Connection con=MulConnection.connectDao();
			Statement st=con.createStatement();
			rs= st.executeQuery(checkUser);
			if(rs.next())
			{
				throw new SQLException();
			}
			st.executeUpdate(query);
			
			
			Connection con1=MulConnection1.connectDao();
			Statement st1=con1.createStatement();
			 
			st1.executeUpdate(query);
			
			ss.setAttribute("userName",user_name);
			request.getRequestDispatcher("homepage.jsp").forward(request,response);
			}
			catch(SQLException e)
			{
			
				request.getRequestDispatcher("error.jsp").forward(request,response);
			}
	 }
		if(str.equals("retrival"))
		{
			error="Invalid reference number, please try again";
			ss.setAttribute("error", error);
			String reference_number=request.getParameter("reference_number");			
			response.setContentType("text/html");
			MultiplexClient mc= new MultiplexClient();
			try{
				Connection con=MulConnection.connectDao();
				ResultSet rs;
				Statement st=con.createStatement();
				String query=	"select * from booking_history where user='"+user+"' and reference='"+reference_number+"'";
				rs= st.executeQuery(query);
				if(rs.next())
					ss.setAttribute("ResultSet", rs);
				else
					throw new SQLException();
				request.getRequestDispatcher("print_retrieval.jsp").forward(request,response);
			}
			catch(SQLException e)
			{
				System.out.println("sql exception");
				request.getRequestDispatcher("error.jsp").forward(request,response);
			}
			
			
		}
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
			// TODO Auto-generated method stub
		}

	}