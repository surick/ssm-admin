<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <title>MODEL管理</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <link rel="icon" href="${basePath}/favicon.ico" type="image/x-icon" />
    <link   rel="shortcut icon" href="${basePath}/favicon.ico" />
    <link href="${basePath}/js/common/bootstrap/3.3.5/css/bootstrap.min.css?${_v}" rel="stylesheet"/>
    <link href="${basePath}/css/common/base.css?${_v}" rel="stylesheet"/>
    <script  src="${basePath}/js/common/jquery/jquery1.8.3.min.js"></script>
    <script  src="${basePath}/js/common/layer/layer.js"></script>
    <script  src="${basePath}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script  src="${basePath}/js/shiro.demo.js"></script>
    <script >
    so.init(function(){
        //初始化全选。
        so.checkBoxInit('#checkAll','[check=box]');
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
    });
    <#--根据ID数组删除model-->
    function deleteById(mids){
        var index = layer.confirm("确定这"+ mids.length +"个model？",function(){
            var load = layer.load();
            $.post('${basePath}/sop/model/deleteModelByMid.shtml',{mids:mids.join(',')},function(result){
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
    <#--添加model-->
    function addModel(){
        var mname = $('#mname').val(),
                gid  = $('#gid').val();
        if($.trim(mname) == ''){
            return layer.msg('model名称不能为空。',so.default),!1;
        }
        if($.trim(gid) == ''){
            return layer.msg('部门名不能为空。',so.default),!1;
        }
    <#--loding-->
        var load = layer.load();
        $.post('${basePath}/sop/model/addModel.shtml',{mname:mname,gid:gid},function(result){
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
</script>
</head>
<body data-target="#one" data-spy="scroll">
<#--引入头部-->
		<@_top.top 4/>
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
    <div class="row">
    <#--引入左侧菜单-->
				<@_left.sop 1/>
        <div class="col-md-10">
            <h2>Model管理</h2>
            <hr>
            <form method="post" action="" id="formId" class="form-inline">
                <div clss="well">
                    <div class="form-group">
                        <input type="text" class="form-control" style="width: 300px;" value="${findContent?default('')}"
                               name="findContent" id="findContent" placeholder="输入部门/Model名称">
                    </div>
                    <span class=""> <#--pull-right -->
				         	<button type="submit" class="btn btn-primary">查询</button>
				         		<a class="btn btn-success" onclick="$('#addModel').modal();">增加MODEL</a>
				         		<button type="button" id="deleteAll" class="btn  btn-danger">Delete</button>
				         </span>
                </div>
                <hr>
                <table class="table table-bordered">
                    <tr>
                        <th><input type="checkbox" id="checkAll"/></th>
                        <th>Model名称</th>
                        <th>部门</th>
                        <th>操作</th>
                    </tr>
						<#if page?exists && page.list?size gt 0 >
                            <#list page.list as it>
								<tr>
                                    <td><input value="${it.mid}" check='box' type="checkbox" /></td>
                                    <td>${it.mname?default('-')}</td>
                                    <td>${it.gid?default('-')}</td>
                                    <td>
                                        <i class="glyphicon glyphicon-remove"></i><a href="javascript:deleteById([${it.mid}]);">删除</a>
                                    </td>
                                </tr>
                            </#list>
                        <#else>
							<tr>
                                <td class="text-center danger" colspan="4">没有找到MODEL</td>
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
<#--弹框-->
    <div class="modal fade" id="addModel" tabindex="-1" role="dialog" aria-labelledby="addModelLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="addModelLabel">添加MODEL</h4>
                </div>
                <div class="modal-body">
                    <form id="boxRoleForm">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">MODEL名称:</label>
                            <input type="text" class="form-control" name="mname" id="mname" placeholder="请输入MODEL名称"/>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">部门名:</label>
                            <input type="text" class="form-control" id="gid" name="gid"  placeholder="请输入部门名">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" onclick="addModel();" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>
<#--/弹框-->
</div>
</body>

</html>

