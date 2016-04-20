package com.jftt.wifi.service;

import java.util.List;
import java.util.Map;

import com.jftt.wifi.bean.RInfoBean;

public interface RInfoService {
	public List<RInfoBean>getAllrInfo();
	public List<RInfoBean>getrInfoByMap(Map<String,String>map);
	public List<RInfoBean>getrInfoByKey(String key,String value);
	public RInfoBean getrInfoById(long id);
	public boolean deleterInfoById(long id);
	public boolean deleterInfoByMap(Map<String,String>map);
	public boolean insertrInfoByBean(RInfoBean rInfoBean);
}
