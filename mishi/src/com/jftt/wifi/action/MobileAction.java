package com.jftt.wifi.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jftt.wifi.bean.IndentBean;
import com.jftt.wifi.bean.MenuItemBean;
import com.jftt.wifi.service.IndentService;
import com.jftt.wifi.service.MenuItemService;
import com.jftt.wifi.util.JsonUtil;

@Controller
@RequestMapping(value="pointInfo")
public class MobileAction {

	private static Logger logger = Logger.getLogger(MobileAction.class); 
	@Resource(name="indentService")
	IndentService indentService;
	@Resource(name="menuItemService")
	MenuItemService menuService;
	
	@RequestMapping(value="getMenuList")
	@ResponseBody
	public String getMenuList(HttpServletRequest request,HttpServletResponse response,String uid){
		this.setResponseHeader(response);
		List<MenuItemBean>menuItemBeanList=menuService.getItemByKey("uId", uid);
		List<String>menuItemJsonStrList=new ArrayList<String>();
		for(MenuItemBean menuBean:menuItemBeanList){
			String jsonStr=JsonUtil.getJsonString4JavaPOJO(menuBean);
			menuItemJsonStrList.add(jsonStr);
		}
		return JsonUtil.getJsonString4JavaList(menuItemJsonStrList).toString();
	}
	
	@RequestMapping(value="addNewIndent")
	@ResponseBody
	public String addNewIndent(HttpServletRequest request,HttpServletResponse response,String indentstr,String userId,String uid,String price){
		try{
			IndentBean indentBean = new IndentBean();
			indentBean.setContent(indentstr);
			indentBean.setIndentId(indentService.getAllIndent().size()+1);
			indentBean.setPrice(Float.parseFloat(price));
			indentBean.setUid(Long.parseLong(uid));
			indentBean.setUserId(Long.parseLong(userId));
			indentService.insertIndentByBean(indentBean);
			return "Success";
		}catch(Exception e){
			e.printStackTrace();
			return "Error";
		}
	}
	private void setResponseHeader(HttpServletResponse response){
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Credentials", "true");
	}
}
