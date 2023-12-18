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
<div class="container-fluid"><!-- 전체 container 입구 -->

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
				
				
				<div class="row mt-5 ms-3">
				<div class="col fw-bold">
						<h3> <i class="bi bi-card-text"></i> &nbsp;&nbsp; 프로그램 리뷰 조회 페이지</h3> 
				</div>
				</div>
				<div class="row mt-3">
					<div class="col border border-2 border-dark"></div>
				</div>
				 
				<div class="row" style ="margin-top:6em;">
					<div class="col border border-1"></div>
				</div>
				<div class="row mt-3 d-flex align-items-center text-center fw-bold" style="font-size: 0.9em; height:2.3em;">
					<div class="col-1">No</div>
					<div class="col-3">제목</div>
					<div class="col-1">강연자</div>
					<div class="col-2">장소</div>
					<div class="col">마감일	</div>
					<div class="col">진행 날짜</div>
					<div class="col">작성일자</div>
					<div class="col">평점</div>
				</div>
				<div class="row mt-3">
					<div class="col border border-1"></div>
				</div>
				<!-- 다시 -->
					<c:forEach items="${List}" var="a">
							<div class="row mt-3 d-flex align-items-center text-center" style="font-size: 0.8em; height:2.3em;" >
								<div class="col-1">${a.programList.internedu_program_pk}</div>
								<div class="col-3">
								<a href="./ajdksManageProgramReview?internedu_program_pk=${a.programList.internedu_program_pk}" style ="color:black;">
									${a.programList.title}
								</a>	
								</div>								
								<div class="col-1">${a.programList.lecturer}</div>
								<div class="col-2">${a.programList.place}</div>
								<div class="col"><fmt:formatDate pattern = "yyyy/MM/dd" value="${a.programList.deadline_date}"/></div>
								<div class="col">
								${a.programList.progress_date}
								</div>
								<div class="col">
								<fmt:formatDate pattern = "yyyy/MM/dd" value="${a.programList.created_at}"/>
								</div>
								<c:if test="${!empty a.rating}">
								<div class="col">
									${a.rating}
								</div>
								</c:if>
								
								<c:if test="${empty a.rating}">
								<div class="col">
									리뷰 없음
								</div>
								</c:if>
							</div>
							<div class="row mt-3">
								<div class="col border border-secondary-subtle"></div>
							</div>
					</c:forEach>
				
				
				
			</div>
		</div>
	</div>	
				
	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>