<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .menus{
            text-align: center;
            float: inline-block;
        }
        .gold{
            color: #8C7430;
        }
        
        
 
    </style>
    <script>
        //js주석
        /*여러줄 주석*/
        
    </script>
</head>
<body>
    <jsp:include page="../commons/student/topNavi.jsp"></jsp:include>
    <div class="row">
        <div class="col">
            <img src="../../resources/img/dormitory/studentMainLogo.jpg">
        </div>
    </div>


    <div class="container mt-3">
        <div class="row">
            <jsp:include page="../commons/student/leftButtons3.jsp"></jsp:include>
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">거리배점표</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 모집안내 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 거리배점표</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="row"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                        <table class="table text-center table-bordered align-middle" style="border-top: 0.01em solid #8C7430;">
                            <tr>
                                <td class="col-md-2" style="color: #8C7430;">도명</td>
                                <td class="col-md-2" style="color: #8C7430;">시군명</td>
                                <td style="color: #8C7430;">총거리</td>
                                <td style="color: #8C7430;">점수</td>
                                <td class="col-md-2" style="color: #8C7430;">도명</td>
                                <td class="col-md-2" style="color: #8C7430;">시군명</td>
                                <td style="color: #8C7430;">총거리</td>
                                <td style="color: #8C7430;">점수</td>
                            </tr>
                            <tr>
                                <td>특별시</td>
                                <td>서울시</td>
                                <td>163</td>
                                <td>245</td>
                                <td rowspan="15">경상북도</td>
                                <td>상주시</td>
                                <td>110.1</td>
                                <td>155</td>
                            </tr>
                            <tr>
                                <td rowspan="5">광역시</td>
                                <td>광주시</td>
                                <td>165.7</td>
                                <td>245</td>
                                <td>성주군</td>
                                <td>131.9</td>
                                <td>200</td>
                            </tr>
                            <tr>
                                <td>대구시</td>
                                <td>172.5</td>
                                <td>260</td>
                                <td>안동시</td>
                                <td>209.4</td>
                                <td>305</td>
                            </tr>
                            <tr>
                                <td>부산시</td>
                                <td>292.2</td>
                                <td>440</td>
                                <td>영덕군</td>
                                <td>285.3</td>
                                <td>425</td>
                            </tr>
                            <tr>
                                <td>울산시</td>
                                <td>281.2</td>
                                <td>425</td>
                                <td>영양군</td>
                                <td>265.9</td>
                                <td>395</td>
                            </tr>
                            <tr>
                                <td>인천시</td>
                                <td>182.4</td>
                                <td>275</td>
                                <td>영주시</td>
                                <td>224.1</td>
                                <td>335</td>
                            </tr>
                            <tr>
                                <td rowspan="19">강원도</td>
                                <td>강릉시</td>
                                <td>285.5</td>
                                <td>425</td>
                                <td>영천시</td>
                                <td>206.2</td>
                                <td>3.5</td>
                            </tr>
                            <tr>
                                <td>고성군</td>
                                <td>328.9</td>
                                <td>485</td>
                                <td>예천군</td>
                                <td>196</td>
                                <td>290</td>
                            </tr>
                            <tr>
                                <td>동해시</td>
                                <td>320</td>
                                <td>470</td>
                                <td>울릉군</td>
                                <td>섬지역</td>
                                <td>500</td>
                            </tr>
                            <tr>
                                <td>삼척시</td>
                                <td>333.4</td>
                                <td>485</td>
                                <td>울진군</td>
                                <td>323.8</td>
                                <td>485</td>
                            </tr>
                            <tr>
                                <td>속초시</td>
                                <td>338.5</td>
                                <td>485</td>
                                <td>의성군</td>
                                <td>185.7</td>
                                <td>275</td>
                            </tr>
                            <tr>
                                <td>양구군</td>
                                <td>286.3</td>
                                <td>425</td>
                                <td>청도군</td>
                                <td>216.1</td>
                                <td>320</td>
                            </tr>
                            <tr>
                                <td>양양군</td>
                                <td>320.4</td>
                                <td>470</td>
                                <td>청송군</td>
                                <td>230.5</td>
                                <td>335</td>
                            </tr>
                            <tr>
                                <td>영월군</td>
                                <td>187.7</td>
                                <td>275</td>
                                <td>칠곡군</td>
                                <td>142.9</td>
                                <td>215</td>
                            </tr>
                            <tr>
                                <td>원주시</td>
                                <td>177.2</td>
                                <td>260</td>
                                <td>포항시</td>
                                <td>248.1</td>
                                <td>365</td>
                            </tr>
                            
                        </table>
                    </div>
                </div><!-- 여기까지-->
            </div>
            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>
        <!-- footer 부분-->
        <div class="row" style="background-color: #181C23;">
            <div class="col-2 pt-4">
                
            </div>
            <div class="col-6 py-4">
                <div class="row">
                    <div class="col-2 px-0 fw-bold text-center" style="color: #FFC00B; font-size: medium;">
                        개인정보처리방침
                    </div>
                    <div class="col px-0 pt-2 fw-bold text-center" style="color: #BABBBD; font-size: 0.3em;">
                        <span class="bi bi-circle-fill"></span>
                    </div>
                    <div class="col-2 px-0 fw-bold text-center" style="color: #BABBBD;">
                        이메일무단수집거부
                    </div>
                    <div class="col px-0 pt-2 fw-bold text-center" style="color: #BABBBD; font-size: 0.3em;">
                        <span class="bi bi-circle-fill"></span>
                    </div>
                    <div class="col-2 px-0 fw-bold text-center" style="color: #BABBBD;">
                        대학정보공시
                    </div>
                    <div class="col pt-2 px-0 fw-bold text-center" style="color: #BABBBD; font-size: 0.3em;">
                        <span class="bi bi-circle-fill"></span>
                    </div>
                    <div class="col-2 px-0 fw-bold text-center" style="color: #BABBBD;">
                        오시는길
                    </div>
                </div>
                <div class="row ms-1 mt-4" style="border-bottom: 0.01em solid #303339;">
                    <div class="col"></div>
                </div>
                <div class="row mt-5">
                    <div class="col fw-bold" style="color: #BABBBD; font-size: medium;">
                        서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층)
                    </div>
                </div>
                <div class="row mt-1 mb-5">
                    <div class="col fw-bold" style="color: #505F65; font-size: medium;">
                        COPYRIGHT© 2023 MINGYU UNIVERSITY. ALL RIGHTS RESERVED.
                    </div>
                </div>
                
            </div>
            

        </div>

   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>