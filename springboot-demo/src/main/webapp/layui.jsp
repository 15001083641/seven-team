<%--
  Created by IntelliJ IDEA.
  User: 崔丽英
  Date: 2018/2/28
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript" src="/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="/layui-v2.2.5/layui/css/layui.css">
    <script type="application/javascript" src="/layui-v2.2.5/layui/layui.js"></script>

</head>
<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">

    <div class="layui-header">
        <div class="layui-logo ">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-gray">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul id="demo"></ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab site-demo-active" lay-allowClose="true" lay-filter="tab">

            <ul class="layui-tab-title">
                <li class="layui-this">欢迎页</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item">欢迎光临</div>

            </div>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>

<script>
    var element = layui.element;
    //JavaScript代码区域
    layui.use('element', function(){
    });

    //var flag =false;
    $.ajax({
            url:"../tree/queryTree.do",
            type:"post",
            dataType:"json",
            success:function (data) {
            layui.use('tree', function(){
                layui.tree({
                    elem: '#demo',
                    target: '_blank', //是否新选项卡打开（比如节点返回href才有效）
                    click: function(node){
                        if(node.children==""){
                            layui.use('element', function() {
                                var element = layui.element;
                                element.tabAdd('tab', {
                                    title: node.name,
                                    content: createFrame(node.url), //支持传入html
                                    id: node.id
                                });
                                element.tabChange('tab',node.id);
                            })
                        }
                        // 监听tab删除
                       /* element.on('tabDelete', function(data){
                            arry.removeAt(data.index);
                        });*/
                    },
                    nodes:data,
                        //[ //节点
                })
            });
        },
        error:function () {
        }
    })

    function createFrame(url){
        return '<iframe scrolling="auto" frameborder="0"  src="'+ url + '" style="width:100%;height:100%;"></iframe>';
    }

</script>

</body>
</html>
