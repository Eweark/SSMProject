<%--
  Created by IntelliJ IDEA.
  User: 慕寒
  Date: 2022/6/14
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
  <style type="text/css">


    #content_upd{
      width: 500px;
      height: 100vh;
      position: absolute;
      left: 0;
      top: 50px;
      background-color: rgba(245, 222, 179, 0);
      /*display: none;*/
      text-align: center;
        margin-left: 514px;
    }

    #content_upd>form{
      width: 500px;
      height: 300px;
      margin: -100px auto auto -500px; /*上右下左*/
      background-color: wheat;
      position: absolute;
      left: 50%;
      top: 40%;
      display: block;
      text-align: center;
    }

    #content_upd>form>table{
      margin-left: 100px;

    }

    .upload{
        margin: -20px auto auto -500px; /*上右下左*/
    }
      #old{
          display: none;
      }
      #rePwd{
          display: none;
      }
      #head{
          margin-top: -47px;
          margin-left: -190px;
      }
      #upload{
          margin-top: -55px;
          margin-left: 50px;
      }
      #headForm{
          margin-top: 40px;
          height: 200px;
          margin-left: 1291px;
      }
  </style>
    <script src="<%=request.getContextPath()%>/js/jquery1.12.4.js"></script>
</head>
<body>
    <!-- --------------------------------------------------------------------- -->
    <div id="content_upd" style="height: 350px">
        <form id="updForm">
            <input type="hidden" name="action" value="updatePwd">
            <table border="0" cellspacing="4" cellpadding="3">
                <tr><h1>修改密码</h1></tr>
                <tr>
                    <td>旧&nbsp&nbsp密&nbsp&nbsp码：</td>
                    <td><input type="password" name="oldPwd" id="oldPwd" onblur="checkPwd()"/></td>
                    <td id="old">旧密码错误！</td>
                </tr>
                <tr>
                    <td>新&nbsp&nbsp密&nbsp&nbsp码：</td>
                    <td><input type="password" name="newPwd" id="newPwd"/></td>
                </tr>
                <tr>
                    <td>确认密码：</td>
                    <td><input type="password" name="conPwd" id="conPwd" onblur="checkNew()"/></td>
                    <td id="rePwd">两次密码不一样！</td>
                </tr>
                <tr style="text-align: center;">
                    <td><input type="button" value="修改" onclick="updPwd1()"></td>
                    <td><input type="button" value="取消"  onclick="cancel_2()" ></td>
                </tr>
            </table>
        </form>
    </div>
    <div>

        <div class="upload">
            <input type="file" name="myFile" id="myFile" value="上传头像" onchange="uploadHead()">
        </div>
        <div id="head">

        </div>
        <button id="upload" name="upload" onclick="upload()">上传头像</button>
    </div>

</body>
<script type="text/javascript">
    function checkPwd() {
        var oldInput = $("#oldPwd").val();

        if (oldInput == ${sessionScope.user.user_pwd}){
            $("#oldPwd").css("border","2px solid green");
            $("#old").css("display","none")
        }else {
            $("#oldPwd").css("border","1px solid red");
            $("#old").css("display","block")
        }
    }
    function checkNew() {
        var newPwd = $("#newPwd").val();
        var reNewPwd = $("#conPwd").val();
        if (newPwd == reNewPwd){
            $("#conPwd").css("border","2px solid green");
            $("#rePwd").css("display","none")
        }else {
            $("#conPwd").css("border","1px solid red");
            $("#rePwd").css("display","block")
        }
    }

    function updPwd1() {
        $.ajax({
            url:"<%=request.getContextPath()%>/studentLogin",
            method:"post",
            data:$("#updForm").serialize(),
            success:function (result) {
                if (result == 1){
                    alert("修改成功");
                    location.href="<%=request.getContextPath()%>/view/stuLogin.jsp"
                }else {
                    alert("修改失败")
                }
            }
        })
    }

    function getObjectURL(file) {
        var url = null;
        if (window.createObjcectURL != undefined) {
            url = window.createOjcectURL(file);
        } else if (window.URL != undefined) {
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) {
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    }
    document.getElementById("myFile").files[0]
    function uploadHead(){
        var objURL = getObjectURL(document.getElementById("myFile").files[0])
        // alert(path);
        $('#head').html("<img src='" + objURL + "' alt='Alternate Text' width='80px' height='80px' id='target' />");
        cutImg();//自定义的裁剪图片函数
    }

    function upload() {
        var formData = new FormData();
        formData.append("file", $("#uploadImage")[0].files[0]);
        $.ajax({
            url: basePath + "/upload.action",
            type: "post",
            data: formData,
            processData: false, // 告诉jQuery不要去处理发送的数据
            contentType: false, // 告诉jQuery不要去设置Content-Type请求头
            dataType: 'text',
            success: function(data) {
                var params = JSON.parse(data)
                $("#img").attr("src", params);
            },
            error: function(data) {
                $('#head').html("<img src='" + objURL + "' alt='Alternate Text' width='80px' height='80px' id='target' />");
            }
        });
        
    }
    
</script>
</html>
