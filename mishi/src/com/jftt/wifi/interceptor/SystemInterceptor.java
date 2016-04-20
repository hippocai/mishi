package com.jftt.wifi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jftt.wifi.common.Constant;


/**
 * 拦截器
 */
public class SystemInterceptor extends HandlerInterceptorAdapter{
	
	private static Logger log = Logger.getLogger(SystemInterceptor.class); 
	
	@Override  
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{ 
	    
	    String uri = request.getRequestURI();
	    log.debug("Pre-handle url="+uri);
	    
		if (uri.startsWith(request.getContextPath()+"/login/tologin") ||
			uri.startsWith(request.getContextPath()+"/login/loginPage")||
			uri.startsWith(request.getContextPath()+"/test/")//测试
			){
			
			log.debug(uri + " 不进行拦截");
			
	    }else{
	    	
	    	//session失效，到登录页面
	    	HttpSession session = request.getSession();
	    	String userId = (String) session.getAttribute(Constant.SESSION_USERID_STRING);
	    	
	    	if(userId == null || userId.equals("")){
	    		//非ajax请求,页面跳转请求
    			response.sendRedirect(request.getContextPath());
    			
    			log.debug("SESSION 失效 返回登陆页面");
    			
		    	return false;
	    	}
	    }
	    
	    return true;
	}  
	  
	@Override  
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)throws Exception{  
		//logger.warn("Post-handle");
	    //System.out.println("Post-handle");  
	}  
	  
	@Override  
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex){  
		//logger.warn("After completion handle");
	    //System.out.println("After completion handle");  
	} 
}
