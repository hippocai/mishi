package com.jftt.wifi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jftt.wifi.bean.IndentBean;
import com.jftt.wifi.dao.IndentDaoMapper;
import com.jftt.wifi.service.IndentService;
@Service("indentService")
public class IndentServiceImpl implements IndentService {

	@Resource(name="indentDaoMapper")
	IndentDaoMapper indentDaoMapper;
	@Override
	public List<IndentBean> getAllIndent() {
		// TODO 自动生成的方法存根
		return this.getIndentByMap(new HashMap<String,String>());
	}

	@Override
	public List<IndentBean> getIndentByMap(Map<String, String> map) {
		// TODO 自动生成的方法存根
		if(map==null){
			return null;
		}
		return indentDaoMapper.getIndentByMap(map);
	}

	@Override
	public List<IndentBean> getIndentByKey(String key, String value) {
		// TODO 自动生成的方法存根
		Map<String,String>map=new HashMap<String,String>();
		map.put(key, value);
		return this.getIndentByMap(map);
	}

	@Override
	public IndentBean getIndentById(long id) {
		// TODO 自动生成的方法存根
		List<IndentBean> indentBeanList=this.getIndentByKey("indentId", id+"");
		if(indentBeanList==null||indentBeanList.size()==0){
			return null;
		}
		return indentBeanList.get(0);
	}

	@Override
	public boolean updateIndentByBean(IndentBean indentBean) {
		// TODO 自动生成的方法存根
		try{
			indentDaoMapper.updateIndentByBean(indentBean);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteIndentById(long id) {
		// TODO 自动生成的方法存根
		return false;
	}

	@Override
	public boolean deleteIndentByMap(Map<String, String> map) {
		// TODO 自动生成的方法存根
		if(map==null){
			return false;
		}
		try{
			indentDaoMapper.deleteIndentByMap(map);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean insertIndentByBean(IndentBean indentBean) {
		// TODO 自动生成的方法存根
		if(indentBean==null){
			return false;
		}
		try {
			indentDaoMapper.insertIndentByBean(indentBean);
			return true;
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return false;
		}
	}

}
