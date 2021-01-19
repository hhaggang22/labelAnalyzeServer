<%--
  Created by IntelliJ IDEA.
  User: kimhakeyong
  Date: 2021/01/20
  Time: 3:02 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Label Analyze Page</title>

    <link rel="stylesheet" href="css/style.css">

    <script>
        function setImage(event){
            var reader = new FileReader();

            reader.onload = function (event){
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);
                document.querySelector("div#image_container").appendChild(img);
            };

            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
</head>
<body>
<div class = "wrapper">
    <div class = "imageSelect">
        <h2> 이미지를 업로드하고 해당 라벨에 있는 정보를 입력하세요. </h2>
        <input type="file" id="image" accept="image/*" onchange="setImage(event);"/>
        <div id ="image_container"></div>
    </div>

    <div class = "category">
        <form method="post" action="Analyze">
            <!-- 물세탁 카테고리 -->
            <h3>1. 물세탁</h3>
            <ul>
                <li>
                    <label><input type="checkbox" class="cate1_1" name="cate1" value="손세탁가능">손세탁가능<br>
                        <img src="img/waterwash/handwash.png">
                    </label>
                </li>
                <li>
                    <label><input type="checkbox" class="cate1_1" name="cate1" value="손세탁불가능">손세탁불가능<br>
                        <img src="img/waterwash/nohandwash.png">
                    </label>
                </li>
                <li>
                    <label><input type="checkbox" class="cate1_1" name="cate1" value="세탁기 약 30도 중성">세탁기 약 30도 중성<br>
                        <img src="img/waterwash/machine_30.png">
                    </label>
                </li>
                <li>
                    <label><input type="checkbox" class="cate1_1" name="cate1" value="세탁기 약 40도">세탁기 약 40<br>
                        <img src="img/waterwash/machine_40.png">
                    </label>
                </li>
                <li>
                    <label><input type="checkbox" class="cate1_1" name="cate1" value="세탁기 40">세탁기 40도<br>
                        <img src="img/waterwash/machine40.png">
                    </label>
                </li>
                <li>
                    <label><input type="checkbox" class="cate1_1" name="cate1" value="세탁기 60">세탁기 60도<br>
                        <img src="img/waterwash/machine60.png">
                    </label>
                </li>
                <li>
                    <label><input type="checkbox" class="cate1_1" name="cate1" value="세탁기 95도">세탁기 95도<br>
                        <img src="img/waterwash/machine95.png">
                    </label>
                </li>
            </ul>

            <!-- 표백 카테고리 -->
            <!-- 다림질 카테고리 -->
            <!-- 건조 카테고리 -->
            <!-- 드라이클리닝 카테고리 -->



        </form>
    </div>
</div>

</body>
</html>