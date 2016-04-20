/*
 * All rights Reserved, Copyright (C) FUJITSU LIMITED 2011
 * FileName: PointInfoBean.java
 * Version:  $Revision$
 * Modify record:
 * NO. |     Date       |    Name         |      Content
 * 1   | 2014-10-9        | JFTT)caiyicheng    | original version
 */
package com.jftt.wifi.bean;

import java.io.Serializable;

/**
 * class name:PointInfoBean <BR>
 * class description: 采集点信息bean <BR>
 * Remark: <BR>
 * @version 1.00 2014-10-9
 * @author JFTT)caiyicheng
 */
public class PointInfoBean implements Serializable {

	/**  
	 * define a field serialVersionUID which type is long
	 */
	private static final long serialVersionUID = -4861205167735994274L;
	
	private long id;//ID
	private String pointNum;//采集器编号
	private String portNum;//采集点端口编号
	private String location;//采集点集体位置
	private String memo;//备注
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getPointNum() {
		return pointNum;
	}
	public void setPointNum(String pointNum) {
		this.pointNum = pointNum;
	}
	public String getPortNum() {
		return portNum;
	}
	public void setPortNum(String portNum) {
		this.portNum = portNum;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}

}
