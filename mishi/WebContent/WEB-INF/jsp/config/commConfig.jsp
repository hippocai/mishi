<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通信设置</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/page.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js" ></script>
<!-- ligerUI -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/js/LigerUI V1.2.5/skins/Aqua/css/ligerui-all.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/LigerUI V1.2.5/ligerui.all.js" ></script>
<!-- validation -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-validation/jquery.validate.js"></script>
<!-- debug -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/consoleDebug.js"></script>

<style type="text/css">

.param_table td{
	padding: 2px;
}
.param_table .input_0{
	width: 200px;
}

.first_div {
	background-color: #FFFFFF;
	margin: 5px;
	border: 1px solid #E5E9EA;
	min-height: 160px;
}

.need_span{color:red;font-size:13px;}
.validation_span{color:red;font-size:13px;}
.l-table-edit {}
.l-table-edit-td{ padding:4px;}
.l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
.l-verify-tip{ left:230px; top:120px;}
.configForm{
display: inline-block;
margin: 30px;
}
#config{
width: 570px;
margin-left: auto;
margin-right: auto;}
select{
	width:70px;
}
</style>

<script type="text/javascript">
$(init);

var config=${config};
var comSelects=${com};
function init(){
	console.info("init");
	console.dir(config);
	console.dir(comSelects);
	addComItems(); 	 fillData();


}

function addComItems(){
	for(dx in comSelects){
		var comName=comSelects[dx].value;
		
		$("#comNum").append("<option value='"+dx+"'>"+comName+"</option>");
		$("#comNumSms").append("<option value='"+dx+"'>"+comName+"</option>");
	}
}

function fillData(){
	$("#comNum").val(getTextVal("comNum",config.comNum));
	$("#baudRate").val(getTextVal("baudRate",config.baudRate));
	$("#dataBit").val(getTextVal("dataBit",config.dataBit));
	$("#stopBit").val(getTextVal("stopBit",config.stopBit));
	$("#checkBit").val(getTextVal("checkBit",config.checkBit));
	
	$("#comNumSms").val(getTextVal("comNumSms",config.comNumSms));
	$("#baudRateSms").val(getTextVal("baudRateSms",config.baudRateSms));
	$("#dataBitSms").val(getTextVal("dataBitSms",config.dataBitSms));
	$("#stopBitSms").val(getTextVal("stopBitSms",config.stopBitSms));
	$("#checkBitSms").val(getTextVal("checkBitSms",config.checkBitSms));
}
function beforeSave(){
	config.comNum= $("#comNum").find("option:selected").text();
	config.baudRate=$("#baudRate").find("option:selected").text();
	config.dataBit=$("#dataBit").find("option:selected").text();
	config.stopBit=$("#stopBit").find("option:selected").text();
	config.checkBit=$("#checkBit").find("option:selected").text();
	
	config.comNumSms= $("#comNumSms").find("option:selected").text();
	config.baudRateSms=$("#baudRateSms").find("option:selected").text();
	config.dataBitSms=$("#dataBitSms").find("option:selected").text();
	config.stopBitSms=$("#stopBitSms").find("option:selected").text();
	config.checkBitSms=$("#checkBitSms").find("option:selected").text();
	
	if(config.comNumSms==config.comNum){
		$.ligerDialog.error("短信猫串口号不能与采集点串口号一致。","ERROR");
		return;
	}
	console.dir(config);
	updataConfigInfo(config);
	
	
}

function updataConfigInfo(config){
	$.ajax({
		type:"POST",
		url:"<%=request.getContextPath()%>/config/updateConfigInfo.action",
		data:config,
		success:function(data){
			if(data=="SUCCESS"){
				$.ligerDialog.success("更新成功","提示");
			}else{
				console.dir(data);
				$.ligerDialog.error("更新失败，出现内部错误，请与管理员联系。","ERROR");
			}
		},
		error:function(data){
			console.dir(data);
			$.ligerDialog.error("更新失败，请检查网络连接是否正常，并刷新页面。","ERROR");
		}	
	});
}

function getTextVal(id,text){
	var val=-1;
	$("#"+id).find("option").each(function(){

		if($(this).html()==(text+"")){
			val=$(this).attr("value");
		}
	})
	return val;
}

function setDafaultValue(){
	$("#comNum").val("0");
	$("#baudRate").val(getTextVal("baudRate","9600"));
	$("#dataBit").val(getTextVal("dataBit","8"));
	$("#stopBit").val(getTextVal("stopBit","1"));
	$("#checkBit").val(getTextVal("checkBit","None"));
	
	$("#comNumSms").val("1");
	$("#baudRateSms").val(getTextVal("baudRateSms","9600"));
	$("#dataBitSms").val(getTextVal("dataBitSms","8"));
	$("#stopBitSms").val(getTextVal("stopBitSms","1"));
	$("#checkBitSms").val(getTextVal("checkBitSms","None"));
}

</script>
</head>
<body>

	<div class="first_div">
		<div class="title_div search_text" >通信设置</div>
		
		<div class="search_div">
		<div id="config">
		<div id="comConfig" class="configForm">
		<form>
			<table cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">采集点串口号:</td>
                <td align="left" class="l-table-edit-td">
                <select name="comNum" id="comNum" ltype="select" style="width:70px"></select>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">采集点波特率:</td>
                <td align="left" class="l-table-edit-td">
                <select name="baudRate" id="baudRate" ltype="select" style="width:70px">
	                <option value="1">110</option>
					<option value="2">300</option>
					<option value="3">600</option>
					<option value="4">1200</option>
					<option value="5">2400</option>
                	<option value="6">4800</option>
                	<option value="7">9600</option>
                	<option value="8">14400</option>
                	<option value="9">19200</option>
                	<option value="10">38400</option>
                	<option value="11">56000</option>
                	<option value="12">57600</option>
                	<option value="13">115200</option>
                	<option value="14">128000</option>
                	<option value="15">256000</option>
                </select>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">采集点数据位:</td>
                <td align="left" class="l-table-edit-td">
                <select name="dataBit" id="dataBit" ltype="select"style="width:70px" >
                	<option value="1">6</option>
                	<option value="2">7</option>
                	<option value="3">8</option>
                </select>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">采集点停止位:</td>
                <td align="left" class="l-table-edit-td">
                <select name="stopBit" id="stopBit" ltype="select" style="width:70px">
                	<option value="1">1</option>
                	<option value="2">1.5</option>
                	<option value="3">2</option>
                </select>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">采集点校验位:</td>
                <td align="left" class="l-table-edit-td">
                <select name="checkBit" id="checkBit" ltype="select"style="width:70px" >
                	<option value="1">Even</option>
                	<option value="2">Odd</option>
                	<option value="3">None</option>
                </select>
                </td>
            </tr>
        </table>
		</form>
		</div>
		<div class="configForm"></div>
		<div id="telConfig"class="configForm">
			<form>
			<table cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">短信猫串口号:</td>
                <td align="left" class="l-table-edit-td">
                <select name="comNumSms" id="comNumSms" ltype="select"style="width:70px" ></select>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">短信猫波特率:</td>
                <td align="left" class="l-table-edit-td">
                <select name="baudRateSms" id="baudRateSms" ltype="select" style="width:70px">
	                <option value="1">110</option>
					<option value="2">300</option>
					<option value="3">600</option>
					<option value="4">1200</option>
					<option value="5">2400</option>
                	<option value="6">4800</option>
                	<option value="7">9600</option>
                	<option value="8">14400</option>
                	<option value="9">19200</option>
                	<option value="10">38400</option>
                	<option value="11">56000</option>
                	<option value="12">57600</option>
                	<option value="13">115200</option>
                	<option value="14">128000</option>
                	<option value="15">256000</option>
                </select>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">短信猫数据位:</td>
                <td align="left" class="l-table-edit-td">
                <select name="dataBitSms" id="dataBitSms" ltype="select"style="width:70px">
                	<option value="1">6</option>
                	<option value="2">7</option>
                	<option value="3">8</option>
                </select>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">短信猫停止位:</td>
                <td align="left" class="l-table-edit-td">
                <select name="stopBitSms" id="stopBitSms" ltype="select" style="width:70px">
                	<option value="1">1</option>
                	<option value="2">1.5</option>
                	<option value="3">2</option>
                </select>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">短信猫校验位:</td>
                <td align="left" class="l-table-edit-td">
                <select name="checkBitSms" id="checkBitSms" ltype="select" style="width:70px">
                	<option value="1">Even</option>
                	<option value="2">Odd</option>
                	<option value="3">None</option>
                </select>
                </td>
            </tr>
        </table>
		</form>
		</div>	
		</div>
		</div>
					
	</div>
	
	<div align="right" style="margin-right:100px;">
		<button class="btu_0" onclick="beforeSave()">保存</button>
		<button class="btu_0" id="defaultBtu" onclick="setDafaultValue()">恢复默认设置</button>
	</div>

</body>
</html>
