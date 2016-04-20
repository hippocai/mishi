package com.jftt.wifi.dao;

import java.util.List;
import java.util.Map;

import com.jftt.wifi.bean.UserBean;

public interface UserDaoMapper {
	/**
	 * Method name: getUserByMap <BR>
	 * Description: getUserByMap <BR>
	 * Remark: <BR>
	 * @param map
	 * @return  List<UserBean><BR>
	 */
	public List<UserBean>getUserByMap(Map<String,String>map);
	/**
	 * Method name: deleteUserByMap <BR>
	 * Description: deleteUserByMap <BR>
	 * Remark: <BR>
	 * @param map  void<BR>
	 */
	public void deleteUserByMap(Map<String,String>map);
	/**
	 * Method name: updateUserByBean <BR>
	 * Description: updateUserByBean <BR>
	 * Remark: <BR>
	 * @param userBean  void<BR>
	 */
	public void updateUserByBean(UserBean userBean);
	/**
	 * Method name: insertUserByBean <BR>
	 * Description: insertUserByBean <BR>
	 * Remark: <BR>
	 * @param userBean  void<BR>
	 */
	public void insertUserByBean(UserBean userBean);
}
