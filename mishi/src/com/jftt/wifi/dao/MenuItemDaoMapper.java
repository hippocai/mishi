package com.jftt.wifi.dao;

import java.util.List;
import java.util.Map;

import com.jftt.wifi.bean.MenuItemBean;

public interface MenuItemDaoMapper {

	public List<MenuItemBean>getMenuItemByMap(Map<String,String>map);
	public void deleteMenuItemByMap(Map<String,String>map);
	public void updateMenuItemByBean(MenuItemBean menuItemBean);
	public void insertMenuItemByBean(MenuItemBean menuItemBean);
}
