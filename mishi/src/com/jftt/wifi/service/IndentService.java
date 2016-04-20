package com.jftt.wifi.service;

import java.util.List;
import java.util.Map;

import com.jftt.wifi.bean.IndentBean;

public interface IndentService {
	/**
	 * Method name: getAllIndent <BR>
	 * Description: getAllIndent <BR>
	 * Remark: <BR>
	 * @return  List<IndentBean><BR>
	 */
	public List<IndentBean>getAllIndent();
	/**
	 * Method name: getIndentByMap <BR>
	 * Description: getIndentByMap <BR>
	 * Remark: <BR>
	 * @param map
	 * @return  List<IndentBean><BR>
	 */
	public List<IndentBean>getIndentByMap(Map<String,String>map);
	/**
	 * Method name: getIndentByKey <BR>
	 * Description: getIndentByKey <BR>
	 * Remark: <BR>
	 * @param key
	 * @param value
	 * @return  List<IndentBean><BR>
	 */
	public List<IndentBean>getIndentByKey(String key,String value);
	/**
	 * Method name: getIndentById <BR>
	 * Description: getIndentById <BR>
	 * Remark: <BR>
	 * @param id
	 * @return  IndentBean<BR>
	 */
	public IndentBean getIndentById(long id);
	/**
	 * Method name: updateIndentByBean <BR>
	 * Description: updateIndentByBean <BR>
	 * Remark: <BR>
	 * @param indentBean
	 * @return  boolean<BR>
	 */
	public boolean updateIndentByBean(IndentBean indentBean);
	/**
	 * Method name: deleteIndentById <BR>
	 * Description: deleteIndentById <BR>
	 * Remark: <BR>
	 * @param id
	 * @return  boolean<BR>
	 */
	public boolean deleteIndentById(long id);
	/**
	 * Method name: deleteIndentByMap <BR>
	 * Description: deleteIndentByMap <BR>
	 * Remark: <BR>
	 * @param map
	 * @return  boolean<BR>
	 */
	public boolean deleteIndentByMap(Map<String,String>map);
	/**
	 * Method name: insertIndentByBean <BR>
	 * Description: insertIndentByBean <BR>
	 * Remark: <BR>
	 * @param indentBean
	 * @return  boolean<BR>
	 */
	public boolean insertIndentByBean(IndentBean indentBean);
}
