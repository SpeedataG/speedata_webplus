<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>

</head>
<body>
<div>
	<form id="mainform" action="${ctx }/system/api_param/${action}" method="post">
	<input type="hidden" name="id" value="${id}"/>
	<input type="hidden" name="interfaceId" value="${interfaceId}"/>
	<input type="hidden" name="paramType" value="${paramType}"/>
		<table class="border-table">
			<tr>
				<td>参数名：</td>
				<td>
					
					<input id="paramZhName" name="paramZhName" class="input small easyui-validatebox" data-options="width: 150,required:'required',validType:'length[1,20]'" value="${apiParam.paramZhName }"> 
					
					</td>
				<td>参数说明：</td>
				<td>
					<input id="paramCnName" name="paramCnName" class="input small easyui-validatebox" data-options="width: 150,required:'required',validType:'length[1,20]'" value="${apiParam.paramCnName }"> 
				</td>
			</tr>
			<tr>
			<td>是否为空：</td>
				<td>
				<input type="radio" id="y_null" name="isNull" value="true"/><label for="y_null">是</label>
				<input type="radio" id="n_null" name="isNull" value="false"/><label for="n_null">否</label>	</td>
				<td>排序：</td>
				<td>
					<input id="sort" name="sort" class="input small easyui-validatebox" data-options="width: 150,required:'required'" value="${apiParam.sort }"> 
				</td>
				
			</tr>
			
		</table>
	</form>
</div>

<script type="text/javascript">
var action="${action}";

//用户 添加修改区分
if(action=='create'){
	$("input[name='isNull'][value=true]").attr("checked",true); 
	}else if(action=='update'){
	 
	$("input[name='isNull'][value=${apiParam.isNull}]").attr("checked",true);
}
//提交表单
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