<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>今日数据</title>

<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/page.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js" ></script>
<!-- debug -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/consoleDebug.js"></script>
<style type="text/css">
body{
font-family: "微软雅黑";
}
.data_circle td{
	width: 300px;
}
.circle_title{
	font-size: 14px;
	font-weight: bold;
	color: #333333;
	margin: 10px 0px;
	letter-spacing: 2px;
}
.circle_div{
	margin: 0px 40px;
	width: 120px;
	height: 120px;
	background-color: #50B5FD;
	border-radius: 60px;
	color: #FFFFFF;
	font-size: 27px;
	font-weight: bold;
	text-align: center;
	line-height: 120px;

	box-shadow: 2px 2px 2px #A9A4A4;
}

.title_div{
	border-bottom: none 0;
}
.data_table .colum_name{
	height: 22px;
	
}
#title{


height: 59px;

background: url('/dwlc/images/top_bg.gif')repeat-x;
}
.title_words{
font-family: 微软雅黑;
font-size: 2em;
color: white;
margin-top: 10px;
width: 408px;
height: 35px;
/* margin-right: auto; */
padding-left: 25px;
float: left;
}
.infoCircle{
	display:inline-block;
	
}
</style>

<script type="text/javascript">
var errorNum=0;
var EnvData=null;
$(function(){
	console.dir(parent);
	loadData();
	setInterval(loadData,3000);
});
function loadData(){
	errorNum=parent.errorNum;
	EnvData=parent.EnvData;
	
	$("#errorNum").empty();
	$("#errorNum").append(errorNum);
	var temp1,temp2;var humi1,humi2;
	if(!EnvData){
		temp1=temp2=humi1=humi2=null;
	}else{
		temp1=EnvData.temp1;
		humi1=EnvData.humidity1;
		temp2=EnvData.temp2;
		humi2=EnvData.humidity2;
	}
	if(temp1==null||temp1==""||parseFloat(temp1)>6000){
		temp1="N/A";
	}else{
		temp1+="℃";
	}
	if(temp2==null||temp2==""||parseFloat(temp2)>6000){
		temp2="N/A";
	}else{
		temp2+="℃";
	}
	
	if(humi1==null||humi1==""||parseFloat(humi1)>6000){
		humi1="N/A";
	}else{
		humi1+="RH";
	}
	if(humi2==null||humi2==""||parseFloat(humi2)>6000){
		humi2="N/A";
	}else{
		humi2+="RH";
	}
	$("#envTmp1").empty();$("#envTmp1").append(temp1);
	$("#envHumi1").empty();$("#envHumi1").append(humi1);
	$("#envTmp2").empty();$("#envTmp2").append(temp2);
	$("#envHumi2").empty();$("#envHumi2").append(humi2);
	
}
</script>
</head>
<body style="background: url('/dwlc/images/bg3.jpg')">
	<div id="title">
	<span class="title_words">欢迎进入PerkinElmer低温监测平台</span>
</div>
<div class="" align="center">
	<div style="margin-top: 120px;"class="infoCircle">
		<div class="circle_title">未处理的异常:</div>
		<div class="circle_div" id="errorNum">366</div>
	</div>
	<div style="margin-top: 70px;"class="infoCircle">
		<div class="circle_title">机房一温度:</div>
		<div class="circle_div"id="envTmp1">366</div>
	</div>
	<div style="margin-top: 70px;"class="infoCircle">
		<div class="circle_title">机房一湿度:</div>
		<div class="circle_div"id="envHumi1">366</div>
	</div>
	<div style="margin-top: 70px;"class="infoCircle">
		<div class="circle_title">机房二温度:</div>
		<div class="circle_div"id="envTmp2">366</div>
	</div>
	<div style="margin-top: 70px;"class="infoCircle">
		<div class="circle_title">机房二湿度:</div>
		<div class="circle_div"id="envHumi2">366</div>
	</div>
</div>
</body>

</html>
