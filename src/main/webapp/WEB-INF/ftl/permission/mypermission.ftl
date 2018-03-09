<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8" />
		<title>用户权限  —个人中心</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
         <@_top.top 10/>
	</head>
	<body data-target="#one" data-spy="scroll">
    <div id="wrapper">
		<div id="page-wrapper">
			<#--row-->
			<div class="row">
				<div class="col-md-10">
					<h2><i class="fa fa-info"></i> 用户权限</h2>
					<hr>
					<div id="getPermissionTree" >加载中... ...</div>
				</div>
			</div>
			<#--/row-->
		</div>
    </div>
		<script>
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