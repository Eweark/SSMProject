<%--
  Created by IntelliJ IDEA.
  User: Jack
  Date: 2022.06.24
  Time: 6:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="<%=request.getContextPath()%>/js/jquery1.12.4.js"></script>
</head>
<body>
    <div>
        <input type="file" name="myFile" id="myFile">
        <button onclick="doUpload()">提交</button>
    </div>
    <img src="" alt="" id="myimg">
    <script>
        function doUpload() {
            var formData = new FormData();
            var file = $("#myFile")[0].files[0];
            formData.append("file", file);
            $.ajax({
                url: '<%=request.getContextPath()%>/upload',
                type: "post",
                data: formData,
                //默认情况下，processData 的值是 true，其代表以对象的形式上传的数据都会被转换为字符串的形式上传。
                // 而当上传文件的时候，则不需要把其转换为字符串，因此要改成false
                processData: false,
                //代表的是 ajax 的 data 是以字符串的形式 如 id=2019&password=123456
                //使用这种传数据的格式，无法传输复杂的数据，比如多维数组、文件等
                contentType: false,
                dataType: 'text',
                success: function(data) {
                    $("#myimg").attr("src", "<%=request.getContextPath()%>/"+data);
                }
            });
        }
    </script>
</body>
</html>
