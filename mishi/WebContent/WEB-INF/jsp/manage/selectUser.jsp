<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选择用户</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/page.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js" ></script>
<!-- mmGrid -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/mmGrid/mmGrid.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mmGrid/mmGrid.js" ></script>
<!-- mmGrid page -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/mmGrid/mmPaginator.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/mmGrid/mmPaginator.js" ></script>
<!-- blackBox -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/blackBox/blackbox.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/blackBox/jquery.blackbox.js" ></script>

<style type="text/css">
.mmGrid,.mmPaginator{
    font-size: 12px;
}
a.select{}
a.select:HOVER {color:orange;}

.del_span{font-size:14px;color:#111111;font-family::Microsoft YaHei;border:1px solid #666666;padding:3px 7px;background-color:#D6D6D6;margin:5px 5px 0px 0px;display:inline-block;}
.del_png{width:13px;cursor:pointer;margin-left:5px;vertical-align:-1px;}

</style>

<script type="text/javascript">
var alertBox = new BlackBox(); //弹出框对象
var departmentList = parent.departmentList;
var roleList = parent.roleList;
var roleObj = parent.roleObj;

$(function(){
	
	//alert(JSON.stringify(parent.roleNodeChecked));
	
	//表格
	$('#exampleTable').mmGrid({
    	root:'rows',
		url:"<%=request.getContextPath()%>/manageUser/getManageUserByMap.action",
		params:{"roleId": parent.roleNodeChecked.id, "roleNot": "roleNot"},
		fullWidthRows: true,
		showBackboard: false,
    	width: 750,
    	height: 'auto',
    	//multiSelect: true,
    	fullWidthRows: true, //表格第一次加载数据时列伸展，自动充满表格
        //checkCol: true,
        nowrap: true,
        indexCol: true,  //索引列
        cols: [{title: 'ID', name: 'id', width:60, hidden:true},
			   {title: '姓名', name: 'name', width:60},
			   {title: '账号', name: 'userId', width:80, hidden:true},

			   {title: '角色', name: 'roleIdList', width:200, renderer:function(val, item, rowIndex){
				   // alert(JSON.stringify(roleList));
				   var role = "";
				   for(var i=0; i<val.length; i++){
					   role = role + roleObj[val[i]+""] + ",";
				   }
				   role = role.substring(0, role.length-1);
				   return "<label title='"+role+"'>"+role+"</label>";
			   }},
			   {title: '操作', name: 'roleId', width:40, align:'center', renderer:function(val, item, rowIndex){
				   
				   var btn = "<a href='#' class='select' onclick='selectUser(this)' key='"+item.id+"' val='"+item.name+"' >选择</a>";
				   //人已经被选择
				   if($(".del_span[key='"+item.id+"']").length > 0){
					   btn = "<a href='#' class='select' onclick='selectUser(this)' key='"+item.id+"' val='"+item.name+"' style='display:none;' >选择</a>";
				   }
				   
				   return btn;
			   }}
           ],
        cellSelected:function(e, item, rowIndex, colIndex){
        	alert(JSON.stringify(item));
        	alert(rowIndex);
        	alert(colIndex);
        },
        plugins : [
        	$('#paginator11-1').mmPaginator({
        		totalCountName: 'total',   //对应MMGridPageVoBean count
        		page: 1,                   //初始页
        		pageParamName: 'page',     //当前页数
        		limitParamName: 'pageSize', //每页数量
        		limitList: [10, 20, 40, 50]
        	})
        ]
    });	
	
	$("#select_div").on("click", '.del_png', function(){
		$(this).parent().remove();
		//表格重新加上
		$("a.select[key='"+$(this).parent().attr("key")+"']").show();
	});
	$("#select_div").on("mouseenter", '.del_png', function(){
		$(this).attr("src", "<%=request.getContextPath()%>/images/delete_1.png");
	});
	$("#select_div").on("mouseleave", '.del_png', function(){
		$(this).attr("src", "<%=request.getContextPath()%>/images/delete.png");
	});
});

function selectUser(obj){
	//alert($(obj).attr('key')+"  "+$(obj).attr('val'));
	$("#select_div").append("<span class='del_span' key='"+$(obj).attr('key')+"' >"+$(obj).attr('val')+"<img class='del_png' title='删除' src='<%=request.getContextPath()%>/images/delete.png' /></span>");
	$(obj).hide();
}


function saveUser(){
	
	alertBox.confirm("<div class='alertBox_text'>确认保存吗？</div>", function(agree){
	    if(agree){
	    	//被选择的所有人
	    	var param = [];
	    	param.push({"name":"roleId", "value":parent.roleNodeChecked.id});
	    	$("#select_div").find("span.del_span").each(function(index, value){
	    		param.push({"name":"userIds", "value":$(value).attr("key")});
	    	});
	    	//alert(JSON.stringify(param));
	    	$.ajax({
	    		type:"POST",
	    		async:false,  //默认true,异步
	    		url:"<%=request.getContextPath()%>/manageRole/addUserRole.action",
	    		data:param,
	    		success:function(data){
	    			if(data == "SUCCESS"){
	    				alertBox.alert("<div class='alertBox_text'>保存成功！</div>", function(){
	    					parent.afterSaveUserRole();
	    				}, {title:"提示信息"});
	    			}else{
	    				alertBox.alert("<div class='alertBox_text'>保存失败！</div>", function(){
	    					parent.afterSaveUserRole();
	    				},{title:"提示信息"});
	    			}
	    	    }
	    	});
	    }
	}, {title:"提示信息"});
}

</script>
</head>
<body style="">

	<div style="margin:10px;" id="table_div">
		<table id="exampleTable"></table>
		<div style="text-align:right;">
	    	<div id="paginator11-1"></div>
	    </div>
	</div>
	
	<div style="margin:10px;" id="select_div">
		
	</div>
	
	<button class="btu_0" onclick="saveUser()" style="float:right;margin-right:10px;">保存</button>
</body>
</html>
