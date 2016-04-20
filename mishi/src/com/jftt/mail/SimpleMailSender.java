/*
 * All rights Reserved, Copyright (C) FUJITSU LIMITED 2014
 * FileName: SimpleMailSender.java
 * Version:  1.0
 * Modify record:
 * NO. |     Date       |    Name         |      Content
 * 1   | 2014-8-21        | JFTT)hexiaojun    | original version
 */
package com.jftt.mail;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date; 
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address; 
import javax.mail.BodyPart; 
import javax.mail.Message; 
import javax.mail.MessagingException; 
import javax.mail.Multipart; 
import javax.mail.Session; 
import javax.mail.Transport; 
import javax.mail.internet.InternetAddress; 
import javax.mail.internet.MimeBodyPart; 
import javax.mail.internet.MimeMessage; 
import javax.mail.internet.MimeMultipart; 
import javax.mail.internet.MimeUtility;

/**
 * class name:SimpleMailSender <BR>
 * class description: 简单邮件（不带附件的邮件）发送器 <BR>
 * Remark: <BR>
 * @version 1.00 2014-8-21
 * @author JFTT)hexiaojun
 */
public class SimpleMailSender  { 
	/**
	 * Method name: sendTextMail <BR>
	 * Description: 以文本格式发送邮件 <BR>
	 * Remark: <BR>
	 * @param mailInfo 待发送的邮件的信息 
	 * @return  boolean<BR>
	 */
	public boolean sendTextMail(MailSenderInfo mailInfo) { 
	  // 判断是否需要身份认证 
	  MyAuthenticator authenticator = null; 
	  Properties pro = mailInfo.getProperties();
	  if (mailInfo.isValidate()) { 
	  // 如果需要身份认证，则创建一个密码验证器 
		authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword()); 
	  }
	  // 根据邮件会话属性和密码验证器构造一个发送邮件的session 
	  Session sendMailSession = Session.getDefaultInstance(pro,authenticator); 
	  try { 
	  // 根据session创建一个邮件消息 
	  Message mailMessage = new MimeMessage(sendMailSession); 
	  // 创建邮件发送者地址 
	  Address from = new InternetAddress(mailInfo.getFromAddress()); 
	  // 设置邮件消息的发送者 
	  mailMessage.setFrom(from); 
	  // 创建邮件的接收者地址，并设置到邮件消息中 
	  Address to = new InternetAddress(mailInfo.getToAddress()); 
	  mailMessage.setRecipient(Message.RecipientType.TO,to); 
	  // 设置邮件消息的主题 
	  mailMessage.setSubject(mailInfo.getSubject()); 
	  // 设置邮件消息发送的时间 
	  mailMessage.setSentDate(new Date()); 
	  // 设置邮件消息的主要内容 
	  String mailContent = mailInfo.getContent(); 
	  mailMessage.setText(mailContent); 
	 
	 
	  // 发送邮件 
	  Transport.send(mailMessage);
	  return true; 
	  } catch (MessagingException ex) { 
		  ex.printStackTrace(); 
	  } 
	  return false; 
	} 
	
	/**
	 * Method name: sendHtmlMail <BR>
	 * Description: 以HTML格式发送邮件 <BR>
	 * Remark: <BR>
	 * @param mailInfo 待发送的邮件信息
	 * @return  boolean<BR>
	 * @throws UnsupportedEncodingException 
	 */
	public static boolean sendHtmlMail(MailSenderInfo mailInfo) throws UnsupportedEncodingException{ 
	  // 判断是否需要身份认证 
	  MyAuthenticator authenticator = null;
	  Properties pro = mailInfo.getProperties();
	  //如果需要身份认证，则创建一个密码验证器  
	  if (mailInfo.isValidate()) { 
		authenticator = new MyAuthenticator(mailInfo.getUserName(), mailInfo.getPassword());
	  } 
	  // 根据邮件会话属性和密码验证器构造一个发送邮件的session 
	  Session sendMailSession = Session.getDefaultInstance(pro,authenticator); 
	  try { 
	  // 根据session创建一个邮件消息 
	  Message mailMessage = new MimeMessage(sendMailSession); 
	  // 创建邮件发送者地址 
	  Address from = new InternetAddress(mailInfo.getFromAddress()); 
	  // 设置邮件消息的发送者 
	  mailMessage.setFrom(from); 
	  // 创建邮件的接收者地址，并设置到邮件消息中 
	  Address to = new InternetAddress(mailInfo.getToAddress()); 
	  // Message.RecipientType.TO属性表示接收者的类型为TO 
	  mailMessage.setRecipient(Message.RecipientType.TO,to); 
	  // 设置邮件消息的主题 
	  mailMessage.setSubject(mailInfo.getSubject()); 
	  // 设置邮件消息发送的时间 
	  mailMessage.setSentDate(new Date()); 
	  
	  // MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象 
	  Multipart mainPart = new MimeMultipart(); 
	  // 创建一个包含HTML内容的MimeBodyPart 
	  BodyPart html = new MimeBodyPart(); 
	  // 设置HTML内容 
	  html.setContent(mailInfo.getContent(), "text/html; charset=utf-8"); 
	  mainPart.addBodyPart(html); 
	  // 将MiniMultipart对象设置为邮件内容 
	  mailMessage.setContent(mainPart); 
	  // 发送邮件 
	  String[] attachFileNames = mailInfo.getAttachFileNames();
      if (attachFileNames != null && attachFileNames.length > 0) {
          // 存放邮件附件的MimeBodyPart
          MimeBodyPart attachment = null;
          File file = null;
          for (int i = 0; i < attachFileNames.length; i++) {
              attachment = new MimeBodyPart();
              // 根据附件文件创建文件数据源
              file = new File(attachFileNames[i]);
              FileDataSource fds = new FileDataSource(file);
              attachment.setDataHandler(new DataHandler(fds));
              // 为附件设置文件名
              attachment.setFileName(MimeUtility.encodeWord(file.getName(), "GBK",null));
              mainPart.addBodyPart(attachment);
          }
      }
      // 将MiniMultipart对象设置为邮件内容
      mailMessage.setContent(mainPart);
		 
	  Transport.send(mailMessage); 
	  return true; 
	  } catch (MessagingException ex) { 
		  ex.printStackTrace(); 
	  } 
	  return false; 
	} 
} 


