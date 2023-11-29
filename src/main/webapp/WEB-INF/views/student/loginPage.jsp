<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <style>
             @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;800&family=Roboto+Mono:wght@700&display=swap');
            .body{
                font-family: 'Noto Sans KR', sans-serif;
                font-family: 'Roboto Mono', monospace;

            }
            .bg-main{
                background-color: rgb(247, 247, 247);
            }
            .text-main{
                color: rgb(0, 0, 255);
            }
            .fs-s{
                font-size: small;
            }
            .fs-xs{
                font-size: x-small;
            }
            .bg-gray{
                background-color: rgb(241, 240, 237);
            }
            #bg-main-img{
                background-image: url();
            }
          
            .container-fluid {
                background-size: cover;
                position: relative;
                width: 100%;
                height: 100vh;
                display: grid;
                z-index: 1;
            }
            .container-fluid::after {
                width: 100%;
                height: 100vh;
                content: "";
                background: url("../imgForAcademy/20211025＿170446.jpg");
                background-size: cover;
                display: grid;
                position: absolute;
                top: 0;
                left: 0;
                z-index: -1;
               
                opacity: 0.5;
                font-size: 0px;
            }

            .text-over-cut {
                display: block;
                max-width: 270px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            
                
        </style>
        
       

    </head>
    <body>
        <div class="container-fluid">
            <div class="row mt-5 align-self-center">
                <div class="col-3"></div>

                <div class="col">
                    <!-- MK대학교/포털사이트 -->
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col-1">
                                    <img src="../imgForAcademy/logo_black.png" alt="" class="img-fluid">
                                </div>
                                <div class="col align-self-center text-white fw-bold fs-4">
                                    MK대학교 포털사이트
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- 로그인페이지 -->
                    <div class="row">
                        <div class="col-5 bg-white">
                            <div class="row mt-4">
                                <div class="col ms-4 fs-1 fw-bold" style="color: #081C70;">
                                    LOGIN
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col ms-4">
                                    <div class="row">
                                        <div class="col fw-light" style="color: #909090;">
                                            민규대학교 포털시스템에
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col fw-light" style="color: #909090;">
                                            오신걸 환영합니다.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row ms-4 mt-2">
                                <div class="col-7 text-center py-2 text-white" style="background-color: #002148;">
                                    2차인증 메뉴얼 다운로드
                                </div>
                            </div>
                        </div>
                        <div class="col-7 py-5" style="background-color: #F3F6FC;">
                            <!-- 아이디/비밀번호/로그인 -->
                            <form action="./loginProcess" method="post">
                                <div class="row mx-5">
                                    <div class="col-8">
                                        <div class="row">
                                            <div class="col">
                                                <div class="row border bg-white">
                                                    <div class="col-2 p-0 m-0 border-end text-center">
                                                        <i class="bi bi-person fs-2" style="color: #133369;"></i>
                                                    </div>
                                                    <div class="col align-self-center">
                                                        <input class="py-2 border-0 bg-transparent" type="text" name="student_id" placeholder="아이디">
                                                    </div>
                                                </div>
                                            </div>                                        
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col">
                                                <div class="row border bg-white">
                                                    <div class="col-2 p-0 m-0 border-end text-center">
                                                        <i class="bi bi-key fs-2" style="color: #133369;"></i>
                                                    </div>
                                                    <div class="col align-self-center">
                                                        <input class="py-2 border-0 bg-transparent" type="text" name="password" placeholder="비밀번호">
                                                    </div>
                                                </div>
                                            </div>                                        
                                        </div>
                                    </div>
                                    <div class="col-4 pe-0 d-grid">
                                        <button type="submit" class="btn text-white fw-bold py-2 rounded-0" style="background-color: #133369;">
                                            로그인
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <!-- 아이디 저장 -->
                            <div class="row mx-5 mt-3">
                                <div class="col px-0">
                                    <input name="#" value="#" type="checkbox"> 아이디 저장
                                </div>
                            </div>
                            <!-- 찾기 -->
                            <div class="row mt-5">
                                <div class="col text-end">
                                    <a href="#" class="text-secondary-emphasis" style="text-decoration: none;">사번 및 학번 찾기</a>
                                </div>
                                <div class="col text-start">
                                    <a href="#" class="text-secondary-emphasis" style="text-decoration: none;">비밀번호 찾기</a>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 공지사항 및 버튼 -->
                    <div class="row mt-4">
                        <div class="col-5 bg-white py-4">
                            <div class="row">
                                <div class="col ms-4 fs-5 fw-bold" style="color: #081C70;">
                                    공지사항
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col ms-4">
                                    <!-- 아마도 반복문 돌 부분.. -->
                                    <div class="row">
                                        <div class="col-9 fw-light">
                                            <a href="#" class="text-over-cut text-black" style="text-decoration: none; font-size: 0.9rem;">
                                                <i class="bi bi-dot"></i>
                                                [학생생활관] 대학 기숙사비 납부제도 인식 및 선호도 관련 의견조사                                                
                                            </a>
                                        </div>
                                        <div class="col fw-light text-secondary" style="font-size: 0.9rem;">
                                            2023.11.29
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-9 fw-light">
                                            <a href="#" class="text-over-cut text-black" style="text-decoration: none; font-size: 0.9rem;">
                                                <i class="bi bi-dot"></i>
                                                [학생생활관] 대학 기숙사비 납부제도 인식 및 선호도 관련 의견조사                                                
                                            </a>
                                        </div>
                                        <div class="col fw-light text-secondary" style="font-size: 0.9rem;">
                                            2023.11.29
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-9 fw-light">
                                            <a href="#" class="text-over-cut text-black" style="text-decoration: none; font-size: 0.9rem;">
                                                <i class="bi bi-dot"></i>
                                                [학생생활관] 대학 기숙사비 납부제도 인식 및 선호도 관련 의견조사                                                
                                            </a>
                                        </div>
                                        <div class="col fw-light text-secondary" style="font-size: 0.9rem;">
                                            2023.11.29
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-9 fw-light">
                                            <a href="#" class="text-over-cut text-black" style="text-decoration: none; font-size: 0.9rem;">
                                                <i class="bi bi-dot"></i>
                                                [학생생활관] 대학 기숙사비 납부제도 인식 및 선호도 관련 의견조사                                                
                                            </a>
                                        </div>
                                        <div class="col fw-light text-secondary" style="font-size: 0.9rem;">
                                            2023.11.29
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-7"></div>
                    </div>
                    <!-- 하단 -->
                    <div class="row">
                        <div class="col"></div>
                    </div>
                </div>

                <div class="col-3"></div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>