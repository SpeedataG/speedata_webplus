<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
<script src="${ctx}/static/plugins/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="${ctx}/static/js/api.interface.js" type="text/javascript"></script>
<script src="${ctx}/static/js/api.param.js" type="text/javascript"></script>
</head>
<body class="easyui-layout" style="font-family: '微软雅黑'">
 <div data-options="region:'center',split:true,border:false,title:'接口列表'">
<div id="tb" style="padding:5px;height:auto">
        <div>
        <div class="search">
        	<form id="searchFrom" action="">
       	        <input type="text" name="filter_LIKES_projectName" class="easyui-validatebox input" data-options="width:150,prompt: '项目名称'"/>
		       
		       <!--  <a href="javascript(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="cx()">查询</a> -->
			   <a  href="javascript(0)" class="btn-normal btn-info" onclick="cx()">查询</a>
			</form>
			</div>
	       	<shiro:hasPermission name="sys:apiInterface:add">
	       		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="glyphicon-plus" plain="true" onclick="add();">添加</a>
	       		<span class="toolbar-item dialog-tool-separator"></span>
	       	</shiro:hasPermission>
	       	<shiro:hasPermission name="sys:apiInterface:delete">
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" data-options="disabled:false" onclick="del()">删除</a>
	        	<span class="toolbar-item dialog-tool-separator"></span>
	        </shiro:hasPermission>
	        <shiro:hasPermission name="sys:apiInterface:update">
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="glyphicon-pencil" plain="true" onclick="upd()">修改</a>
	            <span class="toolbar-item dialog-tool-separator"></span>
	        </shiro:hasPermission>
	      
        </div> 
        
  </div>
  <table id="dg"></table> 
</div>
 
<div data-options="region:'east',split:true,border:false" style="width: 425px">
    	<div class="easyui-layout" data-options="fit: true">
    	 <div data-options="region:'north',split:false,border:false,title:'请求参数列表'" style="height:250px;">
    	<div id="tg_param_request" style="padding:5px;height:auto">
		    <div>
		  	<shiro:hasPermission name="sys:apiInterface:add">
	       		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="glyphicon-plus" plain="true" onclick="add_param_request();">添加</a>
	       		<span class="toolbar-item dialog-tool-separator"></span>
	       	</shiro:hasPermission>
	       	<shiro:hasPermission name="sys:apiInterface:delete">
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" data-options="disabled:false" onclick="del()">删除</a>
	        	<span class="toolbar-item dialog-tool-separator"></span>
	        </shiro:hasPermission>
	        <shiro:hasPermission name="sys:apiInterface:update">
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="glyphicon-pencil" plain="true" onclick="upd_param_request()">修改</a>
	            <span class="toolbar-item dialog-tool-separator"></span>
	        </shiro:hasPermission>
		    </div>
		</div>
		
		  <table id="dg_param_request"></table> 
   	</div> 
   		<div data-options="region:'center',split:false,border:false,title:'响应参数列表'"   style="height:50%;">
    	
    	<div id="tg_param_response" style="padding:5px;height:auto">
		    <div>
		  	<shiro:hasPermission name="sys:apiInterface:add">
	       		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="glyphicon-plus" plain="true" onclick="add_param_response();">添加</a>
	       		<span class="toolbar-item dialog-tool-separator"></span>
	       	</shiro:hasPermission>
	       	<shiro:hasPermission name="sys:apiInterface:delete">
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" data-options="disabled:false" onclick="del()">删除</a>
	        	<span class="toolbar-item dialog-tool-separator"></span>
	        </shiro:hasPermission>
	        <shiro:hasPermission name="sys:apiInterface:update">
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="glyphicon-pencil" plain="true" onclick="upd_param_response()">修改</a>
	            <span class="toolbar-item dialog-tool-separator"></span>
	        </shiro:hasPermission>
		    </div>
		</div>
		  <table id="dg_param_response"></table> 
		  </div>
        </div>
</div>


<div id="dlg"></div>  
<script type="text/javascript">
  var  ctx="${ctx}";
</script>
</body>
</html>