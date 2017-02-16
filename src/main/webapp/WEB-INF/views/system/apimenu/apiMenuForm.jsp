<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>
</head>
<body>
<div>
	<form id="mainform" action="${ctx}/system/permission/${action}" method="post">
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
				<input id="name" name="name" type="text" value="${apiMenu.menuName }" class="input easyui-validatebox" data-options="width: 180,required:'required',validType:'length[2,20]'"/>
			</td>
		</tr>
		
		<tr>
			<td>访问路径：</td>
			<td><input id="href" name="href" type="text" value="${apiMenu.href }" class="input easyui-validatebox"  data-options="width: 180" class="easyui-validatebox"/></td>
		</tr>
	
		<tr>
			<td>排序：</td>
			<td>
				<input id="sort" name="sort" type="text" class="input  easyui-validatebox"  data-options="width: 180" value="${apiMenu.sort }" />
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


</script>
</body>
</html>