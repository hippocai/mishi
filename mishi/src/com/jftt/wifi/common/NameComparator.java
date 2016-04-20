/*
 * All rights Reserved, Copyright (C) FUJITSU LIMITED 2011
 * FileName: PointDataBean.java
 * Version:  $Revision$
 * Modify record:
 * NO. |     Date       |    Name         |      Content
 * 1   | 2014-10-7        | JFTT)caiyicheng    | original version
 */
package com.jftt.wifi.common;

import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;



/**
 * class name:NameComparator <BR>
 * class description: 泛型算法排序谓词类 <BR>
 * Remark: <BR>
 * @version 1.00 2014-10-23
 * @author JFTT)caiyicheng
 */
public class NameComparator implements Comparator<Object> {
	@SuppressWarnings("unchecked")//传进来的就是HashMap
	public int compare(Object a, Object b) {
		Map<String,String> mapA = (HashMap<String, String>)a;
		Map<String,String> mapB = (HashMap<String, String>)b;
		return mapA.get("pointNum").compareTo(mapB.get("pointNum"));
		
	}
}