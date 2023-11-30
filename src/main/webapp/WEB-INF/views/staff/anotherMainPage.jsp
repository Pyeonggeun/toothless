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
            .bg-main{
                background-color: #133369;
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

        </style>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row mt-3">
                <div class="col">
                    <div class="row text-center">
                        <div class="col-4"></div>
                        <div class="col-1 pe-2 text-end">
                            <img src="../imgForAcademy/logo_black.png" alt="" style="height: 4em;">
                        </div>
                        <div class="col-3 ps-0 fw-bold fs-1 text-start ">
                            MK University<span class="fs-6"> | </span> <span class="fs-5">포털사이트</span> 
                        </div>
                        <div class="col-2"></div>
                        <div class="col-1 border-end border-secondary text-end fs-s text-secondary mt-5">
                            포털이용안내
                        </div>
                        <div class="col-1 text-start fs-s text-secondary mt-5">
                            로그아웃
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-1 text-center bg-main py-2 fw-bold text-light">
                <div class="col-2"></div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./mainpage">현장실습 센터</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./mainpage">취업<i class="bi bi-dot"></i>창업 센터</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./mainpage">학생상담 센터</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./mainpage">생활관 센터</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./mainpage">학생보건 센터</a>
                </div>
                <div class="col-3">    
                    <form class="d-flex ps-5" role="search">
                        <input class="form-control me-2" type="search" placeholder="검색어 입력" aria-label="Search">
                        <button class="btn btn-outline-light" type="submit">Search</button>
                    </form>    
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row mt-3">
                <div class="col-2">
                    <div class="row border border-2">
                        <div class="col">
                       		<a></a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <div class="col text-end">
                            <img src="../resources/img/another/iu1.png" alt="" style="height: 8em;">
                        </div>
                        <div class="col text-center fs-1 fw-bold">
                            서울민규 대학교 총장님 말씀
                        </div>
                        <div class="col text-start">
                            <img src="../resources/img/another/iu2.png" alt=""style="height: 8em;">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col text-center">
                            <img src="../resources/img/another/minkue.png" alt="" style="height: 30em;">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col text-end">
                            <img src="../resources/img/another/iu3.png" alt="" style="height: 8em;">
                        </div>
                        <div class="col text-center fs-2 mt-5">
                            2차 프로젝트 화이팅~! &gt; _ &lt;
                        </div>
                        <div class="col text-start">
                            <img src="../resources/img/another/iu4.png" alt="" style="height: 8em;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>