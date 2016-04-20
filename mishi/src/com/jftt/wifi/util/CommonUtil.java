package com.jftt.wifi.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.text.SimpleDateFormat;

/**
 * CommonUtil.java
 */
public class CommonUtil {
	
	/**
	 * Method name: formatDateByDay <BR>
	 * Description: 格式化日期<BR>
	 * Remark:yyyy-MM-dd <BR>
	 * @param date 日期（Date或者String）
	 * @return String <BR>
	 */
	public static String getDateString(Object date) {
		if (date == null) {
			return null;
		} else {
			return (new SimpleDateFormat("yyyy-MM-dd")).format(date);
		}
	}

	/**
	 * Method name: formatDateByDay <BR>
	 * Description: 格式化日期<BR>
	 * Remark:yyyy-MM-dd HH:mm:ss <BR>
	 * @param date 日期（Date或者String）
	 * @return String <BR>
	 */
	public static String getDateTimeString(Object date) {
		if (date == null) {
			return null;
		} else {
			return (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(date);
		}
	}

	/**
	 * @param 将字符串MD5加密
	 * @return
	 */
	public static String getMD5(String password) { 
		
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		md5.update(password.getBytes());
		String md5String = new BigInteger(1, md5.digest()).toString(16);// 加密之后的字符串
		
		return md5String;
    }

}
