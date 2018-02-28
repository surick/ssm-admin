<!DOCTYPE html>
<html lang="zh-cn">
    <head>
        <meta charset="utf-8">
        <title>ssm-admin | 登录</title>
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
        <link rel="icon" href="${basePath}/favicon.ico" type="image/x-icon" />
		<link   rel="shortcut icon" href="${basePath}/favicon.ico" />
        <!-- CSS -->
        <link rel="stylesheet" href="${basePath}/css/login/reset.css">
        <link rel="stylesheet" href="${basePath}/css/login/supersized.css">
        <link rel="stylesheet" href="${basePath}/css/login/style.css">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="${basePath}/js/common/html5shiv.js"></script>
        <![endif]-->
		<style>
			canvas{position: fixed; top: 0px; left: 0px; }
		</style>
    </head>
    <div id="particles-js"></div>
    <body id="body">
        <div class="page-container">
            <h1>登录</h1>
            <form id="_form" action="" method="post">
                <input type="text" name="account" class="username" placeholder="邮箱/账号">
                <input type="password" name="password" class="password" placeholder="请输入密码">
                <div style="text-align: left; margin-left: 10px;">
                <label><input type="checkbox" checked="checked" id="rememberMe"style="width: 12px; height: 12px;">记住密码</label>
                </div>
                <button type="button" id="login">登录</button>
                <button type="button" id="register" class="register">注册</button>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
                <p>社交帐号登录:</p>
                <p>
                    <a title="使用QQ登录" class="qq" href="#"></a>
                    <a title="使用微信登录" class="weixin" href="#"></a>
                </p>
            </div>
            <footer class="home-footer">
                <div>
                    <div>
            <span class="copy">©<span>Jin(yzzxy.top) |  <a href="https://surick.github.io/ssm-admin" class="btn-link">项目介绍</a> | <a href="tencent://message/?Menu=yes&uin=793792709" class="btn-link">QQ</a> | <a href="https://weibo.com/u/2774951333" class="btn-link">微博</a> | <a href="mailto:jk103@qq.com" class="btn-link">邮箱</a>
				| <a href="https://github.com/surick/ssm-admin" class="btn-link" target="_blank">GitHub</a> | <a href="https://gitee.com/surick/ssm-admin" class="btn-link" target="_blank">码云</a>
        	</span></span></div>
                    <div>
                        Privilege Management System Based on SSM + Redis + Freemarker + Shiro
                    </div>
                </div>
            </footer>
        </div>
        <!-- Javascript -->
        <script  src="${basePath}/js/common/jquery/jquery1.8.3.min.js"></script>
        <script  src="${basePath}/js/common/MD5.js"></script>
        <script  src="${basePath}/js/common/supersized/supersized.3.2.7.min.js"></script>
        <script  src="${basePath}/js/common/supersized/supersized-init.js"></script>
		<script  src="${basePath}/js/common/layer/layer.js"></script>
        <script >
			jQuery(document).ready(function() {
				try{
					var _href = window.location.href+"";
					if(_href && _href.indexOf('?kickout')!=-1){
						layer.msg('您已经被踢出，请重新登录！');
					}
				}catch(e){
					
				}
				//回车事件绑定
				document.onkeydown=function(event){
					var e = event || window.event || arguments.callee.caller.arguments[0];
					if(e && e.keyCode==13){ 
						$('#login').click();
					}
				}; 
			
				//登录操作
			    $('#login').click(function(){
			    	
			        var username = $('.username').val();
			        var password = $('.password').val();
			        if(username == '') {
			            $('.error').fadeOut('fast', function(){
			                $('.error').css('top', '27px').show();
			            });
			            $('.error').fadeIn('fast', function(){
			                $('.username').focus();
			            });
			            return false;
			        }
			        if(password == '') {
			            $('.error').fadeOut('fast', function(){
			                $('.error').css('top', '96px').show();
			            });
			            $(this).find('.error').fadeIn('fast', function(){
			                $('.password').focus();
			            });
			            return false;
			        }
			        var pswd = MD5(username +"#" + password),
			        	data = {pswd:pswd,email:username,rememberMe:$("#rememberMe").is(':checked')};
			        var load = layer.load();
			        
			        $.ajax({
			        	url:"${basePath}/u/submitLogin.shtml",
			        	data:data,
			        	type:"post",
			        	dataType:"json",
			        	beforeSend:function(){
			        		layer.msg('开始登录...');
			        	},
			        	success:function(result){
				        	layer.close(load);
				    		if(result && result.status != 200){
				    			layer.msg(result.message,function(){});
				    			$('.password').val('');
				    			return;
				    		}else{
				    			layer.msg('登录成功！');
				    			setTimeout(function(){
				    				//登录返回
					    			window.location.href= result.back_url || "${basePath}/";
				    			},1000)
				    		}
			        	},
			        	error:function(e){
			        		console.log(e,e.message);
			        		layer.msg('请查看后台Java控制台，是否报错，确定已经配置数据库和Redis',new Function());
			        	}
			        });
			    });
			    $('.page-container form .username, .page-container form .password').keyup(function(){
			        $(this).parent().find('.error').fadeOut('fast');
			    });
			    //注册
			    $("#register").click(function(){
			    	window.location.href="register.shtml";
			    });
			});
        </script>
    </body>
	<#--<script src="${basePath}/js/common/particles/particles.js"></script>
    <script src="${basePath}/js/common/particles/app.js"></script>-->
</html>

