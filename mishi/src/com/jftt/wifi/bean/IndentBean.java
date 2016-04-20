package com.jftt.wifi.bean;

import java.io.Serializable;

public class IndentBean implements Serializable {
	/**  
	 * define a field serialVersionUID which type is long
	 */
	private static final long serialVersionUID = 574738512604988283L;
	public long getIndentId() {
		return indentId;
	}
	public void setIndentId(long indentId) {
		this.indentId = indentId;
	}
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	private long indentId;
	//商家ID
	private long uid;
	private long userId;
	private float price;
	private String content;

}
