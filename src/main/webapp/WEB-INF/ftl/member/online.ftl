<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8" />
		<title>在线用户-监控中心</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport"/>
	</head>
	<body data-target="#one" data-spy="scroll">
	<div id="wrapper">
		<@_top.top 2/>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-md-10">
					<h2><i class="fa fa-desktop"></i> 在线用户</h2>
					<hr>
					<form method="post" action="" id="formId" class="form-inline">
						<#--这里是在线已经登录的有效Session，不能等同于当前在线用户，来源于Redis,有效期30分钟-->
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
    </div>
    <script>
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
	</body>
</html>