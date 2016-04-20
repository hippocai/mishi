<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报警阈值设置</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/page.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js" ></script>
<!-- ligerUI -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/js/LigerUI V1.2.5/skins/Aqua/css/ligerui-all.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/LigerUI V1.2.5/ligerui.all.js" ></script>
<!-- validation -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-validation/jquery.validate.js"></script>
<!-- debug -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/consoleDebug.js"></script>

<script src="<%=request.getContextPath()%>/js/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
<script src="<%=request.getContextPath()%>/js/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery-validation/messages_cn.js" type="text/javascript"></script>
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
#tempConfig{
margin-left: auto;
margin-right: auto;
}
.l-group span{
	width:200px;
}
</style>

<script type="text/javascript">
$(init);
var config=${config};
var form=null;
function init(){
	console.dir(config);
	initForm();
	//$("form").ligerForm();
	fillData();
}


function fillData(){
	liger.get("tempMore").setValue(config.tempMore);
	liger.get("tempMax").setValue(config.tempMax);
	liger.get("tempLess").setValue(config.tempLess);
	liger.get("tempMin").setValue(config.tempMin);
	liger.get("superTempMore").setValue(config.superTempMore);
	liger.get("superTempMax").setValue(config.superTempMax);
	liger.get("superTempLess").setValue(config.superTempLess);
	liger.get("superTempMin").setValue(config.superTempMin);
}
function beforeSave(){
	config.tempMore=liger.get("tempMore").getValue();
	config.tempMax=liger.get("tempMax").getValue();
	config.tempLess=liger.get("tempLess").getValue();
	config.tempMin=liger.get("tempMin").getValue();
	config.superTempMore=liger.get("superTempMore").getValue();
	config.superTempMax=liger.get("superTempMax").getValue();
	config.superTempLess=liger.get("superTempLess").getValue();
	config.superTempMin=liger.get("superTempMin").getValue();
	console.dir(config);
	if(!validate()){
		return;
	}else{
		//Do Nothing
	}
	updataConfigInfo(config);
}

function validate(){
	if(!form.valid()){
		return false;
	}
	var tempMore=parseFloat(config.tempMore);
	var tempMax=parseFloat(config.tempMax);
	var tempMin=parseFloat(config.tempMin);
	var tempLess=parseFloat(config.tempLess);
	var superTempMore=parseFloat(config.superTempMore);
	var superTempMax=parseFloat(config.superTempMax);
	var superTempMin=parseFloat(config.superTempMin);
	var superTempLess=parseFloat(config.superTempLess);
	if(tempMore>tempMax){
		$.ligerDialog.warn("温度上限值不能高于温度上上限值，请您检查设置");
		return false;
	}
	if(tempLess<tempMin){
		$.ligerDialog.warn("温度下限值不能低于温度下下限值，请您检查设置");
		return false;
	}
	if(tempMore<tempLess){
		$.ligerDialog.warn("温度上限值不能低于温度下限值，请您检查设置");
		return false;
	}
	if(tempMax<tempMin){
		$.ligerDialog.warn("温度上上限值不能低于温度下下限值，请您检查设置");
		return false;
	}
	if(tempMax<tempLess){
		$.ligerDialog.warn("温度上上限值不能低于温度下限值，请您检查设置");
		return false;
	}
	if(tempMore<tempMin){
		$.ligerDialog.warn("温度上限值不能低于温度下下限值，请您检查设置");
		return false;
	}
	
	if(superTempMore>superTempMax){
		$.ligerDialog.warn("温度上限值不能高于温度上上限值，请您检查设置");
		return false;
	}
	if(superTempLess<superTempMin){
		$.ligerDialog.warn("温度下限值不能低于温度下下限值，请您检查设置");
		return false;
	}
	if(superTempMore<superTempLess){
		$.ligerDialog.warn("温度上限值不能低于温度下限值，请您检查设置");
		return false;
	}
	if(superTempMax<superTempMin){
		$.ligerDialog.warn("温度上上限值不能低于温度下下限值，请您检查设置");
		return false;
	}
	if(superTempMax<superTempLess){
		$.ligerDialog.warn("温度上上限值不能低于温度下限值，请您检查设置");
		return false;
	}
	if(superTempMore<superTempMin){
		$.ligerDialog.warn("温度上限值不能低于温度下下限值，请您检查设置");
		return false;
	}
	
	
	return true;
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


function setDafaultValue(){
	liger.get("tempMore").setValue("-30");
	liger.get("tempMax").setValue("-20");
	liger.get("tempLess").setValue("-50");
	liger.get("tempMin").setValue("-60");
	
	liger.get("superTempMore").setValue("-70");
	liger.get("superTempMax").setValue("-60");
	liger.get("superTempLess").setValue("-90");
	liger.get("superTempMin").setValue("-100");
}

function initForm(){
		form=$("#mainForm").ligerForm({
             inputWidth: 170, labelWidth: 170, space: 40,validate : true,
             fields: [
             { display: "温度报警上限", name: "tempMore", newline: true, type: "number" ,validate: {required: true},group: "普通传感器阈值设定", groupicon: "<%=request.getContextPath()%>/images/group.gif"}, 
             { display: "温度短信报警上限 ", name: "tempMax", newline: false, type: "number",validate: {required: true}},
             { display: "温度下限", name: "tempLess", newline: true, type: "number" ,validate: {required: true}},
             { display: "温度短信报警下限", name: "tempMin", newline: false, type: "number",validate: {required: true}},
			 { display: "温度报警上限", name: "superTempMore", newline: true, type: "number" ,validate: {required: true},group: "超低温传感器阈值设定", groupicon: "<%=request.getContextPath()%>/images/group.gif"}, 
             { display: "温度短信报警上限 ", name: "superTempMax", newline: false, type: "number",validate: {required: true}},
             { display: "温度下限", name: "superTempLess", newline: true, type: "number" ,validate: {required: true}},
             { display: "温度短信报警下限", name: "superTempMin", newline: false, type: "number" ,validate: {required: true}}
             ]
         });  
	}
	

</script>
</head>
<body>

	<div class="first_div">
		<div class="title_div search_text" >报警阈值设置</div>
		
		<div class="search_div">
		<div id="tempConfig">
		<form id="mainForm">
		</form>
		</div>
		</div>
					
	</div>
	
	<div align="right" style="margin-right:100px;">
		<button class="btu_0" onclick="beforeSave()">保存</button>
		<button class="btu_0" id="defaultBtu" onclick="setDafaultValue()">恢复默认设置</button>
	</div>

</body>
</html>
