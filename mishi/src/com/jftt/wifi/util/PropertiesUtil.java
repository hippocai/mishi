/*
 * All rights Reserved, Copyright (C) FUJITSU LIMITED 2011
 * FileName: PropertiesUtil.java
 * Version:  $Revision$
 * Modify record:
 * NO. |     Date       |    Name         |      Content
 * 1   | 2014-10-18        | JFTT)caiyicheng    | original version
 */
package com.jftt.wifi.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * class name:PropertiesUtil <BR>
 * class description: 处理可动态更新的配置文件 <BR>
 * Remark: <BR>
 * @version 1.00 2014-10-18
 * @author JFTT)caiyicheng
 */
public class PropertiesUtil {
	//static String profilepath="D:\\DBConfig.ini";
	static String profilepath=ReadProperties.getValue("propertyPath");   
	private static Logger log = Logger.getLogger(PropertiesUtil.class);
   
    private static Properties props = new Properties();   
    static {   
        try {   
            props.load(new FileInputStream(profilepath));   
            
        } catch (Exception e) {   
            e.printStackTrace();   
        }  
    }   
  
 
    /**
     * Method name: getKeyValue <BR>
     * Description: 读取属性文件中相应键的值   <BR>
     * Remark: <BR>
     * @param key
     * @return  String<BR>
     */
    public static String getKeyValue(String key) {   
        return props.getProperty(key);   
    }   
  

    /**
     * Method name: readValue <BR>
     * Description: 从别的文件中根据主键key读取主键的值value  <BR>
     * Remark: 会改变原先的filePath，不建议使用<BR>
     * @param filePath
     * @param key
     * @return  String<BR>
     */
    @Deprecated
    public static String readValue(String filePath, String key) {   
        Properties props = new Properties();   
        try {   
            InputStream in = new BufferedInputStream(new FileInputStream(filePath));   
            props.load(in);   
            String value = props.getProperty(key);   
           // log.info(key +"键的值是："+ value);   
            return value;   
        } catch (Exception e) {   
            e.printStackTrace();   
            return null;   
        }   
    }   
      
 
    /**
     * Method name: writeProperties <BR>
     * Description: 更新（或插入）一对properties信息(主键及其键值)<BR>
     * Remark: <BR>
     * @param keyname
     * @param keyvalue  void<BR>
     */
    public static void writeProperties(String keyname,String keyvalue) {          
        try {   
            OutputStream fos = new FileOutputStream(profilepath);   
            props.setProperty(keyname, keyvalue);   
            props.store(fos, "Update '" + keyname + "' value");   
            fos.close();
        } catch (Exception e) {   
        	e.printStackTrace();
        	log.error("属性文件更新错误",e);   
        }   
    }   
  
 
    /**
     * Method name: updateProperties <BR>
     * Description: 更新properties文件的键值对   <BR>
     * Remark:此方法不检查文件是否存在! <BR>
     * @param keyname
     * @param keyvalue  void<BR>
     */
    public void updateProperties(String keyname,String keyvalue) {   
        try {   
            props.load(new FileInputStream(profilepath));   
            OutputStream fos = new FileOutputStream(profilepath);   
            props.setProperty(keyname, keyvalue);   
            props.store(fos, "Update '" + keyname + "' value");   
            fos.close();
        } catch (IOException e) {   
        	e.printStackTrace();
            log.error("属性文件更新错误",e);   
        }   
    }   
}
