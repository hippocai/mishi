///*
// * All rights Reserved, Copyright (C) FUJITSU LIMITED 2011
// * FileName: PointInfoAction.java
// * Version:  $Revision$
// * Modify record:
// * NO. |     Date       |    Name         |      Content
// * 1   | 2014-10-10        | JFTT)caiyicheng    | original version
// */
//package com.jftt.wifi.action;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.log4j.Logger;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.jftt.wifi.bean.PointInfoBean;
//import com.jftt.wifi.service.MetaDataService;
//import com.jftt.wifi.service.PointInfoService;
//
///**
// * class name:PointInfoAction <BR>
// * class description: 采集点管理Action <BR>
// * Remark: <BR>
// * @version 1.00 2014-10-10
// * @author JFTT)caiyicheng
// */
//@Controller
//@RequestMapping(value="pointInfo")
//public class PointInfoAction {
//	private static Logger logger = Logger.getLogger(PointInfoAction.class);  
//	
//	@Resource(name="pointInfoService")
//	PointInfoService pointInfoService;
//	
//	@Resource(name="metaDataService")
//	MetaDataService metaDataService;
//	
//	/**
//	 * Method name: toPointSetPage <BR>
//	 * Description: 跳转至采集点设置页面 <BR>
//	 * Remark: <BR>
//	 * @param request
//	 * @return  String<BR>
//	 */
//	@RequestMapping(value="toPointSet")
//	public String toPointSetPage(HttpServletRequest request){
//		return "point/pointSet";
//	}
//	
//	/**
//	 * Method name: getAllPointInfo <BR>
//	 * Description: 取得所有采集点的信息 <BR>
//	 * Remark: <BR>
//	 * @param request
//	 * @param response
//	 * @return  Object<BR>
//	 */
//	@RequestMapping(value="getAllPointInfo")
//	@ResponseBody
//	public Object getAllPointInfo(HttpServletRequest request,HttpServletResponse response){
//		Object data=pointInfoService.getPointInfo();
//		if(data==null){
//			return new ArrayList<PointInfoBean>();
//		}else{
//			return data;
//		}
//		
//	}
//	/**
//	 * Method name: getAllActivePointInfo <BR>
//	 * Description: 取得所有激活的采集点信息 <BR>
//	 * Remark: <BR>
//	 * @param request
//	 * @param response
//	 * @return  Object<BR>
//	 */
//	@RequestMapping(value="getAllActivePointInfo")
//	@ResponseBody
//	public Object getAllActivePointInfo(HttpServletRequest request,HttpServletResponse response){
//		List<PointInfoBean> datas=pointInfoService.getPointInfo();
//		if(datas==null){
//			return new ArrayList<Map<String,String>>();
//		}else{
//			//Do Nothing
//		}
//		List<Map<String,String>> points=new ArrayList<Map<String,String>>();
//		for(PointInfoBean data:datas){
//			if(data.getMemo().equals("0")){
//				continue;
//			}else{
//				//Do Nothing
//			}
//			Map<String, String> map=new HashMap<String,String>();
//			map.put("id", data.getId()+"");
//			map.put("text", data.getLocation()+",编号"+data.getPointNum()+""+data.getPortNum());
//			points.add(map);
//		}
//		
//		return points;
//	}
//	
//	/**
//	 * Method name: getPointMetaData <BR>
//	 * Description: 取得所有采集点的元数据信息 <BR>
//	 * Remark: <BR>
//	 * @param request
//	 * @param response
//	 * @return  Object<BR>
//	 */
//	@RequestMapping(value="getPointMetaData")
//	@ResponseBody
//	public Object getPointMetaData(HttpServletRequest request,HttpServletResponse response){
//		Object data=metaDataService.getMetaData("pointNum");
//		if(data==null){
//			return new ArrayList<PointInfoBean>();
//		}else{
//			return data;
//		}
//		
//	}
//	
//	/**
//	 * Method name: getPortMetaData <BR>
//	 * Description: 获得所有采集端口的元数据信息 <BR>
//	 * Remark: <BR>
//	 * @param request
//	 * @param response
//	 * @return  Object<BR>
//	 */
//	@RequestMapping(value="getPortMetaData")
//	@ResponseBody
//	public Object getPortMetaData(HttpServletRequest request,HttpServletResponse response){
//		Object data=metaDataService.getMetaData("portNum");
//		
//		if(data==null){
//			return new ArrayList<PointInfoBean>();
//		}else{
//			return data;
//		}
//		
//	}
//	
//	/**
//	 * Method name: updatePointData <BR>
//	 * Description: 更新一条采集点信息 <BR>
//	 * Remark: <BR>
//	 * @param data
//	 * @return  String<BR>
//	 */
//	@RequestMapping(value="updatePointData")
//	@ResponseBody
//	public String updatePointData(PointInfoBean data){
//		
//		logger.info(data.toString());
//		if(pointInfoService.updatePointInfo(data)){
//			return "SUCCESS";
//		}else{
//			return "ERROR";
//		}
//	}
//	
//	
//}
