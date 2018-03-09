<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <title>设备状态</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <#--<script type="text/javascript" src="${basePath}/js/common/echart/esl.js"></script>-->
</head>
<body data-target="#one" data-spy="scroll" style="padding:0px;margin:0px;background:#ffffff">
<div id="wrapper">
<#--引入头部-->
<@_top.top 6/>
<script src="${basePath}/js/monitor/smt_bug.js"></script>
<div id="page-wrapper">
    <div class="row">
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
        <#--<audio id="alarm" src="" autoplay="autoplay"></audio>-->
    </div><#--/row-->
</div>
</div>
</body>
<script type="text/javascript">
    // 屏幕大小改变自动刷新
    /*$(window).resize(function (){
        window.location.reload();
    });*/
    function refresh(){
        window.location.reload();
    }
    var re = $("#time option:selected").val();
    setInterval('refresh()',re*60*1000);
</script>
</html>

