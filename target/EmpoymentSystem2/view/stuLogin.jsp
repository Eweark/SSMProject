<%--
  Created by IntelliJ IDEA.
  User: WZQ
  Date: 2022/6/20
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        body {
            background-image: url(<%=request.getContextPath()%>/img/back.png);
            background-repeat: no-repeat;
            background-size: cover;
        }
        /* .image {
            margin: ;
        } */

        #form {
            width: 600px;
            height: 250px;
            margin: 198px auto;
            border: 1px solid brown;
            border-radius: 20px;
            background-color: #d0dfeac2;
        }

        #form>h1 {
            text-align: center;
        }

        #form>form>table {
            margin: auto;
        }

        .loginBtn {
            width: 150px;
            height: 30px;
            margin-left: 250px;
            border: 1px solid aquamarine;
            border-radius: 20px;
            background-color: blue;
            color: azure;
        }

        .image {
            margin-left: 60px;
            margin-top: -140px;
        }

        .logo {
            margin-top: -60px;
            margin-left: 100px;
        }

        .imgUnder {
            margin-left: 1060px;
            margin-top: -38px;
        }

        .underL {
            text-align: center;
            margin-top: 0;
        }

        .underM {
            text-align: center;
        }

        .under {
            background-color: #d0dfeac2;
            margin: 0;
            padding: 0;
        }

        .enroll {
            margin-left: 500px;
        }
    </style>
    <script src="<%=request.getContextPath()%>/js/jquery1.12.4.js"></script>
</head>
<body>
<div id="form">
    <h1>传一就业管理系统</h1>
    <div class="logo">
        <img src="<%=request.getContextPath()%>/img/logo-01.png" width="50px" height="37px">
    </div>
    <form id="loginForm">
        <input type="hidden" name="action" value="stuLogin">
        <table cellspacing="20">
            <tr>
                <td>
                    账号：
                </td>
                <td>
                    <input type="text" name="accept" placeholder="请输入账号" />
                </td>
            </tr>
            <tr>
                <td>
                    密码：
                </td>
                <td>
                    <input type="password" name="password" placeholder="请输入密码" />
                </td>
            </tr>
        </table>
        <input type="button" class="loginBtn" onclick="loginManage()" value="登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录"/>
        <div class="enroll">
            <a href="enroll.html">注册</a>
        </div>
        <div class="image">
            <img src="<%=request.getContextPath()%>/img/1.png" width="100px" height="100px" title="这是一张图片" />
        </div>
    </form>
</div>
<div class="under">
    <p class="underM">0596-83713060|地址：福州金山大榕树创意园5号楼3层|创造和实现美好梦想的地方 </p>
    <div class="imgUnder">
        <img src="<%=request.getContextPath()%>/img/qq.png" width="20px" height="20px">
        <img src="<%=request.getContextPath()%>/img/wx.png" width="20px" height="20px">
    </div>
    <p class="underL">版权所有 闽ICP备11003491号</p>

</div>
</body>
<script>
    function loginManage() {
        $.ajax({
            url:"<%=request.getContextPath()%>/studentLogin",
            data:$("#loginForm").serialize(),
            method:"post",
            success:function (result) {
                if (result == 1){
                    alert("登录成功");
                    window.location.href="<%=request.getContextPath()%>/view/homepage.jsp"
                }else {
                    alert("登录失败")
                }

            }
        })
    }
</script>
</html>
