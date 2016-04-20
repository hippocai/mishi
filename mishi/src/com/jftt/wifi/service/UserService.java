package com.jftt.wifi.service;

import java.util.List;
import java.util.Map;

import com.jftt.wifi.bean.UserBean;

public interface UserService {
	public List<UserBean> getAllUser();
	public List<UserBean> getUserByMap(Map<String,String>map);
	public List<UserBean> getUserByKey(String key,String value);
	public UserBean getUserById(long id);
	public boolean updateUserByBean(UserBean userBean);
	public boolean deleteUserById(long id);
	public boolean deleteUserByMap(Map<String,String>map);
	public boolean insertUserByBean(UserBean userBean);
	
}
