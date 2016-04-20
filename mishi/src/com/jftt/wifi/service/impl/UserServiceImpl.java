package com.jftt.wifi.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jftt.wifi.bean.UserBean;
import com.jftt.wifi.dao.UserDaoMapper;
import com.jftt.wifi.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Resource(name = "UserDaoMapper")
	UserDaoMapper userDaoMapper;
	
	@Override
	public List<UserBean> getAllUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserBean> getUserByMap(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserBean> getUserByKey(String key, String value) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserBean getUserById(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateUserByBean(UserBean userBean) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteUserById(long id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteUserByMap(Map<String, String> map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean insertUserByBean(UserBean userBean) {
		// TODO Auto-generated method stub
		return false;
	}

}
