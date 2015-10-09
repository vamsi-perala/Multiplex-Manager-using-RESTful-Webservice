# Multiplex-Manager-using-RESTful-Webservice

The detail project report is present in the Git Repository. This is a summary of the project.

This application is intended to facilitate users to book movie tickets that are screened in the multiplex "BVV". The multiplex BVV has a fixed number of screens and movies are screened in them at various show times in a day.
The application offers the following options to the user:
*List available movies*
*Check Availability*
*Book tickets*
*Retrieve Booked Tickets*

The 3 services, *Listing all the available movies, Making Reservation of Tickets and Completion of Ticket Booking* are hosted as Web Services, which can be accessed from RESTful clients

###Technology Stack

 **Client**
The client module has been developed using JAVA. The view model is rendered using JSPs. The client side validations are done using JAVASCRIPT.

 **Server:**
Web Services
The web services are developed in Representational state transfer (REST) architectural style.
The web services have been developed in JAVA Spring framework in tandem with Apache CXF API which provides the required JAX-RS API support.
Servlets also serve some client requests. The servlets are JAVA servlets, developed in the J2EE framework.
The webserver this application has been deployed is Tomcat v7.o.

 **DataBase**
The database used is MySQL 5.5. The connectivity between the server and the database is accomplished using JDBC connection.

 **Cache Mechanism**
Memcached has been used for the caching functionality that we have implemented

 **SSL Encryption**: The encryption mechanism has been enabled by using self-signed SSL certificate.

 **Compression**: The request/response compression is enabled by using gzip content encoding.
 We have chosen JAVA technology as the development platform because of its rich API support and compatibility with third party APIs like Memcached.


