<#macro top index>
<script baseUrl="${basePath}" src="${basePath}/js/user.login.js"></script>
<#--<link href="${basePath}/css/common/fontawesome/fontawesome-all.min.css" rel="stylesheet">-->
<#--CDN加载-->
<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<div class="navbar navbar-inverse navbar-fixed-top animated fadeInDown" style="z-index: 101;height: 41px;">

      <div class="container" style="padding-left: 0px; padding-right: 0px;">
        <div class="navbar-header">
          <button data-target=".navbar-collapse" data-toggle="collapse" type="button" class="navbar-toggle collapsed">
            <span class="sr-only">导航</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
	     </div>
	     <div role="navigation" class="navbar-collapse collapse">
	     		<a id="_logo"  href="${basePath}" style="color:#fff; font-size: 24px;" class="navbar-brand hidden-sm">ssm-admin</a>
	          <ul class="nav navbar-nav" id="topMenu">
				<li class="dropdown ${(index==1)?string('active','')}">
					<a aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown" class="dropdown-toggle" href="${basePath}/user/index.shtml">
						<i class="fa fa-id-card"></i>&nbsp;个人中心<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="${basePath}/user/index.shtml"><i class="fa fa-user-circle"></i>&nbsp;个人资料</a></li>
						<li><a href="${basePath}/user/updateSelf.shtml"><i class="fa fa-edit"></i>&nbsp;资料修改</a></li>
						<li><a href="${basePath}/user/updatePswd.shtml"><i class="fa fa-key"></i>&nbsp;密码修改</a></li>
						<li><a href="${basePath}/role/mypermission.shtml"><i class="fa fa-exclamation-circle"></i>&nbsp;我的权限</a></li>
					</ul>
				</li>	  
				<#--拥有 角色888888（管理员） ||  100002（用户中心）-->
				<@shiro.hasAnyRoles name='888888,100002'>          
				<li class="dropdown ${(index==2)?string('active','')}">
					<a aria-expanded="false" aria-haspopup="true"  role="button" data-toggle="dropdown" class="dropdown-toggle" href="${basePath}/member/list.shtml">
						<i class="fa fa-users"></i>&nbsp;用户中心<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<@shiro.hasPermission name="/member/list.shtml">
							<li><a href="${basePath}/member/list.shtml"><i class="fa fa-list"></i>&nbsp;用户列表</a></li>
						</@shiro.hasPermission>
						<@shiro.hasPermission name="/member/online.shtml">
							<li><a href="${basePath}/member/online.shtml"><i class="fa fa-laptop"></i>&nbsp;当前在线</a></li>
						</@shiro.hasPermission>
					</ul>
				</li>	
				</@shiro.hasAnyRoles>         
				<#--拥有 角色888888（管理员） ||  100003（权限频道）-->
				<@shiro.hasAnyRoles name='888888,100003'>
					<li class="dropdown ${(index==3)?string('active','')}">
						<a aria-expanded="false" aria-haspopup="true"  role="button" data-toggle="dropdown" class="dropdown-toggle" href="${basePath}/permission/index.shtml">
							<i class="fa fa-cogs"></i>&nbsp;权限管理<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<@shiro.hasPermission name="/role/index.shtml">
								<li><a href="${basePath}/role/index.shtml"><i class="fa fa-list-ul"></i>&nbsp;角色列表</a></li>
							</@shiro.hasPermission>
							<@shiro.hasPermission name="/role/allocation.shtml">
								<li><a href="${basePath}/role/allocation.shtml"><i class="fa fa-sitemap"></i>&nbsp;角色分配</a></li>
							</@shiro.hasPermission>
							<@shiro.hasPermission name="/permission/index.shtml">
								<li><a href="${basePath}/permission/index.shtml"><i class="fa fa-list-ol"></i>&nbsp;权限列表</a></li>
							</@shiro.hasPermission>
							<@shiro.hasPermission name="/permission/allocation.shtml">
								<li><a href="${basePath}/permission/allocation.shtml"><i class="fa fa-sitemap"></i>&nbsp;权限分配</a></li>
							</@shiro.hasPermission>
						</ul>
					</li>	
				</@shiro.hasAnyRoles>
			    <#--拥有 角色666666(文件管理）-->
				  <@shiro.hasAnyRoles name='888888,666666'>
				  	<li class="dropdown ${(index==4)?string('active','')}">
                      <a aria-expanded="false" aria-haspopup="true"  role="button" data-toggle="dropdown" class="dropdown-toggle" href="${basePath}/sop/model/index.shtml">
                          <i class="fa fa-folder"></i>&nbsp;SOP管理<span class="caret"></span>
                      </a>
                      <ul class="dropdown-menu">
								<li><a href="${basePath}/sop/model/index.shtml"><i class="fa fa-tags"></i>&nbsp;Model管理</a></li>
								<li><a href="${basePath}/sop/file/index.shtml"><i class="fa fa-folder-open"></i>&nbsp;文件管理</a></li>
								<li><a href="${basePath}/sop/log/index.shtml"><i class="fa fa-calendar"></i>&nbsp;日志管理</a></li>
                      </ul>
                  	</li>
				  </@shiro.hasAnyRoles>
			  	<#--拥有 角色777777(设备监控）-->
				  <@shiro.hasAnyRoles name='888888,777777'>
				  	<li class="dropdown ${(index==5)?string('active','')}">
                        <a aria-expanded="false" aria-haspopup="true"  role="button" data-toggle="dropdown" class="dropdown-toggle" href="${basePath}/monitor/index.shtml">
                            <i class="fa fa-eye"></i>&nbsp;设备监控<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${basePath}/sop/monitor/index.shtml"><i class="fa fa-eye"></i>&nbsp;设备监控</a></li>
                            <li><a href="${basePath}/sop/monitor/index.shtml"><i class="fa fa-server "></i>&nbsp;接口状态</a></li>
                            <li><a href="${basePath}/sop/monitor/index.shtml"><i class="fa fa-plug"></i>&nbsp;待定</a></li>
                        </ul>
                    </li>
				  </@shiro.hasAnyRoles>
	          </ul>
	           <ul class="nav navbar-nav  pull-right" >
				<li class="dropdown ${(index==10)?string('active','')}" style="color:#fff;">
					<a aria-expanded="false" aria-haspopup="true"  role="button" data-toggle="dropdown"  
						<@shiro.user>  
							onclick="location.href='${basePath}/user/index.shtml'" href="${basePath}/user/index.shtml" class="dropdown-toggle qqlogin" >
							<i class="fa fa-user"></i>&nbsp;${token.nickname?default('def')}<span class="caret"></span></a>
							<ul class="dropdown-menu" userid="${token.id}">
								<li><a href="${basePath}/user/index.shtml"><i class="fa fa-user-circle"></i>&nbsp;个人资料</a></li>
								<li><a href="${basePath}/role/mypermission.shtml"><i class="fa fa-exclamation-circle"></i>&nbsp;我的权限</a></li>
								<li><a href="javascript:void(0);" onclick="logout();"><i class="fa fa-power-off"></i>&nbsp;注销</a></li>
							</ul>
						</@shiro.user>  
						<@shiro.guest>
							 href="javascript:void(0);" onclick="location.href='${basePath}/u/login.shtml'" class="dropdown-toggle qqlogin" >
							<img src="http://qzonestyle.gtimg.cn/qzone/vas/opensns/res/img/Connect_logo_1.png">&nbsp;登录</a>
						</@shiro.guest>
				</li>	
	          </ul>
	          <style>#topMenu>li>a{padding:10px 13px}</style>
	    </div>
  	</div>
</div>
</#macro>
