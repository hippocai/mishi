/*
 * All rights Reserved, Copyright (C) FUJITSU LIMITED 2011
 * FileName: BeanUtil.java
 * Version:  $Revision$
 * Modify record:
 * NO. |     Date       |    Name         |      Content
 * 1   | 2014-10-14        | JFTT)caiyicheng    | original version
 */
package com.jftt.wifi.util;

import java.beans.BeanInfo;  
import java.beans.Introspector;  
import java.beans.PropertyDescriptor;  
import java.lang.reflect.Method;  
import java.util.HashMap;  
import java.util.Map;  

  
import org.apache.commons.beanutils.BeanUtils;  

/**
 * class name:BeanUtil <BR>
 * class description: Bean转Map和Map转Bean <BR>
 * Remark: <BR>
 * @version 1.00 2014-10-14
 * @author JFTT)caiyicheng
 */
public class BeanUtil {
	 // Map --> Bean 2: 利用org.apache.commons.beanutils 工具类实现 Map --> Bean  
    public static void transMap2BeanWithBeanUtils(Map<String, Object> map, Object obj) {  
        if (map == null || obj == null) {  
            return;  
        }  
        try {  
            BeanUtils.populate(obj, map);  
        } catch (Exception e) {  
            e.printStackTrace();
        }  
    }  
  
    // Map --> Bean 1: 利用Introspector,PropertyDescriptor实现 Map --> Bean  
    public static void transMap2Bean(Map<String, Object> map, Object obj) {  
  
        try {  
            BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());  
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();  
  
            for (PropertyDescriptor property : propertyDescriptors) {  
                String key = property.getName();  
  
                if (map.containsKey(key)) {  
                    Object value = map.get(key);  
                    // 得到property对应的setter方法  
                    Method setter = property.getWriteMethod();  
                    setter.invoke(obj, value);  
                }  
  
            }  
  
        } catch (Exception e) {  
           e.printStackTrace();
        }  
  
        return;  
  
    }  
  
    // Bean --> Map 1: 利用Introspector和PropertyDescriptor 将Bean --> Map  
    public static Map<String, String> transBean2Map(Object obj) {  
  
        if(obj == null){  
            return null;  
        }          
        Map<String, String> map = new HashMap<String, String>();  
        try {  
            BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());  
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();  
            for (PropertyDescriptor property : propertyDescriptors) {  
                String key = property.getName();  
  
                // 过滤class属性  
                if (!key.equals("class")) {  
                    // 得到property对应的getter方法  
                    Method getter = property.getReadMethod();  
                    Object value = getter.invoke(obj);  
                    map.put(key, value.toString()+"");  
                }  
  
            }  
        } catch (Exception e) {  
            e.printStackTrace();
        }  
  
        return map;  
  
    }  

}
