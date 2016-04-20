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

.need_span{color:red;font-size:13px;}
.validation_span{color:red;font-size:13px;}
</style>

<script type="text/javascript">

var manageUser = ${manageUser};//修改用户信息
var form;

$(init);

function initBackButton(){
	 
	//返回按钮
	$("#backBtu").click(function(){
		$.ligerDialog.confirm('确认返回吗？', function(yes){ 
			if(yes){
		    	//window.location.href = "<%=request.getContextPath()%>/manageUser/userList.action";
		    	parent.$("#add_iframe iframe").attr("src", "");
		    	parent.$("div").first().show();
		    	parent.$("#add_iframe").hide();
		    	//parent.search();
		    }
		});
	});
}
function fillInfo(manageUser){
	console.dir(manageUser);
   	$(".search_text").text("修改用户");
   	$("input[name=userId]").val(manageUser.userId);
   	$("input[name=name]").val(manageUser.name);
   	$("input[name=phone]").val(manageUser.phone);
   	$("input[name=email]").val(manageUser.email);
   	$("input[name=memo]").val(manageUser.memo);
   	if(manageUser.phoneFlag!=null&&manageUser.phoneFlag==1){
   		liger.get("phoneFlag").setValue(true);
   	}
   	
   	if(manageUser.emailFlag!=null&&manageUser.emailFlag==1){
   		liger.get("emailFlag").setValue(true);
   	}
}

function init(){
	//disableDebugInfo();
	console.info("init");
	initForm();
	if(manageUser){
		fillInfo(manageUser);
	}else{
		//Do Nothing
	}
	initBackButton();
	
	

}

function beforeSave(){

	  if (form.valid()){
			save();
       }
}


function initForm(){
	if(manageUser){
	form=$("form").ligerForm({
	         inputWidth: 170, labelWidth: 90, space: 40,validate : true,
	         fields: [
	         { display: "用户名", name: "userId", newline: true, type: "text" ,validate: {required: true},group: "基础信息"}, 
	         { display: "重置密码 ", name: "rePassword", newline: false, type: "checkbox",afterContent:"<span>密码重置为123456</span>" },
	         { display: "姓名 ", name: "name", newline: true, type: "text",validate: {required: true}},
	         { display: "手机号码 ", name: "phone", newline: false, type: "digits", validate: {required: true}},
	         { display: "电子邮件 ", name: "email", newline: true, type: "text" ,validate: {required: true} },
	         { display: "备注", name: "memo", newline: false,  type: "text" },
	         { display: "短信通知", name: "phoneFlag", newline: true, type: "checkbox"},
	         { display: "邮件通知", name: "emailFlag", newline: false,  type: "checkbox" }
       		 ]
     });  
	}else{
		form=$("form").ligerForm({
	         inputWidth: 170, labelWidth: 90, space: 40,validate : true,
	         fields: [
	         { display: "用户名", name: "userId", newline: true, type: "text" ,validate: {required: true}}, 
	         { display: "密码 ", name: "Password", newline: false, type: "text",validate: {required: true}},
	         { display: "姓名 ", name: "name", newline: true, type: "text",validate: {required: true}},
	         { display: "手机号码 ", name: "phone", newline: false, type: "digits", validate: {required: true}},
	         { display: "电子邮件 ", name: "email", newline: true, type: "text" ,validate: {required: true} },
	         { display: "备注", name: "memo", newline: false,  type: "text" },
	         { display: "短信通知", name: "phoneFlag", newline: true, type: "checkbox"},
	         { display: "邮件通知", name: "emailFlag", newline: false,  type: "checkbox" }
	         
      		 ]
    });  
	}
	
}

//保存
function save(){
	
	var param = new Object();
	param=form.getData();
	var urlStr = "<%=request.getContextPath()%>/manageUser/addManageUser.action";
	
	if(manageUser){
		//修改
		urlStr = "<%=request.getContextPath()%>/manageUser/updateManageUser.action";
		param.id = manageUser.id;
		
		if(liger.get("rePassword").getValue()){
			//重置密码
			param.password = "123456";
		}else{
			param.password = $.trim($("#password").val());
		}
	}
	
	if (param.phoneFlag==true){
		param.phoneFlag=1;
	}else{
		param.phoneFlag=0;
	}
	
	if (param.emailFlag==true){
		param.emailFlag=1;
	}else{
		param.emailFlag=0;
	}
	console.info("上传至后台的参数为:");
	console.dir(param);
	$.ligerDialog.confirm('确认保存吗？', function(yes){ 
		if(yes){
			$.ajax({
	    		type:"POST",
	    		async:true,  //默认true,异步
	    		data:param,
	    		url:urlStr,
	    		success:function(data){
	    			if(data == "SUCCESS"){
	    				
	    				$.ligerDialog.success('保存成功！', '提示', function(){
	    					window.location.href = "<%=request.getContextPath()%>/manageUser/userList.action";
	    				});
	    				
	    			}else{
	    				$.ligerDialog.error('保存失败，出现内部错误，请联系管理员！', '提示');
	    			}
		    			parent.search();
		    			parent.$("#add_iframe iframe").attr("src", "");
				    	parent.$("div").first().show();
				    	parent.$("#add_iframe").hide();
	    	
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
		<div class="title_div search_text" >增加用户</div>
		
		<div class="search_div">
			<form>
			</form>
		</div>
					
	</div>
	
	<div align="right" style="margin-right:100px;">
		<button class="btu_0" onclick="beforeSave()">保存</button>
		<button class="btu_0" id="backBtu">返回</button>
	</div>

</body>
</html>
