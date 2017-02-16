<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
<script src="${ctx}/static/plugins/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="${ctx}/static/js/company.js" type="text/javascript"></script>

</head>
<body>
<div id="tb" style="padding:5px;height:auto">
        <div>
        <div class="search">
        	<form id="searchFrom" action="">
       	        <input type="text" name="filter_LIKES_companyName" class="easyui-validatebox input" data-options="width:150,prompt: '公司名称'"/>
		       
		       <!--  <a href="javascript(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="cx()">查询</a> -->
			   <a  href="javascript(0)" class="btn-normal btn-info" onclick="cx()">查询</a>
			</form>
			</div>
	       	<shiro:hasPermission name="sys:company:add">
	       		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="glyphicon-plus" plain="true" onclick="add();">添加</a>
	       		<span class="toolbar-item dialog-tool-separator"></span>
	       	</shiro:hasPermission>
	       	<shiro:hasPermission name="sys:company:delete">
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" data-options="disabled:false" onclick="del()">删除</a>
	        	<span class="toolbar-item dialog-tool-separator"></span>
	        </shiro:hasPermission>
	        <shiro:hasPermission name="sys:company:update">
	            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="glyphicon-pencil" plain="true" onclick="upd()">修改</a>
	            <span class="toolbar-item dialog-tool-separator"></span>
	        </shiro:hasPermission>
	      
        </div> 
        
  </div>
<table id="dg"></table> 
<div id="dlg"></div>  
<script type="text/javascript">
  var  ctx="${ctx}";
</script>
</body>
</html>