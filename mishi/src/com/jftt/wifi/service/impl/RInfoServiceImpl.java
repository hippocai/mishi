package com.jftt.wifi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jftt.wifi.bean.RInfoBean;
import com.jftt.wifi.dao.RInfoDaoMapper;
import com.jftt.wifi.service.RInfoService;

@Service("rInfoService")
public class RInfoServiceImpl implements RInfoService{
	
	@Resource(name="RInfoDaoMapper")
	RInfoDaoMapper rInfoDaoMapper;
	
	@Override
	public List<RInfoBean> getAllrInfo() {
		// TODO Auto-generated method stub
		return this.getrInfoByMap(new HashMap<String,String>());
	}

	@Override
	public List<RInfoBean> getrInfoByMap(Map<String, String> map) {
		// TODO Auto-generated method stub
		if(map==null){
			return null;
		}
		return rInfoDaoMapper.getRInfoBeanByMap(map);
	}

	@Override
	public List<RInfoBean> getrInfoByKey(String key, String value) {
		// TODO Auto-generated method stub
		Map<String,String>map = new HashMap<String,String>();
		map.put(key, value);
		return this.getrInfoByMap(map);
	}

	@Override
	public RInfoBean getrInfoById(long id) {
		// TODO Auto-generated method stub
		List<RInfoBean> rInfoBeanList = this.getrInfoByKey("uid", id+"");
		if(rInfoBeanList==null||rInfoBeanList.size()==0){
			return null;
		}
		return rInfoBeanList.get(0);
	}

	@Override
	public boolean deleterInfoById(long id) {
		// TODO Auto-generated method stub
		try{
			Map<String,String>map = new HashMap<String,String>();
			map.put("uid", id+"");
			this.deleterInfoByMap(map);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleterInfoByMap(Map<String, String> map) {
		// TODO Auto-generated method stub
		if(map == null){
			return false;
		}
		try{
			rInfoDaoMapper.deleteRInfoByMap(map);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean insertrInfoByBean(RInfoBean rInfoBean) {
		// TODO Auto-generated method stub
		if(rInfoBean == null){
			return false;
		}
		try{
			rInfoDaoMapper.insertRInfo(rInfoBean);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

}
