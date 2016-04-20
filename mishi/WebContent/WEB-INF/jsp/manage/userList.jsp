<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
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
	height: 100%;
}

.mmGrid,.mmPaginator{
    
}

</style>

<script type="text/javascript">

var commonUser="${commonUser}";
$(function(){
	
console.info(commonUser);
	
	//表格
	$('#exampleTable').mmGrid({
    	root:'rows',// 和后台数据保存列一致,对应MMGridPageVoBean rows
		url:"<%=request.getContextPath()%>/manageUser/getManageUserByMap.action",
    	width: 'auto',
    	height: 'auto',
    	fullWidthRows: true, //表格第一次加载数据时列伸展，自动充满表格
    	showBackboard: false,
        checkCol: true,
        multiSelect: true,
        indexCol: true,  //索引列
        params:function(){
        	var param = new Object();
        	if(commonUser&&commonUser!=""){
        		param.commonUser="true";
        	}
        	param.name = $.trim($("#name").val());
        	param.loginId = $.trim($("#loginId").val());

        	
        	return param;
        },
        cols: [{title: 'ID', name: 'id', width:60, hidden:true},
			   {title: '姓名', name: 'name', width:50},
			   {title: '账号', name: 'userId', width:50},
			   {title: '移动电话', name: 'phone', width:60},
			   {title: '邮箱', name: 'email', width:160}
			  
           ],
        plugins : [
        	$('#paginator11-1').mmPaginator({
        		totalCountName: 'total',    //对应MMGridPageVoBean count
        		page: 1,                    //初始页
        		pageParamName: 'page',      //当前页数
        		limitParamName: 'pageSize', //每页数量
        		limitList: [10, 20, 40, 50]
        	})
        ]
    });
});

//查询
function search(){
	/* var param = new Object();
	
	param.name = $.trim($("#name").val());
	param.loginId = $.trim($("#loginId").val());
	param.departmentId = $("#departmentId").val();
	param.status = $("#status").val(); */
	
	$('#exampleTable').mmGrid().load({"page":1});
}


//删除一行
function deleteRow(){
	
	//被选中的一行
	var selectRows = $('#exampleTable').mmGrid().selectedRows();
	
	if(selectRows.length > 0){
		$.ligerDialog.confirm('确认删除吗？', function(yes){ 
			if(yes){
				var param = [];
		    	$.each(selectRows, function(index, val){
		    		console.debug("id:"+val.id);
		    		param.push({"name":"ids", "value":val.id});
		    	});
		    	
		    	$.ajax({
		    		type:"POST",
		    		async:true,  //默认true,异步
		    		data:param,
		    		url:"<%=request.getContextPath()%>/manageUser/delManageUser.action",
		    		success:function(data){
		    			search();
		    	    }
		    	});
		    }
		});
	}else{
		//alert("请先选择数据！");
		$.ligerDialog.warn('请先选择数据！');
	}
}

//增加自定义标签
function addRow(){
	$("#add_iframe iframe").height($("body").height());
	$("#add_iframe iframe").attr("src", "<%=request.getContextPath()%>/manageUser/userAdd.action");
	$("div").first().hide();
	$("#add_iframe").show();
	//window.location.href = "<%=request.getContextPath()%>/manageUser/userAdd.action";
}

//修改标签
function editRow(){
	
	if($('#exampleTable').mmGrid().selectedRows().length > 1){
		//alert("只能单选操作！");
		$.ligerDialog.warn('只能单选操作!');
	}else{
		//被选中的一行
		var selectRowIndex = $('#exampleTable').mmGrid().selectedRowsIndex();
		
		if(selectRowIndex != ""){
			var row = $('#exampleTable').mmGrid().row(selectRowIndex);
			$("#add_iframe iframe").attr("src", "<%=request.getContextPath()%>/manageUser/userAdd.action?id="+row.id);
			$("div").first().hide();
			$("#add_iframe").show();
			//window.location.href = "<%=request.getContextPath()%>/manageUser/userAdd.action?id="+row.id;
		}else{
			$.ligerDialog.warn('请先选择一行！');
		}
	}
}

</script>
</head>
<body style="overflow-x:hidden;">

<div class="first_div">
	<div class="title_div" >用户管理</div>
	
	<table class="param_table" style="margin-left:10px;" >
		<tr>
			<td style="width:220px;">
				<span>姓名：</span>
				<input type="text" id="name" name="name" class="input_0" />
			</td>
			<td style="width:220px;">
				<span>账号：</span>
				<input type="text" id="loginId" name="loginId" class="input_0" />
			</td>
			
			<td style="width:230px;display:none;">
				<span>锁定状态：</span>
				<select id="status" name="status" class="input_0">
					<option value="all">全部</option>
					<option value="0">未锁定</option>
					<option value="1">锁定</option>
				</select>
			</td>
			<td style="">
				<button class="btu_0" onclick="search()" style="margin-left:10px;">查询</button>
			</td>
		</tr>
	</table>
	
	<div style="margin:3px 10px 10px 10px;background-color:#DDDDDD;height:1px;"></div>
	
	<!-- add delete edit -->
	<table class="png_table" cellpadding="0" cellspacing="0" style="margin-bottom:10px;">
		<tr>
			<td>
				<%-- <a class="button_a" href="javascript:;" onclick="addRow()">
					<img src="<%=request.getContextPath()%>/images/add.png" />
					<span>增加</span>
				</a> --%>
				<button class="btu_0" onclick="addRow()" style="margin-left:10px;">增加</button>
			</td>
			<td>
				<%-- <a class="button_a" href="javascript:;" onclick="deleteRow()">
					<img src="<%=request.getContextPath()%>/images/delete.png"/>
					<span>删除</span>
				</a> --%>
				<button class="btu_0" onclick="deleteRow()" style="margin-left:10px;">删除</button>
			</td>
			<td>
				<%-- <a class="button_a" href="javascript:;" onclick="editRow()">
					<img src="<%=request.getContextPath()%>/images/edit.png" />
					<span>修改</span>
				</a> --%>
				<button class="btu_0" onclick="editRow()" style="margin-left:10px;">修改</button>
			</td>
		</tr>
	</table>
	
	<div id="exampleTable" style="margin-top:10px;" ></div>
	<div id="paginator11-1" align="right" style="margin-right:10px;" ></div>
	
</div>
	
<div id="add_iframe" style="display:none;width:100%;height:100%;">
	<iframe frameborder="0" src="" style="width:100%;height:100%;" ></iframe>
</div>
	
</body>
</html>
