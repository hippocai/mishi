package com.jftt.wifi.dao;

import java.util.List;
import java.util.Map;

import com.jftt.wifi.bean.RestaurantBean;

public interface RestaurantDaoMapper {
	public List<RestaurantBean>getRestaurantByMap(Map<String,String>map);
	public void deleteRestaurantByMap(Map<String,String>map);
	public void insertRestaurantByBean(RestaurantBean restaurantBean);
	public void updateRestaurantByBean(RestaurantBean restaurantBean);
}
