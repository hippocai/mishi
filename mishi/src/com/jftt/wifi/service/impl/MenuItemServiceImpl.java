package com.jftt.wifi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jftt.wifi.bean.MenuItemBean;
import com.jftt.wifi.dao.MenuItemDaoMapper;
import com.jftt.wifi.service.MenuItemService;

@Service("menuItemService")
public class MenuItemServiceImpl implements MenuItemService {

	@Resource(name="menuItemDaoMapper")
	MenuItemDaoMapper menuItemDaoMapper;
	@Override
	public List<MenuItemBean> getMenuItemByMap(Map<String, String> map) {
		// TODO 自动生成的方法存根
		if(map==null){
			return null;
		}
		return menuItemDaoMapper.getMenuItemByMap(map);
	}

	@Override
	public List<MenuItemBean> getAllItems() {
		// TODO 自动生成的方法存根
		return this.getMenuItemByMap(new HashMap<String,String>());
	}

	@Override
	public List<MenuItemBean> getItemByKey(String key, String value) {
		// TODO 自动生成的方法存根
		Map<String,String>map=new HashMap<String,String>();
		map.put(key, value);
		return this.getMenuItemByMap(map);
	}

	@Override
	public MenuItemBean getItemById(long id) {
		// TODO 自动生成的方法存根
		List<MenuItemBean>beanList=this.getItemByKey("itemId", id+"");
		if(beanList==null||beanList.size()==0){
			return null;
		}
		return beanList.get(0);
	}

	@Override
	public boolean deleteMenuItemByMap(Map<String, String> map) {
		// TODO 自动生成的方法存根
		if(map==null){
			return false;
		}
		try{
			menuItemDaoMapper.deleteMenuItemByMap(map);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateMenuItemByBean(MenuItemBean menuItemBean) {
		// TODO 自动生成的方法存根
		if(menuItemBean==null){
			return false;
		}
		try{
			menuItemDaoMapper.updateMenuItemByBean(menuItemBean);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean insertMenuItemByBean(MenuItemBean menuItemBean) {
		// TODO 自动生成的方法存根
		if(menuItemBean==null){
			return false;
		}
		try{
			menuItemDaoMapper.updateMenuItemByBean(menuItemBean);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

}
