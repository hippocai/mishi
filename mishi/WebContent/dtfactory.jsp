<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自动生成数据</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/page.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js" ></script>
<!-- mmGrid -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/mmGrid/mmGrid.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mmGrid/mmGrid.js" ></script>
<!-- mmGrid page -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/mmGrid/mmPaginator.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mmGrid/mmPaginator.js" ></script>
<!-- ligerUI -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/js/LigerUI V1.2.5/skins/Aqua/css/ligerui-all.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/LigerUI V1.2.5/ligerui.min.js" ></script>
<!-- debug -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/consoleDebug.js"></script>
<style type="text/css">

html, body{
	height: 90%;
}

.mmGrid,.mmPaginator{
    
}

</style>

<script type="text/javascript">
$(function(){
});


function makeData(){
	$.ajax({
		type:"POST",
		async:true,  //默认true,异步
		url:"<%=request.getContextPath()%>/test/dataFactory.action",
		success:function(data){
			if(data=="SUCCESS"){
				alert("成功");
				
			}else{
				alert("失败");
			}
		},
		error:function(data){
			alert("网络连接失败");
		}
	});
}

function transferData(){
	$.ajax({
		type:"POST",
		async:true,  //默认true,异步
		url:"<%=request.getContextPath()%>/test/csvtest.action",
		success:function(data){
			if(data=="SUCCESS"){
				alert("成功");
				
			}else{
				alert("失败");
			}
		},
		error:function(data){
			alert("网络连接失败");
		}
	});
}

function dbBackup(){
	$.ajax({
		type:"POST",
		async:true,  //默认true,异步
		url:"<%=request.getContextPath()%>/test/dbbackup.action",
		success:function(data){
			if(data=="SUCCESS"){
				alert("成功");
				
			}else{
				alert("失败");
			}
		},
		error:function(data){
			alert("网络连接失败");
		}
	});
}

</script>

</head>
<body style="overflow-x:hidden;">
<div id="show">
	<input type="button" onclick="makeData()"value="生成测试数据"/>
	<input type="button" onclick="transferData()"value="转移昨日数据并生成CSV文件"/>
	<input type="button" onclick="dbBackup()"value="备份数据库"/>
</div>
	
</body>
</html>
