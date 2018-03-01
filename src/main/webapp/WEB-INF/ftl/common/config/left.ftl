<#macro user index>
<div id="one" class="col-md-2">
	<ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">
	  <li class="${(index==1)?string('active',' ')}">
	      <a href="${basePath}/user/index.shtml">
              <i class="fa fa-user-circle"></i>&nbsp;个人资料
	      </a>
	       <ul class="dropdown-menu" aria-labelledby="dLabel" style="margin-left: 160px; margin-top: -40px;">
              <li><a href="${basePath}/user/updateSelf.shtml"><i class="fa fa-edit"></i>&nbsp;资料修改</a></li>
              <li><a href="${basePath}/user/updatePswd.shtml"><i class="fa fa-key"></i>&nbsp;密码修改</a></li>
          </ul>
	  </li>
	  <li class="${(index==2)?string('active',' ')} dropdown">
	      <a href="${basePath}/role/mypermission.shtml">
              <i class="fa fa-exclamation-circle"></i>&nbsp;用户权限
	      </a>
	  </li>
	</ul>
</div>
</#macro>
<#macro member index>
	<@shiro.hasAnyRoles name='888888,100002'>          
		<div  id="one" class="col-md-2">
			<ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">
			  <li class="${(index==1)?string('active',' ')}">
			      <a href="${basePath}/member/list.shtml">
                      <i class="fa fa-list"></i>&nbsp;所有用户
			      </a>
			  </li>
			  <li class="${(index==2)?string('active',' ')} dropdown">
			      <a href="${basePath}/member/online.shtml">
                      <i class="fa fa-laptop"></i>&nbsp;在线用户
			      </a>
			  </li>
			</ul>
		</div>
	</@shiro.hasAnyRoles>         
</#macro>
<#macro role index>
	<@shiro.hasAnyRoles name='888888,100003'>  
		<div id="one" class="col-md-2">
			<ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">
			 
			 <@shiro.hasPermission name="/role/index.shtml">
			  <li class="${(index==1)?string('active',' ')}">
			      <a href="${basePath}/role/index.shtml">
                      <i class="fa fa-list-ul"></i>&nbsp;角色列表
			      </a>
			  </li>
			  </@shiro.hasPermission>
			 <@shiro.hasPermission name="/role/allocation.shtml">
			  <li class="${(index==2)?string('active',' ')} dropdown">
			      <a href="${basePath}/role/allocation.shtml">
                      <i class="fa fa-sitemap"></i>&nbsp;角色分配
			      </a>
			  </li>
			  </@shiro.hasPermission>
			  <@shiro.hasPermission name="/permission/index.shtml">
			  <li class="${(index==3)?string('active',' ')} dropdown">
			      <a href="${basePath}/permission/index.shtml">
                      <i class="fa fa-list-ol"></i>&nbsp;权限列表
			      </a>
			  </li>
			  </@shiro.hasPermission>
			  <@shiro.hasPermission name="/permission/allocation.shtml">
			  <li class="${(index==4)?string('active',' ')} dropdown">
			      <a href="${basePath}/permission/allocation.shtml">
                      <i class="fa fa-sitemap"></i>&nbsp;权限分配
			      </a>
			  </li>
			  </@shiro.hasPermission>
			</ul>
		</div>
	</@shiro.hasAnyRoles>   
</#macro>
<#macro sop index>
	<@shiro.hasAnyRoles name='888888,666666'>
		<div id="one" class="col-md-2">
            <ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">

			  <li class="${(index==1)?string('active',' ')}">
                  <a href="${basePath}/sop/model/index.shtml">
                      <i class="fa fa-tags"></i>&nbsp;Model管理
                  </a>
              </li>
			  <li class="${(index==2)?string('active',' ')} dropdown">
                  <a href="${basePath}/sop/file/index.shtml">
                      <i class="fa fa-folder-open"></i>&nbsp;文件管理
                  </a>
              </li>
			  <li class="${(index==3)?string('active',' ')} dropdown">
                  <a href="${basePath}/sop/log/index.shtml">
                      <i class="fa fa-calendar"></i>&nbsp;日志管理
                  </a>
              </li>
            </ul>
        </div>
	</@shiro.hasAnyRoles>
</#macro>
<#macro monitor index>
	<@shiro.hasAnyRoles name='888888,777777'>
		<div id="one" class="col-md-2">
            <ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix" style="top: 100px; z-index: 100;">

                <li class="${(index==1)?string('active',' ')}">
                    <a href="${basePath}/sop/monitor/index.shtml">
                        <i class="fa fa-eye"></i>&nbsp;产线监控
                    </a>
                </li>
                <li class="${(index==2)?string('active',' ')} dropdown">
                    <a href="${basePath}/sop/monitor/index.shtml">
                        <i class="glyphicon glyphicon-chevron-right"></i>&nbsp;接口状态
                    </a>
                </li>
                <li class="${(index==3)?string('active',' ')} dropdown">
                    <a href="${basePath}/sop/monitor/index.shtml">
                        <i class="glyphicon glyphicon-chevron-right"></i>&nbsp;待定
                    </a>
                </li>
            </ul>
        </div>
	</@shiro.hasAnyRoles>
</#macro>
