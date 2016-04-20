package com.jftt.wifi.dao;

import java.util.List;
import java.util.Map;

import com.jftt.wifi.bean.RateBean;

public interface RateDaoMapper {

	public List<RateBean>getRateBeanByMap(Map<String,String>map);
	public void deleteRateByMap(Map<String,String>map);
	public void insertRateByBean(RateBean rateBean);
}
