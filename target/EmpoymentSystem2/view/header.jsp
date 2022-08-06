<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WZQ
  Date: 2022/6/11
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
</head>
<script src="<%=request.getContextPath()%>/js/jquery1.12.4.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css" />
<body>
<div id="header">
    <div id="btn">
        <c:if test="${sessionScope.user != null}">
            <img src="<%=request.getContextPath()%>/img/user.png" width="50px" height="50px" class="user" >
            <div class="username">
                <ul id="userCon">
                    <li>
                        欢迎你：    ${sessionScope.user.trueName}
                        <ul class="infoUser">
                            <li><a href="<%=request.getContextPath()%>/view/intentionManage.jsp">个人资料</a></li>
                            <li><a href="<%=request.getContextPath()%>/view/homeSetPwd.jsp">修改密码</a></li>
                            <li><a href="#" onclick="logOut()">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </c:if>
        <c:if test="${sessionScope.user == null}">
            <button type="button" class="login"><a href="<%=request.getContextPath()%>/view/stuLogin.jsp">登录</a></button>
            <button type="button" class="enroll"><a href="enroll.html">注册</a></button>
        </c:if>
    </div>
    <div id="logo1">
        <img src="<%=request.getContextPath()%>/img/卓跃教育矢量logo（转曲)蓝色.png" width="243px" height="66px" class="logo">
    </div>

    <div class="menuDiv">
        <ul class="menu">
            <img src="<%=request.getContextPath()%>/img/head_logo3.png" width="24px" height="25px" class="logo3">
        </ul>
        <ul class="menu">
            <li>
                资讯频道
                <ul>
                    <li>时政要闻</li>
                    <hr>
                    <li>重要新闻</li>
                    <hr>
                    <li>中心动态</li>
                    <hr>
                    <li>专题资讯</li>
                    <hr>
                    <li>国际动态</li>
                    <hr>
                    <li>往期轮播</li>
                </ul>
            </li>
        </ul>
        <ul class="menu">
            <li>
                业务频道
                <ul>
                    <li>就业服务</li>
                    <hr>
                    <li>创新创业</li>
                    <hr>
                    <li>培训鉴定</li>
                    <hr>
                    <li>劳动关系</li>
                    <hr>
                    <li>社会保障</li>
                </ul>
            </li>
        </ul>
        <ul class="menu">
            <li>
                工作平台
                <ul>
                    <li>就业平台</li>
                    <hr>
                    <li>新职业平台</li>
                    <hr>
                    <li>专版专栏</li>
                </ul>
            </li>
        </ul>
        <ul class="menu">
            <li>
                政策法规
                <ul>
                    <li>就业平台</li>
                    <hr>
                    <li>新职业平台</li>
                    <hr>
                    <li>专版专栏</li>
                </ul>
            </li>
        </ul>
        <ul class="menu">
            <li>
                数据频道
                <ul>
                    <li>就业平台</li>
                    <hr>
                    <li>新职业平台</li>
                    <hr>
                    <li>专版专栏</li>
                </ul>
            </li>
        </ul>
        <ul class="menu">
            <li>
                便民服务
                <ul>
                    <li>就业平台</li>
                    <hr>
                    <li>新职业平台</li>
                    <hr>
                    <li>专版专栏</li>
                </ul>
            </li>
        </ul>
        <ul class="menu">
            <li>
                关于我们
                <ul>
                    <li>就业平台</li>
                    <hr>
                    <li>新职业平台</li>
                    <hr>
                    <li>专版专栏</li>
                </ul>
            </li>
        </ul>
    </div>

</div>
</body>
<script>
    function logOut() {
        $.ajax({
            url:"<%=request.getContextPath()%>/studentLogin",
            method:"post",
            data:{
                "action":"logout"
            },
            success:function (result) {
                if (result == 1){
                    alert("退出成功");
                    <%--location.href="<%=request.getContextPath()%>/view/homepage.jsp"--%>
                    window.location.reload();
                }else {
                    alert("退出失败")
                }
            }
        })
    }
</script>
</html>
