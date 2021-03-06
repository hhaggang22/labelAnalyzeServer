<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="com.imageLabel.labelAnalyzeServer.controller.dto.InfoDto" %>
<%@ page import="javax.sound.sampled.Line" %><%--
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

            if(value == "korea"){
                $('#con1').css('display','block');
                $('#con2').css('display','none');
                $('#con3').css('display','none');
                return false;
            }
            if(value == "america"){
                $('#con1').css('display','none');
                $('#con2').css('display','block');
                $('#con3').css('display','none');
                return false;
            }
            if(value == "japan"){
                $('#con1').css('display','none');
                $('#con2').css('display','none');
                $('#con3').css('display','block');
                return false;
            }
        }

        var count = 1;

        function addSelectForm(){
            var str = '<br/><select name="material" id="mate'+count+'">'+
                    '<option> 폴리에스터 </option>'+
                    '<option>면</option>'+
                    '<option>캐시미어</option>'+
                    '<option>울</option>'+
                '</select>'+
                '<span><input type="text" name="percent" id="percent'+count+'" placeholder="함유량"></span>';

            if(count<=5){
                $('#selectMaterial').append(str);
                count++;
            }

        }

    </script>
</head>

<body>
<div class = "wrapper">
    <!--이미지 업로드 부분 -->
    <div class = "imageSelect">
        <h2> 이미지를 업로드하고 해당 라벨에 있는 정보를 입력하세요. </h2>
        <!--<input type="file" id="image" accept="image/*" onchange="setImage(event);"/>-->
        <%
            String imageUrl = (String)request.getAttribute("imageURL");
        %>
        <img src = <%=imageUrl%> />
    </div>

    <!--옷 재질 및 함유량 추가-->
    <form method="post" action="Analyze">
        <div class = "selectMaterial" id="selectMaterial">
            <select name="material" id="mate0">
                <option>폴리에스터</option>
                <option>면</option>
                <option>캐시미어</option>
                <option>울</option>
            </select>
            <span><input type="text" name="percent" id="percent0" placeholder="함유량"></span>
            <button type="button" id="addMate" onclick="addSelectForm()">추가</button>

        </div>

        <br/>

        <!--나라선택-->
        <input type="radio" name="country" value="korea" onchange="setDisplay()" checked="checked">한국
        <input type="radio" name="country" value="america" onchange="setDisplay()">미국
        <input type="radio" name="country" value="japan" onchange="setDisplay()">일본

    <!--나라별 세탁정보 선택화면-->
        <!--한국-->
        <div class = "category_korea" id="con1">
            <!-- 물세탁 카테고리 -->
            <div class="cate">
                <h3>1. 물세탁</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="0">손세탁가능<br>
                            <img src="img/waterwash/handwash.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="1">물세탁불가<br>
                            <img src="img/waterwash/nohandwash.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="2">세탁기 약 30도 중성<br>
                            <img src="img/waterwash/machine_30.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="3">세탁기 약 40<br>
                            <img src="img/waterwash/machine_40.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="4">세탁기 40도<br>
                            <img src="img/waterwash/machine40.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="5">세탁기 60도<br>
                            <img src="img/waterwash/machine60.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="6">세탁기 95도<br>
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
                        <label><input type="checkbox" class="bleach" name="bleach" value="0">염소, 산소, 표백 불가<br>
                            <img src="img/bleach/allno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="bleach" name="bleach" value="1">산소, 표백 불가<br>
                            <img src="img/bleach/spno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="bleach" name="bleach" value="2">염소, 표백 불가<br>
                            <img src="img/bleach/ypno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="bleach" name="bleach" value="3">염소, 산소, 표백 가능<br>
                            <img src="img/bleach/ysp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="bleach" name="bleach" value="4">산소, 표백 가능<br>
                            <img src="img/bleach/sp.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="bleach" name="bleach" value="5">염소, 표백 가능<br>
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
                        <label><input type="checkbox" class="ironing" name="ironing" value="0">다림질불가<br>
                            <img src="img/ironing/no.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="ironing" name="ironing" value="1">80~120<br>
                            <img src="img/ironing/to80120.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="ironing" name="ironing" value="2">80~120(천깔고)<br>
                            <img src="img/ironing/withcloth80120.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="ironing" name="ironing" value="3">140~160<br>
                            <img src="img/ironing/to140160.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="ironing" name="ironing" value="4">140~160(천깔고)<br>
                            <img src="img/ironing/withcloth140160.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="ironing" name="ironing" value="5">180~210<br>
                            <img src="img/ironing/180210.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="ironing" name="ironing" value="6">180~210(천깔고)<br>
                            <img src="img/ironing/withcloth180210.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 건조 카테고리 -->
            <div class="cate">
                <h3>4. 건조</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="0">옷걸이(화창)<br>
                            <img src="img/dry/hangsun.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="1">옷걸이(흐림)<br>
                            <img src="img/dry/hang.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="2">눕혀서(화창)<br>
                            <img src="img/dry/laysun.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="3">눕혀서(흐림)<br>
                            <img src="img/dry/lay.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="4">비틀기가능<br>
                            <img src="img/dry/squeeze.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="5">비틀기불가<br>
                            <img src="img/dry/nosqueeze.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="6">건조기가능<br>
                            <img src="img/dry/machine.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="7">건조기불가<br>
                            <img src="img/dry/nomachine.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 드라이클리닝 카테고리 -->
            <div class="cate">
                <h3>5. 드라이클리닝</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="drycleaning" name="drycleaning" value="0">드라이클리닝<br>
                            <img src="img/drycleaning/can.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="drycleaning" name="drycleaning" value="1">드라이클리닝불가<br>
                            <img src="img/drycleaning/no.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="drycleaning" name="drycleaning" value="2">석유계 드라이<br>
                            <img src="img/drycleaning/half.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="drycleaning" name="drycleaning" value="3">셀프 드라이 불가<br>
                            <img src="img/drycleaning/noself.png">
                        </label>
                    </li>

                </ul>
            </div>

        </div>

        <!--미국-->
        <div class = "category_america" id="con2" style="display: none">
            <div class="cate">
                <h3>1. 물세탁</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="7">손세탁가능<br>
                            <img src="img/waterwash/ame_handwash.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="8">물세탁금지<br>
                            <img src="img/waterwash/ame_no.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="9">기계세탁가능<br>
                            <img src="img/waterwash/ame_mac.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="10">비틀기 금지<br>
                            <img src="img/waterwash/ame_nosqueeze.png">
                        </label>
                    </li>

                </ul>
            </div>

            <!-- 표백 카테고리 -->
            <div class="cate">
                <h3>2. 표백</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="bleach" name="bleach" value="6">어떤 표백제도 불가<br>
                            <img src="img/bleach/ame_no.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="bleach" name="bleach" value="7">비염소제와 색상보호 표백제만 가능<br>
                            <img src="img/bleach/ame_half.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="bleach" name="bleach" value="8">모든 표백제 가능<br>
                            <img src="img/bleach/ame_allbleach.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 다림질 카테고리 -->
            <div class="cate">
                <h3>3. 다림질</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="ironing" name="ironing" value="7">다림질불가<br>
                            <img src="img/ironing/ame_no.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="ironing" name="ironing" value="8">스팀다리미불가<br>
                            <img src="img/ironing/ame_steamno.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="ironing" name="ironing" value="9">스팀다리미가능<br>
                            <img src="img/ironing/ame_steam.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 건조 카테고리 -->
            <div class="cate">
                <h3>4. 건조</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="8">건조기 가능<br>
                            <img src="img/dry/machine.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="9">건조기 불가<br>
                            <img src="img/dry/ame_nomachine.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="10">젖은 채로 줄이나 막내기에 널어서 건조<br>
                            <img src="img/dry/ame_wetroap.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="11">줄에 널어서 건조<br>
                            <img src="img/dry/ame_roap.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="12">평평하게 펴서 건조<br>
                            <img src="img/dry/ame_flat.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="13">그늘에서 건조<br>
                            <img src="img/dry/ame_gloomy.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 드라이클리닝 카테고리 -->
            <div class="cate">
                <h3>5. 드라이클리닝</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="drycleaning" name="drycleaning" value="4">드라이클리닝<br>
                            <img src="img/drycleaning/ame_drycleaning.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="drycleaning" name="drycleaning" value="5">드라이클리닝불가<br>
                            <img src="img/drycleaning/ame_no.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="drycleaning" name="drycleaning" value="6">짧은 드라이클리닝<br>
                            <img src="img/drycleaning/ame_short.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="drycleaning" name="drycleaning" value="7">낮은 습도에서 드라이클리닝<br>
                            <img src="img/drycleaning/ame_lowmoi.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="drycleaning" name="drycleaning" value="8">열을 줄여서 드라이클리닝<br>
                            <img src="img/drycleaning/ame_lowheat.png">
                        </label>
                    </li>

                </ul>
            </div>
        </div>
        <!--일본-->
        <div class = "category_japan" id="con3" style="display: none">
            <div class="cate">
                <h3>1. 물세탁</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="11">30도 손세탁가능<br>
                            <img src="img/waterwash/jap_30hand.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="12">95도 세탁기가능<br>
                            <img src="img/waterwash/jap_95mac.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="13">약한 손세탁<br>
                            <img src="img/waterwash/jap_light.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="14">비틀기금지<br>
                            <img src="img/waterwash/jap_nosqueeze.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="waterwash" name="waterwash" value="15">물세탁금지<br>
                            <img src="img/waterwash/jap_no.png">
                        </label>
                    </li>

                </ul>
            </div>

            <!-- 표백 카테고리 -->
            <div class="cate">
                <h3>2. 표백</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="bleach" name="bleach" value="9">어떤 표백제도 불가<br>
                            <img src="img/bleach/jap_no.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="bleach" name="bleach" value="10">어떤 표백제도 가능<br>
                            <img src="img/bleach/jap_can.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 다림질 카테고리 -->
            <div class="cate">
                <h3>3. 다림질</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="ironing" name="ironing" value="10">다림질불가<br>
                            <img src="img/ironing/jap_no.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="ironing" name="ironing" value="11">80~120<br>
                            <img src="img/ironing/jap_to80120.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="ironing" name="ironing" value="12">140~160<br>
                            <img src="img/ironing/jap_to140160.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="ironing" name="ironing" value="13">180~210<br>
                            <img src="img/ironing/jap_to180210.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 건조 카테고리 -->
            <div class="cate">
                <h3>4. 건조</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="14">옷걸이에 걸어서 건조<br>
                            <img src="img/dry/jap_hang.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="15">옷걸이에 걸어서 건조(흐림)<br>
                            <img src="img/dry/jap_hanggloomy.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="16">눕혀서 건조<br>
                            <img src="img/dry/jap_lay.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="dry" name="dry" value="17">눕혀서 건조(흐림)<br>
                            <img src="img/dry/jap_laygloomy.png">
                        </label>
                    </li>

                </ul>
            </div>
            <!-- 드라이클리닝 카테고리 -->
            <div class="cate">
                <h3>5. 드라이클리닝</h3>
                <ul>
                    <li>
                        <label><input type="checkbox" class="drycleaning" name="drycleaning" value="9">드라이클리닝가능<br>
                            <img src="img/drycleaning/jap_can.png">
                        </label>
                    </li>
                    <li>
                        <label><input type="checkbox" class="drycleaning" name="drycleaning" value="10">드라이클리닝불가<br>
                            <img src="img/drycleaning/jap_no.png">
                        </label>
                    </li>

                </ul>
            </div>
        </div>

        <button type="submit" id="request_button">Save</button>
    </form>
</div>

</body>
</html>