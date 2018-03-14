<%--
  Created by IntelliJ IDEA.
  User: xzl
  Date: 2018/3/1
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询员工信息</title>
    <script type="application/javascript" src="/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="/layui-v2.2.5/layui/css/layui.css">
    <script type="application/javascript" src="/layui-v2.2.5/layui/layui.js"></script>

    <style type="text/css">.layui-table-fixed-r td{height:30px!important;}
    .layui-table-fixed-r th{height:30px!important;}
    .layui-table img {
        max-width: 30px;min-height: 30px;
    }
    </style>
</head>
<body>

<%--查询--%>
<div id="pTable" style="width: 99.9%;height:99.9%">
    <a class="layui-btn layui-btn-mini" onclick="addBook()" lay-event="edit">添加</a>
    <a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del" onclick="deleteAllBook()">批量删除</a>

    <!--条件查询-->
    <div class="layui-form-item">
        <label class="layui-form-label">员工名称:</label>
        <div class="layui-input-block">
            <input type="text" name="name" required  lay-verify="required" placeholder="请输入员工名称" autocomplete="off" class="layui-input" id="staffname">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">员工年龄:</label>
        <div class="layui-input-inline">
            <input type="text" name="staffage" id="age" required lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
        </div>
    </div>

    <a class="layui-btn layui-btn-mini"  onclick="queryWhere()"><i class="layui-icon">&#xe608;</i>搜索</a>
   <%-- <a class="layui-btn layui-btn-mini" href="javascript:queryWhere()">搜索</a>--%>

    <table class="layui-table" id="layui_table_id" lay-data="{id: 'idTest'}" lay-filter="test" style="width: 99.9%;height:99.9%">
    </table>
    <div id="laypage"></div>
</div>

<%--添加的Div弹框 与from表单--%>
<div id="addDiv" style="display: none">
    <form class="layui-form" id="addBookForm">
        <input type="hidden" name="id" id="id">

        <div class="layui-form-item">
            <label class="layui-form-label">员工名称:</label>
            <div class="layui-input-block">
                <input type="text" name="staffname" id="name"  lay-verify="required" placeholder="请输入员工名称" autocomplete="off" class="layui-input" >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">员工学历:</label>
            <div class="layui-input-block">
                <select name="staffeducation" lay-verify="required" id="type">
                    <option value="0">请选择</option>
                    <option value="1">初中</option>
                    <option value="2">高中</option>
                    <option value="3">大专</option>
                    <option value="4">本科</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">员工年龄:</label>
            <div class="layui-input-inline">
                <input type="text" name="staffage" id="staffage" required lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">员工性别:</label>
            <div class="layui-input-block">
                <input type="radio" name="staffsex" value="1" title="男" lay-filter="erweima">
                <input type="radio" name="staffsex" value="2" title="女" lay-filter="erweima">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">员工爱好:</label>
            <div class="layui-input-block">
                <input type="checkbox" name="staffhobby" title="写作" value="1">
                <input type="checkbox" name="staffhobby" title="阅读" value="2">
                <input type="checkbox" name="staffhobby" title="发呆" value="3">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">出版时间</label>
            <div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
                <input type="text"  class="layui-input" id="test1" name="birthday">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">书籍详情</label>
            <div class="layui-input-block">
                <textarea  id="info" placeholder="请输入内容" name="staffinfo" style="border: 0; width: 99%;height:30px"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">封面</label>
            <div style="width: 400px">
                <div id="demo2"></div>
                <div style="padding-left:105px">
                    <input type="hidden" id="image" name="staffimg">
                    <button type="button" class="layui-btn" id="test2">
                        <i class="layui-icon">&#xe67c;</i>上传图片
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
<%--<script src="../jss/layui/layui.js"></script>--%>
<%--操作--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>

    //这里以搜索为例
  /*  function queryWhere(){
        alert(1);
          alert($("#name").val());
          alert($("#staffage").val());
        table.reload('idTest', {
            url: '../staff/queryStaff.do'
            ,where: {//设定异步数据接口的额外参数
                staffname: $("#name").val()
                ,staffage: $("#age").val()
            }
        });
    }*/

    var $;
    var form;
    var limitcount = 10;//每页条数
    var curnum = 1;//显示第几页
    //列表查询方法
    function productsearch(start,limitsize) {
        layui.use(['table','laypage','laydate'], function(){
                table = layui.table,
                laydate=layui.laydate,
                laypage = layui.laypage;
               tableIns =  table.render({
                elem: '#layui_table_id'
                ,skin: 'line' //行边框风格
                ,even: true //开启隔行背景
                ,url: '../staff/queryStaff.do?tPage='+start+'&tNumber=' + limitsize
                , cols: [[ //表头
                    {checkbox: true, fixed: true}
                    ,{field: 'id', title: '编号', width:80, sort: true, fixed: 'left'}
                    ,{field: 'staffname', title: '员工名称', width:100}
                    ,{field: 'staffage', title: '员工年龄', width:100, sort: true}
                    ,{field: 'staffsex', title: '员工性别', width:100,templet: function(d){
                        if(d==1){
                            return "男";
                        }
                        return "女";
                    }}
                    ,{field: 'staffinfo', title: '员工简介', width: 150}
                    , {
                        field: 'staffhobby', title: '员工爱好', width: 100, sort: true,
                        templet: function (d) {
                            var a = "";
                            var array = d.staffhobby.split(',');
                            for (var i = 0; i < array.length; i++) {
                                if (array[i] == 1) {
                                    a += "写作 ";
                                } else if (array[i] == 2) {
                                    a += "阅读 ";
                                } else {
                                    a += "发呆 ";
                                }
                            }
                            return a;
                        }
                    }
                    ,{field: 'staffeducation', title: '员工学历', width: 100, sort: true,
                        templet: function(d){
                            if(d.staffeducation==1){
                                return "初中";
                            }else if(d.staffeducation==2){
                                return "高中";
                            }else if(d.staffeducation==3){
                                return "大专";
                            }else{
                                return "本科";
                            }
                        }}
                    ,
                    {field: 'staffimg', title: '封面', width: 120,
                        templet:'<div><img src="{{d.staffimg}}"></div>',
                        style:'height:30px;width:30px;line-height:30px!important;'
                    },
                    {fixed: 'right', title:'操作', toolbar: '#barDemo', width:150 ,hidden:true}
                ]]
                , page: false
                , height: 430
                ,done: function(res, curr, count){
                    //如果是异步请求数据方式，res即为你接口返回的信息。
                    //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                    laypage.render({
                        elem:'laypage'
                        ,count:count
                        ,curr:curnum
                        ,limit:limitcount
                        ,scrollbar: false// 父页面 滚动条 禁止
                        ,layout: ['prev', 'page', 'next', 'skip','count','limit']
                        ,jump:function (obj,first) {
                            if(!first){
                                curnum = obj.curr;
                                limitcount = obj.limit;
                                productsearch(curnum,limitcount);
                            }
                        }
                    })
                }
            })


            //监听工具条
            table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                $ = layui.jquery
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
                if(layEvent === 'detail'){
                    viewLableInfo(data.attrId);
                    layer.msg(data.attrId);
                } else if(layEvent === 'del'){
                    layer.confirm("确认要删除吗，删除后不能恢复", { title: "删除确认" }, function (index) {
                        layer.close(index);
                        $.post("../staff/deleOne.do?id="+data.id, function (data) {
                            location.reload();
                        });
                    });
                } else if(layEvent === 'edit'){
                    if(data.id !=null){
                        updateBook();
                        layui.use('form', function(){
                            form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
                            $("#id").val(data.id);
                            alert(data.staffname);

                            $("#name").val(data.staffname);
                            $("#staffage").val(data.staffage);
                            $("#info").val(data.staffinfo);
                            $("#test1").val(data.birthday);
                            $("#type").val(data.staffeducation);

                            $("#demo2").html("<img src='" + data.staffimg + "' width='40px' height='40px'>");
                            $("#image").val(data.staffimg);

                            $("input[name='staffsex'][value=" +data.staffsex+ "]").attr("checked", true);

                            var arr = new Array([]);
                            arr  = data.staffhobby.split(",");
                            $.each(arr,function(i,item){
                                $("input[name='staffhobby'][value="+item+"]").attr("checked","checked");
                            });
                            form.render();
                        });
                    }
                    }
            });
            //常规用法
            laydate.render({
                elem: '#createDate'
            });
            //常规用法
            laydate.render({
                elem: '#processingTime'
            });

        });
    }
    productsearch( curnum, limitcount);

    //时间
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#test1',//指定元素
            type: 'datetime',
            theme: 'molv'
        });
    });

    //上传图片
    layui.use('upload', function(){
        var upload = layui.upload;
        //执行实例
        var uploadInst = upload.render({
            elem: '#test2' //绑定元素
            ,url: '../staff/upload.do' //上传接口
            ,done: function(res){
                //上传完毕回调
                $ = layui.jquery;
                $("#image").val(res.path);
                $('#demo2').html('<img src="' + res.path + '" width="100" height="100" alt="图片不存在">')
            }
            ,error: function(res){

            }
        });
    });

    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });

    //表单修改
    function updateBook(){
        addtab("修改");
    }

    //表单新增
    function addBook(){
        addtab("新增");
    }

    //表单ajax提交
    function addtab(msg) {
         //$ = layui.jquery
         layui.use('layedit', function(){
            layedit = layui.layedit;
            indexs = layedit.build('info'); //建立编辑器
        });
            layer.open({
                type: 1,
                title: msg+"用户信息", //不显示标题栏
                skin: 'layui-layer-demo', //样式类名
                closeBtn: 1, //不显示关闭按钮
                shift: 2,
                area: ['800px', '650px'], //宽高
                shadeClose: true, //开启遮罩关闭
                content:$("#addDiv"),
                scrollbar: false, // 父页面 滚动条 禁止
                btnAlign: 'c',
                /*success: function(layero, index){// 层弹出后的成功回调方法 分别是当前层DOM当前层索引
                    console.log(layero, index);
                },*/
                //resize:false, //是否允许拉伸
                btn:['提交'],
                yes: function(index, layero){
                    layedit.sync(indexs);
                    $.ajax({
                        url:"../staff/addInfo.do",
                        type:"post",
                        data:$("#addBookForm").serialize(),
                        dataType:"text",
                        async:true,
                        success:function(){
                            location.href=location;
                            alert(msg+"成功");
                        },
                        error:function(){
                            alert(msg+"失败");
                        }
                    })
                },
                end: function () {
                    location.reload();
                },

            });
        }

    //批量删除
    function deleteAllBook(){
        $ = layui.jquery
        var ids = "";
        var checkStatus = table.checkStatus('layui_table_id')
            ,data = checkStatus.data;
        for (var i in data){
            ids+=","+data[i].id;
        }
        if(ids== ""){
            layer.msg("请选择需要删除的专题");
        }else{
            ids=ids.substr(1);
            layer.confirm("确认删除勾选的专题？", {icon: 3, title:"确认"}, function(){
                $.ajax({
                    url:"../staff/deleteAll.do",
                    type:"post",
                    data:{"ids":ids},
                    dataType:"json",
                    success: function (data) {
                        if (data.flag) {
                            layer.msg("删除成功!");
                            location.href = location;
                        }
                    }
                })
            }, function(){
            });
        }
    }
</script>
</body>
</html>
