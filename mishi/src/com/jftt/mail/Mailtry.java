package com.jftt.mail;

import com.jftt.mail.MailSenderInfo;
import com.jftt.mail.SimpleMailSender;

public class Mailtry {
	public static void main(String[] args){
        //这个类主要是设置邮件
	  MailSenderInfo mailInfo = new MailSenderInfo(); 
	  mailInfo.setMailServerHost("smtp.qq.com"); 
	  mailInfo.setMailServerPort("25"); 
	  mailInfo.setValidate(true); 
	  mailInfo.setUserName("464682792@qq.com"); 
	  mailInfo.setPassword("*******");//您的邮箱密码 
	  mailInfo.setFromAddress("464682792@qq.com"); 
	  mailInfo.setToAddress("chinesehxj@163.com"); 
	  mailInfo.setSubject("设置邮箱标题"); 
	  mailInfo.setContent("为什么会发两遍呢"); 
	  
        //这个类主要来发送邮件
	  SimpleMailSender sms = new SimpleMailSender();
         sms.sendTextMail(mailInfo);//发送文体格式 
         //sms.sendHtmlMail(mailInfo);//发送html格式
	}

}
