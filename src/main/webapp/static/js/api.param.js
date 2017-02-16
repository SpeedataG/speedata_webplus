
var d;
var interface_id=0;
$(function(){   
	
	
	
	
});


var dg_param_request;
function loadParam_request(interfaceId){
	interface_id=interfaceId;
	 var postData = {
			 filter_EQT_paramType:1,
			 filter_EQI_apiInterface_id:interfaceId 
		    };
	dg_param_request=$('#dg_param_request').datagrid({    
	method: "get",
    url:ctx+'/system/api_param/search', 
    fit : false,
    height:200,
	fitColumns : true,
	border : false,
	idField : 'id',
	striped:true,
	pagination:false,
	rownumbers:true,
	pageNumber:1,
	pageSize : 20,
	multiSort:true,
	remoteSort:true,
	sortName:'sort',
	sortorder:'asc',
	pageList : [ 10, 20, 30, 40, 50 ],
	singleSelect:true,
	queryParams:postData,
    columns:[[    
        {field:'id',title:'id',hidden:true},    
        {field:'paramZhName',title:'参数名',sortable:true,width:150},  
        {field:'paramCnName',title:'参数说明',sortable:true,width:100},
        {field:'isNull',title:'是否为空',sortable:true,width:100},
        {field:'sort',title:'排序',sortable:true,width:100}
       
    ]],
    
    toolbar:'#tg_param_request'
	});

}
var dg_param_response;
function loadParam_response(interfaceId){
	interface_id=interfaceId;
	 var postData = {
			 filter_EQT_paramType:2,
			 filter_EQI_apiInterface_id:interfaceId   
		    };
	dg_param_response=$('#dg_param_response').datagrid({    
	method: "get",
    url:ctx+'/system/api_param/search', 
    fit : true,
    height:200,
	fitColumns : true,
	border : false,
	idField : 'id',
	striped:true,
	pagination:false,
	rownumbers:true,
	pageNumber:1,
	pageSize : 20,
	multiSort:true,
	pageList : [ 10, 20, 30, 40, 50 ],
	remoteSort:true,
	sortName:'sort',
	sortorder:'asc',
	singleSelect:true,
	queryParams:postData,
    columns:[[    
        {field:'id',title:'id',hidden:true},    
        {field:'paramZhName',title:'参数名',sortable:true,width:150},  
        {field:'paramCnName',title:'参数说明',sortable:true,width:100},
        {field:'sort',title:'排序',sortable:true,width:50}
    ]],
    
    toolbar:'#tg_param_response'
	});

}

var d_param_request;

//弹窗增加
function add_param_request() {
	
	d_param_request=$("#dlg").dialog({   
	    title: '添加请求参数',    
	    width: 600,    
	    height: 200,    
	    href:ctx+'/system/api_param/create?paramType=1&interfaceId='+interface_id,
	    maximizable:true,
	    modal:true,
	    buttons:[{
			text:'确认',
			handler:function(){
				$("#mainform").submit(); 
				d_param_request.panel('close');
			}
		},{
			text:'取消',
			handler:function(){
				d_param_request.panel('close');
				}
		}]
	});
}

var d_param_response;
//弹窗增加
function add_param_response() {
	
	d_param_response=$("#dlg").dialog({   
	    title: '添加响应参数',    
	    width: 600,    
	    height: 200,    
	    href:ctx+'/system/api_param/create?paramType=2&interfaceId='+interface_id,
	    maximizable:true,
	    modal:true,
	    buttons:[{
			text:'确认',
			handler:function(){
				$("#mainform").submit(); 
				d_param_response.panel('close');
			}
		},{
			text:'取消',
			handler:function(){
				d_param_response.panel('close');
				}
		}]
	});
}
//弹窗修改
function upd_param_request(){
	var row = dg_param_request.datagrid('getSelected');
	if(rowIsNull(row)) return;
	d_param_request=$("#dlg").dialog({   
	    title: '修改请求参数',    
	    width: 600,    
	    height:250,    
	    href:ctx+'/system/api_param/update/'+row.id+"?paramType=1&interfaceId="+interface_id,
	    maximizable:true,
	    modal:true,
	    buttons:[{
			text:'修改',
			handler:function(){
				$('#mainform').submit(); 
				d_param_request.panel('close');
			}
		},{
			text:'取消',
			handler:function(){
				d_param_request.panel('close');
				}
		}]
	});
}
//弹窗修改
function upd_param_response(){
	var row = dg_param_response.datagrid('getSelected');
	if(rowIsNull(row)) return;
	d_param_response=$("#dlg").dialog({   
	    title: '修改请求参数',    
	    width: 600,    
	    height:250,    
	    href:ctx+'/system/api_param/update/'+row.id+"?paramType=2&interfaceId="+interface_id,
	    maximizable:true,
	    modal:true,
	    buttons:[{
			text:'修改',
			handler:function(){
				$('#mainform').submit(); 
				d_param_response.panel('close');
			}
		},{
			text:'取消',
			handler:function(){
				d_param_response.panel('close');
				}
		}]
	});
}

