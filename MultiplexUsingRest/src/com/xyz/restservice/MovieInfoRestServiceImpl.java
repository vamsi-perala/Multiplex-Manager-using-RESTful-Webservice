package com.xyz.restservice;
 
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;



import com.xyz.pojo.Movies;
import com.xyz.pojo.Availability;
 
public class MovieInfoRestServiceImpl implements MovieInfoRestService {
 
public com.xyz.pojo.BookingStatus bookTicket(String card, int cvv, int ticket, String screen, String date, int show, String user)
{
	com.xyz.pojo.BookingStatus bs= new com.xyz.pojo.BookingStatus();
	if(card.equals("1234554321"))
		bs.setStatus("not booked");
	else
	{	
		String showTime = null;
		if(show == 1)
		{
			showTime= "11:00 AM";
		}
		else if(show == 2)
		{
			showTime= "3:00 PM";
		}
		else if(show == 3)
		{
			showTime= "6:00 PM";
		}
		long i= 10000000;
		int  n = (int) (i * Math.random());
		String reference= "REJK"+n;
		String movie = null;

		int avail, current;
		avail=0;
		Connection con=MulConnection.connectDao();
		  ResultSet rs;
			try 
			{
				System.out.println(show+", "+screen+", "+date);
				Statement st=con.createStatement();
				String val = "select show"+show+" from availability where screen= '"+screen+"' and date= '"+date+"'";
				rs=st.executeQuery(val);
				while(rs.next())			
				{					
					avail = rs.getInt(1);
					System.out.println(avail);
				}
				current= avail-ticket;
				System.out.println(current);
				String val1= "update availability set show"+show+"='"+current+"' where screen='"+screen+"' and date ='"+date+"'";
				st.executeUpdate(val1);
				
				String val2= "select movie from movieinfo where screen='"+screen+"'";
				rs=st.executeQuery(val2);
				
				while(rs.next())			
				{					
					 movie= rs.getString(1);					 
					System.out.println("movie: "+movie);
				}
				String val3= "insert into Booking_History values('"+user+"', '"+screen+"', '"+movie+"', '"+date+"', '"+showTime+"', "+ticket+", '"+reference+"');";
				st.executeUpdate(val3);
				bs.setReference(reference);
			}
			
			catch(SQLException e)
			{}
		bs.setStatus("booked ");
	}
	return bs;
	
}
	
public Availability getAvailability(String screen, java.sql.Date date, int show)
{
	int availability=0;
	String movie;
	Connection con=MulConnection.connectDao();
	  ResultSet rs;
	  Availability a =new Availability();
		try 
		{
			Statement st=con.createStatement();
			String val = "select movie, show"+show+" from availability where screen= '"+screen+"' and date= '"+date+"'";
			System.out.println(val);
			rs=st.executeQuery(val);
			
			while(rs.next())			
			{
				movie=rs.getString(1);
				availability=rs.getInt(2);				
			    a.setAvailability(availability);
			    a.setMovie(movie);
			}
			
		}
		catch(SQLException e)
		{}
	   
	
	return a;
}
public ArrayList<Movies> getMovieList(String date) {
  Movies movie = new Movies();
  ArrayList<Movies> armovie = new ArrayList<Movies>();
  Connection con=MulConnection.connectDao();
  ResultSet rs;
	try 
	{
		Statement st=con.createStatement();
		String val = "select * from movieinfo";
		rs=st.executeQuery(val);
		while(rs.next())			
		{
			movie = new Movies();
			System.out.println(rs.getString(1)+", "+rs.getString(2));
			movie.setScreen(rs.getString(1));
			movie.setMovie(rs.getString(2));
			armovie.add(movie);
		}
		
	}
	catch(SQLException e)
	{}
   
  return armovie;
 }

 
}