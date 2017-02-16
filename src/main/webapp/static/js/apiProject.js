var dg;
var d;
$(function(){   
	dg=$('#dg').datagrid({    
	method: "get",
    url:ctx+'/system/api_project/search', 
    fit : true,
	fitColumns : true,
	border : false,
	idField : 'id',
	striped:true,
	pagination:true,
	rownumbers:true,
	pageNumber:1,
	pageSize : 20,
	multiSort:true,
	pageList : [ 10, 20, 30, 40, 50 ],
	singleSelect:true,
    columns:[[    
        {field:'id',title:'id',hidden:true},    
        {field:'projectName',title:'项目名称',sortable:true,width:150},    
        {field:'createTime',title:'创建时间',sortable:true,width:100,
        	 formatter: function (val, rec) {
        		 if(val==""){return  "";}
        		 var timestamp = new Date(val);
        		 return myTime(timestamp);
             }	
        },
        {field:'updateTime',title:'更新时间',sortable:true,width:100,
        	 formatter: function (val, rec) {
        		 if(val==""){return  "";}
        		 var timestamp = new Date(val);
        		 return myTime(timestamp);
             }		
        }
    ]],
    
    toolbar:'#tb'
	});
});

//弹窗增加
function add() {
	d=$("#dlg").dialog({   
	    title: '添加公司',    
	    width: 400,    
	    height: 200,    
	    href:ctx+'/system/api_project/create',
	    maximizable:true,
	    modal:true,
	    buttons:[{
			text:'确认',
			handler:function(){
				$("#mainform").submit(); 
			}
		},{
			text:'取消',
			handler:function(){
					d.panel('close');
				}
		}]
	});
}

//删除
function del(){
	var row = dg.datagrid('getSelected');
	if(rowIsNull(row)) return;
	parent.$.messager.confirm('提示', '删除后无法恢复您确定要删除？', function(data){
		if (data){
			$.ajax({
				type:'get',
				url:ctx+"/system/api_project/delete/"+row.id,
				success: function(data){
					successTip(data,dg);
				}
			});
		} 
	});
}
//生成api文档
function genApi(){
	var row = dg.datagrid('getSelected');
	if(rowIsNull(row)) return;
	parent.$.messager.confirm('提示', '确定生成Api文档吗？', function(data){
		if (data){
			$.ajax({
				type:'get',
				url:ctx+"/system/api_project/genApi/"+row.id,
				success: function(data){
					successTip(data,dg);
				}
			});
		} 
	});
}
//弹窗修改
function upd(){
	var row = dg.datagrid('getSelected');
	if(rowIsNull(row)) return;
	d=$("#dlg").dialog({   
	    title: '修改用户',    
	    width: 400,    
	    height: 200,    
	    href:ctx+'/system/api_project/update/'+row.id,
	    maximizable:true,
	    modal:true,
	    buttons:[{
			text:'修改',
			handler:function(){
				$('#mainform').submit(); 
			}
		},{
			text:'取消',
			handler:function(){
					d.panel('close');
				}
		}]
	});
}



//查看
function look(){
	var row = dg.datagrid('getSelected');
	if(rowIsNull(row)) return;
	d=$("#dlg").dialog({   
	    title: '修改用户',    
	    width: 380,    
	    height: 340,    
	    href:ctx+'/system/api_project/update/'+row.id,
	    maximizable:true,
	    modal:true,
	    buttons:[{
			text:'取消',
			handler:function(){
					d.panel('close');
				}
		}]
	});
}

//创建查询对象并查询
function cx(){
	var obj=$("#searchFrom").serializeObject();
    alert(JSON.stringify(obj));
	dg.datagrid('load',obj); 
}
