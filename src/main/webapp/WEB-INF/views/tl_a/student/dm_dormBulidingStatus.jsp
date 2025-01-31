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
                                <span class="fw-bold" style="font-size: xx-large;">건물 현황</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙시설 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 건물 현황</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="row"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <img src="../../resources/img/dormitory/dormsub1.jpg" alt="" class="img-fluid">
                            </div>
                            <div class="col">
                                <img src="../../resources/img/dormitory/dormsub2.jpg" alt="" class="img-fluid">
                            </div>
                            <div class="col">
                                <img src="../../resources/img/dormitory/dormsub3.jpg" alt="" class="img-fluid">
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col"><span class="fw-bold" style="color: #8C7430;">01 </span><span>&nbsp; A동</span></div>
                            <div class="col"><span class="fw-bold" style="color: #8C7430;">02 </span><span>&nbsp; B동</span></div>
                            <div class="col"><span class="fw-bold" style="color: #8C7430;">03 </span><span>&nbsp; C동</span></div>
                        </div>
                        <div class="row mt-5">
                            <div class="col-3 px-0 pt-4 fw-bold fs-5" style="border-top: 0.15em solid #8C7430; color: #8C7430;">&nbsp;&nbsp;&nbsp;생활관 소개</div>
                            <div class="col pt-4" style="font-size: medium;">본 생활관은 약 1,610명이 사용할 수 있고 숙박의 편의를 제공하여 면학 분위기를 고양시키고 최신 시설을 완비하여 진리 탐구에 전념하도록 학생 중심으로최고의 생활환경을 제공하고 있습니다.</div>
                        </div>
                        <div class="row mt-5"> 
                            <div class="col">
                                <li class="fw-bold" style="font-size: x-large; color: #282525;"> 호실별 전화번호</li>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col ps-5" style="font-size: medium;">
                                외부에서 관내의 전화를 거실 경우에는 대표 전화 <span class="fw-bold" style="color: #8C7430;">042) 829-7419</span>로 전화를 거시면, 안내 메시지가 나옵니다.
                                방호수를 먼저 확인하시고<span class="fw-bold" style="color: #8C7430;">방 번호 4자리</span>를 누르시면 바로 방과 연결이 됩니다.
                                
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

<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>