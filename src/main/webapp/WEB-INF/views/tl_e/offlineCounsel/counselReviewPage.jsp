<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
                <span class="fw-bold fs-3 text-start align-middle">MK University</span><span class="fs-6t align-middle">&nbsp;&nbsp;|&nbsp;&nbsp;</span><span class="fs-5 fw-bold align-middle">상담센터</span> 
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
			    <span class="fw-bold">${sessionStudentInfo.student_id }</span>님
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
			<div class="col-1"></div>
			<div class="col-6 mt-5">
				<form action="./counselReviewProcess" method="get">
					<div class="row pt-3">
						<div class="col fs-3 fw-bold text-center">
							상담 만족도 조사
						</div>
					</div>
					<div class="row pt-4">
						<div class="col border border-dark">
							<div class="row text-center border-bottom border-dark">
								<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
									<div class="row">
										<div class="col">
											상담일자
										</div>
									</div>
								</div>
								<div class="col border-end border-dark py-3">
									<div class="row">
										<div class="col">
											${map.offlineReservationDto.counsel_year }-${map.offlineReservationDto.counsel_month }-${map.offlineReservationDto.counsel_date }
											&nbsp;${map.offlineReservationDto.counsel_hour }:00
										</div>
									</div>
								</div>
								<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
									<div class="row">
										<div class="col">
											상담사명									
										</div>
									</div>
								</div>
								<div class="col py-3">
									<div class="row">
										<div class="col">
											${map.counselorDto.name }								
										</div>
									</div>
								</div>
							</div>
							<div class="row text-center border-bottom border-dark">
								<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
									<div class="row">
										<div class="col pt-2">
											점수
										</div>
									</div>
								</div>
								<div class="col py-3 border-end border-dark">
									<div class="row">
										<div class="col">
											<select name="score" class="form-select" style="color: #ffc107;">
											  <option class="text-warning" value="5" ${map.offlineSurveyDto.score == '5' ? 'selected' : '' }>★★★★★</option>
											  <option class="text-warning" value="4" ${map.offlineSurveyDto.score == '4' ? 'selected' : '' }>★★★★</option>
											  <option class="text-warning" value="3" ${map.offlineSurveyDto.score == '3' ? 'selected' : '' }>★★★</option>
											  <option class="text-warning" value="2" ${map.offlineSurveyDto.score == '2' ? 'selected' : '' }>★★</option>
											  <option class="text-warning" value="1" ${map.offlineSurveyDto.score == '1' ? 'selected' : '' }>★</option>
											</select>								
										</div>
									</div>
								</div>
								<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
									<div class="row">
										<div class="col pt-2">
											상담주제
										</div>
									</div>
								</div>
								<div class="col py-3">
									<div class="row">
										<div class="col pt-2">
											${map.typeCategoryDto.name }								
										</div>
									</div>
								</div>
							</div>
							<div class="row text-center align-items-center">
								<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
									<div class="row">
										<div class="col pb-3">
											<br><br><br>
											리뷰내용
											<br><br><br>
										</div>
									</div>
								</div>
								<div class="col py-3">
									<div class="row">
										<div class="col">
											<textarea name="text" class="form-control" rows="6">${map.offlineSurveyDto.text }</textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row pt-4">
						<div class="col">
							<div class="row">
								<div class="col"></div>
								<div class="col-3 d-grid pe-0">
									<c:choose>
										<c:when test="${!empty map.offlineSurveyDto.id }">
											<input class="btn btn-dark" type="submit" value="리뷰하기" disabled="disabled">
										</c:when>
										<c:otherwise>
											<input class="btn btn-dark" type="submit" value="리뷰하기">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
					<input name="reservation_id" type="hidden" value="${map.offlineReservationDto.id }">
				</form>
			</div>
			<div class="col-3"></div>
		</div>
		
		<pre>
		
		
		
		
		
		
		
		</pre>
	
	
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>