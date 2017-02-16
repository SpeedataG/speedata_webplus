<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ include file="/WEB-INF/views/include/taglibs.jsp"%>

<%
String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
request.setAttribute("error", error);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>后台管理系统</title>
	<script src="${ctx}/static/plugins/easyui/jquery/jquery-1.11.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/bglogin.css" />
	<script>
	var captcha;
	function refreshCaptcha(){  
	    document.getElementById("img_captcha").src="${ctx}/static/images/kaptcha.jpg?t=" + Math.random();  
	}  
	</script>
</head>
<body>
	<div style="background:#ededed;">
	<form id="loginForm" action="${ctx}/a/login" method="post" >
		<div class="login_top">
			<div class="login_title">
			<span ><img src="${ctx}/static/images/logo_xj.gif" style="text-align:center;vertical-align:middle;"/></span>
				<span style="height:150px;line-height:150px;font-size:35px;vertical-align:middle">管理服务平台</span>
			</div>
		</div>
		<div style="float:left;width:100%;">
			<div class="login_main">
				<div class="login_main_top"></div>
				
				<div class="login_main_ln col">
					<input type="text" id="username" name="username" value="admin"/>
				  <span class="icon user" ></span>
				</div>
				<div class="login_main_pw col">
					<input type="password" id="password" name="password" value="123456"/>
					 <span class="icon pwd" ></span>
				</div>
				<div class="login_main_yzm">
					<div>
					<input type="text" id="captcha" name="captcha"/>
					<img alt="验证码" src="${ctx}/static/images/kaptcha.jpg" title="点击更换" id="img_captcha" onclick="javascript:refreshCaptcha();" style="height:43px;width:85px;border:0; border-radius:3px;float:right;margin-right:68px;"/>
					</div>
				</div>
				<div class="login_main_remb">
					<input id="rm" name="rememberMe" type="hidden"/><!-- <label for="rm"><span>记住我</span></label> -->
				</div>
				<div class="login_main_ln col">
					<button onclick="" class="btn" style="font-size:14px;">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
					
				</div>
				<!-- <div class="login_main_errortip login-tips">&nbsp;</div> -->
				<div class="login-tips"><i></i><p class="msgtip">请输入用户名和密码</p></div>
			</div>
		</div>
	</form>
	</div>
	<c:choose>
		<c:when test="${error eq 'com.speedata.webplus.system.utils.CaptchaException'}">
			<script>
				$(".msgtip").html("验证码错误，请重试");
			</script>
		</c:when>
		<c:when test="${error eq 'org.apache.shiro.authc.UnknownAccountException'}">
			<script>
				$(".msgtip").html("帐号或密码错误，请重试");
			</script>
		</c:when>
		<c:when test="${error eq 'org.apache.shiro.authc.IncorrectCredentialsException'}">
			<script>
				$(".msgtip").html("用户名不存在，请重试");
			</script>
		</c:when>
	</c:choose>
</body>
</html>
