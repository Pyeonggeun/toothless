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
                                	<h1>교육 프로그램 정보</h1>
                                	작성자 ${qwer.staffInfoDto.name }<br>
                                	제목 ${qwer.eduDto.name }<br>
                                	내용 ${qwer.eduDto.content }<br>
                                	포스터이미지링크 ${qwer.eduDto.img_link }<br>
                                	신청시작일 <fmt:formatDate value="${qwer.eduDto.apply_start_date }"
										pattern="yy년 MM월 dd일 hh시"/><br>
                                	신청종료일 <fmt:formatDate value="${qwer.eduDto.apply_end_date }"
										pattern="yy년 MM월 dd일 hh시"/><br>
                                	교육일시 <fmt:formatDate value="${qwer.eduDto.edu_date }"
										pattern="yy년 MM월 dd일 hh시"/><br>
                                	교육장소 ${qwer.eduDto.place }<br>7
                                	수강인원 ${qwer.eduDto.capacity }<br>
                                	등록일자 ${qwer.eduDto.created_at } <br>
                                	<a href="./updateEduProgPage?edu_pk=${qwer.eduDto.edu_pk }">글 수정</a>
                                	<a href="./deleteEduProgProcess?edu_pk=${qwer.eduDto.edu_pk }">글 삭제</a><br>
                               		<a href="./eduMainPageForStaff">목록으로</a>
                                	
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
                                                <div class="col-4 my-auto">
                                                    <img class="img-fluid" src="./img/health/health_ci.gif">
                                                </div>
                                                <div class="col text-body-tertiary" style="font-size: small;">
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