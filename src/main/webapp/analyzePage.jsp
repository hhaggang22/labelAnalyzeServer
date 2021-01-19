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

    <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
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

        function setDisplay(){
            let value = $(':radio[name="country"]:checked').val();

            if(value == "1"){
                $('#con1').css('display','block');
                $('#con2').css('display','none');
                $('#con3').css('display','none');
                return false;
            }
            if(value == "2"){
                $('#con1').css('display','none');
                $('#con2').css('display','block');
                $('#con3').css('display','none');
                return false;
            }
            if(value == "3"){
                $('#con1').css('display','none');
                $('#con2').css('display','none');
                $('#con3').css('display','block');
                return false;
            }
        }

    </script>
</head>

<body>
<div class = "wrapper">
    <!--이미지 업로드 부분 -->
    <div class = "imageSelect">
        <h2> 이미지를 업로드하고 해당 라벨에 있는 정보를 입력하세요. </h2>
        <input type="file" id="image" accept="image/*" onchange="setImage(event);"/>
        <div id ="image_container"></div>
    </div>

    <form method="post" action="Analyze">
    <!--나라선택-->
    <input type="radio" name="country" value="1" onchange="setDisplay()" checked="checked">한국
    <input type="radio" name="country" value="2" onchange="setDisplay()">미국
    <input type="radio" name="country" value="3" onchange="setDisplay()">일본

    <!--나라별 세탁정보 선택화면-->
        <!--한국-->
        <div class = "category_korea" id="con1">
            <!-- 물세탁 카테고리 -->
            <div class="cate">
                <h3>1. 물세탁</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="손세탁가능">손세탁가능<br>
                            <img src="img/waterwash/handwash.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="물세탁불가">물세탁불가<br>
                            <img src="img/waterwash/nohandwash.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_약_30도_중성">세탁기 약 30도 중성<br>
                            <img src="img/waterwash/machine_30.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_약_40도">세탁기 약 40<br>
                            <img src="img/waterwash/machine_40.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_40도">세탁기 40도<br>
                            <img src="img/waterwash/machine40.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_60도">세탁기 60도<br>
                            <img src="img/waterwash/machine60.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_95도">세탁기 95도<br>
                            <img src="img/waterwash/machine95.png">
                        </label>
                    </li>
                </ul>
            </div>

            <!-- 표백 카테고리 -->
            <div class="cate">
                <h3>2. 표백</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_산소_표백 불가">염소, 산소, 표백 불가<br>
                            <img src="img/bleach/allno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="산소_표백_불가">산소, 표백 불가<br>
                            <img src="img/bleach/spno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_표백_불가">염소, 표백 불가<br>
                            <img src="img/bleach/ypno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_산소_표백_가능">염소, 산소, 표백 가능<br>
                            <img src="img/bleach/ysp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="산소_표백_가능">산소, 표백 가능<br>
                            <img src="img/bleach/sp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_표백_가능">염소, 표백 가능<br>
                            <img src="img/bleach/yp.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 다림질 카테고리 -->
            <div class="cate">
                <h3>3. 다림질</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="염소_산소_표백 불가">염소, 산소, 표백 불가<br>
                            <img src="img/bleach/allno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="산소_표백_불가">산소, 표백 불가<br>
                            <img src="img/bleach/spno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="염소_표백_불가">염소, 표백 불가<br>
                            <img src="img/bleach/ypno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="염소_산소_표백_가능">염소, 산소, 표백 가능<br>
                            <img src="img/bleach/ysp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="산소_표백_가능">산소, 표백 가능<br>
                            <img src="img/bleach/sp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_표백_가능">염소, 표백 가능<br>
                            <img src="img/bleach/yp.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 건조 카테고리 -->
            <!-- 드라이클리닝 카테고리 -->
        </div>

        <!--미국-->
        <div class = "category_america" id="con2" style="display: none">
            <!-- 물세탁 카테고리 -->
            <div id="category1" class="cate">
                <h3>1. 미국물세탁</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="손세탁가능">손세탁가능<br>
                            <img src="img/waterwash/handwash.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="물세탁불가">물세탁불가<br>
                            <img src="img/waterwash/nohandwash.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_약_30도_중성">세탁기 약 30도 중성<br>
                            <img src="img/waterwash/machine_30.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_약_40도">세탁기 약 40<br>
                            <img src="img/waterwash/machine_40.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_40도">세탁기 40도<br>
                            <img src="img/waterwash/machine40.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_60도">세탁기 60도<br>
                            <img src="img/waterwash/machine60.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_95도">세탁기 95도<br>
                            <img src="img/waterwash/machine95.png">
                        </label>
                    </li>
                </ul>
            </div>

            <!-- 표백 카테고리 -->
            <div id="category2" class="cate">
                <h3>2. 표백</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_산소_표백 불가">염소, 산소, 표백 불가<br>
                            <img src="img/bleach/allno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="산소_표백_불가">산소, 표백 불가<br>
                            <img src="img/bleach/spno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_표백_불가">염소, 표백 불가<br>
                            <img src="img/bleach/ypno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_산소_표백_가능">염소, 산소, 표백 가능<br>
                            <img src="img/bleach/ysp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="산소_표백_가능">산소, 표백 가능<br>
                            <img src="img/bleach/sp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_표백_가능">염소, 표백 가능<br>
                            <img src="img/bleach/yp.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 다림질 카테고리 -->
            <div id="category3" class="cate">
                <h3>3. 다림질</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="염소_산소_표백 불가">염소, 산소, 표백 불가<br>
                            <img src="img/bleach/allno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="산소_표백_불가">산소, 표백 불가<br>
                            <img src="img/bleach/spno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="염소_표백_불가">염소, 표백 불가<br>
                            <img src="img/bleach/ypno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="염소_산소_표백_가능">염소, 산소, 표백 가능<br>
                            <img src="img/bleach/ysp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="산소_표백_가능">산소, 표백 가능<br>
                            <img src="img/bleach/sp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_표백_가능">염소, 표백 가능<br>
                            <img src="img/bleach/yp.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 건조 카테고리 -->
            <!-- 드라이클리닝 카테고리 -->
        </div>
        <!--일본-->
        <div class = "category_japan" id="con3" style="display: none">
            <!-- 물세탁 카테고리 -->
            <div class="cate">
                <h3>1. 일본물세탁</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="손세탁가능">손세탁가능<br>
                            <img src="img/waterwash/handwash.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="물세탁불가">물세탁불가<br>
                            <img src="img/waterwash/nohandwash.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_약_30도_중성">세탁기 약 30도 중성<br>
                            <img src="img/waterwash/machine_30.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_약_40도">세탁기 약 40<br>
                            <img src="img/waterwash/machine_40.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_40도">세탁기 40도<br>
                            <img src="img/waterwash/machine40.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_60도">세탁기 60도<br>
                            <img src="img/waterwash/machine60.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate1" name="cate1" value="세탁기_95도">세탁기 95도<br>
                            <img src="img/waterwash/machine95.png">
                        </label>
                    </li>
                </ul>
            </div>

            <!-- 표백 카테고리 -->
            <div class="cate">
                <h3>2. 표백</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_산소_표백 불가">염소, 산소, 표백 불가<br>
                            <img src="img/bleach/allno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="산소_표백_불가">산소, 표백 불가<br>
                            <img src="img/bleach/spno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_표백_불가">염소, 표백 불가<br>
                            <img src="img/bleach/ypno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_산소_표백_가능">염소, 산소, 표백 가능<br>
                            <img src="img/bleach/ysp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="산소_표백_가능">산소, 표백 가능<br>
                            <img src="img/bleach/sp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_표백_가능">염소, 표백 가능<br>
                            <img src="img/bleach/yp.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 다림질 카테고리 -->
            <div class="cate">
                <h3>3. 다림질</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="염소_산소_표백 불가">염소, 산소, 표백 불가<br>
                            <img src="img/bleach/allno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="산소_표백_불가">산소, 표백 불가<br>
                            <img src="img/bleach/spno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="염소_표백_불가">염소, 표백 불가<br>
                            <img src="img/bleach/ypno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="염소_산소_표백_가능">염소, 산소, 표백 가능<br>
                            <img src="img/bleach/ysp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate3" name="cate3" value="산소_표백_가능">산소, 표백 가능<br>
                            <img src="img/bleach/sp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="cate2" name="cate2" value="염소_표백_가능">염소, 표백 가능<br>
                            <img src="img/bleach/yp.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 건조 카테고리 -->
            <!-- 드라이클리닝 카테고리 -->
        </div>
    </form>
</div>

</body>
</html>