/*
 * All rights Reserved, Copyright (C) FUJITSU LIMITED 2011
 * FileName: CSVUtil.java
 * Version:  $Revision$
 * Modify record:
 * NO. |     Date       |    Name         |      Content
 * 1   |   2014年10月19日      | JFTT)caiyicheng    | original version
 */
package com.jftt.wifi.util;

import java.io.BufferedWriter;  
import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.OutputStreamWriter;  
import java.util.Iterator;  
import java.util.LinkedHashMap;  
import java.util.List;  
import java.util.Map; 

import org.apache.log4j.Logger;


/**
 * class name:CSVUtil <BR>
 * class description: 生成CSV文件 <BR>
 * Remark: <BR>
 * @version 2014年10月19日
 * @author JFTT)caiyicheng
 */
public class CSVUtil {
	private static Logger log = Logger.getLogger(CSVUtil.class);
	@SuppressWarnings("rawtypes")
	public static File createCSVFile(List<Map<String,String>> exportData, LinkedHashMap<String, String> rowMapper, String outPutPath, String filename) {  
  
        File csvFile = null;  
        BufferedWriter csvFileOutputStream = null;  
        try {  
        	if(!outPutPath.endsWith("\\")){
        		outPutPath+="\\";
        	}else{
        		//Do Nothing
        	}
            csvFile = new File(outPutPath + filename + ".csv");  
            // csvFile.getParentFile().mkdir();  
            File parent = csvFile.getParentFile();  
            if (parent != null && !parent.exists()) {  
                parent.mkdirs();  
                log.info("文件夹不存在，已经创建");
            }else{
            	//Do Nothing
            }
            csvFile.createNewFile();  
  
            // GB2312使正确读取分隔符","  
            csvFileOutputStream = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(csvFile), "GB2312"), 1024);  
            // 写入文件头部  
            for (Iterator<Map.Entry<String, String>> propertyIterator = rowMapper.entrySet().iterator(); propertyIterator.hasNext();) {  
                java.util.Map.Entry propertyEntry = (java.util.Map.Entry) propertyIterator  
                        .next();  
                csvFileOutputStream.write("\""  
                        + propertyEntry.getValue().toString() + "\"");  
                if (propertyIterator.hasNext()) {  
                    csvFileOutputStream.write(",");  
                }else{
                	//Do Nothing
                }
            }  
            csvFileOutputStream.newLine();  
  
            // 写入文件内容  
            for (Iterator iterator = exportData.iterator(); iterator.hasNext();) {    
               // Object row = (Object) iterator.next();    
                LinkedHashMap row = (LinkedHashMap) iterator.next();  
                System.out.println(row);  
               
                for (Iterator propertyIterator = row.entrySet().iterator(); propertyIterator.hasNext();) {    
                    java.util.Map.Entry propertyEntry = (java.util.Map.Entry) propertyIterator.next();    
                   // System.out.println( BeanUtils.getProperty(row, propertyEntry.getKey().toString()));  
                    csvFileOutputStream.write("\"" +  propertyEntry.getValue().toString() + "\"");    
                   if (propertyIterator.hasNext()) {    
                       csvFileOutputStream.write(",");    
                    }else{
                    	//Do Nothing
                    }
               }    
                if (iterator.hasNext()) {    
                   csvFileOutputStream.newLine();    
                }else{
                	//Do Nothing
                }
           }    
            csvFileOutputStream.flush();  
           // csvFileOutputStream.close();  
            return csvFile;  
        } catch (Exception e) {    
           e.printStackTrace(); 
           log.error("发生异常", e);
           return null;  
        } finally {    
           try {    
                csvFileOutputStream.close();    
            } catch (IOException e) {    
               e.printStackTrace();  
           }    
       }    
       
	}
	
	/*public static void main(String[] args) {  
	       List exportData = new ArrayList<Map>();  
	        Map row1 = new LinkedHashMap<String, String>();  
	        row1.put("1", "11");  
	        row1.put("2", "12");  
	        row1.put("3", "13");  
	        row1.put("4", "14");  
	        exportData.add(row1);  
	        row1 = new LinkedHashMap<String, String>();  
	        row1.put("1", "21");  
	        row1.put("2", "22");  
	        row1.put("3", "23");  
	        row1.put("4", "24");  
	        exportData.add(row1);  
	        List propertyNames = new ArrayList();  
	        LinkedHashMap map = new LinkedHashMap();  
	        map.put("1", "第一列");  
	        map.put("2", "第二列");  
	        map.put("3", "第三列");  
	        map.put("4", "第四列");  
	        CSVUtil.createCSVFile(exportData, map, "d:/", "12");  
	    }  */
}
