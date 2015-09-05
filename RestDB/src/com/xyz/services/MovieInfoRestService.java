package com.xyz.services;
 
import java.sql.Date;
import java.util.ArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import com.xyz.pojo.*;
 
@Path("restservice/1.0")
@Produces("application/xml")
public interface MovieInfoRestService {
 //parameter that gets passed via the URL
 @GET
 @Path("/movie/{date}")
 public ArrayList<Movies> getMovieList(@PathParam("date") String date);
 @GET
 @Path("/avail/{screen}/{date}/{show}")
 public Availability getAvailability(@PathParam("screen") String screen, @PathParam("date") Date date, @PathParam("show") int show);
 @GET
 @Path("/booking/{cardnum}/{cvv}/{ticket}/{screen}/{date}/{show}/{user}")
 public BookingStatus bookTicket(@PathParam("cardnum") String card, @PathParam("cvv") int cvv, @PathParam("ticket") int ticket, @PathParam("screen") String screen, @PathParam("date") String date, @PathParam("show") int show, @PathParam("user") String user );
}