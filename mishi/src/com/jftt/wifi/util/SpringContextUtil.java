/**
 * All rights Reserved, Copyright (C) FUJITSU LIMITED 2013
 * FileName: SpringContextUtil.java
 * Version:  $Revision$
 * Modify record:
 * NO. |		Date		|		Name		|		Content
 * 1   |	2013-12-26		|	JFTT)FuXiaofeng	|	original version
 */
package com.jftt.wifi.util;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoaderListener;

/**
 * class name:SpringContextUtil <BR>
 * class description: SpringBean获取方法 <BR>
 * Remark: <BR>
 * @version 1.00 2013-12-26
 * @author JFTT)FuXiaofeng
 */
public class SpringContextUtil {

	/** 通过ContextLoaderListener取得ctx */ 
	private static ApplicationContext ctx;  
	
    public static void initApplicationContext(){  
        ctx = ContextLoaderListener.getCurrentWebApplicationContext();  
    }
    
    /** 通过泛型方法取得bean实例 */  
    @SuppressWarnings("unchecked")
	public static <T> T getBean(String name){  
        if(ctx==null){  
            initApplicationContext();  
        }  
        return (T) ctx.getBean(name);  
    }
}
