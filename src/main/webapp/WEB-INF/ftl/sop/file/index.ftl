<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <title>文件管理-SOP管理</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
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
        <#--根据ID数组删除文件-->
        function deleteById(fids){
            var index = layer.confirm("确定这"+ fids.length +"个文件？",function(){
                var load = layer.load();
                $.post('${basePath}/sop/file/deleteFileByFid.shtml',{fids:fids.join(',')},function(result){
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
        <#--根据id更新文件-->
        function updateById() {

        }
        <#--&lt;#&ndash;添加model&ndash;&gt;
        function addFile(){
            var formdata = new FormData;
            var mid = $('#mid').val(),
                    fnum = $('#fnum').val(),
                    fname = $('#fname').val(),
                    fver = $('#fver').val();
            var fileObj = document.getElementById("sop").files[0];
            formdata.append("mid",mid);
            formdata.append("fnum",fnum);
            formdata.append("fname",fname);
            formdata.append("fver",fver);
            formdata.append("file",fileObj);
            if($.trim(mid) == ''){
                return layer.msg('model名称不能为空。',so.default),!1;
            }
            if($.trim(fnum) == ''){
                return layer.msg('NUM不能为空。',so.default),!1;
            }
            if($.trim(fname) == ''){
                return layer.msg('文件名不能为空。',so.default),!1;
            }
            if($.trim(fver) == ''){
                return layer.msg('版本不能为空。',so.default),!1;
            }
        &lt;#&ndash;loding&ndash;&gt;
            var load = layer.load();
            /*$.post('${basePath}/sop/file/addFile.shtml',{mid:mid,fnum:fnum,fname:fname,fver:fver,fpath:fpath,file:file},function(result){
                layer.close(load);
                if(result && result.status != 200){
                    return layer.msg(result.message,so.default),!1;
                }
                layer.msg('添加成功。');
                setTimeout(function(){
                    $('#formId').submit();
                },1000);
            },'json');*/
            $.ajax({
                url: '${basePath}/sop/file/addFile.shtml',
                type: 'POST',
                cache: false,
                data: formdata,
                processData: false,
                contentType: false
            }).done(function(result) {
                layer.close(load);
                if(result && result.status != 200){
                    return layer.msg(result.message,so.default),!1;
                }
                layer.msg('添加成功。');
                setTimeout(function(){
                    $('#formId').submit();
                },1000);
            });
        }-->
    </script>
</head>
<body data-target="#one" data-spy="scroll">
<#--引入头部-->
		<@_top.top 4/>
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
    <div class="row">
    <#--引入左侧菜单-->
        <@_left.sop 2/>
        <div class="col-md-10">
            <h2>文件管理</h2>
            <hr>
            <form method="post" action="" id="formId" class="form-inline">
                <div clss="well">
                    <div class="form-group">
                        <input type="text" class="form-control" style="width: 300px;" value="${findContent?default('')}"
                               name="findContent" id="findContent" placeholder="输入文件名称/上传人">
                    </div>
                    <span class=""> <#--pull-right -->
				         	<button type="submit" class="btn btn-primary">查询</button>
				         		<a class="btn btn-success" onclick="$('#addFile').modal();">填加文件</a>
				         		<button type="button" id="deleteAll" class="btn  btn-danger">Delete</button>
				         </span>
                </div>
                <hr>
                <table class="table table-bordered">
                    <tr>
                        <th><input type="checkbox" id="checkAll"/></th>
                        <th>NUM</th>
                        <th>Model名称</th>
                        <th>文件名</th>
                        <th>档案名</th>
                        <th>文件版本</th>
                        <th>上传人</th>
                        <th>更新时间</th>
                        <th>操作</th>
                    </tr>
						<#if page?exists && page.list?size gt 0 >
                            <#list page.list as it>
								<tr>
                                    <td><input value="${it.fid}" check='box' type="checkbox" /></td>
                                    <td>${it.fnum?default('-')}</td>
                                    <td>${it.mid?default('-')}</td>
                                    <td>${it.fname?default('-')}</td>
                                    <td>${it.fpath?default('-')}</td>
                                    <td>${it.fver?default('-')}</td>
                                    <td>${it.fuser?default('-')}</td>
                                    <td>${it.ftime?string('yyyy-MM-dd HH:mm:ss')}</td>
                                    <td>
                                        <i class="glyphicon glyphicon-eye-open"></i><a href="/sop/file/showFile.shtml?fid=${it.fid}">查看</a>
                                        <i class="glyphicon glyphicon-edit"></i><a href="javascript:updateById([${it.fid}]);">更新</a>
                                        <i class="glyphicon glyphicon-remove"></i><a href="javascript:deleteById([${it.fid}]);">删除</a>
                                    </td>
                                </tr>
                            </#list>
                        <#else>
							<tr>
                                <td class="text-center danger" colspan="9">没有找到文件</td>
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
    <div class="modal fade" id="addFile" tabindex="-1" role="dialog" aria-labelledby="addFileLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="addFileLabel">添加文件</h4>
                </div>
                <div class="modal-body">
                    <form id="boxFileForm" action="/sop/file/addFile.shtml" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Model名称:</label>
                            <input type="text" class="form-control" id="mid" name="mid" placeholder="请输入Model名称"/>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">NUM:</label>
                            <input type="text" class="form-control" id="fnum" name="fnum"  placeholder="请输入NUM">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">文件名称:</label>
                            <input type="text" class="form-control" id="fname" name="fname"  placeholder="请输入文件名称">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">版本:</label>
                            <input type="text" class="form-control" id="fver" name="fver"  placeholder="请输入版本">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">上传文件:</label>
                            <input type="file" id="sop" name="sop">
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <input type="submit" value="发布" class="btn btn-primary">
                    </form>
                </div>
            </div>
        </div>
    </div>
<#--/弹框-->
</div>
</body>

</html>

