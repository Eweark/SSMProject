
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        #left{
            width: 300px;
            height: 800px;
            border: 1px solid black;
            float: left;
        }
        #right{
            width: 400px;
            height: 800px;
            border: 1px solid black;
            float: left;
            margin-left: 30px;
        }
        #leftTitle{
            height: 50px;
            border-bottom: 1px solid black;
            text-align: center;
        }
        #rightTitle{
            height: 50px;
            border-bottom: 1px solid black;
            text-align: center;
        }
        .roleName>p{
            text-align: center;
            border-bottom: 1px solid black;
        }
        .roleName>p:hover{
            background-color: orange;
        }
        .powerList li{
            list-style-type: none;
        }

    </style>
    <script src="<%=request.getContextPath()%>/js/jquery1.12.4.js"></script>
</head>
<body>
<div id="left">
    <div id="leftTitle">
        <h1>角色</h1>
    </div>
    <div id="leftContent">

    </div>
</div>
<div id="right">
    <div id="rightTitle">
    <h1>权限</h1>
</div>
    <div id="rightContent">
    </div>
</div>
</body>
<script>
    var rId;
    findAllRole();
    function findAllRole() {
        $.ajax({
            url:"<%=request.getContextPath()%>/roleManage?action=allRole",
            success:function (result) {
                var map = JSON.parse(result);
                var roleList = map.allRole;
                var powerList = map.allPower;
                var html = "";
                for (var i = 0; i <roleList.length ; i++) {
                    html += "<div class='roleName'>";
                    html += "<p onclick='selPower("+roleList[i].roleId+")'>"+roleList[i].roleName+"</p>";
                    html += "<div>";
                }
                document.getElementById("leftContent").innerHTML=html;

                var powerHtml = "";
                console.log(powerList);
                for (var i = 0; i <powerList.length ; i++) {
                    powerHtml+="<ul class='powerList'>";
                    if (powerList[i].parentId==0){
                        powerHtml+="<li><input type='checkbox' class='powerChild'  onclick='changePower("+powerList[i].powerId+")' id='H"+powerList[i].powerId+"' />"+powerList[i].powerName;
                        powerHtml+=addChild(powerList,powerList[i].powerId);
                        powerHtml+="</li>"
                    }
                    powerHtml+="</ul>";
                }
                document.getElementById("rightContent").innerHTML=powerHtml;
            }
        })
    }
    //根据id查询其权限
    function selPower(id) {
        rId = id;
        $(".powerChild").prop("checked", false);

        $.ajax({
            url:"<%=request.getContextPath()%>/roleManage?action=selPowerById",
            method:"post",
            data:{"roleId":id},
            success:function (result) {
                console.log(result);
                var powerList = JSON.parse(result);
                for (var i = 0; i <powerList.length ; i++) {
                    $("#H"+powerList[i].powerId).prop("checked", true);
                }

            }
        })
    }
    //添加子菜单
    function addChild(powerList,powerId) {
        childHtml = '';
        for (var i = 0; i <powerList.length ; i++) {
            if (powerList[i].parentId == powerId){
                childHtml+="<li><input type='checkbox' class='powerChild'  onclick='changePower("+powerList[i].powerId+","+rId+")' id='H"+powerList[i].powerId+"' />"+powerList[i].powerName+"</li>"
            }
        }
        if (childHtml!=''){
            childHtml="<ul>"+childHtml+"</ul>"
        }
        return childHtml;
    }
    //修改权限
    function changePower(powerId) {
        path = "";
        var checked = $("#H"+powerId).prop("checked");
        if (checked){
            path = "<%=request.getContextPath()%>/roleManage?action=insertPower";
        }else{
            path = "<%=request.getContextPath()%>/roleManage?action=deletePower";
        }
        $.ajax({
            url:path,
            method:"post",
            data:{
                "roleId":rId,
                "powerId":powerId
            },
            success:function (result) {
                if (result == 1){
                    console.log("成功！")
                }else {
                    console.log("失败！")
                }

            }
        })

    }
</script>
</html>
