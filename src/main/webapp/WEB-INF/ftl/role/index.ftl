<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8" />
		<title>所有角色 - 角色管理</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	</head>
	<body data-target="#one" data-spy="scroll">
		<div id="wrapper">
		<@_top.top 3/>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-md-10">
					<h2><i class="fa fa-list"></i> 角色列表</h2>
					<hr>
					<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent?default('')}" 
					        			name="findContent" id="findContent" placeholder="输入角色类型 / 角色名称">
					      </div>
					     <span class=""> <#--pull-right -->
				         	<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> 查询</button>
				         	<@shiro.hasPermission name="/role/addRole.shtml">
				         		<a class="btn btn-success" onclick="$('#addrole').modal();"><i class="fa fa-plus"></i> 增加角色</a>
				         	</@shiro.hasPermission>
				         	<@shiro.hasPermission name="/role/deleteRoleById.shtml">
				         		<button type="button" id="deleteAll" class="btn  btn-danger"><i class="fa fa-trash"></i> Delete</button>
				         	</@shiro.hasPermission>
				         </span>    
				        </div>
					<hr>
					<table class="table table-bordered">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th><i class="fa fa-user"></i> 角色名称</th>
							<th><i class="fa fa-tag"></i> 角色类型</th>
							<th><i class="fa fa-cog"></i> 操作</th>
						</tr>
						<#if page?exists && page.list?size gt 0 >
							<#list page.list as it>
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.name?default('-')}</td>
									<td>${it.type?default('-')}</td>
									<td>
										<#if it.type != '888888'>
											<@shiro.hasPermission name="/role/deleteRoleById.shtml">
												<i class="fa fa-trash"></i><a href="javascript:deleteById([${it.id}]);">删除</a>
								         	</@shiro.hasPermission>
								         	<#else>
								         	-
										</#if>
									</td>
								</tr>
							</#list>
						<#else>
							<tr>
								<td class="text-center danger" colspan="4">没有找到角色</td>
							</tr>
						</#if>
					</table>
					<#if page?exists>
						<div class="pagination pull-right">
							${page.pageHtml}
						</div>
					</#if>
					</form>
				</div>
			</div><#--/row-->
			
			<@shiro.hasPermission name="/role/addRole.shtml">
				<#--添加弹框-->
				<div class="modal fade" id="addrole" tabindex="-1" role="dialog" aria-labelledby="addroleLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title" id="addroleLabel">添加角色</h4>
				      </div>
				      <div class="modal-body">
				        <form id="boxRoleForm">
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">角色名称:</label>
				            <input type="text" class="form-control" name="name" id="name" placeholder="请输入角色名称"/>
				          </div>
				          <div class="form-group">
				            <label for="recipient-name" class="control-label">角色类型:</label>
				            <input type="text" class="form-control" id="type" name="type"  placeholder="请输入角色类型  [字母 + 数字] 6位">
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        <button type="button" onclick="addRole();" class="btn btn-primary">Save</button>
				      </div>
				    </div>
				  </div>
				</div>
				<#--/添加弹框-->
			</@shiro.hasPermission>
		</div>
        </div>
        <script>
            so.init(function(){
                //初始化全选。
                so.checkBoxInit('#checkAll','[check=box]');

				<@shiro.hasPermission name="/role/deleteRoleById.shtml">
				//全选
				so.id('deleteAll').on('click',function(){
                    var checkeds = $('[check=box]:checked');
                    if(!checkeds.length){
                        return layer.msg('请选择要删除的选项。',so.default),!0;
                    }
                    var array = [];
                    checkeds.each(function(){
                        array.push(this.value);
                    });
                    return deleteById(array);
                });
				</@shiro.hasPermission>
            });
			<@shiro.hasPermission name="/role/deleteRoleById.shtml">
			<#--根据ID数组删除角色-->
			function deleteById(ids){
                var index = layer.confirm("确定这"+ ids.length +"个角色？",function(){
                    var load = layer.load();
                    $.post('${basePath}/role/deleteRoleById.shtml',{ids:ids.join(',')},function(result){
                        layer.close(load);
                        if(result && result.status != 200){
                            return layer.msg(result.message,so.default),!0;
                        }else{
                            layer.msg(result.resultMsg);
                            setTimeout(function(){
                                $('#formId').submit();
                            },1000);
                        }
                    },'json');
                    layer.close(index);
                });
            }
			</@shiro.hasPermission>
			<@shiro.hasPermission name="/role/addRole.shtml">
			<#--添加角色-->
			function addRole(){
                var name = $('#name').val(),
                        type = $('#type').val();
                if($.trim(name) == ''){
                    return layer.msg('角色名称不能为空。',so.default),!1;
                }
                if(!/^[a-z0-9A-Z]{6}$/.test(type)){
                    return layer.msg('角色类型为6数字字母。',so.default),!1;
                }
			<#--loding-->
                var load = layer.load();
                $.post('${basePath}/role/addRole.shtml',{name:name,type:type},function(result){
                    layer.close(load);
                    if(result && result.status != 200){
                        return layer.msg(result.message,so.default),!1;
                    }
                    layer.msg('添加成功。');
                    setTimeout(function(){
                        $('#formId').submit();
                    },1000);
                },'json');
            }
			</@shiro.hasPermission>
        </script>
	</body>
</html>