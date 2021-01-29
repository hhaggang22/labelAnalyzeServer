<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
</head>
<body>
<button id="btn">확인</button>
<div id="area1" class="area"></div>
<script>
    $("btn").click(function (){
        $.ajax({
            url : "/Connection",
            data : {index : index},
            type : "get",
            success : function (data){
                console.log(data);
                var html = "<table border='1'>";
                html += "</table>";
                $("#area1").html(html);
            },
            error : function (data){
                console.log("ajax 처리 실패");
            }
        });
    });
</script>
</body>
</html>