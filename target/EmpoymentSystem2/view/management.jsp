
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WZQ
  Date: 2022/6/12
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/management.css"/>
    <script src="<%=request.getContextPath()%>/js/jquery1.12.4.js"></script>

</head>
<body>
<div id="header">
    <img src="<%=request.getContextPath()%>/img/logo-01.png" width="50px" height="37px" class="logo">

<%--    <button type="button" onclick="showWin()" class="update">修改密码</button>--%>
    <div>
        <img src="<%=request.getContextPath()%>/img/user.png" width="50px" height="50px" class="user">
        <div id="userInfo">${sessionScope.user}
            <div id="con">
                <p><a href="" style="color: black">修改密码</a></p>
                <p><span style="color: black" onclick="exitLogin()">退出登录</span></p>
            </div>
        </div>
    </div>
    <h1>传一就业后台管理系统</h1>
</div>
<div id="left">

</div>
<div id="right">
    <iframe src="" width="100%" height="100%" name="com"></iframe>

</div>

<!-- 修改密码窗口 -->
<div id="upd">
    <div id="updatePwd">
        <h1>修改密码</h1>
        <p>旧密码：<input type="password" name="pwd1" /></p>
        <p>新密码：<input type="password" name="pwd2" /></p>

        <button type="button">确定</button>
        <button type="button">取消</button>
    </div>
</div>
</body>
<script type="text/javascript">
    <%--showPower();--%>
    <%--function showWin(){--%>
    <%--    // alert("点击了修改密码")--%>
    <%--    // 显示修改密码窗口--%>
    <%--    document.getElementById("upd").style.display="block";--%>
    <%--    document.getElementById("updatePwd").style.display="block";--%>
    <%--}--%>
    <%--function power() {--%>
    <%--    var list = document.getElementsByClassName("H1000");--%>
    <%--    for (var i = 0; i < list.length; i++) {--%>
    <%--        list[i].style.display="none";--%>
    <%--    }--%>
    <%--    <c:forEach items="${sessionScope.powerCode}" var="powerList">--%>
    <%--    document.getElementById('${powerList}').style.display="block";--%>
    <%--    </c:forEach>--%>
    <%--}--%>
    function exitLogin() {
        sessionStorage.clear();
        location.href="<%=request.getContextPath()%>/view/backstage/login.jsp";
    }

    $.ajax({
        url:"<%=request.getContextPath()%>/power?action=powList",
        success:function (result) {
            var powerList = JSON.parse(result);
            var html="";

            for (var i = 0; i <powerList.length ; i++) {
                html+="<ul class='mainMenu'>";
                if (powerList[i].parentId==0){
                    html+="<li>"+powerList[i].powerName;
                    html+=addChild(powerList,powerList[i].powerId);
                    html+="</li>"
                }
                html+="</ul>";
            }

            document.getElementById("left").innerHTML=html;
        }
    });

    function addChild(powerList,powerId) {
        childHtml = '';
        for (var i = 0; i <powerList.length ; i++) {
            if (powerList[i].parentId == powerId){
                childHtml+="<li><a href= '<%=request.getContextPath()%>"+powerList[i].url+"' target=\"com\">"+powerList[i].powerName+"</a></li>"
            }
        }
        if (childHtml!=''){
            childHtml="<ul>"+childHtml+"</ul>"
        }
        return childHtml;
    }

</script>
</body>
</html>
