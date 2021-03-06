<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误日志查看</title>
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
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/js/LigerUI V1.2.5/skins/Gray2014/css/all.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/LigerUI V1.2.5/ligerui.min.js" ></script>
<!-- debug -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/consoleDebug.js"></script>
<style type="text/css">

html, body{
	height: 90%;
}

.mmGrid,.mmPaginator{
    
}
#clear{
	margin-bottom: -18px;
margin-top: 8px;
}
</style>

<script type="text/javascript">
$(init);
var grid=null;var editMode=false;




function init(){
	initGrid();
}

function getErrLog(){
	console.info("getAllErrLog");
	var ErrLog=null;var data={};
	$.ajax({
		type:"POST",
		async:false,  //默认true,异步

		url:"<%=request.getContextPath()%>/errLog/getLogData.action",
		success:function(data){
			ErrLog=data;
	    },
	    error:function(data){
	    	$.ligerDialog.error('数据获取失败，请保证网络畅通并刷新页面！', '提示');
	    	ErrLog=null;
	    	console.info("ErrLog is null");
	    }
	});
	if(ErrLog!=null){
		data.Rows=ErrLog;
		data.Total=ErrLog.length;
	}else{
		data.Rows=[];
		data.Total=0;
	}
	return data;
}

function initGrid(){
    grid = $("#pointGrid").ligerGrid({
        columns: [
        { display: '采集器编号',width: "19%", name: 'point'},
        { display: '采集点端口', width: "19%", name: 'port'},
        { display: '采集点地址', name: 'loc', width: "20%" },
        { display: '日志产生时间', name: 'time', width: "20%" },
        { display: '错误描述', name: 'errDes', width: "20%" }
        ],
   
        enabledEdit: false,clickToEdit:false, isScroll: true,width:"100%",height:"640px",
        pageSize:20, pageSizeOptions:[20,40,80,90,100],
        data: getErrLog()

    });   
}

function clearErrorLog(){
	$.ajax({
		type:"POST",
		async:false,  //默认true,异步
		url:"<%=request.getContextPath()%>/errLog/clearLog.action",
		success:function(data){
			if(data=="SUCCESS"){
				console.info("成功");
				grid.loadData(getErrLog());
			}else{
				$.ligerDialog.error('失败，出现内部错误，请联系管理员！', '提示');
			}
	    },
	    error:function(data){
	    	$.ligerDialog.error('失败，请保证网络畅通并刷新页面！', '提示');
	    }
	});
}

</script>
</head>
<body style="overflow-x:hidden;">

<div class="first_div">
	<div class="title_div" >错误日志查看</div>
	<div id="pointGrid"style="margin-left: auto;margin-right: auto"></div>

</div>
	<div align="right" style="margin-right:30px;">
		<button class="btu_0" onclick="clearErrorLog()">清除错误日志</button>
	</div>
	
</body>
</html>
