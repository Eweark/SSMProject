<%--
  Created by IntelliJ IDEA.
  User: 86138
  Date: 2022/6/13
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>就业意向</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/intentionManage.css" />
    <%--  引入jquery依赖  --%>
    <script src="<%=request.getContextPath()%>/js/jquery1.12.4.js"></script>
</head>
<body style="background-image: url(${pageContext.request.contextPath}/img/back.png); background-size: cover; background-repeat: no-repeat;">
<form id="employment">
    <input type="hidden" name="action" value="addIntention">
    <div id="d1">
        <div id="title">
            <h1>提交就业意向</h1>
        </div>
        <div id="content">

            <div id="acc">
                <div id="inputAcc">
                    省：
                    <select name="province" style="height:25px;width:150px;" id="province"
                            onchange="addCity('province','city')">

                    </select>
                </div>
            </div>
            <div id="pwd">
                市：
                <select name="city" style="height:25px;width:150px;" id="city" onchange="addCity('city','county')">

                </select>
            </div>
            <div id="checkPwd">
                区：
                <select name="county" style="height:25px;width:150px;" id="county">
                </select>
            </div>
            <div id="usertype">
                意向企业：<input style="height:25px;width: 120px;argin-bottom: 30px;" type="text" name="company"
                            placeholder="意向企业">
            </div>
            <div id="sex">
                最低薪资：<input style="height:25px;width: 120px;argin-bottom: 30px;" type="text" name="minMoney"
                            placeholder="最低薪资">
            </div>
            <div id="code">
                最高薪资：<input style="height:25px;width: 120px;argin-bottom: 30px;" type="text" name="maxMoney"
                            placeholder="最高薪资">
            </div>
            <div id="regBtn">
                <input type="button" value="提     交"
                       style="cursor: pointer; width:300px;height:30px;color: white; border-radius: 5px; background-color: blue; font-size: 18px; border: none;"
                       onclick="subIntention()">
            </div>
        </div>
    </div>
</form>
</body>
<script type="text/javascript">
    var reList;
    $.ajax({
        url:"<%=request.getContextPath()%>/region",
        method:"post",
        data:{
            "action":"findAllRegion"
        },
        success:function (result) {
            var list =JSON.parse(result);
            reList = list;
            var html = "<option></option>";
            for (var i = 0; i < list.length ; i++) {
                if (list[i].parentId == 0){
                    html += "<option value ='"+list[i].regionId+"'>"+list[i].regionName+"</option>";
                }
            }
            document.getElementById("province").innerHTML=html;
        }
    });

    // 添加城市与区
    function addCity(select,onselect) {
        var marId = document.getElementById(select).value;
        var cityHtml = "<option></option>";
        for (var i = 0; i < reList.length; i++) {
            if (reList[i].parentId == marId){
                cityHtml += "<option value ='"+reList[i].regionId+"'>"+reList[i].regionName+"</option>";
            }
        }
        document.getElementById(onselect).innerHTML=cityHtml;
    }

    function subIntention() {
        $.ajax({
            url:"<%=request.getContextPath()%>/Intention",
            method:"get",
            data:$("#employment").serialize(),
            success:function (result) {
                if (result == 1){
                    alert("添加成功")
                }else {
                    alert("添加失败")
                }
            }
        })

    }
</script>
</html>
