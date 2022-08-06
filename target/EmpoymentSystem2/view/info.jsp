<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/6/23
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title></title>
    <script src="<%=request.getContextPath()%>/js/jquery1.12.4.js"></script>
    <script>
    </script>
    <style>
        *{
            padding: 0px;
            margin: 0px;
        }
        #head{
            width: 100vw;
            height: 300px;
            background-color: #7FFFD4;
            background-image: url("<%=request.getContextPath()%>/img/仙一.png");
        }
        #content{
            width: 50vw;
            height: 600px;
            background-color: #E8E8E8;
            border: 1px solid #bad4e3;
            border-radius: 10px;
            position: absolute;
            left: 25%;
            top: 20%;
            z-index: 999;
        }
        #left{
            width: 20%;
            height: 100%;
            float: left;
        }
        #right{
            float: left;
            width: 80%;
            height: 100%;
            background-color: #CCCCCC;
        }
        #left-top{
            width: 100%;
            height: 45%;
            float: left;
        }
        #left-bottom{
            width: 100%;
            height: 45%;
            float: left;
        }
        #left-bottom>p{
            text-align: center;
            height: 40px;
            cursor: pointer;
            line-height: 40px;
        }
        #left-bottom>p:hover{
            background-color: #f9d060;

        }
    </style>
    <script>
        //验证旧密码密码 失去焦点
        function oldPswOnBlur(){
            var re2=false
          var oldPsw=document.getElementById("oldPsw")
            var  oldPswMsg = document.getElementById("oldPswMsg");
            if (oldPsw.value==""||oldPsw.value==null){
                oldPsw.style.border="1px solid red"
                oldPswMsg.style.display="block"
                oldPswMsg.style.color="red"
                oldPswMsg.innerText="输入不能为空"
            }else {
                acc=${sessionScope.get('userId')}
                $.ajax({
                    url:"<%=request.getContextPath()%>/login",
                    method:"post",
                    data:{"cmd":"oldPsw","acc":acc,"psw":oldPsw.value},
                    success:function (re){
                        if (re==1){
                            oldPswMsg.style.display="block"
                            oldPswMsg.style.color="green"
                            oldPswMsg.innerText="密码正确"
                            re2=true;
                        }else {
                            oldPsw.style.border="1px solid red"
                            oldPswMsg.style.display="block"
                            oldPswMsg.style.color="red"
                            oldPswMsg.innerText="密码错误"
                            return false
                        }
                    }
                })
            }
            return re2
        }
        //聚焦 验证旧密码密码
        function oldOnFocus(){
            var oldPsw=document.getElementById("oldPsw")
                oldPsw.style.border="0px solid red"
                oldPswMsg.style.display="none"
        }
        //确认密码框 失去焦点
        function okNewPswOnBlur(){
            var newPsw=document.getElementById("newPsw")
            var okNewPsw=document.getElementById("okNewPsw")
            var  okNewPswMsg = document.getElementById("okNewPswMsg");
            if (okNewPsw.value==""||oldPsw.value==null){
                okNewPsw.style.border="1px solid red"
                okNewPswMsg.style.display="block"
                okNewPswMsg.style.color="red"
                okNewPswMsg.innerText="输入不能为空"
            }else if(okNewPsw.value!=newPsw.value){
                okNewPsw.style.border="1px solid red"
                okNewPswMsg.style.display="block"
                okNewPswMsg.style.color="red"
                okNewPswMsg.innerText="两次密码不一致"
            }else {
                okNewPswMsg.style.display="block"
                okNewPswMsg.style.color="green"
                okNewPswMsg.innerText="密码正确"
                return true
            }
        }
        //聚焦 确认密码框
        function okNewPswOnFocus(){
            var okNewPsw=document.getElementById("okNewPsw")
            okNewPsw.style.border="0px solid red"
            okNewPswMsg.style.display="none"
        }
        //提交修改密码请求
        function upPsw(){
            var okNewPsw=document.getElementById("okNewPsw")
            //用户确认
            change=confirm("确定要修改密码吗？")
            if(change){
                //检测输入框数据
                var re2= document.getElementById("oldPswMsg").innerText
                var re1= okNewPswOnBlur()
                console.log(re1,re2)
                if (re1&&re2=="密码正确"){
                    acc=${sessionScope.get('userId')}
                        $.ajax({
                            url:"<%=request.getContextPath()%>/login",
                            method:"post",
                            data:{"cmd":"upPsw","acc":acc,"psw":okNewPsw.value},
                            success:function (re){
                                if (re==1){
                                    alert("修改密码成功")
                                    //清除session登录数据
                                    $.ajax({
                                        url:"<%=request.getContextPath()%>/login",
                                        method:"post",
                                        data:{"cmd":"logout"},
                                        success:function (re){
                                        }
                                    })
                                    //跳转到登录页
                                    window.location.href="../LoginOrEnroll/login.html"
                                }else {
                                    alert("修改密码失败")
                                }
                            }
                        })
                }else {
                    alert("修改密码，输入数据格式有误，请检查输入格式")
                }
            }
        }
        //按钮切换功能
        //个人资料div
        function showPersonalData(){
            document.getElementById("headPortrait").style.display="block"
            document.getElementById("changePSD").style.display="none"
        }
        //修改密码功能div
        function showUpPassword(){
            document.getElementById("changePSD").style.display="block"
            document.getElementById("headPortrait").style.display="none"
        }
    </script>
</head>
<body>
    <div id="head">
    </div>
    <div id="content">
<%--        左边功能区--%>
        <div id="left">
            <div id="left-top">
                <c:if test="${not empty sessionScope.get('userImg')}">
                    <img src="${sessionScope.get('userImg')}" style="border-radius: 50px;width: 100px;height: 100px;margin: auto;margin: 20px 0px 20px 40px">
                    <p style="text-align: center">${sessionScope.get('userName')}</p>
                </c:if>
                <c:if test="${empty sessionScope.get('userImg')}">
                    <img src="<%=request.getContextPath()%>/img/头像_商务男士.png" style="border-radius: 50px;width: 100px;height: 100px;margin: auto;margin: 20px 0px 20px 40px">
                    <p style="text-align: center">${sessionScope.get('userName')}</p>
                </c:if>
            </div>
            <div id="left-bottom">
                <p onclick="showPersonalData()">个人资料</p>
                <p onclick="showUpPassword()">修改密码</p>
                <p>我的收藏</p>
                <p>我的问答</p>
            </div>
        </div>
<%--        右边内容区--%>
        <div id="right">
<%--            头像--%>
            <div id="headPortrait" style="display: none">
                <ul>
                    <li><p>头像</p></li>
                    <li><img  src="../img/imgAdd.png"></li>
                    <li><input type="file" name="pic" id="pic" onchange="showImg()" accept="image/gif, image/jpeg"><input type="button" value="开始上传" style="height: 40px;width: 80px"></li>
                </ul>
            </div>
<%--    修改密码--%>
            <div id="changePSD">
                <ul style="margin: auto;margin-left: 20px">
                    <li>
                        <ul>
                            <li>旧密码<input type="text" id="oldPsw" name="oldPsw" placeholder="正在使用的密码" onblur="oldPswOnBlur()" onfocus="oldOnFocus()"></li>
                            <li id="oldPswMsg" style="display: none"></li>
                        </ul>
                    </li>
                    <li>
                        <ul>
                            <li>新密码<input type="text" id="newPsw" name="newPsw" placeholder="新的密码"></li>
                            <li id="newPswMsg" style="display: none"></li>
                        </ul>
                    </li>
                    <li>
                        <ul>
                            <li>确认密码<input type="text" id="okNewPsw" name="okNewPsw" placeholder="再输入一次新的密码" onblur="okNewPswOnBlur()" onfocus="okNewPswOnFocus()"></li>
                            <li id="okNewPswMsg" style="display: none"></li>
                        </ul>
                    </li>
                    <li>
                        <input type="button" value="确认" onclick="upPsw()">
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
