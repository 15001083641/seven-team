<%--
  Created by IntelliJ IDEA.
  User: 崔丽英
  Date: 2018/3/1
  Time: 17:39
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
<body>


<form class="layui-form" action="">

    <div class="layui-form-item">
        <label class="layui-form-label">员工名称:</label>
        <div class="layui-input-block">
            <input type="text" name="staffname" required  lay-verify="required" placeholder="请输入员工名称" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">员工年龄:</label>
        <div class="layui-input-block">
            <input type="text" name="staffage" required  lay-verify="required" placeholder="请输入员工年龄" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">员工性别:</label>
        <div class="layui-input-block">
            <input type="radio" name="staffsex" value="男" title="男">
            <input type="radio" name="staffsex" value="女" title="女" checked>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">文本域</label>
        <div class="layui-input-block">
            <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">密码框</label>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">辅助文字</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">复选框</label>
        <div class="layui-input-block">
            <input type="checkbox" name="like[write]" title="写作">
            <input type="checkbox" name="like[read]" title="阅读" checked>
            <input type="checkbox" name="like[dai]" title="发呆">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">开关</label>
        <div class="layui-input-block">
            <input type="checkbox" name="switch" lay-skin="switch">
        </div>
    </div>





    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>

</form>                    

    <script>
        var form = layui.form;
        layui.use('form', function(){
            //监听提交
            form.on('submit(formDemo)', function(data){
                layer.msg(JSON.stringify(data.field));
                return false;
            });
        });
    </script>
   </body>
</html>
