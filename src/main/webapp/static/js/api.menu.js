var dg;
var d;
var permissionDg;
var parentPermId;
$(function(){   
	dg=$('#dg').treegrid({  
	method: "get",
    url:ctx+'/system/api_menu/combotree', 
    fit : true,
	fitColumns : true,
	border : false,
	idField : 'id',
	treeField:'text',
	parentField : 'pid',
	remoteSort:true,
	sortName:'sort',
	sortorder:'asc',
	animate:true, 
	rownumbers:true,
	singleSelect:true,
	striped:true,
    columns:[[    
        {field:'id',title:'id',hidden:true,width:100},    
        {field:'text',title:'名称',width:100},
        {field:'projectName',title:'所属项目',width:100},
        {field:'url',title:'url',width:100},
        {field:'sort',title:'排序'},
        {field:'createTime',title:'创建时间',width:100,
         formatter: function (val, rec) {
        		 if(val==""||val==null){return  "";}
        	
        		 var timestamp = new Date(val);
        		 return myTime(timestamp);
        		
             }	
        },
         {field:'updateTime',title:'更新时间',width:100,
          formatter: function (val, rec) {
        		 if(val==""||val==null){return  "";}
        		 var timestamp = new Date(val);
        		 return myTime(timestamp);
        		
             }	
         }
    ]],
    enableHeaderClickMenu: false,
    enableHeaderContextMenu: false,
    enableRowContextMenu: false,
    toolbar:'#tb',
    dataPlain: true
	});
	
});

//弹窗增加
function add() {
	//父级权限
	var row = dg.treegrid('getSelected');
	if(row){
		parentPermId=row.id;
	}
	
	d=$('#dlg').dialog({    
	    title: '添加api菜单',    
	    width: 450,    
	    height: 360,    
	    closed: false,    
	    cache: false,
	    maximizable:true,
	    resizable:true,
	    href:ctx+'/system/api_menu/create',
	    modal: true,
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
	var row = dg.treegrid('getSelected');
	if(rowIsNull(row)) return;
	parent.$.messager.confirm('提示', '删除后无法恢复您确定要删除？', function(data){
		if (data){
			$.ajax({
				type:'get',
				url:ctx+"/system/permission/delete/"+row.id,
				success: function(data){
					if(successTip(data,dg))
			    		dg.treegrid('reload');
				}
			});
			//dg.datagrid('reload'); //grid移除一行,不需要再刷新
		} 
	});

}

//修改
function upd(){
	var row = dg.treegrid('getSelected');
	if(rowIsNull(row)) return;
	//父级权限
	parentPermId=row.pid;
	d=$("#dlg").dialog({   
	    title: '修改api菜单',    
	    width: 450,    
	    height: 360,    
	    href:ctx+'/system/api_menu/update/'+row.id,
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


var nowIcon;
var icon_dlg;