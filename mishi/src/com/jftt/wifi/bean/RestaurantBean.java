package com.jftt.wifi.bean;

import java.io.Serializable;

public class RestaurantBean implements Serializable {

	/**  
	 * define a field serialVersionUID which type is long
	 */
	private static final long serialVersionUID = 5967966735648434253L;

	/*
	 uid
brand
position
longitude
latitude
rate

	 */
	
	private long uid;
	private String brand;
	private String position;
	private float longitude;
	private float latitude;
	private float rate;
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
}
