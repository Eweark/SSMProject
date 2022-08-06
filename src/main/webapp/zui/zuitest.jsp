<%--
  Created by IntelliJ IDEA.
  User: WZQ
  Date: 2022/6/24
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/zui-1.10.0/dist/css/zui.min.css">
</head>
<body>

<div class="col-12" style="height: 50px;background-color: lightblue">
    <i class="icon icon-spin icon-spinner-snake icon-5x "></i>
    <img src="http://openzui.com/docs/img/img2.jpg" width="200px" height="200px" class="img-circle" alt="圆形图片">
</div>
<div class="col-3" style="background-color: grey;height: 500px;float: left">
    <div class="progress">
        <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%" id="myPro">
            <span class="sr-only">40% Complete (success)</span>
        </div>
    </div>
</div>
<div class="col-9" style="background-color: #A52A2A ;height: 500px;float: left">
    <div id="myNiceCarousel" class="carousel slide" data-ride="carousel">
        <!-- 圆点指示器 -->
        <ol class="carousel-indicators">
            <li data-target="#myNiceCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myNiceCarousel" data-slide-to="1"></li>
            <li data-target="#myNiceCarousel" data-slide-to="2"></li>
        </ol>

        <!-- 轮播项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <img alt="First slide" src="http://openzui.com/docs/img/slide1.jpg">
                <div class="carousel-caption">
                    <h3>我是第一张幻灯片</h3>
                    <p>:)</p>
                </div>
            </div>
            <div class="item">
                <img alt="Second slide" src="http://openzui.com/docs/img/slide2.jpg">
                <div class="carousel-caption">
                    <h3>我是第二张幻灯片</h3>
                    <p>0.0</p>
                </div>
            </div>
            <div class="item">
                <img alt="Third slide" src="http://openzui.com/docs/img/slide3.jpg">
                <div class="carousel-caption">
                    <h3>我是第三张幻灯片</h3>
                    <p>最后一张咯~</p>
                </div>
            </div>
        </div>

        <!-- 项目切换按钮 -->
        <a class="left carousel-control" href="#myNiceCarousel" data-slide="prev">
            <span class="icon icon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#myNiceCarousel" data-slide="next">
            <span class="icon icon-chevron-right"></span>
        </a>
    </div>
</div>

</body>
<script src="<%=request.getContextPath()%>/js/jquery1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/zui-1.10.0/dist/js/zui.min.js"></script>
</html>
