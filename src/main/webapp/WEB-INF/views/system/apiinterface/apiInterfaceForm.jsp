<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>

</head>
<body>
	<div>
		<form id="mainform" action="${ctx }/system/api_interface/${action}"
			method="post">
			<div class="easyui-tabs" style="width:585px;height:300px">
				<div title="基本信息" style="padding:10px">
					<table class="border-table">
						<tr>
							<td>标题：</td>
							<td colspan="3"><input type="hidden" name="id" value="${id}" />
								<input id="title" name="title"
								class="input small easyui-validatebox" style="width:100%;"
								data-options="required:'required',validType:'length[3,20]'"
								value="${apiInterface.title }">
							</td>

						</tr>
						<tr>
							<td>url：</td>
							<td colspan="3"><input id="url" name="url"
								class="input small easyui-validatebox" style="width:100%;"
								data-options="required:'required',validType:'length[3,20]'"
								value="${apiInterface.url }">
							</td>

						</tr>
						<tr>
							<td>提交方式：</td>
							<td><select id="method" name="method" style="width:135px;" value="${apiInterface.method}">
									<option value="">==请选择==</option>
									
									<option value="GET" <c:if test="${apiInterface.method=='GET'}">  selected="selected"</c:if>>GET</option>
									
									<option value="POST" <c:if test="${apiInterface.method=='POST'}"> selected="selected"</c:if>>POST</option>
									
							</select></td>
								<td>排序：</td>
							<td><input type="text" id="sort"
								name="sort" class="input small easyui-numberbox" style="width:140px;"
								value="${apiInterface.sort}" /></td>
						</tr>
						<tr>
							<td>所属项目：</td>
							<td><input type="text" id="projectId"
								name="projectId" class="easyui-combogrid"
								value="${apiInterface.apiProject.id}" /></td>
							<td>所属菜单：</td>
							<td><input id="apiMenuId" name="apiMenuId"
								class="input small easyui-validatebox easyui-combotree"
								style="width:140px;" value="${apiInterface.apiMenu.id}">
							</td>
						</tr>
					
						<tr>
							<td>备注：</td>
							<td colspan="3"><textarea rows="5" cols="41" id="remark"
									name="remark"
									style="width:100%;font-size: 12px;font-family: '微软雅黑'">${apiInterface.remark}</textarea>
							</td>
						</tr>
					</table>
				</div>
				<div title="请求示例" style="padding:10px">
					<textarea rows="6" id="request" name="request"
						style="width:100%;height:240px;font-size: 12px;font-family: '微软雅黑'">${apiInterface.request}</textarea>
				</div>
				<div title="响应示例" style="padding:10px">
				
						<textarea rows="6" id="response" name="response"
						style="width:100%;height:240px;font-size: 12px;font-family: '微软雅黑'">${apiInterface.response}</textarea>
			
					</td>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		var action = "${action}";
		//提交表单
		$('#mainform').form({
			onSubmit : function() {
				var isValid = $(this).form('validate');
				return isValid; // 返回false终止表单提交
			},
			success : function(data) {
				successTip(data, dg, d);
			}
		});
		$(function() {
			init_project($("#projectId"));
			init_apimenu();
		});
		function init_project(obj) {

			obj.combogrid({
				panelWidth : 300,
				panelHeight : 250,
				idField : 'id', //ID字段  
				textField : 'projectName', //显示的字段  
				url : ctx + "/system/api_project/combo",
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

		function init_apimenu() {
			$('#apiMenuId').combotree({
				valueField : 'id',
				textField : 'name',
				url : ctx + "/system/api_menu/combotree",
				required : true,
				method : 'get',
			});

		}
	</script>
</body>
</html>