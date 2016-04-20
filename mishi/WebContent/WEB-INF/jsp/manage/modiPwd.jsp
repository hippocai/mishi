<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加用户</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/page.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js" ></script>
<!-- ligerUI -->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/js/LigerUI V1.2.5/skins/Aqua/css/ligerui-all.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/LigerUI V1.2.5/ligerui.min.js" ></script>
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
.validate{
color: red;
}
input
{
	width:200px;
}
.search_div{
width: 50%;
margin-left: auto;
margin-right: auto;}
.need_span{color:red;font-size:13px;}
.validation_span{color:red;font-size:13px;}
</style>

<script type="text/javascript">

$(init);
function init(){
	$("form").ligerForm();
	$("#newPwd").bind("blur",checkNewPwdSize);
	$("#conPwd").bind("blur",confirmPwd);
}

function checkAll(){
	return checkNewPwdSize()&&confirmPwd()&&checkOldPwdNotNull();
}

function checkNewPwdSize(){
	var pwdstr=trim($("#newPwd").val());
	$("#msg2").empty();
	if (pwdstr.length<6){
		$("#msg2").append("密码长度必须大于六位！");
		return false;
	}else{
		return true;
	}
}

function confirmPwd(){
	var pwdstr=trim($("#newPwd").val());
	var pwdstr2=trim($("#conPwd").val());
	$("#msg3").empty();
	if(pwdstr!=pwdstr2){
		$("#msg3").append("两次输入不一致！");
		return false;
	}else{
		return true;
	}
}

function checkOldPwdNotNull(){
	var pwdstr=trim($("#Pwd").val());
	$("#msg1").empty();
	if(pwdstr==""||pwdstr==null){
		$("#msg1").append("请输入原密码！");
		return false;
	}else{
		return true;
	}
}
//删除左右两端的空格
function trim(str) {
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

function submit(){
	if(!checkAll()){
		return;
	}
	var urlStr = "<%=request.getContextPath()%>/manageUser/modiPwdExec.action";
	var param={};
	param.oldPwd=trim($("#Pwd").val());
	param.newPwd=trim($("#newPwd").val());
	$.ligerDialog.confirm('确认保存吗？', function(yes){ 
		if(yes){
			$.ajax({
	    		type:"POST",
	    		async:true,  //默认true,异步
	    		data:param,
	    		url:urlStr,
	    		success:function(data){
	    			if(data == "SUCCESS"){
	    				
	    				$.ligerDialog.success('保存成功,请重新登录！', '提示', function(){
	    					window.location.href = "<%=request.getContextPath()%>/login/loginPage.action";
	    				});
	    				
	    			}
	    			
	    			if(data == "ERROR"){
	    				$.ligerDialog.error('保存失败，出现内部错误，请联系管理员！', '提示');
	    			}
	    			if(data == "PWDERROR"){
	    				$("#msg1").empty();
	    				$("#msg1").append("原密码不正确");
	    			}
	    	
	    	    },
	    	    error:function(data){
	    	    	$.ligerDialog.error('保存失败，请确保网络连接正常，并刷新页面！', '提示');
	    	    }
	    	});
	    }
	});
}

</script>
</head>
<body>

	<div class="first_div">
		<div class="title_div search_text" >修改密码</div>
		
		<div class="search_div">
			<form>
			 <table width="98%" border="0" cellpadding="3" cellspacing="1" bgcolor="#C5DCEB">
        		<tr class="w022">
          		<td width="50%" height="279" align="center" bgcolor="#FFFFFF"><table width="580" border="0" cellspacing="0" cellpadding="0"style="float: left;margin-left: 20px;">
            
            	<tr>
              	<td height="46"width="90" align="left"> 原 密 码：</td>
              	<td height="46"width="200" align="left"><input name="Pwd" type="password" id="Pwd" size="40" /></td>
              	<td height="45" align="left"width="70"><span id="msg1"class="validate"></span></td>
          		</tr>
            	<tr>
              	<td height="46" width="90"align="left">新 密 码：</td>
              	<td height="46"width="200" align="left"><input name="newPwd" type="password" id="newPwd" size="40" /></td>
              	<td height="45" width="200"align="left"><span id="msg2"class="validate"></span></td>
            	</tr>
           		<tr>
              	<td height="45"width="90" align="left">确认密码：</td>
              	<td height="45"width="200" align="left"><input name="conPwd" type="password" id="conPwd" size="40"/></td>
              	<td height="45" width="200"align="left"><span id="msg3"class="validate"></span></td>
            	</tr>
            	<tr>
            	<td>  
				</td>
				</tr>
          		</table></td>
        		</tr>
     		</table>
			</form>
		</div>
	<div align="right" style="margin-right:100px;">
		<button class="btu_0" onclick="submit()">保存</button>
	</div>		
	</div>
	

</body>
</html>
