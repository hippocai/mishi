/*
 * All rights Reserved, Copyright (C) FUJITSU LIMITED 2014
 * FileName: MyAuthenticator.java
 * Version:  1.0
 * Modify record:
 * NO. |     Date       |    Name         |      Content
 * 1   | 2014-8-21        | JFTT)hexiaojun    | original version
 */
package com.jftt.mail;

import javax.mail.*;
  
/**
 * class name:MyAuthenticator <BR>
 * class description: 验证信息封装类 <BR>
 * Remark: <BR>
 * @version 1.00 2014-8-21
 * @author JFTT)hexiaojun
 */
public class MyAuthenticator extends Authenticator{
	String userName=null;
	String password=null;
	 
	public MyAuthenticator(){
		
	}
	public MyAuthenticator(String username, String password) { 
		this.userName = username; 
		this.password = password; 
	} 
	
	protected PasswordAuthentication getPasswordAuthentication(){
		return new PasswordAuthentication(userName, password);
	}
}
 
