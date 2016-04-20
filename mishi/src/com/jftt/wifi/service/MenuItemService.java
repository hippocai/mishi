package com.jftt.wifi.service;

import java.util.List;
import java.util.Map;

import com.jftt.wifi.bean.MenuItemBean;

public interface MenuItemService {
	
	/**
	 * Method name: getMenuItemByMap <BR>
	 * Description: getMenuItemByMap <BR>
	 * Remark: <BR>
	 * @param map
	 * @return  List<MenuItemBean><BR>
	 */
	public List<MenuItemBean>getMenuItemByMap(Map<String,String>map);
	/**
	 * Method name: getAllItems <BR>
	 * Description: getAllItems <BR>
	 * Remark: <BR>
	 * @return  List<MenuItemBean><BR>
	 */
	public List<MenuItemBean>getAllItems();
	/**
	 * Method name: getItemByKey <BR>
	 * Description: getItemByKey <BR>
	 * Remark: <BR>
	 * @param key
	 * @param value
	 * @return  List<MenuItemBean><BR>
	 */
	public List<MenuItemBean>getItemByKey(String key,String value);
	/**
	 * Method name: getItemById <BR>
	 * Description: getItemById <BR>
	 * Remark: <BR>
	 * @param id
	 * @return  MenuItemBean<BR>
	 */
	public MenuItemBean getItemById(long id);
	/**
	 * Method name: deleteMenuItemByMap <BR>
	 * Description: deleteMenuItemByMap <BR>
	 * Remark: <BR>
	 * @param map
	 * @return  boolean<BR>
	 */
	public boolean deleteMenuItemByMap(Map<String,String>map);
	/**
	 * Method name: updateMenuItemByBean <BR>
	 * Description: updateMenuItemByBean <BR>
	 * Remark: <BR>
	 * @param menuItemBean
	 * @return  boolean<BR>
	 */
	public boolean updateMenuItemByBean(MenuItemBean menuItemBean);
	/**
	 * Method name: insertMenuItemByBean <BR>
	 * Description: insertMenuItemByBean <BR>
	 * Remark: <BR>
	 * @param menuItemBean
	 * @return  boolean<BR>
	 */
	public boolean insertMenuItemByBean(MenuItemBean menuItemBean);
	
}
