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

function fillInfo(manageUser){
	console.dir(manageUser);
   	$("input[name=name]").val(manageUser.name);
   	$("input[name=phone]").val(manageUser.phone);
   	$("input[name=email]").val(manageUser.email);
   	$("input[name=memo]").val(manageUser.memo);
}

function init(){
	//disableDebugInfo();
	console.info("init");
	initForm();
	fillInfo(manageUser);
	
	

}

function beforeSave(){

	  if (form.valid()){
			save();
       }
}


function initForm(){

	form=$("form").ligerForm({
	         inputWidth: 170, labelWidth: 90, space: 40,validate : true,
	         fields: [
	         { display: "姓名 ", name: "name", newline: true, type: "text",validate: {required: true}},
	         { display: "手机号码 ", name: "phone", newline: false, type: "digits", validate: {required: true}},
	         { display: "电子邮件 ", name: "email", newline: true, type: "text" ,validate: {required: true} },
	         { display: "备注", name: "memo", newline: false,  type: "text" }
	     
       		 ]
     });  
	
}

//保存
function save(){
	
	var param = new Object();
	param=form.getData();
	urlStr = "<%=request.getContextPath()%>/manageUser/updateManageUser.action";
	param.id = manageUser.id;

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
	    				
	    				});
	    				
	    			}else{
	    				$.ligerDialog.error('保存失败，出现内部错误，请联系管理员！', '提示');
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
		<div class="title_div search_text" >修改个人信息</div>
		
		<div class="search_div">
			<form>
			</form>
		</div>
					
	</div>
	
	<div align="right" style="margin-right:100px;">
		<button class="btu_0" onclick="beforeSave()">保存</button>
	</div>

</body>
</html>
