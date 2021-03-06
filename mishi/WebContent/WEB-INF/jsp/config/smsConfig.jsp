<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>短信、报警设置</title>
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
</style>

<script type="text/javascript">
$(init);
var config=${config};
function init(){
	console.info("init");
	console.dir(config);
	fillData();
	$("form").ligerForm();


}

function fillData(){
	$("#tempOrder").val(config.tempOrder);
	$("#humidityOrder").val(config.humidityOrder);
//	$("#warningFormat").append(config.warningFormat);
}
function beforeSave(){
	config.tempOrder=liger.get("tempOrder").getValue();
	config.humidityOrder=liger.get("humidityOrder").getValue();
	//config.warningFormat=$("#warningFormat").val();
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
	liger.get("tempOrder").setValue("cxwd#point##port#");
	liger.get("humidityOrder").setValue("cxsd");
	//config.warningFormat=$("#warningFormat").val("警告！冷库温度异常。\n采集器编号:#point#,端口编号:#port#,采集器地址:#loc#。\n当前温度#ctmp#,正常温度范围为:#comtmp#");
}

</script>
</head>
<body>

	<div class="first_div">
		<div class="title_div search_text" >短信、报警设置</div>
		<div class="search_div">
			<div id="config">
				<div id="comConfig" class="configForm">
					<form>
						
					<table cellpadding="0" cellspacing="0" class="l-table-edit" >
			           	 <tr>
			                <td align="right" class="l-table-edit-td">查询温度指令:</td>
			                <td align="left" class="l-table-edit-td">
			                	<input type="text" id="tempOrder" name="tempOrder"/>
			                </td>
			            </tr>
			             <tr>
			                <td align="right" class="l-table-edit-td">查询湿度指令:</td>
			                <td align="left" class="l-table-edit-td">
			                	<input type="text" id="humidityOrder" name="humidityOrder"/>
			                </td>
			            </tr>
						<!--
			            <tr>
			                <td align="right" class="l-table-edit-td">报警内容配置:</td>
			                <td align="left" class="l-table-edit-td">
			                	<textarea id="warningFormat"name="warningFormat"style="margin: 0px;width: 380px;height: 80px;"></textarea>
			                </td>
			            </tr>
						-->
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
