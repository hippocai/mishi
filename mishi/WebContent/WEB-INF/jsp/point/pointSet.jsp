<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>采集点管理</title>
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


function getAllPointInfo(){
	console.info("getAllPointInfo");
	var pointInfo=null;var data={};
	$.ajax({
		type:"POST",
		async:false,  //默认true,异步

		url:"<%=request.getContextPath()%>/pointInfo/getAllPointInfo.action",
		success:function(data){
			pointInfo=data;
	    },
	    error:function(data){
	    	$.ligerDialog.error('数据获取失败，请保证网络畅通并刷新页面！', '提示');
	    	pointInfo=null;
	    	console.info("pointInfo is null");
	    }
	});
	if(pointInfo!=null){
		data.Rows=pointInfo;
		data.Total=pointInfo.length;
	}else{
		data.Rows=[];
		data.Total=0;
	}
	return data;
}



function getPointMetaData(){
	console.info("getPointMetaData");
	var pointMeta=null;var data={};
	$.ajax({
		type:"POST",
		async:false,  //默认true,异步

		url:"<%=request.getContextPath()%>/pointInfo/getPointMetaData.action",
		success:function(data){
			pointMeta=data;
	    },
	    error:function(data){
	    	$.ligerDialog.error('数据获取失败，请保证网络畅通并刷新页面！', '提示');
	    	pointMeta=null;
	    	console.info("pointInfo is null");
	    }
	});
	if(pointMeta!=null){
		data=pointMeta;
	}else{
		data={};
	}
	console.dir(data);
	return data;
}

function getPortMetaData(){
	console.info("getPortMetaData");
	var portMeta=null;var data={};
	$.ajax({
		type:"POST",
		async:false,  //默认true,异步

		url:"<%=request.getContextPath()%>/pointInfo/getPortMetaData.action",
		success:function(data){
			portMeta=data;
	    },
	    error:function(data){
	    	$.ligerDialog.error('数据获取失败，请保证网络畅通并刷新页面！', '提示');
	    	portMeta=null;
	    	console.info("portInfo is null");
	    }
	});
	if(portMeta!=null){
		data=portMeta;
	}else{
		data={};
	}
	console.dir(data);
	return data;
}


function init(){
	initGrid();

}

function initGrid(){
    grid = $("#pointGrid").ligerGrid({
        columns: [
        { display: '采集器编号',width: "20%", name: 'pointNum'},
        { display: '采集点端口', width: "20%", name: 'portNum'},
        { display: '采集点地址', name: 'location', width: "20%", editor: { type: 'text'} },
        { display: '启用状态', name: 'memo', width: "19%", editor: { type: 'radiolist',data:getEditorData(),name:"selectEditor"} ,render: function (rowdata, rowindex, value)
        	{
        		var h="";
        		if(value==""||value==null||value=='0'){
					return"<span class='text_bg_red' >已关闭</span>";
        		}else{
        			if(value=='1'){
						return"<span class='text_bg_green' >普通</span>";
					}else{
						return"<span class='text_bg_green' >超低温</span>";
					}
        		}
        		
        	}
        },
        { display: '操作', isSort: false, width: "19%", render: function (rowdata, rowindex, value)
        {
            var h = "";
            if (!rowdata._editing)
            {
                h += "<a href='javascript:beginEdit(" + rowindex + ")'>修改</a> ";
            }
            else
            {
                h += "<a href='javascript:endEdit(" + rowindex + ")'>提交</a> ";
                h += "<a href='javascript:cancelEdit(" + rowindex + ")'>取消</a> "; 
            }
            return h;
        }
        }
        ],
   
        enabledEdit: true,clickToEdit:false, isScroll: true,width:"100%",height:"640px",
        pageSize:20, pageSizeOptions:[20,40,80,90,100],
        data: getAllPointInfo(),
        onEndEdit:function(data){
        	editMode=false;
        	console.info("onEndEdit");
        },
    	onAfterEdit:function(data){
        	editMode=false;
        	console.info("onAfterEdit");
        },
        onReload:function(data){
        	console.info("onReload");
        	editMode=false;
        },
        onAfterShowData:function(data){
        	console.info("onAfterShowData");
        	editMode=false;
        }

    });   
}
function getEditorData(){
	
	var dataGrid = [
        { id: '0', text: '关闭' },
        { id: '1', text: '普通' },
		{ id: '2', text: '超低温' }
       ]; 
	return dataGrid;
}
function beginEdit(rowid) { 
	if(editMode){
		$.ligerDialog.warn('请先提交正在修改的数据', '提示');
		return;
	}
	editMode=true;
	
	var editingPointNum=grid.getRow(rowid).pointNum;
	grid.beginEdit(rowid);
	if(editingPointNum=="47"||editingPointNum=="48"){
		$("input[value=2]").css("display","none");
	$("input[value=2]").next("label").css("display","none");
	}
	
}
function cancelEdit(rowid) { 

	grid.cancelEdit(rowid);
	editMode=false;
}
function endEdit(rowid){
	grid.endEdit(rowid);
	var rowData=grid.getRow(rowid);
	updatePointData(rowData);
	editMode=false;
	grid.reload(getAllPointInfo());
}

function deleteRow(rowid){
    if (confirm('确定删除?')){
    	grid.deleteRow(rowid);
    }
}

 
function getSelected(){ 
    var row = grid.getSelectedRow();
    if (!row) { alert('请选择行'); return; }
    alert(JSON.stringify(row));
}
function getData(){ 
    var data = grid.getData();
    alert(JSON.stringify(data));
} 

function updatePointData(rowData){
	var param={};
	param.memo=rowData.memo;
	param.id=rowData.id;
	param.location=rowData.location;
	param.pointNum=rowData.pointNum;
	param.portNum=rowData.portNum;
	console.dir(param);
	$.ajax({
		type:"POST",
		async:false,  //默认true,异步
		data:param,
		url:"<%=request.getContextPath()%>/pointInfo/updatePointData.action",
		success:function(data){
			if(data=="SUCCESS"){
				console.info("数据更新成功");
			}else{
				$.ligerDialog.error('数据更新失败，出现内部错误，请联系管理员！', '提示');
			}
	    },
	    error:function(data){
	    	$.ligerDialog.error('数据获取失败，请保证网络畅通并刷新页面！', '提示');
	    	console.info("update Failure");
	    }
	});
}

</script>
</head>
<body style="overflow-x:hidden;">

<div class="first_div">
	<div class="title_div" >采集点管理</div>
	<div id="pointGrid"style="margin-left: auto;margin-right: auto"></div>
</div>

	
<div id="add_iframe" style="display:none;width:100%;height:100%;">
	<iframe frameborder="0" src="" style="width:100%;height:100%;" ></iframe>
</div>
	
</body>
</html>
