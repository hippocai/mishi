package com.jftt.wifi.dao;

import java.util.List;
import java.util.Map;

import com.jftt.wifi.bean.IndentBean;

public interface IndentDaoMapper {
	public List<IndentBean>getIndentByMap(Map<String,String>map);
	public void deleteIndentByMap(Map<String,String>map);
	public void updateIndentByBean(IndentBean indentBean);
	public void insertIndentByBean(IndentBean indentBean);
}
