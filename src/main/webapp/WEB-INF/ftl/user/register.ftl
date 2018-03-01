<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="utf-8">
        <title>ssm-admin | 注册</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- CSS -->
        <#--link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'-->
        <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="${basePath}/css/login/reset.css"/>
        <link rel="stylesheet" href="${basePath}/css/login/supersized.css"/>
        <link rel="stylesheet" href="${basePath}/css/login/style.css"/>
		<style>
			#vcode >img{cursor:pointer;margin-bottom: -15px;border-radius:5px;}
		</style>
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="${basePath}/js/common/html5shiv.js"></script>
        <![endif]-->
    </head>

    <body id="body">
        <div class="page-container" style="margin: 100px auto 0px;">
            <h1><i class="fa fa-registered"></i>注册</h1>
            <form id="_form" action="" method="post">
                <input type="text" name="nickname" id="nickname" class="username" placeholder="请输入昵称">
                <input type="text" name="email"  id="email" placeholder="请输入邮箱/账号，作为您以后登录使用">
                <input type="password" name="pswd" id="password" class="password" placeholder="请输入密码">
                <input type="password" id="re_password"  placeholder="请再次输入密码">
                <div style="text-align: left; margin-left: 10px;" id="vcode">
	                <input type="text" name="vcode"   placeholder="验证码" style="width: 110px; margin-left: -8px; margin-right: 8px;">
                	<img src="${basePath}/open/getGifCode.shtml" />
                </div>
                <button type="button" class="register"><i class="fa fa-registered"></i> 注册</button>
                <button type="button" id="login" ><i class="fa fa-sign-in"></i> 登录</button>
                <div class="error"><span>+</span></div>
                <footer class="home-footer">
                    <div>
                        <div>
                            <i class="fa fa-copyright"></i>Jin(yzzxy.top) |  <a href="https://surick.github.io/ssm-admin" class="btn-link"><i class="fa fa-github-alt"></i> 项目介绍</a>
                            | <a href="tencent://message/?Menu=yes&uin=793792709" class="btn-link"><i class="fa fa-qq"></i> QQ</a>
                            | <a href="https://weibo.com/u/2774951333" class="btn-link"><i class="fa fa-weibo"></i> 微博</a>
                            | <a href="mailto:jk103@qq.com" class="btn-link"><i class="fa fa-envelope"></i> 邮箱</a>
                            | <a href="https://github.com/surick/ssm-admin" class="btn-link" target="_blank"><i class="fa fa-github"></i> GitHub</a>
                            | <a href="https://gitee.com/surick/ssm-admin" class="btn-link" target="_blank"><i class="fa fa-git"></i> 码云</a>
                            </span></span></div>
                    </div>
                </footer>
            </form>
        </div>

        <!-- Javascript -->
        <script  src="${basePath}/js/common/jquery/jquery1.8.3.min.js"></script>
        <script  src="${basePath}/js/common/MD5.js"></script>
        <script  src="${basePath}/js/common/supersized/supersized.3.2.7.min.js"></script>
        <script  src="${basePath}/js/common/supersized/supersized-init.js"></script>
		<script  src="${basePath}/js/common/layer/layer.js"></script>
        <script >
			jQuery(document).ready(function() {
				//验证码
				$("#vcode").on("click",'img',function(){
					/**动态验证码，改变地址，多次在火狐浏览器下，不会变化的BUG，故这样解决*/
					var i = new Image();
					i.src = '${basePath}/open/getGifCode.shtml?'  + Math.random();
					$(i).replaceAll(this);
					//$(this).clone(true).attr("src",'${basePath}/open/getGifCode.shtml?'  + Math.random()).replaceAll(this);
				});
			    $('.register').click(function(){
			    	var form = $('#_form');
			    	var error= form.find(".error");
			    	var tops = ['27px','96px','165px','235px','304px','372px'];
			    	var inputs = $("form :text,form :password");
			    	for(var i=0;i<inputs.length;i++){
			    		var self = $(inputs[i]);
			    		if(self.val() == ''){
			    			 error.fadeOut('fast', function(){
			               		 $(this).css('top', tops[i]);
				            });
				            error.fadeIn('fast', function(){
				               self.focus();
				            });
				            return !1;
			    		}
			    	}
			    	var re_password = $("#re_password").val();
			    	var password = $("#password").val();
			    	if(password != re_password){
			    		return layer.msg('2次密码输出不一样！',function(){}),!1;
			    	}
			    	
			    	if($('[name=vcode]').val().length !=4){
			    		return layer.msg('验证码的长度为4位！',function(){}),!1;
			    	}
			    	var load = layer.load();
			    	$.post("${basePath}/u/subRegister.shtml",$("#_form").serialize() ,function(result){
			    		layer.close(load);
			    		if(result && result.status!= 200){
			    			return layer.msg(result.message,function(){}),!1;
			    		}else{
			    			layer.msg('注册成功！' );
			    			window.location.href= result.back_url || "${basePath}/";
			    		}
			    	},"json");
			        
			    });
			    $("form :text,form :password").keyup(function(){
			        $(this).parent().find('.error').fadeOut('fast');
			    });
			    //跳转
			    $("#login").click(function(){
			    	window.location.href="login.shtml";
			    });
			    $("#register").click(function(){
			    	window.location.href="register.shtml";
			    });
			    
			
			});
        </script>
    </body>

</html>

