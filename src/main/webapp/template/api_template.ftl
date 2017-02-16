<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>${project.projectName?if_exists}</title>

<link rel="stylesheet" href="src/css/layui.css">

<style>
.demo1 {
	width: 200px;
}
.top-bar { position: absolute; width: 100%; height: 60px; top: 0; left: 0; background: #1AA094}
.top-bar-left { position: absolute; width: 500px; height: 60px;}
.top-bar-right { position: absolute; width: 400px; height: 60px; right: 0; }
.top-bar-right #timerSpan { position: absolute;  right: 50px; }
.top-bar-right #themeSpan { position: absolute; width: 350px; top: 24px; right: 5px; text-align: right; }
.top-toolbar { position: absolute; font-weight: normal; padding: 0; width: 100%; height: 28px; top: 51px; left: 0; border-top-width: 1px; border-bottom-width: 0; z-index: 100; }
.bottom{position: absolute;bottom:0;width:100%;height:44px;line-height:44px;left:200px;text-align:center;}
.top-project{color:#26A995;font-weight:bold;text-align:center;font-size:20px;position: absolute;top:0;width:100%;height:70px;line-height:70px;left:200px;background:#F9F7F7;}
dd{border-bottom:1px solid #737171;background:#676565;}
</style>
</head>
<body>

	<div class="layui-layout layui-layout-admin">
		<div class="layui-header" style="height:65px;width:200px;">
		
		  <div id="topbar" class="top-bar" style="height:65px;width:200px;">
                <div class="top-bar-left" style="height:65px;">
                   <img src="image/logo_xj.gif" style="text-align:center;vertical-align:middle;width:150px;padding-top:13px;padding-left:23px;"/> <span style="color:#fff;padding-top:10px;padding-left:6px;vertical-align:middle;font-size:20px;font-weight:bold;"></span>
                </div>
               
            </div>
		
		</div>
		<div class="layui-side layui-bg-black" >
		
			<div class="layui-side-scroll">
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
				<#list menuList as menu>
					<#if menu_index==0>
					<li class="layui-nav-item layui-nav-itemed">
                    <#else>
					<li class="layui-nav-item">
                    </#if>
						<a class="" href="javascript:;">${menu.menuName?if_exists}</a>
						
						<dl class="layui-nav-child">
						<#list menu.childlist as child>
							<dd>
								<a href="javascript:void(0)" onclick="javascript:document.getElementById('${child.href?if_exists}').scrollIntoView()">${child.menuName?if_exists}</a>
							</dd>
						</#list>
						</dl>
					</li>
					</#list>
					
				</ul>
			</div>
		</div>
 <div class="top-project"><span style="text-align:center;margin-left:-200px;">${project.projectName?if_exists}</span></div>
		<div class="layui-body"  style="top:70;">
			<#list project.apiInterfaces as interface>
			<div  id="<#if (interface.apiMenu)??>${interface.apiMenu.href?if_exists}</#if>" style="padding:10px 10px 10px 10px;">
				<fieldset class="layui-elem-field layui-field-title">
					<legend>${interface.title?if_exists}</legend>
				</fieldset>
				<blockquote style="margin-top:-10px;"
					class="layui-elem-quote layui-quote-nm"><span style="font-weight:bold;">接口地址：${interface.url?if_exists}</span></br>
<#if interface.remark??><span style="color:#5D5D5D;font-size:11px;">描述：${interface.remark?if_exists}</span></#if></blockquote>
				<div class="layui-tab layui-tab-brief" style="margin:0;">
					<ul class="layui-tab-title">
						<li class="layui-this">请求参数</li>
						<li>响应参数</li>
						<li>请求示例</li>
						<li>响应示例</li>
					</ul>
					<div class="layui-tab-content" style="padding:0;">
						<div class="layui-tab-item layui-show">
							<table class="layui-table">
								<colgroup>
									<col width="150">
									<col width="200">
									<col width="100">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th>参数</th>
										<th>说明</th>
										<th>是否必填</th>
										<th>备注</th>
									</tr>
								</thead>
								<tbody>
							   <#list interface.apiParams as apiParam>
    							  <#if apiParam.paramType==1>
									<tr>
										<td>${apiParam.paramZhName?if_exists}</td>
										<td>${apiParam.paramCnName?if_exists}</td>
										<td><#if apiParam.isNull??>${apiParam.isNull?string('Y', 'N')}</#if></td>
										<td>${apiParam.remark?if_exists}</td>
									</tr>
								   </#if>
                                </#list>
								</tbody>
							</table>

						</div>
						<div class="layui-tab-item">
                           <table class="layui-table">
								<colgroup>
									<col width="150">
									<col width="200">
									<col width="100">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th>参数</th>
										<th>说明</th>
										<th>备注</th>
									</tr>
								</thead>
								<tbody>
							   <#list interface.apiParams as apiParam>
    							  <#if apiParam.paramType==2>
									<tr>
										<td>${apiParam.paramZhName?if_exists}</td>
										<td>${apiParam.paramCnName?if_exists}</td>
										<td>${apiParam.remark?if_exists}</td>
									</tr>
								   </#if>
                                </#list>
								</tbody>
							</table>
                        </div>
<div class="layui-tab-item">
<pre class="layui-code" lay-title="json">
${interface.request?if_exists}	
</pre>
</div>
<div class="layui-tab-item">
<pre class="layui-code" lay-title="json">
${interface.response?if_exists}
</pre>
</div>
					</div>
				</div>
			</div>
			</#list>
		</div>
	
	<div class="bottom"><span style="text-align:center;margin-left:-200px;">北京思必拓科技有限公司<span></span></div>
	</div>

	<script src="build/lay/dest/layui.all.js"></script>
	<script>
	layui.use('code', function(){
  		layui.code();
	 });
	</script>
</body>
</html>
