package com.jftt.wifi.bean;

import java.io.Serializable;

public class RInfoBean implements Serializable {

	/**  
	 * define a field serialVersionUID which type is long
	 */
	private static final long serialVersionUID = 563380249753023533L;
	/*
	 uid
	loginName
	passwd

	 */
	
	private long uid;
	private String loginName;
	private String passwd;
	public long getUid() {
		return uid;
	}
	public void setUid(long uid) {
		this.uid = uid;
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
