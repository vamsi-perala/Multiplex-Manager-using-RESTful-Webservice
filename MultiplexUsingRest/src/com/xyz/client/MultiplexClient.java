package com.xyz.client;

import java.util.ArrayList;

import com.xyz.restservice.MovieInfoRestService;
import com.xyz.pojo.*;
import org.apache.cxf.jaxrs.client.JAXRSClientFactory;

public class MultiplexClient {
  
    public static void main(String[] args){
        String serviceUrl = "http://localhost:8080/BillPayment/movieinfoservices";
        MovieInfoRestService serviceClient = JAXRSClientFactory.create(serviceUrl, MovieInfoRestService.class);
	 
      try {
          //Submit bill payment request
          ArrayList<Movies> armovie = serviceClient.getMovieList("abc1234xyz");
          Movies m= armovie.get(0);
          System.out.println(m.getScreen());
          //access bill payment response
          /*if(bill.getAccountID() == null)
            System.err.println("In the bill, account ID not set");
          else
            System.out.println("Account ID:" + bill.getAccountID());
          System.out.println("Payment Amount Due:" + bill.getBillAmount());
          if(bill.getDueDate() == null)
            System.err.println("In the bill, payment due date not set");
          else
            System.out.println("Payment Due Date:" + bill.getDueDate());*/
        } catch (java.lang.Exception ex) {
            ex.printStackTrace();
        }
    }
}