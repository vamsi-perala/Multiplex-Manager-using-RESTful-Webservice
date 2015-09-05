package com.xyz.pojo;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "availability")
public class Availability 
{
	private int availability;
	private String movie;

	public int getAvailability() {
		return availability;
	}

	public void setAvailability(int availability) {
		this.availability = availability;
	}

	public String getMovie() {
		return movie;
	}

	public void setMovie(String movie) {
		this.movie = movie;
	}
	
	
}
