<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>就业意向管理</title>
<%--    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/regionManage.css"/>--%>
    <%--  引入jquery依赖  --%>
    <script src="<%=request.getContextPath()%>/js/jquery1.12.4.js"></script>
    <style>
        #pageManage{
            text-align: center;
            margin-top: 100px;
        }
    </style>
</head>
<body>
<!-- 头部 -->

<div id="head">
    <form id="searchForm">
        <input type="hidden" name="action" value="searchLike">
        <input type="hidden" name="pageCurr"  id="pageCurr" value="1">
    <table  cellspacing="10" cellpadding="0" height="100px">
        <tr>
            <td>姓名:</td>
            <td>
                <input type="text" style="height: 30px;width: 200px;  " name="nameInput" id="nameInput" onblur="checkName()" onfocus="setName()"/>
            </td>
            <td>省:</td>
            <td>
                <select style="height: 35px;width: 200px;" name="province" id="province" onchange="addCity('province','city')">
                    <option value="0"></option>

                </select>
            </td>
            <td>市:</td>
            <td>
                <select style="height: 35px;width: 200px;" name="city" id="city" onchange="addCity('city','county')">
                    <option value="0"></option>
                </select>
            </td>
            <td>区:</td>
            <td>
                <select style="width:200px;height: 35px;" id="county" name="county">
                    <option value="0"></option>
                </select>
            </td>
            <br/>
            <td>最低薪资:</td>
            <td>
                <input type="text" style="height: 30px;width: 200px;" id="minMoney" name="minMoney"  onblur="checkMoney('minMoney')" onfocus="setMoney('minMoney')"/>
            </td>
            <td>最高薪资:</td>
            <td>
                <input type="text" style="height: 30px;width: 200px;" id="maxMoney" name="maxMoney" onblur="checkMoney('maxMoney')" onfocus="setMoney('maxMoney')"/>
            </td>
            <td>
                <button type="button" id="search" onclick="searchLike()">搜索</button>
            </td>
        </tr>
    </table>
    </form>
</div>

<!-- 新增页面结束 -->
<div id="content">
    <table border="" cellspacing="10px" cellpadding="" id="tab" onclick="table()" width="100%">
        <tr>
            <th></th>
            <th>姓名</th>
            <th>省</th>
            <th>市</th>
            <th>区</th>
            <th>公司</th>
            <th>最低薪资</th>
            <th>最高薪资</th>
        </tr>
        <tbody id="tb">
        </tbody>
    </table>
</div>
<div id="pageManage">
    <button class="upperPage" id="upperPage" onclick="upperPage()">上一页</button>
    <span id="pageSize" name="pageSize">第页/第页</span>
    <button  class="nextPage" id="nextPage" onclick="nextPage()">下一页</button>
</div>
</body>
<script type="text/javascript">
    var pageCurr = 1;
    var isSearch = 0;
    var maxPage = -1;
    var maxSearch = -1;
    //数字正则
    var isNum = /^\d+$/;
    //数字、字母、下划线正则
    var isName =/^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
    selAll();

    /**
     * 查询所有
     */
    function selAll() {
        $.ajax({
            url:"<%=request.getContextPath()%>/Intention",
            method:"post",
            data:{"action":"selAllIntention",
                "pageCurr":pageCurr
            },
            success:function (result) {
                var map = JSON.parse(result);
                var intentionList = map.intentionList;
                var areaList = map.areaList;
                var pageCount = map.pageCount;
                maxPage = pageCount;
                var html = "";
                for (var i = 0; i < intentionList.length ; i++) {
                    html += "<tr>";
                    html += "<td></td>";
                    html += "<td>"+ intentionList[i].name+"</td>";
                    html += "<td>"+ areaList[i].province+"</td>";
                    html += "<td>"+ areaList[i].city+"</td>";
                    html += "<td>"+ areaList[i].county+"</td>";
                    html += "<td>"+ intentionList[i].company+"</td>";
                    html += "<td>"+ intentionList[i].minSal+"</td>";
                    html += "<td>"+ intentionList[i].maxSal+"</td>";
                    html += "</tr>";
                }
                document.getElementById("tb").innerHTML=html;
                document.getElementById("pageSize").innerText="第"+pageCurr+"页/共"+pageCount+"页";
            }
        })
    }

    /**
     * 下一页
     */
    function nextPage() {
        if (isSearch == 0){
            if (pageCurr+1 <= maxPage){
                pageCurr++;
                selAll();
            }else {
                alert("没有下一页了")
            }

        }else {
            var a = document.getElementById("pageCurr").value;
            if (++a <= maxSearch){
                ++document.getElementById("pageCurr").value;
                searchLike()
            }else {
                alert("没有下一页了")
            }

        }
    }

    /**
     * 上一页
     */
    function upperPage() {
        if (isSearch == 0){
            if (pageCurr-1 > 0){
                pageCurr--;
                selAll();
            }else {
                alert("没有上一页")
            }
        }else {
            if (document.getElementById("pageCurr").value-1 > 0){
                document.getElementById("pageCurr").value--;
                searchLike()
            }else {
                alert("没有上一页了")
            }
        }

    }
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
            var html = "<option value='0'></option>";
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
        var cityHtml = "<option value='0'></option>";
        for (var i = 0; i < reList.length; i++) {
            if (reList[i].parentId == marId){
                cityHtml += "<option value ='"+reList[i].regionId+"'>"+reList[i].regionName+"</option>";
            }
        }
        document.getElementById(onselect).innerHTML=cityHtml;
    }

    /**
     * 模糊查询
     */
    function searchLike() {
        var minMoney = document.getElementById("minMoney").value;
        var maxMoney = document.getElementById("maxMoney").value;
        var name = document.getElementById("nameInput").value;
        var isMinMoney = true;
        var isN = true;
        var isMaxMoney = true;
        if (minMoney != ''){
            isMinMoney = isNum.test(minMoney);
        }else {
            document.getElementById("minMoney").value = 0;
        }
        if (maxMoney != ''){
            isMaxMoney = isNum.test(maxMoney);
        }else {
            document.getElementById("maxMoney").value = 0;
        }
        if (name != ''){
            isN = isName.test(name)
        }
        if (isMinMoney && isMaxMoney && isN){
            searchAjax()
        }else {
            alert("条件输入框有错误！")
        }

    }

    function searchAjax() {
        isSearch = 1;
        $.ajax({
            url:"<%=request.getContextPath()%>/Intention",
            method:"post",
            data:$("#searchForm").serialize(),
            success:function (result) {
                var map = JSON.parse(result);
                var intentionList = map.intentionList;
                var areaList = map.areaList;
                var pageCount = map.pageCount;
                maxSearch = pageCount;
                var html = "";
                for (var i = 0; i < intentionList.length ; i++) {
                    html += "<tr>";
                    html += "<td></td>";
                    html += "<td>"+ intentionList[i].name+"</td>";
                    html += "<td>"+ areaList[i].province+"</td>";
                    html += "<td>"+ areaList[i].city+"</td>";
                    html += "<td>"+ areaList[i].county+"</td>";
                    html += "<td>"+ intentionList[i].company+"</td>";
                    html += "<td>"+ intentionList[i].minSal+"</td>";
                    html += "<td>"+ intentionList[i].maxSal+"</td>";
                    html += "</tr>";
                }
                document.getElementById("tb").innerHTML=html;
                document.getElementById("pageSize").innerText="第"+document.getElementById("pageCurr").value+"页/共"+pageCount+"页";
            }
        })
    }
    function checkMoney(id) {
        var money = document.getElementById(id).value;
        if (isNum.test(money) || money == ''){
            document.getElementById(id).style.border="";
        }else {
            document.getElementById(id).style.border="1px solid red";
            document.getElementById(id).innerText=" ";
            alert("只能输入数字")
        }
    }
    
    function setMoney(id) {
        var money = document.getElementById(id).value;
        if (money == ''){
            document.getElementById(id).style.border="";
        }
    }

    function checkName() {
        var name = document.getElementById("nameInput").value;
        if (isName.test(name) || name == ''){
            document.getElementById("nameInput").style.border="";
        }else {
            document.getElementById("nameInput").style.border="1px solid red";
            alert("姓名只能输入汉字，数字，字母")
        }
    }
    function setName() {
        var name = document.getElementById("nameInput").value;
        if (name == ''){
            document.getElementById("nameInput").style.border="";
        }
    }
</script>
</html>
