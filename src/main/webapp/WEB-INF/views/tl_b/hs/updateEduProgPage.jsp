<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>       
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col">
               		<jsp:include page="../commonJsp/staffTopBanner.jsp"></jsp:include>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <jsp:include page="../commonJsp/staffSideBar.jsp"></jsp:include>
                                <div class="col">
                                    <!-- 여기 안에만 사용하면 됨 -->
                                	<h1>교육 프로그램 정보 수정페이지</h1>
                                	<form action="./updateEduProgProcess" method="get">
										작성자: ${sessionStaffInfo.name}<br>
										제목: <input name="name" type="text" value="${update.eduDto.name }"><br>
										내용:<br>
										<textarea name="content" rows="10" cols="60">${update.eduDto.content }</textarea><br>
										포스터: <input name="img_link" type="file" accept="image/*" multiple><br>
										신청시작일: <input name="apply_start_date" type="date" value="${update.apply_start_date }"><br>
										신청종료일: <input name="apply_end_date" type="date" value="${update.apply_end_date }"><br>
										교육일시: <input name="edu_date" type="date" value="${update.edu_date }"><br>
										장소: <input name="place" type="text" value="${update.eduDto.place }"><br>
										수강인원: <input name="capacity" type="number" value="${update.eduDto.capacity }" min="1"><br>
										<input name="edu_pk" type="hidden" value="${update.eduDto.edu_pk }">
										
										<input type="submit" value="글 수정">
									</form>
                                	
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col py-4" style="background-color: #F2F2F2;">
                                    <div class="row" style="margin-left: 16%; margin-right: 16%;">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1 my-auto">
                                                    <img class="img-fluid" src="../../resources/img/another/logo_black.png">
                                                </div>
                                                <div class="col-3 ps-0 my-auto" style="font-size: x-large">
                                                    MK University | 보건센터
                                                </div>
                                                <div class="col text-body-tertiary my-auto" style="font-size: small;">
                                                    <p class="my-0">서울특별시 강남구 테헤란로7길 7 에스코빌딩 6~7층&emsp;전화 : 02&#41;561-1911&emsp;팩스 : 02&#41;561-1911</p>
                                                    <p class="my-0">COPYRIGHT&#40;C&#41; University of Seoul ALL RIGHTS RESERVED.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>