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
    	<title>교육 학생 상세페이지</title>
    </head>
    <body>
		<h1>학생이 보는 상세페이지입니다.</h1>
		<h1>교육 프로그램 정보</h1>
		작성자 ${qwer.staffInfoDto.name }<br>
		제목 ${qwer.eduDto.name }<br>
		내용 ${qwer.eduDto.content }<br>
		포스터이미지링크
		<img class="img" src="/uploadFiles/eduImage/${qwer.eduDto.img_link }"><br>
		신청시작일 <fmt:formatDate value="${qwer.eduDto.apply_start_date }"
		pattern="yy년 MM월 dd일 hh시"/><br>
		신청종료일 <fmt:formatDate value="${qwer.eduDto.apply_end_date }"
		pattern="yy년 MM월 dd일 hh시"/><br>
		교육일시 <fmt:formatDate value="${qwer.eduDto.edu_date }"
		pattern="yy년 MM월 dd일 hh시"/><br>
		교육장소 ${qwer.eduDto.place }<br>
		수강인원 ${qwer.eduDto.capacity }<br>
		등록일자 ${qwer.eduDto.created_at } <br>
		
		<a href="./eduMainPageForStaff">목록으로</a><br>
		
		<!-- 내가 신청한 프로그램인지에 따라 버튼 다르게 표시  -->
		<%-- ${qwer.stuAndEduCount }-->얘가 0이면 버튼 활성화 1이면 비활성화<br> --%>
		<c:choose>
            <c:when test="${qwer.stuAndEduCount eq '0'}">
                <%-- <a class="btn fw-bold text-white" href="./eduApplyPage?edu_pk=${qwer.eduDto.edu_pk }&name=${qwer.eduDto.name}"
			    role="button" style="background-color: #014195;">프로그램 신청</a><br> --%>
			    <button class="btn fw-bold text-white" 
	                	style="background-color: #014195;" 
	                	onclick="location.href='./eduApplyPage?edu_pk=${qwer.eduDto.edu_pk}&name=${qwer.eduDto.name}&capacity=${qwer.eduDto.capacity}'">
		            프로그램 신청
		        </button>
            </c:when>
		
            <c:otherwise>
	            <button class="btn fw-bold" style="background-color: #a6abb2;" disabled>
	            	프로그램 신청
	            </button>
            </c:otherwise>
        </c:choose>
        <br>
     
     	
			
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
          
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>