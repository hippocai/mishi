package com.jftt.wifi.util;

import java.io.*;
import java.util.Properties;

public class ReadProperties {
	private static final String path = "configure.properties";// 从src的根目录开始
	private static final String encode = "UTF-8";// 文件的编码格式
	private static Properties props = new Properties();
	static {
		try {
			props.load(Thread.currentThread().getContextClassLoader()
					.getResourceAsStream(path));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String getValue(String key) {
		try {
			return new String(props.getProperty(key).getBytes("ISO8859-1"), encode);
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
			return null;
		}
	}

	public static void updateProperties(String key, String value) {
		props.setProperty(key, value);
	}

	public static void main(String[] args){
		System.out.println(getValue("respContent"));
	}

}
