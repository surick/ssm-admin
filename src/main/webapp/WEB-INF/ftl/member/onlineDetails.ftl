<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8" />
		<title>用户详情--监控中心</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	</head>
	<body data-target="#one" data-spy="scroll">
	<div id="wrapper">
		<@_top.top 2/>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-md-10">
					<h2>用户详情</h2>
					<hr>
					<table class="table table-bordered">
						<tr>
							<th>标识号</th>
							<td>${bo.sessionId?default('—')}</td>
						</tr>
						<tr>
							<th>登录时间</th>
							<td>${bo.startTime?string('yyyy年MM月dd日 HH:mm:ss')}</td>
						</tr>
						<tr>
							<th>最后一次操作时间</th>
							<td>${bo.lastAccess?string('yyyy年MM月dd日 HH:mm:ss')}</td>
						</tr>
						<tr>
							<th>用户状态</th>
							<td>${(bo.sessionStatus)?string('有效','已踢出')}</td>
						</tr>
						<tr>
							<th>登录IP</th>
							<td>${bo.host?default('—')}</td>
						</tr>
						<tr>
							<th>失效时间</th>
							<td>${bo.timeout}&nbsp;(毫秒) = ${bo.timeout/1000}(秒) = ${bo.timeout/1000/60}(分钟)</td>
						</tr>
						<tr>
							<th>昵称</th>
							<td>${bo.nickname?default('—')}</td>
						</tr>
						<tr>
							<th>Email/帐号</th>
							<td>${bo.email?default('—')}</td>
						</tr>
						<tr>
							<th>帐号创建时间</th>
							<td>${bo.createTime?string('yyyy-MM-dd HH:mm')}</td>
						</tr>
						<tr>
							<th>最后登录时间</th>
							<td>${bo.lastLoginTime?string('yyyy-MM-dd HH:mm')}</td>
						</tr>
					</table>
				</div>
			</div><#--/row-->
		</div>
    </div>
	</body>
</html>