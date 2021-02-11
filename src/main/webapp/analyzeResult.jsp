<%--
  Created by IntelliJ IDEA.
  User: kimhakeyong
  Date: 2021/01/20
  Time: 9:25 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Analyze Result Page</title>
        <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
    </head>
    <body>

    <div>
        <%= request.getAttribute("jsonResult")%>
    </div>

    <div>
        <%= request.getAttribute("infoArray")%>
    </div>

    </body>
</html>
