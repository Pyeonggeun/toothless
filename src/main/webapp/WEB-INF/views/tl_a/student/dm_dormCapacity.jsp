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
            <jsp:include page="../commons/student/leftButtons2.jsp"></jsp:include>
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">수용인원 현황</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙시설 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 수용인원 현황</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="row"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                        <div class="row mt-3"> 
                            <div class="col">
                                <li class="fw-bold" style="font-size: x-large; color: #282525;"> 수용인원 현황</li>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col ps-5" style="color: #1A1B1C; font-size: medium;">
                                본 기숙사는 약 1,500명이 사용할 수 있고 숙박의 편의를 제공하여 면학 분위기를 고양시키고 최신 시설을 완비하여 진리 탐구에 전념하도록 학생 중심으로 최고의 기숙환경을 제공하고 있습니다.
                            </div>
                        </div>
                        <div class="row mt-5"> 
                            <div class="col ps-3">
                                <li class="fw-bold" style="font-size: large; color: #282525;">&nbsp기숙사 층별 수용인원 현황</li>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <table class="table table-bordered text-center align-middle" style="border-top: 0.1em solid #8C7430;">
                                    <tr>
                                        <td colspan="2"  style="background-color: #F5F5F5; color: #8C7430;">학사</td>
                                        <td style="background-color: #F5F5F5; color: #8C7430;">층</td>
                                        <td colspan="2" style="background-color: #F5F5F5; color: #8C7430;">일반실</td>
                                        <td style="background-color: #F5F5F5; color: #8C7430;">특수실</td>
                                        <td style="background-color: #F5F5F5; color: #8C7430;">수용수</td>
                                        <td style="background-color: #F5F5F5; color: #8C7430;">복지시설</td>
                                    </tr>
                                    <tr>
                                        <td rowspan="4" class="text-center" style="background-color: #F5F5F5;">MK학사</td>
                                        <td class="py-4" style="background-color: #F5F5F5;">A동</td>
                                        <td>8층</td>
                                        <td colspan="2">130실</td>
                                        <td>2실</td>
                                        <td>500</td>
                                        <td>식당,독서실,체력단련실</td>
                                    </tr>
                                    <tr>
                                        <td class="py-4" style="background-color: #F5F5F5;">B동</td>
                                        <td>8층</td>
                                        <td colspan="2">130실</td>
                                        <td>2실</td>
                                        <td>500</td>
                                        <td>식당,독서실,체력단련실</td>
                                    </tr>
                                    <tr>
                                        
                                        <td rowspan="2" style="background-color: #F5F5F5;">C동</td>
                                        <td rowspan="2">8층</td>
                                        <td>2인실</td>
                                        <td>4인실</td>
                                        <td rowspan="2">3실</td>
                                        <td rowspan="2">500</td>
                                        <td rowspan="2">행정실, 독서실, pc룸</td>
                                    </tr>
                                    <tr>
                                        <td>250</td>
                                        <td>250</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
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