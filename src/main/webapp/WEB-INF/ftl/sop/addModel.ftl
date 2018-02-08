<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <title>MODEL管理-MODEL添加</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <link rel="icon" href="${basePath}/favicon.ico" type="image/x-icon" />
    <link   rel="shortcut icon" href="${basePath}/favicon.ico" />
    <link href="${basePath}/js/common/bootstrap/3.3.5/css/bootstrap.min.css?${_v}" rel="stylesheet"/>
    <link href="${basePath}/css/common/base.css?${_v}" rel="stylesheet"/>
    <script  src="${basePath}/js/common/jquery/jquery1.8.3.min.js"></script>
    <script  src="${basePath}/js/common/layer/layer.js"></script>
    <script  src="${basePath}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script  src="${basePath}/js/shiro.demo.js"></script>
</head>

<body data-target="#one" data-spy="scroll">
<#--引入头部-->
		<@_top.top 3/>
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
    <div class="row">
    <#--引入左侧菜单-->
				<@_left.role 3/>
        <div class="col-md-10">
    <form id="_form" action="" method="post">
        <input type="text" name="mname" id="mname" class="form-control" placeholder="Model名称">
        <input type="text" name="gid"  id="dept" class="form-control" placeholder="部门">
        <button type="button" id="add" class="btn btn-primary">添加</button>
    </form>
        </div>
    </div>
</div>

<!-- Javascript -->
<script  src="${basePath}/js/common/jquery/jquery1.8.3.min.js"></script>
<script >
    jQuery(document).ready(function() {
        $('#add').click(function(){
            var form = $('#_form');
            var error= form.find(".error");
            var tops = ['27px','96px','165px','235px','304px','372px'];
            var inputs = $("form :text");
            for(var i=0;i<inputs.length;i++){
                var self = $(inputs[i]);
                if(self.val() == ''){
                    error.fadeOut('fast', function(){
                        $(this).css('top', tops[i]);
                    });
                    error.fadeIn('fast', function(){
                        self.focus();
                    });
                    return !1;
                }
            }
            var load = layer.load();
            $.post("${basePath}/sop/addModel.shtml",$("#_form").serialize() ,function(result){
                layer.close(load);
                if(result && result.status!= 200){
                    return layer.msg(result.message,function(){}),!1;
                }else{
                    layer.msg('添加成功！' );
                    window.location.href= result.back_url || "${basePath}/";
                }
            },"json");

        });


    });
</script>
</body>

</html>

