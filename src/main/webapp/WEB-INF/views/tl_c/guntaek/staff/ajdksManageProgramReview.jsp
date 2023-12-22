<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title> AJDKS TEMPLATE FOR STAFF </title>
<style>
	/*교직원좌측메뉴바설정*/
	.staffleftmenubar input {
	    display: none;
	}
	
	.staffleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.staffleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.staffleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.staffleftmenubar input + label + .content {
	    display: none;
	}
	
	.staffleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

</style>

</head>
<body>
<div class="container-fluid">
<!-- 전체 container 입구 -->

<div class="row">
		<div class="col">
		<jsp:include page="../../common/ajdksHighestMenubarForStaff.jsp"></jsp:include>
	</div>
</div>
<div class="row">

	<!-- 좌측메뉴바 -->
	<jsp:include page="../../common/ajdksSideMenubarForStaff.jsp"></jsp:include>
	
	<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
	<div class="col">
		<div class="row">
			<div class="col mx-4">
			<!-- 본문작성공간 -->
				
				
					<!-- 프로그램 상세하게 보기... -->				
					
					<div class="row mt-5">
					<div class="col fw-bold">
								<h3 style="font-weight:bold"> <i class="bi bi-list-task"></i>&nbsp;&nbsp;&nbsp;${ProgramDto.title}</h3>	
					</div>
					</div>
					
					<div class="row mt-3">
						<div class="col border border-2 border-dark"></div>
					</div>
					
				
					
					
					<div class="row mt-4 border">	
						<div class = "col-2 d-flex justify-content-center align-items-center border-end" style ="background-color:#f9f9f9; height:2em" >접수기간</div>
						<div class = "col-4 ps-3 d-flex align-items-center" >${ProgramDto.progress_date}</div>
						<div class = "col-2 d-flex justify-content-center align-items-center border-start border-end" style ="background-color:#f9f9f9">모집마감일자</div>
						<div class = "col-4 ps-3 d-flex align-items-center">
							<fmt:formatDate pattern ="yyyy-MM-dd" value="${ProgramDto.deadline_date}"/>
						</div>
					</div>
					<div class="row mt">
						<div class = "col-2 d-flex justify-content-center align-items-center border-start " style ="background-color:#f9f9f9;height:2em">장소</div>
						<div class = "col-10 d-flex align-items-center border-end border-start"> ${ProgramDto.place}</div>
					</div>
					<div class="row mt border">
						<div class = "col-2 d-flex justify-content-center align-items-center border-end" style ="background-color:#f9f9f9; height:2em">신청 가능 인원</div>
						<div class = "col-4 ps-3 d-flex align-items-center">${ProgramDto.maximum_applicant}</div>
						<div class = "col-2 d-flex justify-content-center align-items-center border-start border-end" style ="background-color:#f9f9f9">교육비</div>
						<div class = "col-4 ps-3 d-flex align-items-center">무료</div>
					</div>
					
					
					<div class="row mt-5">
					<div class="col-1"></div>
						<div class="col-10 d-flex justify-content-center"><img class="img-fluid" src="/Git_imageFile/${ProgramDto.poster_image}">
					</div>
					<div class="col-1"></div>
					</div>

					<div class="row mt-5">
					<div class="col-2"> <p style="font-weight:bold; font-size:1.2em">상세내용</p></div>
 					<div class="col"></div>	
					</div>
					
					<div class="row mt-2">
					<div class="col border px-4 py-2" style ="background-color:#f9f9f9; border-radius:5px;">
								${ProgramDto.content}
					</div>
					</div>
					
					<div class="row mt-5">
					<div class="col-2"><p style="font-weight:bold; font-size:1.2em">학생 리뷰</p></div></div>
 					<div class="col"></div>	
					
					
					
					
					<c:forEach items="${reviewList}" var="a">
						
					<form action ="./ajdksDeleteProgramReview">
					<div class="row border border-radius:5px;">
					<div class = "col-1 d-flex justify-content-center align-items-center border-end" style ="background-color:#f9f9f9; height:3em" >아이디</div>
					<div class = "col-2 ps-3 d-flex align-items-center justify-content-center">익명 ${a.internedu_review_pk}</div>
					<div class = "col-2 d-flex justify-content-center align-items-center border-start border-end" style ="background-color:#f9f9f9">점수(5점 만점)</div>
					<div class = "col-2 ps-3 d-flex align-items-center justify-content-center">${a.rating}점</div>
					<div class = "col-1 d-flex justify-content-center align-items-center border-start border-end" style ="background-color:#f9f9f9">작성일</div>
					<div class = "col-4 ps-3 d-flex align-items-center justify-content-center">	<fmt:formatDate pattern ="yyyy-MM-dd" value="${a.created_at}"/></div>
					
				
					</div>
					<div class="row border-start border-end border-bottom px-4 py-4 " style ="height:10em; ; border-radius:5px;">
						${a.review}
					</div>
					<div class="row mt-4"></div>
					</form>
					</c:forEach>
					
						
					
					</div>
					
					<!-- 본문 작성 공간 -->			
				</div>
			</div>
			<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>		
		</div>	
	
	</div>

			<!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>