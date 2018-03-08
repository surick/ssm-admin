<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8" />
		<title>用户权限  —个人中心</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
		<#--<link rel="icon" href="${basePath}/favicon.ico" type="image/x-icon" />
		<link   rel="shortcut icon" href="${basePath}/favicon.ico" />
		<link href="${basePath}/js/common/bootstrap/3.3.5/css/bootstrap.min.css?${_v}" rel="stylesheet"/>
		<link href="${basePath}/css/common/base.css?${_v}" rel="stylesheet"/>
        <script  src="${basePath}/js/common/jquery/jquery1.8.3.min.js"></script>
        <script  src="${basePath}/js/common/layer/layer.js"></script>
        <script  src="${basePath}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script  src="${basePath}/js/common/bootstrap/bootstrap-treeview.js"></script>
        <script  src="${basePath}/js/shiro.demo.js"></script>-->
        <link rel="icon" href="https://dev-1253372767.file.myqcloud.com/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="https://dev-1253372767.file.myqcloud.com/favicon.ico" />
        <link href="https://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://dev-1253372767.file.myqcloud.com/ssm_base.css" rel="stylesheet">
        <script src="https://cdn.bootcss.com/jquery/1.8.3/jquery.min.js"></script>
        <script src="https://cdn.bootcss.com/layer/3.0.3/layer.min.js"></script>
        <script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="https://dev-1253372767.file.myqcloud.com/ssm-check.js"></script>
        <script src="https://cdn.bootcss.com/bootstrap-treeview/1.2.0/bootstrap-treeview.min.js"></script>
	</head>
	<body data-target="#one" data-spy="scroll">
		
		<@_top.top 1/>
		<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
			<#--row-->
			<div class="row">
				<@_left.user 2/>
				<div class="col-md-10">
					<h2><i class="fa fa-info"></i> 用户权限</h2>
					<hr>
					<div id="getPermissionTree" >loding... ...</div>
				</div>
			</div>
			<#--/row-->
		</div>

		<script >
			$(function(){
				//加载 permission tree data
				var load = layer.load();
				$.post("getPermissionTree.shtml",{},function(data){
					layer.close(load);
					if(data && !data.length){
						return $("#getPermissionTree").html('<code>您没有任何权限。只有默认的个人中心。</code>'),!1;
					}
					$('#getPermissionTree').treeview({
			          levels: 1,//层级
			          color: "#428bca",
			          nodeIcon: "glyphicon glyphicon-user",
			          showTags: true,//显示数量
			          data: data//数据
			        });
				},'json');
			});
		</script>
	</body>
</html>