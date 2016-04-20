<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>当前数据显示</title>
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

</style>

<script type="text/javascript">
$(init);
var grid=null;var editMode=false;




function init(){
	setCurrentDataState();
	initGrid();

	setInterval(reload,30000);
}

function reload(){
	setCurrentDataState();
	grid.loadData(getAllPointData());
	

}
function setCurrentDataState(){
	var dataState={};
	$.ajax({
		type:"POST",
		async:false,  //默认true,异步

		url:"<%=request.getContextPath()%>/pointData/getCurrentDataState.action",
		success:function(data){
			dataState=data;
	    },
	    error:function(data){
	    	$.ligerDialog.error('数据获取失败，请保证网络畅通并刷新页面！', '提示');
	    	console.info("pointInfo is null");
	    }
	});
	$("#comState").empty();
	if(dataState&&dataState.state==1){
		$("#comState").append("正常");
	}else{
		$("#comState").append("异常");
	}
	$("#newestTime").empty();
	if(dataState){
		$("#newestTime").append(dataState.time);
	}
}
function getAllPointData(){
	console.info("getAllPointData");
	var pointData=null;var data={};
	$.ajax({
		type:"POST",
		async:false,  //默认true,异步

		url:"<%=request.getContextPath()%>/pointData/getCurrentData.action",
		success:function(data){
			pointData=data;
	    },
	    error:function(data){
	    	$.ligerDialog.error('数据获取失败，请保证网络畅通并刷新页面！', '提示');
	    	pointData=null;
	    	console.info("pointInfo is null");
	    }
	});
	if(pointData!=null){
		data.Rows=pointData;
		data.Total=pointData.length;
	}else{
		data.Rows=[];
		data.Total=0;
	}
	return data;
}

function initGrid(){
    grid = $("#pointGrid").ligerGrid({
        columns: [
        { display: '采集器编号',width: "10%", name: 'pointNum'},
        { display: '采集点端口', width: "10%", name: 'portNum'},
        { display: '采集点地址', name: 'location', width: "16%" },
        { display: '温度', name: 'temp', width: "11%" },
        { display: '采集时间', name: 'time', width: "20%" },
        { display: '温度状态', name: 'stateDes', width: "11%",render: function (rowdata, rowindex, value){
    		if(rowdata.state==1){
    			return"<span class='text_bg_green' >温度正常</span>";
    		}else{
    			return"<span class='text_bg_red' >温度异常</span>";
    		}
        	}
        },
        { display: '采集点状态', name: 'memo', width: "20%" ,render: function (rowdata, rowindex, value){
    		if(rowdata.pointState==0){
    			return"<span class='text_bg_green' >"+rowdata.memo+"</span>";
    		}
    		if(rowdata.pointState==1){
    			return"<span class='text_bg_yellow' >"+rowdata.memo+"</span>";
    		}
    		if(rowdata.pointState==2){
    			return"<span class='text_bg_red' >"+rowdata.memo+"</span>";
    		}
    		
        	}
        }
      
        ],
   
        enabledEdit: true,clickToEdit:false, isScroll: true,width:"100%",height:"640px",
        pageSize:20, pageSizeOptions:[20,40,80,90,100],
        data: getAllPointData()

    });   
}


</script>
</head>
<body style="overflow-x:hidden;">

<div class="first_div">
	<div class="title_div" >采集点管理</div>
	<div id="stateShow">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="80">通信状态：</td>
        <td width="400"><span id="comState"></span></td>
         <td width="30"></td><td width="30"></td>
         <td width="100">最近更新时间：</td>
        <td class="w02"><span id="newestTime"></span></td>
      </tr>
    </table>
	</div>
	<div id="pointGrid"style="margin-left: auto;margin-right: auto"></div>
</div>

	
<div id="add_iframe" style="display:none;width:100%;height:100%;">
	<iframe frameborder="0" src="" style="width:100%;height:100%;" ></iframe>
</div>
	
</body>
</html>
