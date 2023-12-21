<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            .border-main{
                border-color: #133369;
            }
            .mouseOver{
            	background-color: #133369;
            	color: white;
            }
        </style>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
				<div class="col">
					<jsp:include page="../commons/studentNaviLogo.jsp"/>
				</div>          
            </div>
            <div class="row mt-2">
                <div class="col px-0">
                    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                            <img src="../../resources/img/another/mainbanner.png" class="d-block w-100" style="height: 30em;">
                          </div>
                          <div class="carousel-item">
                            <img src="../../resources/img/another/mainbanner.png" class="d-block w-100" style="height: 30em;">
                          </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col">
                    <div class="row">
                        <div class="col-1"></div>
                        <div class="col">
                            <div class="row">
                                <div class="col" style="font-size: small;" style="color: #133369;">
                                    MinKyue
                                </div>
                            </div>
                            <div class="row">
                                <div class="col fs-3 fw-bold" style="color: #133369;">
                                    POPUP ZONE
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-1"></div>
                        <div onmouseenter="mouseOver(this)" onmouseleave="mouseLeave(this)" onclick="location.href='/toothless/tl_c/guntaek/student/ajdksRegisterSelfIntroduction'" class="col border border-2 mx-1" style="cursor: pointer;">
                            <div class="row">
                                <div class="col-3 align-self-center text-center mt-4 fs-2">
                                    <i class="bi bi-person-workspace"></i>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col ms-2 mt-2 fw-bold align-self-center fs-5">
                                    현장실습 지원 센터
                                </div>
                            </div>
                            <div class="row mt-5 mb-3">
                                <div class="col text-start align-self-center rounded-pill">
                                    바로가기 <i class="bi bi-chevron-right text-secondary"></i>
                                </div>
                            </div>
                        </div>
                        <div onmouseenter="mouseOver(this)" onmouseleave="mouseLeave(this)" onclick="location.href='/toothless/tl_d/common/employmentMainPage'" class="col border border-2 mx-1" style="cursor: pointer;">
                            <div class="row">
                                <div class="col-3 align-self-center text-center mt-4 fs-2">
                                    <i class="bi bi-briefcase-fill"></i>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col ms-2 mt-2 fw-bold align-self-center fs-5">
                                    취업 지원 센터
                                </div>
                            </div>
                            <div class="row mt-5 mb-3">
                                <div class="col text-start align-self-center rounded-pill">
                                    바로가기 <i class="bi bi-chevron-right text-secondary"></i>
                                </div>
                            </div>
                        </div>
                        <div onmouseenter="mouseOver(this)" onmouseleave="mouseLeave(this)" onclick="location.href='/toothless/tl_e/commons/counselCenterStudentMainPage'" class="col border border-2 mx-1" style="cursor: pointer;">
                            <div class="row">
                                <div class="col-3 align-self-center text-center mt-4 fs-2">
                                    <i class="bi bi-headset"></i>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col ms-2 mt-2 fw-bold align-self-center fs-5">
                                    상담 지원 센터
                                </div>
                            </div>
                            <div class="row mt-5 mb-3">
                                <div class="col text-start align-self-center rounded-pill">
                                    바로가기 <i class="bi bi-chevron-right text-secondary"></i>
                                </div>
                            </div>
                        </div>
                        <div onmouseenter="mouseOver(this)" onmouseleave="mouseLeave(this)" onclick="location.href='/toothless/tl_a/student/jw_mainPage'" class="col border border-2 mx-1" style="cursor: pointer;">
                            <div class="row">
                                <div class="col-3 align-self-center text-center mt-4 fs-2">
                                    <i class="bi bi-buildings"></i>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col ms-2 mt-2 fw-bold align-self-center fs-5">
                                   생활관 관리 센터
                                </div>
                            </div>
                            <div class="row mt-5 mb-3">
                                <div class="col text-start align-self-center rounded-pill">
                                    바로가기 <i class="bi bi-chevron-right text-secondary"></i>
                                </div>
                            </div>
                        </div>
                        <div onmouseenter="mouseOver(this)" onmouseleave="mouseLeave(this)" onclick="location.href='/toothless/tl_b/common/studentMainPage'" class="col border border-2 mx-1" style="cursor: pointer;">
                            <div class="row">
                                <div class="col-3 align-self-center text-center mt-4 fs-2">
                                    <i class="bi bi-capsule"></i>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col ms-2 mt-2 fw-bold align-self-center fs-5">
                                    학생 보건 센터
                                </div>
                            </div>
                            <div class="row mt-5 mb-3">
                                <div class="col text-start align-self-center rounded-pill">
                                    바로가기 <i class="bi bi-chevron-right text-secondary"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-1"></div>
                    </div>
                </div>
            </div>
        </div>
        

        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>