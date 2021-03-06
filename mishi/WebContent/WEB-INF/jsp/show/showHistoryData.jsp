<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>历史数据查询</title>
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
#dataSelect{
height: 34px;
margin-left: auto;
margin-right: auto;
margin-top: 15px;
width: 700px;
}
.l-text-label{
margin-top: 6px;
}
.stateItem{
width: 280px;
display: inline;
float: left;
text-align: center;
padding: 3px;
}
#stateShow{
height: 50px;
width: 900px;
margin-left: auto;
margin-right: auto;
padding: 5px;
margin-bottom: 20px;
margin-top: 20px;
border: solid 2px rgb(255, 255, 255);
background-color: rgba(80, 149, 255, 0.78);
color: white;
border-radius: 15px;
box-shadow: 2px 2px 2px #A9A4A4;

}
#dataContent{
display: none;
}


</style>

<script type="text/javascript">
$(init);
var grid=null;var datas={};




function init(){
	datas.Rows=[];
	datas.Total=0;

	 $("#timeSelect").ligerDateEditor({label:"选择时间"});
	$("#goSearsh").ligerButton({ click: goSearch});
	 $("#pointSelect").ligerComboBox({valueFieldID:"hiddenPointValue",width:260,selectBoxWidth:'260px' ,url:"<%=request.getContextPath()%>/pointInfo/getAllActivePointInfo.action"});

}



function initGrid(){
    grid = $("#pointGrid").ligerGrid({
        columns: [
        {
			display: '温度',
			name: 'temp',
			width: "20%",
			render: function(rowdata, rowindex, value){
				if (rowdata.state != -1) {
					return rowdata.temp;
				}
				else {
					return "N/A";
				}
			}
		},
        { display: '采集时间', name: 'date', width: "20%" },
        { display: '温度状态', name: 'stateDes', width: "28%",render: function (rowdata, rowindex, value){
    		if(rowdata.state==1){
    			return"<span class='text_bg_green' >温度正常</span>";
    		}else{
    			return"<span class='text_bg_red' >温度异常</span>";
    		}
        	}
        },
		 { display: '通讯状态', name: 'pointState', width: "28%",render: function (rowdata, rowindex, value){
    		if(rowdata.state==-1){
    			return"<span class='text_bg_red' >异常</span>";
    		}else{
    			return"<span class='text_bg_green' >正常</span>";
    		}
        	}
        }
        ],
        enabledEdit: true,clickToEdit:false, isScroll: true,width:"100%",height:"640px",
        pageSize:20, pageSizeOptions:[20,40,80,90,100],
        data: datas
    });   
}

function goSearch(){
	var date=$("#timeSelect").val();
	var pointId=$("#hiddenPointValue").val();
	console.info("date:"+date);
	console.info("pointId:"+pointId);
	if(date==null||date==""){
		$.ligerDialog.warn('请选择时间！', '提示');
		return;
	}
	if(pointId==null||pointId==""){
		$.ligerDialog.warn('请选择采集点！', '提示');
		return;
	}
	var param={};
	param.date=date;
	param.pointId=pointId;
	var manager = $.ligerDialog.waitting('正在搜索,请稍后');
	$.ajax({
		type:"POST",
		async:false,  //默认true,异步
		data:param,
		url:"<%=request.getContextPath()%>/pointData/searchHistoryData.action",
		success:function(data){
			manager.close(); 
			datas=data;
			presentDatas(datas);
	    },
	    error:function(data){
	    	manager.close(); 
	    	$.ligerDialog.error('数据获取失败，请保证网络畅通并刷新页面！', '提示');
	    	datas.Rows=[];
	    	datas.Total=0;
	    }
	});
}

function presentDatas(datas){
	console.dir(datas);
	if(!datas){
		$.ligerDialog.error('出现错误，请保证网络畅通并刷新页面！', '提示');
		return;
	}
	if(datas.errorCode=="1"){
		$.ligerDialog.warn(datas.errorDetail, '提示');
		return;
	}
	$("#tempMax").empty();
	$("#tempMax").append(datas.maxTmp);
	$("#tempMin").empty();
	$("#tempMin").append(datas.minTmp);
	$("#tempAvg").empty();
	$("#tempAvg").append(datas.avgTmp);
	$("#loc").empty();
	$("#loc").append(datas.loc);
	$("#state").empty();
	if(datas.exceptionCnt=="0"){
		$("#state").append("正常");
	}else{
		$("#state").append("出现过"+datas.exceptionCnt+"次异常");
	}

	$("#dataContent").css("display",'block');
	if(grid){
		grid.loadData(datas);
	}else{
		initGrid();
	}
	
	
}

</script>
</head>
<body style="overflow-x:hidden;">

<div class="first_div">
	<div class="title_div" >历史数据查询</div>
	<div id="dataSelect">
		<div id="timeDiv" style="display:inline-block;width: 200px;float:left;"><input type="text" id="timeSelect" /></div>
		<div id="pointDiv"style="display:inline-block;width: 340px;float:left;"><span style="display: inline;float:left;margin-top: 6px;">选择采集点:</span><div style="display: inline;float:left;"><input type="text" id="pointSelect" /></div></div>
		<div id="goSearsh"style="display:inline-block;width: 63px;float:left;margin-top: 3px;">搜索</div>
	</div>
	<div id="dataContent">
		<div id="stateShow">
			<div class="stateItem"><span class="label">最高温度:</span><span id="tempMax"class="stateItemShow">-180.14</span></div>
			<div class="stateItem"><span class="label">最低温度:</span><span id="tempMin"class="stateItemShow">-180.14</span></div>
			<div class="stateItem"><span class="label">平均温度:</span><span id="tempAvg"class="stateItemShow">-180.14</span></div>
			<div class="stateItem"><span class="label">采集器位置:</span><span id="loc"class="stateItemShow">第四号冷库/编号1004</span></div>
			<div class="stateItem"><span class="label">状态:</span><span id="state"class="stateItemShow">正常</span></div>
		</div>
		<div id="pointGrid"style="margin-left: auto;margin-right: auto"></div>
	</div>
</div>

	
<div id="add_iframe" style="display:none;width:100%;height:100%;">
	<iframe frameborder="0" src="" style="width:100%;height:100%;" ></iframe>
</div>
	
</body>
</html>
