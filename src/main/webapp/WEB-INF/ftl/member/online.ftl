<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8" />
		<title>在线用户-用户管理</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
		<#--<link rel="icon" href="${basePath}/favicon.ico" type="image/x-icon" />
		<link   rel="shortcut icon" href="${basePath}/favicon.ico" />
		<link href="${basePath}/js/common/bootstrap/3.3.5/css/bootstrap.min.css?${_v}" rel="stylesheet"/>
		<link href="${basePath}/css/common/base.css?${_v}" rel="stylesheet"/>
		<script  src="${basePath}/js/common/jquery/jquery1.8.3.min.js"></script>
		<script  src="${basePath}/js/common/layer/layer.js"></script>
		<script  src="${basePath}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script  src="${basePath}/js/shiro.demo.js"></script>-->
        <link rel="icon" href="https://dev-1253372767.file.myqcloud.com/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="https://dev-1253372767.file.myqcloud.com/favicon.ico" />
        <link href="https://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://dev-1253372767.file.myqcloud.com/ssm_base.css" rel="stylesheet">
        <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
        <script src="https://cdn.bootcss.com/layer/3.0.3/layer.min.js"></script>
        <script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="https://dev-1253372767.file.myqcloud.com/ssm-check.js"></script>
		<script >
			<@shiro.hasPermission name="/member/changeSessionStatus.shtml">
			$(function(){
				$("a[v=onlineDetails]").on('click',function(){
					var self = $(this);
					var text = $.trim(self.text());
					var index = layer.confirm("确定"+ text +"？",function(){
						changeSessionStatus(self.attr('sessionId'),self.attr('status'),self);
						layer.close(index);
					});
				});
			});
			//改变状态
			function changeSessionStatus(sessionIds,status,self){
				status = !parseInt(status);
				//loading
				var load = layer.load();
				$.post("${basePath}/member/changeSessionStatus.shtml",{status:status,sessionIds:sessionIds},function(result){
					layer.close(load);
					if(result && result.status == 200){
						return self.text(result.sessionStatusText),
									self.attr('status',result.sessionStatus),
										self.parent().prev().text(result.sessionStatusTextTd);
										layer.msg('操作成功'),!1;
					}else{
						return layer.msg(result.message,function(){}),!1;
					}		
				},'json');
			}
			</@shiro.hasPermission>
			
		</script>
	</head>
	<body data-target="#one" data-spy="scroll">
		
		<@_top.top 2/>
		<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
			<div class="row">
				<@_left.member 2/>
				<div class="col-md-10">
					<h2><i class="fa fa-desktop"></i> 在线用户</h2>
					<hr>
					<form method="post" action="" id="formId" class="form-inline">
					<#--	<div clss="well">
					     	<p>这里是在线已经登录的<code>有效</code>Session，不能等同于当前在线用户，来源于Redis。</p>
					     	<p>这个Session是有TTL，有效期是30分钟，30分钟这个Session没有更新就会剔除，故你不用纠结。</p>
				        </div>
					<hr>-->
					<table class="table table-bordered">
						<tr>
							<th><i class="fa fa-info"></i> SessionID</th>
							<th><i class="fa fa-qq"></i> 昵称</th>
							<th><i class="fa fa-envelope"></i> Email/帐号</th>
							<th><i class="fa fa-calendar"></i> 创建回话</th>
							<th><i class="fa fa-calendar"></i> 回话最后活动</th>
							<th><i class="fa fa-check-circle"></i> 状态</th>
							<th><i class="fa fa-cog"></i> 操作</th>
						</tr>
						<#if list?exists && list?size gt 0 >
							<#list list as it>
								<tr>
									<td>${it.sessionId?default('未设置')}</td>
									<td>${it.nickname?default('未设置')}</td>
									<td>${it.email?default('未设置')}</td>
									<td>${it.startTime?string('HH:mm:ss yy-MM-dd')}</td>
									<td>${it.lastAccess?string('HH:mm:ss yy-MM-dd')}</td>
									<td>${(it.sessionStatus)?string('有效','已踢出')}</td>
									<td>
                                        <i class="fa fa-info-circle"></i><a href="${basePath}/member/onlineDetails/${it.sessionId}.shtml"> 详情</a>
										<@shiro.hasPermission name="/member/changeSessionStatus.shtml">
											<i class="fa fa-sign-out"></i> <a v="onlineDetails"href="javascript:void(0);" sessionId="${it.sessionId}" status="${(it.sessionStatus)?string(1,0)}">${(it.sessionStatus)?string('踢出','激活')}</a>
										</@shiro.hasPermission>
									</td>
								</tr>
							</#list>
						<#else>
							<tr>
								<td class="center-block" callspan="4">没有用户</td>
							</tr>
						</#if>
						
					</table>
				</div>
			</div><#--/row-->
		</div>
			
	</body>
</html>