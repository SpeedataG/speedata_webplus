<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
</head>
<body>
<div>
	<form id="mainform" action="${ctx}/system/api_menu/${action}" method="post">
	<table  class="border-table">
		<tr>
			<td>上级菜单：</td>
			<td><input id="parentId" name="parentId" value="${apiMenu.parentId }"  class="easyui-validatebox" style="height:30px;"/></td>
		</tr>
		
		<tr>
			<td>菜单名称：</td>
			<td>
				<input type="hidden" name="id" value="${permission.id }"/>
				<input type="hidden" name="type" value="O"/>
				<input id="menuName" name="menuName" type="text" value="${apiMenu.menuName }" class="input easyui-validatebox" data-options="width: 180,required:'required',validType:'length[2,20]'"/>
			</td>
		</tr>
		<tr>
		<td>所属项目：</td>
		<td><input type="text" id="projectId" name="projectId" class="easyui-combogrid" value="${apiMenu.apiProject.id}" data-options="required:'required'" style="width:180px;height:30px;"/></td>
		</tr>
		<tr>
			<td>访问路径：</td>
			<td><input id="href" name="href" type="text" value="${apiMenu.href }" class="input easyui-validatebox"  data-options="width: 180" class="easyui-validatebox"/></td>
		</tr>
	
		<tr>
			<td>排序：</td>
			<td>
				<input id="sort" name="sort" type="text" class="input  easyui-validatebox  easyui-numberbox" precision="0"   data-options="width:180,required:'required',validType:'length[0,3]'" value="${apiMenu.sort }" />
			</td>
		</tr>
		<tr>
			<td>描述：</td>
			<td><textarea rows="3" cols="41" name="remark">${apiMenu.remark}</textarea></td>
		</tr>
	</table>
	</form>
</div> 
<script type="text/javascript">
$(function(){
	init_project($("#projectId"));
});
//父级权限
$('#pid').val(parentId);

//菜单类型
$('#type').combobox({  
	width:180,
	panelHeight:50
});  

//上级权限
$('#parentId').combotree({
	width:180,
	method:'GET',
	url: '${ctx}/system/api_menu/combotree',
    idField : 'id',
    textFiled : 'text',
	parentField : 'pid',
	
	iconCls: 'icon',
    animate:true
});  

$('#mainform').form({    
    onSubmit: function(){    
    	var isValid = $(this).form('validate');
		return isValid;	// 返回false终止表单提交
    },    
    success:function(data){   
    	successTip(data,dg,d);
    }    
});   
function init_project(obj) {

	obj.combogrid({
		panelWidth : 300,
		panelHeight : 250,
		idField : 'id', //ID字段  
		textField : 'projectName', //显示的字段  
		url : "${ctx}/system/api_project/combo",
		mode : 'remote',
		method : 'get',
		fitColumns : true,
		striped : true,
		editable : false,
		pagination : true,//是否分页  
		rownumbers : true,//序号  
		collapsible : false,//是否可折叠的  
		fit : true,//自动大小  
		pageSize : 10,//每页显示的记录条数，默认为10  
		pageList : [ 10 ],//可以设置每页记录条数的列表  

		columns : [ [ {
			field : 'id',
			title : 'id',
			hidden : true
		}, {
			field : 'projectName',
			title : '项目名称',
			sortable : true,
			width : 150
		}, ] ],
		toolbar : [ {
			id : 'btnClear',
			text : '清空',
			iconCls : 'icon-add',
			handler : function() {
				obj.combogrid('clear');
			}
		} ]
	});
}

</script>
</body>
</html>