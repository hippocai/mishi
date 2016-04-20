<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录页面</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js" ></script>

<!-- ligerUI -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/js/LigerUI V1.2.5/skins/Aqua/css/ligerui-all.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/LigerUI V1.2.5/ligerui.min.js" ></script>

<style type="text/css">
</style>

<script type="text/javascript">

if(window != top){
	//session 失效 判断有没父页面，有，改变父页面地址
	top.location.href = location.href; 
}  
	

$(function(){
	
});

function login(){
	
	// 准备参数
	var param = new Object();
	param.userId = $.trim($("#name").val());
	param.password = $.trim($("#password").val());
	
	if(param.userId == ""){
		//alert("用户名不可为空");
		$.ligerDialog.warn('用户名不可为空');
		return false;
	}else if(param.password == ""){
		//alert("密码不可为空");
		$.ligerDialog.warn('密码不可为空');
		return false;
	}

	$.ajax({
		type:"POST",
		async:true,  //默认true,异步
		data:param,
		dataType:'text',
		url:"<%=request.getContextPath()%>/login/tologin.action",
		success:function(data){
			
			if(data == "OK"){
				window.location.href = "<%=request.getContextPath()%>/index/toIndexPage.action";
			}else if(data == "PASSWORD_ERROR"){
				//alert("密码错误！");
				$.ligerDialog.warn('密码错误');
			}else if(data == "NO_EXIST"){
				//alert("用户不存在！");
				$.ligerDialog.warn('用户不存在！');
			}else{
				//alert("登陆失败！");
				$.ligerDialog.warn('登陆失败！');
			}
			
	    }
	});
}
</script>
</head>

<body >

	<div style="padding:5px;" >
		
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td>
					用户名：<input type="text" class="login_input" id="name"></input>
				</td>
				<td>
					密　码：<input type="password" class="login_input" id="password" name="password"></input>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input class="login_but" type="button" value="登陆" onclick="login()"/>　
				</td>
			</tr>
		</table>

	</div>
</body>

</html>
