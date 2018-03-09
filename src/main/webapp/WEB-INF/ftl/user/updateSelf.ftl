<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8" />
		<title>修改个人资料 —个人中心</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	</head>
	<body data-target="#one" data-spy="scroll">
		<div id="wrapper">
		<@_top.top 1/>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-md-10">
					<h2><i class="fa fa-edit"></i>修改个人资料</h2>
					<hr>
					<form id="formId" enctype="multipart/form-data" action="${basePath}/user/updateSelf.shtml" method="post">
						  <input type="hidden" value="${token.id}" name="id"/>
						  <div class="form-group">
						    <label for="nickname"><i class="fa fa-qq"></i>昵称</label>
						    <input type="text" class="form-control" autocomplete="off" id="nickname" maxlength="8" name="nickname" value="${token.nickname?default('未设置')}" placeholder="请输入昵称">
						  </div>
						  <div class="form-group">
							  <label for="email"><i class="fa fa-envelope"></i>Email/账户（禁止修改）</label>
						    <input type="text" class="form-control " disabled autocomplete="off" id="email" maxlength="64" name="email" value="${token.email?default('未设置')}" placeholder="请输入帐号">
						  </div>
						  <div class="form-group">
							  <button type="submit" class="btn btn-success">保存修改</button>
						  </div>
						</form>
				</div>
				 <#--地图
				<@_html.tool_map/>
				-->
			</div><#--/row-->
		</div>
		</div>
		<#-- 页脚
		<@_footer.footer 0/>
		-->
		<script>
			$(function(){
				var load;
				$("#formId").ajaxForm({
			    	success:function (result){
			    		layer.close(load);
			    		if(result && result.status == 300){
			    			layer.msg(result.message,function(){});
			    			return !1;
			    		}
			    		if(result && result.status == 500){
			    			layer.msg("操作失败！",function(){});
			    			return !1;
			    		}
			    		layer.msg('操作成功！');
			    	},
			    	beforeSubmit:function(){
			    		//判断参数
			    		if($.trim($("#nickname").val()) == ''){
				    		layer.msg('昵称不能为空！',function(){});
				    		$("#nickname").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#nickname").parent().removeClass('has-error').addClass('has-success');
			    		}
			    		load = layer.load();
			    	},
			    	dataType:"json",
			    	clearForm:false
				});
			
		});
		</script>
	</body>
</html>