/*
 * All rights Reserved, Copyright (C) FUJITSU LIMITED 2011
 * FileName: consoleDebug.js
 * Version:  $Revision$
 * Modify record:
 * NO. |     Date       |    Name         |      Content
 * 1   | 2014-9-23        | JFTT)caiyicheng    | original version
 */


var console=window.console;
	if(!window.console){
		console=disableDebugInfo();
	}

	//禁用所有调试信息

/**
 * Method name: disableDebugInfo <BR>
 * Description: disableDebugInfo <BR>
 * Remark: <BR>  void<BR>
 */
function disableDebugInfo(){
		console={};
		console.debug = function(){};
		console.info = function(){};
		console.warn = function(){};
		console.error = function(){};
		console.assert = function(){};
		console.dir = function(){};
		console.dirxml = function(){};
		console.trace = function(){};
		console.group = function(){};
		console.groupEnd = function(){};
		console.time = function(){};
		console.timeEnd = function(){};
		console.profile = function(){};
		console.profileEnd = function(){};
		console.count = function(){};
		return console;
		
	}
	
	//console=disableDebugInfo();//关闭所有调试信息