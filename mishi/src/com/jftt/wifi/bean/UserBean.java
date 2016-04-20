package com.jftt.wifi.bean;

import java.io.Serializable;

public class UserBean implements Serializable {

	/**  
	 * define a field serialVersionUID which type is long
	 */
	private static final long serialVersionUID = -7227342208648101947L;

	/*
		 userId
		loginName
		passwd
	 */
	
	private long userId;
	private String loginName;
	private String passwd;
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
}
