/*
 * All rights Reserved, Copyright (C) FUJITSU LIMITED 2014
 * FileName: MailSenderInfo.java
 * Version: 1.0 
 * Modify record:
 * NO. |     Date       |    Name         |      Content
 * 1   | 2014-8-21        | JFTT)hexiaojun    | original version
 */

package com.jftt.mail;
 
import java.util.Properties; 
/**
 * class name:MailSenderInfo <BR>
 * class description: 发送邮件需要使用的基本信息 <BR>
 * Remark: <BR>
 * @version 1.00 2014-8-21
 * @author JFTT)hexiaojun
 */
public class MailSenderInfo { 
	// 发送邮件的服务器的IP和端口 
	private String mailServerHost; 
	private String mailServerPort = "25"; 
	// 邮件发送者的地址 
	private String fromAddress; 
	// 邮件接收者的地址 
	private String toAddress; 
	// 登陆邮件发送服务器的用户名和密码 
	private String userName; 
	private String password; 
	// 是否需要身份验证 
	private boolean validate = false; 
	// 邮件主题 
	private String subject; 
	// 邮件的文本内容 
	private String content; 
	// 邮件附件的文件名 
	private String[] attachFileNames; 	

	/**
	 * Method name: getProperties <BR>
	 * Description: 获得邮件会话属性 <BR>
	 * Remark: <BR>
	 * @return  Properties<BR>
	 */
	public Properties getProperties() { 
	  Properties mailSession = new Properties(); 
	  mailSession.put("mail.smtp.host", this.mailServerHost); 
	  mailSession.put("mail.smtp.port", this.mailServerPort); 
	  mailSession.put("mail.smtp.auth", validate ? "true" : "false"); 
	  return mailSession; 
	} 
	
	
	public String getMailServerHost() { 
	  return mailServerHost; 
	} 
	
	public void setMailServerHost(String mailServerHost) { 
	  this.mailServerHost = mailServerHost; 
	}
	
	public String getMailServerPort() { 
	  return mailServerPort; 
	}
	
	public void setMailServerPort(String mailServerPort) { 
	  this.mailServerPort = mailServerPort; 
	}
	
	public boolean isValidate() { 
	  return validate; 
	}
	
	public void setValidate(boolean validate) { 
	  this.validate = validate; 
	}
	
	public String[] getAttachFileNames() { 
	  return attachFileNames; 
	}
	
	public void setAttachFileNames(String[] fileNames) { 
	  this.attachFileNames = fileNames; 
	}
	
	public String getFromAddress() { 
	  return fromAddress; 
	} 
	
	public void setFromAddress(String fromAddress) { 
	  this.fromAddress = fromAddress; 
	}
	
	public String getPassword() { 
	  return password; 
	}
	
	public void setPassword(String password) { 
	  this.password = password; 
	}
	
	public String getToAddress() { 
	  return toAddress; 
	} 
	
	public void setToAddress(String toAddress) { 
	  this.toAddress = toAddress; 
	} 
	
	public String getUserName() { 
	  return userName; 
	}
	
	public void setUserName(String userName) { 
	  this.userName = userName; 
	}
	
	public String getSubject() { 
	  return subject; 
	}
	
	public void setSubject(String subject) { 
	  this.subject = subject; 
	}
	
	public String getContent() { 
	  return content; 
	}
	
	public void setContent(String textContent) { 
	  this.content = textContent; 
	} 
} 
