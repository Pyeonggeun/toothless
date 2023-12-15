<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>

	<div class="container-fluid">
	
		<div class="row pt-2 pb-3 border-bottom">
            <div class="col-4 ps-5 text-start">
                <a class="navbar-brand" href="../commons/counselCenterCounselorMainPage"><img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
                <span class="fw-bold fs-3 text-start align-middle">MK University</span><span class="fs-6t align-middle">&nbsp;&nbsp;|&nbsp;&nbsp;</span><span class="fs-5 fw-bold align-middle">상담센터</span></a>
            </div>
            <div class="col-2"></div>
            <div class="col">
            	<div class="row pt-3">
            		<div class="col-9 d-grid">
            			<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            		</div>
            		<div class="col d-grid">
            			<button class="btn btn-outline-dark" type="submit">Search</button>
            		</div>
            	</div>
            </div>
			<div class="col-1 pt-3 me-0 pe-0 text-center dropdown nav-item">
			  <a class="nav-link pt-2 dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    <span class="fw-bold">${sessionExternalInfo.external_id }</span>님
			  </a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">정보 수정</a></li>
			    <li><a class="dropdown-item" href="#">마이페이지</a></li>
			    <li><hr class="dropdown-divider"></li>
			    <li><a class="dropdown-item" href="#"><span><i class="bi bi-power"></i></span>&nbsp;로그아웃</a></li>
			  </ul>
			</div>
			<div class="col-1"></div>
		</div>

		<div class="row">
			<div class="col-2 ms-4 border-end" style="height: 53em">
				<div class="row pt-5">
					<div class="col fw-bold fs-3 ps-4">
						MENU
					</div>
				</div>
				<div class="row pt-5">
					<div class="col fs-5">						
						<div class="dropend">
							<button class="btn btn-white dropdown-toggle navbar-brand" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							온라인상담
							</button>
							<ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="../onlineCounsel/onlineCounselMainPage">온라인상담</a></li>
							    <li><hr class="dropdown-divider"></li>
						   		<li><a class="dropdown-item" href="#">emptyPage1</a></li>
						   		<li><hr class="dropdown-divider"></li>
						   		<li><a class="dropdown-item" href="#">emptyPage2</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col fs-5">						
						<div class="dropend">
							<button class="btn btn-white dropdown-toggle navbar-brand" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							오프라인상담
							</button>
							<ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="../offlineCounsel/offlineCounselReservationCheckPage">예약 조회</a></li>
							    <li><hr class="dropdown-divider"></li>
						   		<li><a class="dropdown-item" href="../offlineCounsel/offlineCounselHistoryCheckPage">상담 이력 조회</a></li>
						   		<li><hr class="dropdown-divider"></li>
						   		<li><a class="dropdown-item" href="#">일정 변경</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col fs-5">						
						<div class="dropend">
							<button class="btn btn-white dropdown-toggle navbar-brand" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							집단상담
							</button>
							<ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="#">emptyPage1</a></li>
							    <li><hr class="dropdown-divider"></li>
						   		<li><a class="dropdown-item" href="#">emptyPage2</a></li>
						   		<li><hr class="dropdown-divider"></li>
						   		<li><a class="dropdown-item" href="#">emptyPage3</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-8 ps-5">
				<div class="row pt-5">
					<div class="col fs-3 fw-bold">
						나의 휴가일정
					</div>
				</div>
				<div class="row pt-4 pb-3 border-bottom border-dark">
					<div class="col-10 text-end pe-0 pt-2">
						<i class="bi bi-plus-circle"></i>
					</div>
					<div class="col-2">
						<form class="d-grid" action="./vacationRegisterPage" method="get">
							<input name="counselor_id" type="hidden" value="${counselorDto.id }">
							<input class="btn btn-dark" type="submit" value="휴가신청">								
						</form>
					</div>
				</div>
				<div class="row pt-3 pb-3 border-bottom border-dark text-center fw-bold" style="background-color: rgb(244, 244, 241);">
					<div class="col-1">
						No.
					</div>
					<div class="col-3">
						구분
					</div>
					<div class="col-4">
						시작일시
					</div>
					<div class="col-4">
						종료일시
					</div>
				</div>
				<!-- 이 row 한 개 반복문으로 돌려서 출력 -->
				<c:forEach items="${list }" var="dateList" varStatus="vs">
					<div class="row pt-3 pb-3 border-bottom text-center">
						<div class="col-1 pt-2">
							${vs.index + 1}
						</div>
						<div class="col-3 pt-2">
							연차
						</div>
						<div class="col-4 pt-2">
							${dateList.start_year}-${dateList.start_month }-${dateList.start_date } ${dateList.start_hour }:00
						</div>
						<div class="col-4 pt-2">
							${dateList.end_year}-${dateList.end_month }-${dateList.end_date } ${dateList.end_hour + 1 }:00
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-2"></div>
		</div>
		
		<pre>
		
		
		
		
		
		
		
		</pre>
	
	
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>