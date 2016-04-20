<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js" ></script>

<!-- ligerUI -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/js/LigerUI V1.2.5/skins/Aqua/css/ligerui-all.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/LigerUI V1.2.5/ligerui.min.js" ></script>

<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 100px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #d5e4f8;
}
html{
	background: none;
}
</style>
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css" />
</head>
<script>
$(init);


function init(){
	if(window != top){
		//session 失效 判断有没父页面，有，改变父页面地址
		top.location.href = location.href; 
	}  
	$("#confirmButton").bind("click",login);
	$("#reset").bind("click",function(){
		$("#userName").val("");
		$("#Pwd").val("");
	});
}
function login(){
	
	// 准备参数
	var param = new Object();
	param.userId = $.trim($("#userName").val());
	param.password = $.trim($("#Pwd").val());
	
	if(param.userId == ""){
		//alert("用户名不可为空");
		$.ligerDialog.warn('用户名不可为空');
		return false;
	}else if(param.password == ""){
		//alert("密码不可为空");
		$.ligerDialog.warn('密码不可为空');
		return false;
	}
	var manager = $.ligerDialog.waitting('正在登录,请稍候...');
	$.ajax({
		type:"POST",
		async:true,  //默认true,异步
		data:param,
		dataType:'text',
		url:"<%=request.getContextPath()%>/login/tologin.action",
		success:function(data){
			manager.close(); 
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
				$.ligerDialog.warn('登陆失败,请保证网络畅通并刷新页面！！');
			}
			
	    },
	    error:function(data){
	    	$.ligerDialog.error('链接失败，请保证网络畅通并刷新页面！', '提示');
	    }
	});
}

function key_down(num){
	   if(num == 13) {
	       document.getElementById("confirmButton").click();
	   }
	}
</script>
<body onkeydown="key_down(event.keyCode);">
<table width="1003" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="<%=request.getContextPath()%>/images/login_01.jpg" width="1003" height="130" /></td>
  </tr>
</table>
<table width="1003" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="<%=request.getContextPath()%>/images/login_02.jpg" width="1003" height="125" /></td>
  </tr>
</table>
<form>
<table width="1003" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="305"><img src="<%=request.getContextPath()%>/images/login_03.jpg" width="315" height="130" /></td>
    <td background="<%=request.getContextPath()%>/images/login_04.jpg"><table width="356" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="73" height="35" align="center"><span class="w05">用户名：</span></td>
        <td width="283"><input type="text" name="userName" id="userName" /></td>
      </tr>
      <tr>
        <td height="35" align="center"><span class="w05">密　码：</span></td>
        <td><input type="password" name="Pwd" id="Pwd" /></td>
      </tr>
      <tr>
        <td height="50">&nbsp;</td>
        <td><table width="202" height="20" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><img id="confirmButton"src="<%=request.getContextPath()%>/images/button01.png" width="70" height="29" style="cursor: pointer;"/></td>
            <td><img id="reset"src="<%=request.getContextPath()%>/images/button02.png" width="70" height="29" style="cursor: pointer;"/></td>
          </tr>
        </table></td>
      </tr>
    </table>
  
    </td>
    <td width="262"><img src="<%=request.getContextPath()%>/images/login_05.jpg" width="262" height="130" /></td>
  </tr>
</table>
 </form>
<table width="1003" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="<%=request.getContextPath()%>/images/login_06.jpg" width="1003" height="235" /></td>
  </tr>
</table>
</body>
</html>
