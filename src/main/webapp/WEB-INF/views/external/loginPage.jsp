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
                background-color: #133369;
            }
            .text-main{
                color: #002148;
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
                background: url("../resources/img/another/backgroundimg.png");
                background-size: cover;
                display: grid;
                position: absolute;
                top: 0;
                left: 0;
                z-index: -1;
                opacity: 0.6;
                font-size: 0px;
            }

            .text-over-cut {
                display: block;
                max-width: 270px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .border-main{
                border-color: #081C70;
            }
            .test{
                content: "";
            }
            .test::after{
                font-size: small;
                font-weight: lighter;
                content: " | ";
                
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
                                <div class="col-1 p-0">
                                    <img src="../resources/img/another/logo_black.png" alt="" class="img-fluid">
                                </div>
                                <div class="col p-0 align-self-center text-black fw-bold fs-3">
                                    MK University<span class="fs-6"> | </span> <span class="fs-5">포털사이트</span> 
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 로그인페이지 -->
                    <div class="row">
                        <div class="col-4 bg-white">
                            <div class="row mt-4">
                                <div class="col ms-4 fs-1 fw-bold" style="color: #081C70;">
                                    LOGIN
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col ms-4">
                                    <div class="row">
                                        <div class="col" style="color: #909090;">
                                            서울민규대학교 포털시스템에
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col" style="color: #909090;">
                                            오신것을 환영합니다.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row ms-4 mt-2">
                                <div class="col text-center py-2 text-white" style="background-color: #002148;">
                                    2차인증 메뉴얼 다운로드
                                </div>
                            </div>
                        </div>
                        <div class="col-8 py-5 ps-3" style="background-color: #F3F6FC;">
                            <!-- 아이디/비밀번호/로그인 -->
                            <form action="./loginProcess" method="post">
                                <div class="row mx-5">
                                    <div class="col-8">
                                        <div class="row text-center fs-s">
                                        	<div class="col">
                                        		<div class="row bg-main pb-1">
                                        			 <div class="col-3 d-grid px-0">
                                                		<a class="navbar-brand border border-2 bg-white" href="../student/loginPage">학생</a>
                                            		</div>
                                            		<div class="col-3 d-grid px-0">
                                                		<a class="navbar-brand border border-2 bg-white" href="../staff/loginPage">교직원</a>
                                            		</div>
		                                            <div class="col-3 d-grid px-0">
		                                                <a class="navbar-brand border border-2 bg-white" href="../professor/loginPage">교수</a>
		                                            </div>
		                                            <div class="col-3 d-grid px-0">
		                                                <a class="navbar-brand bg-main text-white" href="../external/loginPage">외부인</a>
		                                            </div>	
                                        		</div>
                                        	</div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="row border bg-white">
                                                    <div class="col-2 p-0 m-0 border-end text-center">
                                                        <i class="bi bi-person fs-2" style="color: #133369;"></i>
                                                    </div>
                                                    <div class="col align-self-center">
                                                        <input class="py-2 border-0 bg-transparent" type="text" name="external_id" placeholder="아이디">
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
                                                        <input class="py-2 border-0 bg-transparent" type="password" name="password" placeholder="비밀번호">
                                                    </div>
                                                </div>
                                            </div>                                        
                                        </div>
                                    </div>
                                    <div class="col-4 pe-0 d-grid">
                                        <button class="btn text-white fw-bold py-2 rounded-0" style="background-color: #133369;">
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
                            <div class="row mt-4">
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
                                    <!-- 아마도 반복문 돌 부분.. 공지사항 중 최신 5개 ㄱㄱ -->
                                    <div class="row">
                                        <div class="col-8 fw-light">
                                            <a href="#" class="text-over-cut text-black" style="text-decoration: none; font-size: 0.9rem;">
                                                <i class="bi bi-dot"></i>
                                                [클래스공지] 2차 프로젝트 시작 노가다의 시간 안내
                                            </a>
                                        </div>
                                        <div class="col fw-light text-secondary text-end" style="font-size: 0.9rem;">
                                            2023.11.29
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-8 fw-light">
                                            <a href="#" class="text-over-cut text-black" style="text-decoration: none; font-size: 0.9rem;">
                                                <i class="bi bi-dot"></i>
                                                [학생생활관] 대학 기숙사비 납부제도 인식 및 선호도 관련 의견조사                                                
                                            </a>
                                        </div>
                                        <div class="col fw-light text-secondary text-end" style="font-size: 0.9rem;">
                                            2023.11.29
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-8 fw-light">
                                            <a href="#" class="text-over-cut text-black" style="text-decoration: none; font-size: 0.9rem;">
                                                <i class="bi bi-dot"></i>
                                                [학생포털시스템공지] 학생 포털 로그인 불가능에 대한 조치 안내                                                
                                            </a>
                                        </div>
                                        <div class="col fw-light text-secondary text-end" style="font-size: 0.9rem;">
                                            2023.11.28
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-8 fw-light">
                                            <a href="#" class="text-over-cut text-black" style="text-decoration: none; font-size: 0.9rem;">
                                                <i class="bi bi-dot"></i>
                                                [공지] 제 1회 대방어 축제 대방어 뱃살 당첨자 안내                                                
                                            </a>
                                        </div>
                                        <div class="col fw-light text-secondary text-end" style="font-size: 0.9rem;">
                                            2023.11.26
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-8 fw-light">
                                            <a href="#" class="text-over-cut text-black" style="text-decoration: none; font-size: 0.9rem;">
                                                <i class="bi bi-dot"></i>
                                                [학사 공지] 휴학생 및 복학생 신청 기간 안내                                              
                                            </a>
                                        </div>
                                        <div class="col fw-light text-secondary text-end" style="font-size: 0.9rem;">
                                            2023.11.24
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-7 bg-white py-4">
                            <div class="row ms-3 me-5">
                                <div class="col border py-2 me-1" style="background-color: #F7F7F7;">
                                    <a href="#" class="text-black" style="text-decoration: none;">
                                        <div class="row">
                                            <div class="col-8 ms-3 align-self-center">
                                                대표홈페이지
                                            </div>
                                            <div class="col me-3 text-end ">
                                                <i class="bi bi-mortarboard fs-5"></i>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col border py-2 ms-1" style="background-color: #F7F7F7;">
                                    <a href="#" class="text-black" style="text-decoration: none;">
                                        <div class="row">
                                            <div class="col-8 ms-3 align-self-center">
                                                기숙사정보
                                            </div>
                                            <div class="col me-3 text-end">
                                                <i class="bi bi-building-fill-add"></i>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="row ms-3 me-5 mt-2">
                                <div class="col border py-2 me-1" style="background-color: #F7F7F7;">
                                    <a href="#" class="text-black" style="text-decoration: none;">
                                        <div class="row">
                                            <div class="col-8 ms-3 align-self-center">
                                                평생교육원
                                            </div>
                                            <div class="col me-3 text-end">
                                                <i class="bi bi-buildings fs-5"></i>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col border py-2 ms-1" style="background-color: #F7F7F7;">
                                    <a href="#" class="text-black" style="text-decoration: none;">
                                        <div class="row">
                                            <div class="col-8 ms-3 align-self-center">
                                                취업정보
                                            </div>
                                            <div class="col me-3 text-end">
                                                <i class="bi bi-calendar4-week fs-5"></i>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="row ms-3 me-5 mt-2">
                                <div class="col border py-2 me-1" style="background-color: #F7F7F7;">
                                    <a href="#" class="text-black" style="text-decoration: none;">
                                        <div class="row">
                                            <div class="col-8 ms-3 align-self-center">
                                                산학협력단
                                            </div>
                                            <div class="col me-3 text-end">
                                                <i class="bi bi-brilliance fs-5"></i>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col border py-2 ms-1" style="background-color: #F7F7F7;">
                                    <a href="#" class="text-black" style="text-decoration: none;">
                                        <div class="row">
                                            <div class="col-8 ms-3 align-self-center">
                                                학술정보원
                                            </div>
                                            <div class="col me-3 text-end">
                                                <i class="bi bi-pencil fs-5"></i>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 하단 -->
                    <div class="row mt-3">
                        <div class="col">
                            <div class="row">
                                <div class="col text-white text-center fw-light">
                                    서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층) / TEL:010-4761-2103 / E-MAIL:se001lec@naver.com
                                </div>
                            </div>
                            <div class="row">
                                <div class="col text-white text-center fw-light" style="font-size: 0.9rem;">
                                    COPYRIGHT© 2023 MINKUE UNIVERSITY ALL RIGHTS RESERVED.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-3"></div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>>