<%--
  Created by IntelliJ IDEA.
  User: WZQ
  Date: 2022/6/11
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css" />
</head>
<body>
<div id="msg">
    <div><img src="<%=request.getContextPath()%>/img/right_banner1.png" width="50px" height="46px"><br>网上调查</div>
    <div class="wechat"><img src="<%=request.getContextPath()%>/img/right_banner2.png" width="50px" height="46px">
        <div class="img">
            <img src="<%=request.getContextPath()%>/img/code.jpg" width="258px" height="258px">

        </div>
        <br>
        公众号
    </div>
    <div><img src="<%=request.getContextPath()%>/img/right_banner8.png" width="50px" height="46px"><br>留言板</div>
    <div><img src="<%=request.getContextPath()%>/img/right_banner9.png" width="50px" height="46px"><br>高级搜索</div>
</div>
<%@include file="header.jsp"%>

<div id="banner">
    <img class="img-side img1" src="<%=request.getContextPath()%>/img/banner/ZH-CN8809175725.jpg" alt="1" height="300px" width="82.3%">
    <img class="img-side img2" src="<%=request.getContextPath()%>/img/banner/ZH-CN8809655435.jpg" alt="2" height="300px" width="82.3%">
    <img class="img-side img3" src="<%=request.getContextPath()%>/img/banner/ZH-CN8821036782.jpg" alt="3" height="300px" width="82.3%">
    <img class="img-side img4" src="<%=request.getContextPath()%>/img/banner/ZH-CN8824105008.jpg" alt="4" height="300px" width="82.3%">
</div>
<div id="content">
    <div id="message">
        <div class="news1">
            <div class="title1" id="n1" onmouseover="myClickshow('sub','n1')">
                时政要闻
            </div>
            <div id="sub">
                <img src="<%=request.getContextPath()%>/img/103448_320x205c.jpg" class="img-1">
                <div class="con1">
                    <h4>习近平会见第九次全国信访工作会议代表 李克强王沪宁韩正参加会见</h4>
                    <hr style="width: 400px; float: right;">
                    <p>新华社北京5月26日电
                        第九次全国信访工作会议25日至26日在京召开。中共中央总书记、国家主席、中央军委主席习近平亲切会见会议代表，向受表彰的先进集体和先进个人表示热烈祝贺，向全...</p>
                </div>
                <div class="con2">
                    <p>关于公布2022年上半年创业培训讲师培训汇总信息的函（中就.. <span class="date1">02-18</span></p>
                    <p>中国就业培训技术指导中心推出首批缺工职业的线上培训资源... <span class="date1">02-18</span></p>
                    <p>关于公布2022年上半年创业培训讲师培训汇总信息的函（中就.. <span class="date1">01-25</span></p>
                    <p>中国就业培训技术指导中心推出首批缺工职业的线上培训资源... <span class="date1">01-20</span></p>
                    <p>关于公布2022年上半年创业培训讲师培训汇总信息的函（中就.. <span class="date1">12-24</span></p>
                    <p>关于公布2022年上半年创业培训讲师培训汇总信息的函（中就.. <span class="date1">12-18</span></p>
                </div>
            </div>
        </div>
        <div class="">
            <div class="title1" id="n2" onmouseover="myClickshow('sub1','n2')">
                重要新闻
            </div>
            <div id="sub1">
                <img src="<%=request.getContextPath()%>/img/100301_320x205c.jpg" class="img-1">
                <div class="con1">
                    <h4>习近平会见第九次全国信访工作会议代表 李克强王沪宁韩正参加会见</h4>
                    <hr style="width: 400px; float: right;">
                    <p>新华社北京5月26日电
                        第九次全国信访工作会议25日至26日在京召开。中共中央总书记、国家主席、中央军委主席习近平亲切会见会议代表，向受表彰的先进集体和先进个人表示热烈祝贺，向全...</p>
                </div>
                <div class="con2">
                    <p>关于公布2022年上半年创业培训讲师培训汇总信息的函（中就.. <span class="date1">02-18</span></p>
                    <p>中国就业培训技术指导中心推出首批缺工职业的线上培训资源... <span class="date1">02-18</span></p>
                    <p>关于公布2022年上半年创业培训讲师培训汇总信息的函（中就.. <span class="date1">01-25</span></p>
                    <p>中国就业培训技术指导中心推出首批缺工职业的线上培训资源... <span class="date1">01-20</span></p>
                    <p>关于公布2022年上半年创业培训讲师培训汇总信息的函（中就.. <span class="date1">12-24</span></p>
                    <p>关于公布2022年上半年创业培训讲师培训汇总信息的函（中就.. <span class="date1">12-18</span></p>
                </div>
            </div>
        </div>
        <div class="">
            <div class="title1" id="n3" onmouseover="myClickshow('sub2','n3')">
                中心动态
            </div>
            <div id="sub2">
                <img src="<%=request.getContextPath()%>/img/102190_320x205c.png" class="img-1">
                <div class="con1">
                    <h4>习近平会见第九次全国信访工作会议代表 李克强王沪宁韩正参加会见</h4>
                    <hr style="width: 400px; float: right;">
                    <p>新华社北京5月26日电
                        第九次全国信访工作会议25日至26日在京召开。中共中央总书记、国家主席、中央军委主席习近平亲切会见会议代表，向受表彰的先进集体和先进个人表示热烈祝贺，向全...</p>
                </div>
                <div class="con2">
                    <p>关于公布2022年上半年创业培训讲师培训汇总信息的函（中就.. <span class="date1">02-18</span></p>
                    <p>中国就业培训技术指导中心推出首批缺工职业的线上培训资源... <span class="date1">02-18</span></p>
                    <p>关于公布2022年上半年创业培训讲师培训汇总信息的函（中就.. <span class="date1">01-25</span></p>
                    <p>中国就业培训技术指导中心推出首批缺工职业的线上培训资源... <span class="date1">01-20</span></p>
                    <p>关于公布2022年上半年创业培训讲师培训汇总信息的函（中就.. <span class="date1">12-24</span></p>
                    <p>关于公布2022年上半年创业培训讲师培训汇总信息的函（中就.. <span class="date1">12-18</span></p>
                </div>
            </div>
        </div>

    </div>
    <div id="message2">
        <div id="">
            <div class="title2" id="n4" onmouseover="policyClickshow('policy','n4')">
                中央政策
            </div>
            <div class="info" id="policy">
                <br><br><br>
                <ul>
                    <li>国务院办公厅印发《关于进一步做好...</li>
                    <li>人力资源社会保障部办公厅 中国残联...</li>
                    <li>人力资源社会保障部办公厅关于加快...</li>
                    <li>人力资源社会保障部办公厅 中央网信...</li>
                    <li>国务院办公厅印发《关于进一步做好...</li>
                    <li>人力资源社会保障部办公厅 中国残联...</li>
                    <li>人力资源社会保障部办公厅关于加快...</li>
                    <li>人力资源社会保障部办公厅 中央网信...</li>
                    <li>国务院办公厅印发《关于进一步做好...</li>

                </ul>
            </div>
            <div id="">
                <div class="title3" id="n5" onmouseover="policyClickshow('policy2','n5')">
                    地方政策
                </div>
                <div class="info" id="policy2">
                    <br><br>
                    <ul>
                        <li>人力资源社会保障部办公厅 中国残联...</li>
                        <li>人力资源社会保障部办公厅 中国残联...</li>
                        <li>人力资源社会保障部办公厅关于加快...</li>
                        <li>人力资源社会保障部办公厅 中央网信...</li>
                        <li>人力资源社会保障部办公厅 中国残联...</li>
                        <li>人力资源社会保障部办公厅 中国残联...</li>
                        <li>人力资源社会保障部办公厅关于加快...</li>
                        <li>人力资源社会保障部办公厅 中央网信...</li>
                        <li>人力资源社会保障部办公厅 中国残联...</li>
                    </ul>
                </div>
            </div>
        </div>

    </div>

    <!-- 专版专栏 -->
    <div id="special">
        <div class="spimg" style="background-image: url(<%=request.getContextPath()%>/img/index_special3.jpg);">
            <!-- <img src="img/index_special3.jpg" id="img_1" class="img_1_class"> -->
        </div>
        <div class="spimg" style="background-image: url(<%=request.getContextPath()%>/img/index_special6.jpg);">
            <!-- <img src="img/index_special6.jpg" id="img_2" class="img_1_class"> -->
        </div>
        <div class="spimg" style="background-image: url(<%=request.getContextPath()%>/img/index_special7.jpg);">
            <!-- <img src="img/index_special7.jpg" id="img_3" class="img_1_class"> -->
        </div>
        <div class="spimg" style="background-image: url(<%=request.getContextPath()%>/img/newspecial.jpg);">
            <!-- <img src="img/newspecial.jpg" id="img_4" class="img_1_class"> -->
        </div>
    </div>
    <div id="message3">
        <div id="server_work">
            <h2>业务工作</h2>
            <div class="ser_title_div">
                <div class="server_title" id="work_01" onmouseover="serClickSow('ser_01','work_01')">就业服务</div>
                <div class="server_title" id="work_02" onmouseover="serClickSow('ser_02','work_02')">创新创业</div>
                <div class="server_title" id="work_03" onmouseover="serClickSow('ser_03','work_03')">培训鉴定</div>
                <div class="server_title" id="work_04" onmouseover="serClickSow('ser_04','work_04')">劳动关系</div>
                <div class="server_title" id="work_05" onmouseover="serClickSow('ser_05','work_05')">社会保障</div>
            </div>
            <hr style="width: 750px; margin-top: 40px;">
            <div class="servr_01" id="ser_01">
                <!-- <br> -->
                <ul>
                    <li>2021年三项社会保险收入同比增长34.6% 全年城镇新增就业1269万人 <span class="date1">02-18</span></li>
                    <li>江西上饶：开启就业见习工作“云”培训会 <span class="date1">02-18</span></li>
                    <li>河北南皮：精准施策、靶向发力，助力该县经济平稳高质量发展 <span class="date1">02-18</span></li>
                    <li>宁夏：二十条政策措施全力以赴促进高校毕业生更加充分更高质量就业 <span class="date1">02-18</span></li>
                    <li>江西：截至5月底，脱贫劳动力实现就业137.5万人 <span class="date1">02-18</span></li>
                    <li>河北张家口：打出政策组合拳稳岗促就业 <span class="date1">02-18</span></li>
                    <li>河北省秦皇岛市北戴河新区多举措助力高校毕业生就业创业 <span class="date1">02-18</span></li>
                    <li>上海：新出台两项稳就业补贴政策 <span class="date1">02-18</span></li>
                </ul>
            </div>
            <div class="servr_01" id="ser_02">
                <!-- <br> -->
                <ul>
                    <li>河北南皮：精准施策、靶向发力，助力该县经济平稳高质量发展 <span class="date1">02-18</span></li>
                    <li>河北南皮：精准施策、靶向发力，助力该县经济平稳高质量发展 <span class="date1">02-18</span></li>
                    <li>河北南皮：精准施策、靶向发力，助力该县经济平稳高质量发展 <span class="date1">02-18</span></li>
                    <li>宁夏：二十条政策措施全力以赴促进高校毕业生更加充分更高质量就业 <span class="date1">02-18</span></li>
                    <li>河北南皮：精准施策、靶向发力，助力该县经济平稳高质量发展 <span class="date1">02-18</span></li>
                    <li>河北张家口：打出政策组合拳稳岗促就业 <span class="date1">02-18</span></li>
                    <li>河北省秦皇岛市北戴河新区多举措助力高校毕业生就业创业 <span class="date1">02-18</span></li>
                    <li>河北南皮：精准施策、靶向发力，助力该县经济平稳高质量发展 <span class="date1">02-18</span></li>
                </ul>
            </div>
            <div class="servr_01" id="ser_03">
                <!-- <br> -->
                <ul>
                    <li>河北张家口：打出政策组合拳稳岗促就业 <span class="date1">02-18</span></li>
                    <li>江西上饶：开启就业见习工作“云”培训会 <span class="date1">02-18</span></li>
                    <li>河北南皮：精准施策、靶向发力，助力该县经济平稳高质量发展 <span class="date1">02-18</span></li>
                    <li>宁夏：二十条政策措施全力以赴促进高校毕业生更加充分更高质量就业 <span class="date1">02-18</span></li>
                    <li>江西：截至5月底，脱贫劳动力实现就业137.5万人 <span class="date1">02-18</span></li>
                    <li>河北张家口：打出政策组合拳稳岗促就业 <span class="date1">02-18</span></li>
                    <li>河北省秦皇岛市北戴河新区多举措助力高校毕业生就业创业 <span class="date1">02-18</span></li>
                    <li>上海：新出台两项稳就业补贴政策 <span class="date1">02-18</span></li>
                </ul>
            </div>
            <div class="servr_01" id="ser_04">
                <!-- <br> -->
                <ul>
                    <li>上海：新出台两项稳就业补贴政策 <span class="date1">02-18</span></li>
                    <li>江西上饶：开启就业见习工作“云”培训会 <span class="date1">02-18</span></li>
                    <li>河北南皮：精准施策、靶向发力，助力该县经济平稳高质量发展 <span class="date1">02-18</span></li>
                    <li>宁夏：二十条政策措施全力以赴促进高校毕业生更加充分更高质量就业 <span class="date1">02-18</span></li>
                    <li>江西：截至5月底，脱贫劳动力实现就业137.5万人 <span class="date1">02-18</span></li>
                    <li>河北张家口：打出政策组合拳稳岗促就业 <span class="date1">02-18</span></li>
                    <li>河北省秦皇岛市北戴河新区多举措助力高校毕业生就业创业 <span class="date1">02-18</span></li>
                    <li>上海：新出台两项稳就业补贴政策 <span class="date1">02-18</span></li>
                </ul>
            </div>
            <div class="servr_01" id="ser_05">
                <!-- <br> -->
                <ul>
                    <li>河北张家口：打出政策组合拳稳岗促就业 <span class="date1">02-18</span></li>
                    <li>江西上饶：开启就业见习工作“云”培训会 <span class="date1">02-18</span></li>
                    <li>河北南皮：精准施策、靶向发力，助力该县经济平稳高质量发展 <span class="date1">02-18</span></li>
                    <li>宁夏：二十条政策措施全力以赴促进高校毕业生更加充分更高质量就业 <span class="date1">02-18</span></li>
                    <li>江西：截至5月底，脱贫劳动力实现就业137.5万人 <span class="date1">02-18</span></li>
                    <li>河北张家口：打出政策组合拳稳岗促就业 <span class="date1">02-18</span></li>
                    <li>河北省秦皇岛市北戴河新区多举措助力高校毕业生就业创业 <span class="date1">02-18</span></li>
                    <li>上海：新出台两项稳就业补贴政策 <span class="date1">02-18</span></li>
                </ul>
            </div>
        </div>

    </div>
    <div id="message4">
        <div id="platform_1" onmouseover=changePlaBord("platform_1") onmouseout=restorePlaBord("platform_1")>
            <h2>就业平台</h2>
            <img src="<%=request.getContextPath()%>/img/icon1.png">
        </div>
        <div id="platform_2" onmouseover=changePlaBord("platform_2") onmouseout=restorePlaBord("platform_2")>
            <h2>就创平台</h2>
            <img src="<%=request.getContextPath()%>/img/icon2.png">
        </div>
        <div id="platform_3" onmouseover=changePlaBord("platform_3") onmouseout=restorePlaBord("platform_3")>
            <h2>新职业平台</h2>
            <img src="<%=request.getContextPath()%>/img/icon3.png">
        </div>
        <div id="platform_4" onmouseover=changePlaBord("platform_4") onmouseout=restorePlaBord("platform_4")>
            <h2>专题咨询</h2>
            <img src="<%=request.getContextPath()%>/img/icon4.png">
        </div>

    </div>
    <!-- 指导 -->
    <div id="serverImg">
        <img src="<%=request.getContextPath()%>/img/88472.jpg" height="120px" width="100%" ">
        <img src="<%=request.getContextPath()%>/img/99918.png" height="120px" width="100%" ">
    </div>
    <div id=" fastLink">
        <h2>快捷通道</h2>
        <hr>
        <div class="server">
            <div>12333电话咨询服务</div>
            <div>注册国外资格证书查询</div>
            <div>技能人才评价证书全国联网查询</div>
            <div>全国行业职业技能鉴定机构查询系统</div>
            <div>计算机信息高新技术考试证书查询</div>
            <div>能力证书测评查询</div>
            <div>全国《就业创业证》查询</div>
            <div>公共就业和人才服务机构查询</div>
        </div>
    </div>
</div>
<div id="footer">
    <a href="https://baidu.com">人力资源和社会保障部</a>|<a href="enroll.html">中国公共招聘网</a>|<a href="main.html">世界技能大赛中国组委会</a>|<a href="https://baidu.com">中国国家人才网</a>|<a href="https://baidu.com">中国人力资源市场网</a>|<a href="https://baidu.com">技能人才评价工作网</a>
</div>
</body>
<script type="text/javascript">
    index = 0;

    function changeImage() {
        index++;
        a = document.getElementsByClassName("img-side");
        if (index >= a.length) index = 0;
        for (var i = 0; i < a.length; i++) {
            a[i].style.display = "none"
        }
        a[index].style.display = "block"
    }
    //定时器
    setInterval(changeImage, 3000);
    // 要闻方法
    function myClickshow(one, two) {
        document.getElementById("sub").style.display = "none"
        document.getElementById("sub2").style.display = "none"
        document.getElementById("sub1").style.display = "none"
        document.getElementById("n1").style.backgroundColor = ""
        document.getElementById("n2").style.backgroundColor = ""
        document.getElementById("n3").style.backgroundColor = ""
        event = document.getElementById(one)
        event.style.display = "block"
        document.getElementById(two).style.backgroundColor = "orange"
    }

    function myClickhide(one) {
        event = document.getElementById(one)
        event.style.display = "none"
    }
    // 政策方法
    function policyClickshow(one, two) {
        if (two == "n4") {
            document.getElementById("n5").style.marginTop = "-468px"
            document.getElementById("n5").style.marginLeft = "241px"
            // document.getElementById("n5").style.overflow="hidden"
        } else {
            document.getElementById("n5").style.marginTop = "0px"
            document.getElementById("n5").style.marginLeft = "0px"
        }
        document.getElementById("policy2").style.display = "none"
        document.getElementById("policy").style.display = "none"
        document.getElementById("n4").style.backgroundColor = ""
        document.getElementById("n5").style.backgroundColor = ""
        event = document.getElementById(one)
        event.style.display = "block"
        document.getElementById(two).style.backgroundColor = "orange"
    }
    // 就创平台
    function changePlaBord(one) {
        document.getElementById(one).style.border = "1px solid red"
    }

    function restorePlaBord(one) {
        document.getElementById(one).style.border = "1px solid gray"
    }

    function serClickSow(one,two){
        ser=document.getElementsByClassName("servr_01")
        for (var i = 0; i < ser.length; i++) {
            ser[i].style.display="none"
        }
        tit = document.getElementsByClassName("server_title")
        for (var i = 0; i < tit.length; i++) {
            tit[i].style.color="black"
        }
        document.getElementById(one).style.display="block"
        document.getElementById(two).style.color="red"
    }
</script>
</html>
