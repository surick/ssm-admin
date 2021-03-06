<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="origin" name="referrer" />

    <#--<link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/frameworks-a4bf54bef6fb.css" integrity="sha512-pL9Uvvb7LMqGC8jv/AyqZ7Ya6/HTgkhZzKwEsHOdsfaW2pr3fgzqjgKUSJfYkZ/klxwHrcu+tZwtNDTuw8vH6Q==" media="all" rel="stylesheet" />
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github-d5aa84dde2d5.css" integrity="sha512-1aqE3eLVo8QJ3AfkPFnOFkzBmHnOY5YYQ89j1V4ke28LRSpxHMVQecd6/XxAp5lGLPPSEaFNhLyGKHQHiFXT7w==" media="all" rel="stylesheet" />-->

  <#--  <link href="${basePath}/css/login/frameworks.css" rel="stylesheet">
    <link href="${basePath}/css/login/login.css" rel="stylesheet">-->

    <!--CDN-->
    <link href="https://dev-1253372767.file.myqcloud.com/frameworks.css" rel="stylesheet">
    <link href="https://dev-1253372767.file.myqcloud.com/login.css" rel="stylesheet">

    <meta name="viewport" content="width=device-width">

    <title>登录</title>
    <meta name="description" content="">

    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

</head>

<body class="logged-out env-production page-responsive min-width-0 session-authentication">


<div class="position-relative js-header-wrapper ">

    <div class="header header-logged-out width-full pt-5 pb-4" role="banner">
        <div class="container clearfix width-full text-center">
            <a class="header-logo" href="/" aria-label="Homepage">
                <i class="fa fa-btc fa-4x"></i>
            </a>
        </div>
    </div>


</div>

<div role="main" class="application-main ">

    <div>

        <div class="auth-form px-3">

            <form id="_form" action="" method="post">
                <div class="auth-form-header p-0"><h1>登录</h1></div>

            <div class="auth-form-body mt-3">

                <label for="username">
                    用户名或Email(测试账号:admin)
                </label>
                <input autofocus="autofocus" class="form-control input-block" id="username" name="account" tabindex="1" type="text"/>

                <label for="password">
                    密码(测试密码:root) <a href="#" class="label-link">忘记密码?</a>
                </label>
                <input class="form-control form-control input-block" id="password" name="password" tabindex="2" type="password"/>

                <label>
                    <input type="checkbox" id="rememberMe" checked="checked">记住密码
                </label>

                <button type="button" id="login1" class="btn btn-primary btn-block" tabindex="3">登录</button>
            </div>
        </form>

            <p class="create-account-callout mt-3">
                没有账号?
                <a href="/u/register.shtml">立即注册</a>.</br>
            </p>
            <p class="create-account-callout mt-3">
                <b><small>Tips:定时数据恢复已关闭，可以自由注册帐号啦.Thanks.</small></b>
            </p>
        </div>

    </div>
    <div class="modal-backdrop js-touch-events"></div>
</div>

<div class="footer container-lg p-responsive py-6 mt-6 f6" role="contentinfo">
    <ul class="list-style-none d-flex flex-justify-center">
        <li class="mr-3"><a href="https://surick.github.io/ssm-admin/">文档</a></li>
        <li class="mr-3"><a href="https://surick.github.io/">Blog</a></li>
        <li class="mr-3"><a href="https://gitee.com/surick/ssm-admin">码云</a></li>
        <li class="mr-3"><a href="https://github.com/surick/ssm-admin">GitHub</a></li>
    </ul>
</div>

<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<script src="https://dev-1253372767.file.myqcloud.com/MD5.js"></script>
<script src="https://cdn.bootcss.com/layer/3.0.3/layer.min.js"></script>
<script>
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
                $('#login1').click();
            }
        };

        //登录操作
        $('#login1').click(function(){

            var username = $('#username').val();
            var password = $('#password').val();
            if(username == '') {
                layer.msg('用户名不能为空！');
                $('#username').focus();
                return false;
            }
            if(password == '') {
                layer.msg('密码不能为空！');
                $('#password').focus();
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
                    layer.msg('登录中...');
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
                    layer.msg('请联系管理员是否已经配置开启数据库和Redis',new Function());
                }
            });
        });
    });
</script>

</body>
</html>

