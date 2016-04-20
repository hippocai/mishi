package com.jftt.wifi.dao;

import java.util.List;
import java.util.Map;

import com.jftt.wifi.bean.RInfoBean;

public interface RInfoDaoMapper {
	public List<RInfoBean>getRInfoBeanByMap(Map<String,String>map);
	public void deleteRInfoByMap(Map<String,String>map);
	public void insertRInfo(RInfoBean rInfoBean);
	
}
