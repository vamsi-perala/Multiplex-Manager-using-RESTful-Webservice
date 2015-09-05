package com.xyz.pojo;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "movieinfo")
public class Movies 
{
	private String screen;
	private String movie;
	public String getScreen() {
		return screen;
	}
	public void setScreen(String screen) {
		this.screen = screen;
	}
	public String getMovie() {
		return movie;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}

}
