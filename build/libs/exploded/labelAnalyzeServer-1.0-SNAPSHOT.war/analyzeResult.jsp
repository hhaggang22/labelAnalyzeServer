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
        <script>
            $(document).ready(function (){
                list = ${jsonResult};

                for(var loop = 0; loop < list.length; loop++){
                    console.log('waterwash : ' + list[loop].waterwash);
                    console.log('bleach : ' + list[loop].bleach);
                    console.log('ironing : ' + list[loop].ironing);
                    console.log('dry : ' + list[loop].dry);
                    console.log('drycleaning : ' + list[loop].drycleaning);
                }
            })
        </script>


    </body>
</html>
