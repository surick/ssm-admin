<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <title>设备状态</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <link rel="icon" href="${basePath}/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${basePath}/favicon.ico" />
    <link href="${basePath}/js/common/bootstrap/3.3.5/css/bootstrap.min.css?${_v}" rel="stylesheet"/>
    <link href="${basePath}/css/common/base.css?${_v}" rel="stylesheet"/>
    <!-- 如需布置在内网无外部网络连接，使用服务器本地资源，否则静态资源使用CDN加速 -->
    <script type="text/javascript" src="${basePath}/js/common/jquery/jquery1.8.3.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/common/echart/esl.js"></script>
    <!-- 使用CDN加速 -->
    <!--  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/efe/esl/2-1-6/esl.js"></script> -->
    <script src="${basePath}/js/monitor/smt.js"></script>
</head>
<body data-target="#one" data-spy="scroll" style="padding:0px;margin:0px;background:#ffffff">
<#--引入头部-->
<@_top.top 5/>
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
    <div class="row">
    <#--引入左侧菜单-->
    <#--<@_left.monitor 1/>-->
        <div id="top">
            <select>
                <option value=SMT>SMT产线</option>
            </select>
            <select id="time">
                <option value="1">1mins</option>
                <option value="3" selected="selected">3mins</option>
                <option value="5">5mins</option>
            </select>
        </div>
        <div id="main" style="height: 880px;"></div>
        <audio id="alarm" src="" autoplay="autoplay"></audio>
    </div><#--/row-->
</div>
</body>
<script type="text/javascript">

    // 屏幕大小改变自动刷新
    $(window).resize(function (){
        window.location.reload();
    });
    function refresh(){
        window.location.reload();
    }
    var re = $("#time option:selected").val();
    setInterval('refresh()',re*60*1000);
</script>

</html>

