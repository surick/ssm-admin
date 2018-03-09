<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8" />
		<title>${token.nickname} —个人中心</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	</head>
	<body data-target="#one" data-spy="scroll">
	<div id="wrapper">
		<@_top.top 1/>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-md-10">
					<h2><i class="fa fa-user"></i> 个人信息</h2>
					<hr>
					<table class="table table-bordered">
						<tr>
							<th><i class="fa fa-qq"></i> 昵称</th>
							<td>${token.nickname?default('未设置')}</td>
						</tr>
						<tr>
							<th><i class="fa fa-envelope"></i> Email/帐号</th>
							<td>${token.email?default('未设置')}</td>
						</tr>
						<tr>
							<th><i class="fa fa-calendar"></i> 创建时间</th>
							<td>${token.createTime?string('yyyy-MM-dd HH:mm')}</td>
						</tr>
						<tr>
							<th><i class="fa fa-calendar"></i> 最后登录时间</th>
							<td>${token.lastLoginTime?string('yyyy-MM-dd HH:mm')}</td>
						</tr>
					</table>
				</div>
			</div>
			<#--/row-->
		</div>
    </div>
	</body>
</html>