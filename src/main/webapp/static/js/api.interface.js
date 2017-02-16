var dg;
var d;
$(function(){   
	
	//load_project();
	dg=$('#dg').datagrid({    
	method: "get",
    url:ctx+'/system/api_interface/search', 
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
	remoteSort:true,
	sortName:'sort',
	sortorder:'asc',
	singleSelect:true,
    columns:[[    
        {field:'id',title:'id',hidden:true},    
        {field:'title',title:'标题',sortable:true,width:150},  
        {field:'projectName',title:'项目',sortable:true,width:100},
        {field:'createTime',title:'创建时间',sortable:true,width:100,
        	 formatter: function (val, rec) {
        		 if(val==""||val==null){return  "";}
        		 var timestamp = new Date(val);
        		 return myTime(timestamp);
        		
             }	
        },
        {field:'updateTime',title:'更新时间',sortable:true,width:100,
        	formatter: function (val, rec) {
        		 if(val==""||val==null){return  "";}
       		 var timestamp = new Date(val);
       		 return myTime(timestamp);
       		
            }		
        },
        {field:'sort',title:'排序',sortable:true,width:100},
        
    ]],
    onDblClickRow: function (rowIndex, rowData) { 
      loadParam_request(rowData.id);
      loadParam_response(rowData.id);
    },
    onLoadSuccess:function(data){   
       
        var rows=$('#dg').datagrid("getRows");
        if (rows.length > 0) {
            $('#dg').datagrid('selectRow',0);//grid加载完成后自动选中第一行
            var interfaceid=$('#dg').datagrid("getSelections")[0].id;//获取选中的数据
            loadParam_request(interfaceid);
            loadParam_response(interfaceid);
        }
    },
    toolbar:'#tb'
	});
	
});

//弹窗增加
function add() {
	d=$("#dlg").dialog({   
	    title: '添加接口',    
	    width: 600,    
	    height: 400,    
	    href:ctx+'/system/api_interface/create',
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
	//load_project();
}

//删除
function del(){
	var row = dg.datagrid('getSelected');
	if(rowIsNull(row)) return;
	parent.$.messager.confirm('提示', '删除后无法恢复您确定要删除？', function(data){
		if (data){
			$.ajax({
				type:'get',
				url:ctx+"/system/api_interface/delete/"+row.id,
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
	    title: '修改接口',    
	    width: 600,    
	    height:400,    
	    href:ctx+'/system/api_interface/update/'+row.id,
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
	    title: '修改接口',    
	    width: 380,    
	    height: 340,    
	    href:ctx+'/system/api_interface/update/'+row.id,
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
   
	dg.datagrid('load',obj); 
}


