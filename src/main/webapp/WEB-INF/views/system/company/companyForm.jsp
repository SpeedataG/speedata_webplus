<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
<%@ include file="/WEB-INF/views/include/easyui.jsp"%>

</head>
<body>
<div>
	<form id="mainform" action="${ctx }/system/company/${action}" method="post">
		<table class="border-table">
			<tr>
				<td>公司名称：</td>
				<td>
					<input type="hidden" name="id" value="${id}"/>
					<input id="companyName" name="companyName" class="input small easyui-validatebox" data-options="width: 150,required:'required',validType:'length[3,20]'" value="${company.companyName }"> 
				</td>
			</tr>
			
			<tr>
				<td>备注：</td>
				<td><textarea rows="3" cols="41" name="remark" style="font-size: 12px;font-family: '微软雅黑'">${company.remark}</textarea></td>
			</tr>
		</table>
	</form>
</div>

<script type="text/javascript">
var action="${action}";
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