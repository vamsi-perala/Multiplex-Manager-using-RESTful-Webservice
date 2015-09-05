package com.xyz.client;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.ArrayList;

import com.xyz.services.MovieInfoRestService;
import com.xyz.pojo.*;

import net.spy.memcached.MemcachedClient;

import org.apache.cxf.jaxrs.client.JAXRSClientFactory;

public class MultiplexClient {
  
	 public ArrayList<Movies> getMovieInfo(String date) 
	    {
		 String[] array= new String[5];
		 ArrayList<Movies> armovie = null;
		 try{
	    	
	    	MemcachedClient c=new MemcachedClient(new InetSocketAddress("localhost", 11211));

	    	if(date.equals("2014-05-02") && c.get(date)!=null)
	    	{
	    		armovie=new ArrayList<Movies>();
	    		array=(String[])c.get(date);
	    		System.out.println("returning from cache");
	    		for(int i=0;i<array.length;i++)
	        	{
	        		System.out.println(array[i]);
	        		Movies m= new Movies();
	        		m.setMovie(array[i]);
	        		m.setScreen("Screen 0"+i+1);
	        		armovie.add(m);
	        	}
	    		return armovie;
	    	}
	    	System.out.println("calling web service");
	    	String serviceUrl = "http://localhost:8080/MultiplexUsingRest/movieinfoservices";
	        MovieInfoRestService serviceClient = JAXRSClientFactory.create(serviceUrl, MovieInfoRestService.class);
	       
	        armovie= serviceClient.getMovieList(date);
	        System.out.println("returned from web service");	        
	        // Store a value (async) for one hour
	        if(date.equals("2014-05-02") && c.get(date)==null)
	    	{
	        	System.out.println("storing in memcache");
	        	
	        	for(int i=0;i<armovie.size();i++)
	        	{
	        		array[i]=armovie.get(i).getMovie();
	        	}
	        	c.set(date, 3600, array);
	        	System.out.println("stored");
	    	}
	        
	        // Retrieve a value.
	        
	        System.out.println("client"+armovie.get(0).getMovie());
	        return armovie;
	        }        
		 catch(IOException e)
		 {}
		 return armovie;
	    }
    
    public Availability getAvailability(String screen, String date,  int show)
    {
        String serviceUrl = "http://localhost:8080/MultiplexUsingRest/movieinfoservices";
        MovieInfoRestService serviceClient = JAXRSClientFactory.create(serviceUrl, MovieInfoRestService.class);
        java.sql.Date d1=java.sql.Date.valueOf(date); 
        com.xyz.pojo.Availability av = serviceClient.getAvailability(screen,d1,show);
        System.out.println("client "+av.getAvailability()+", "+av.getMovie());
        return av;        
         
    }
    
    public String getStatus(String card, int cvv, int ticket, String screen, String date, int show, String user)
    {
    	 String serviceUrl = "http://localhost:8080/MultiplexUsingRest/movieinfoservices";
    	 MovieInfoRestService serviceClient = JAXRSClientFactory.create(serviceUrl, MovieInfoRestService.class);
    	 com.xyz.pojo.BookingStatus bs = serviceClient.bookTicket(card,cvv,ticket, screen, date, show, user);
         System.out.println("client"+bs.getStatus());
    	return bs.getReference();
    	
    }
}