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
                <a href="../commons/counselCenterStudentMainPage"><img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;"></a>
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
							    <li><a class="dropdown-item" href="#">emptyPage1</a></li>
							    <li><hr class="dropdown-divider"></li>
						   		<li><a class="dropdown-item" href="#">emptyPage2</a></li>
						   		<li><hr class="dropdown-divider"></li>
						   		<li><a class="dropdown-item" href="#">emptyPage3</a></li>
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
							    <li><a class="dropdown-item" href="../offlineCounsel/checkOfflineCounselReservationStudentPage">예약 조회</a></li>
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
			<div class="col-9 ps-5">
				<div class="row pt-5">
					<div class="col fs-3 fw-bold">
						예약 조회
					</div>
				</div>
				<div class="row pt-4">
					<div class="col">
						<div class="row border" style="background-color: rgb(244, 244, 241);">
							<div class="col">
								<div class="row py-3 align-items-center border-bottom">
									<div class="col-1 fw-bold">
										상담사명
									</div>
									<div class="col-3">
										<input class="form-control" type="text">
									</div>
									<div class="col-1"></div>
									<div class="col-1 fw-bold">
										일자
									</div>
									<div class="col-2">
										<select class="form-select">
										  <option selected>일자</option>
										  <option value="1">상담신청일</option>
										  <option value="2">상담예약일</option>
										</select>								
									</div>
									<div class="col-3 ps-5">
										<input class="form-control" type="date">
									</div>
								</div>
								<div class="row pt-3 pb-3 align-items-center border-bottom">
									<div class="col-1 fw-bold">
										상담종류
									</div>
									<div class="col-3">
										<select class="form-select">
										  <option value="1" selected>전체</option>
										  <option value="2">성격문제</option>
										  <option value="3">대인/가족관계</option>
										  <option value="4">이성문제</option>
										  <option value="5">우울/불안문제</option>
										  <option value="6">진로문제</option>
										  <option value="7">학업문제</option>
										</select>								
									</div>
									<div class="col-1"></div>
									<div class="col-1 fw-bold">
										상담상태
									</div>
									<div class="col-3">
										<select class="form-select">
										  <option value="1" selected>전체</option>
										  <option value="2">신청</option>
										  <option value="3">완료</option>
										  <option value="4">취소</option>
										</select>								
									</div>
								</div>
								<div class="row py-3">
									<div class="col-4"></div>
									<div class="col-2 d-grid">
										<input class="btn btn-outline-dark" type="submit" value="초기화" style="background-color: rgb(255,255,255);">
									</div>
									<div class="col-2 d-grid">
										<input class="btn btn-dark" type="submit" value="검색">
									</div>
									<div class="col-4"></div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				<div class="row pt-5 pb-3 border-bottom border-dark">
					<div class="col-10"></div>
					<div class="col-2">
						<select class="form-select">
						  <option selected>전체</option>
						  <option value="1">오름차순</option>
						  <option value="2">내림차순</option>
						</select>								
					</div>
				</div>
				<div class="row pt-3 pb-3 border-bottom border-dark text-center fw-bold" style="background-color: rgb(244, 244, 241);">
					<div class="col-1">
						No.
					</div>
					<div class="col-2">
						상담종류
					</div>
					<div class="col-1">
						상담사명
					</div>
					<div class="col-2">
						신청일
					</div>
					<div class="col-1">
						상담상태
					</div>
					<div class="col-2">
						상담일자
					</div>
					<div class="col">
						예약취소
					</div>
					<div class="col">
						리뷰
					</div>
				</div>
				<!-- 이 row 한 개 반복문으로 돌려서 출력 -->
				<c:forEach items="${list }" var="map" varStatus="vs">
					<div class="row pt-3 pb-3 border-bottom text-center">
						<div class="col-1 pt-2">
							${fn:length(list) - vs.index}
						</div>
						<div class="col-2 pt-2">
							${map.typeCategoryDto.name }
						</div>
						<div class="col-1 pt-2">
							${map.counselorDto.name }
						</div>
						<div class="col-2 pt-2">
							<fmt:formatDate value="${map.offlineReservationDto.created_at }" pattern="yyyy-MM-dd"/>
						</div>
						<div class="col-1 pt-2">
							${map.offlineReservationDto.state }
						</div>
						<div class="col-2 pt-2">
							${map.offlineReservationDto.counsel_year }-${map.offlineReservationDto.counsel_month }-${map.offlineReservationDto.counsel_date }&nbsp;
							${map.offlineReservationDto.counsel_hour }<span>:00</span>
						</div>
						<div class="col d-grid">
							<form action="./counselCancelPage" method="get">
								<c:choose>
									<c:when test="${map.offlineReservationDto.state == '신청' }">
										<input class="btn btn-danger" type="submit" value="예약취소">
									</c:when>
									<c:when test="${map.offlineReservationDto.state == '완료' }">
										<input class="btn btn-outline-danger" type="submit" value="예약취소" disabled="disabled">
									</c:when>
									<c:otherwise>
										<input class="btn btn-outline-danger" type="submit" value="취소완료" disabled="disabled">
									</c:otherwise>
								</c:choose>
								<input name="reservation_id" type="hidden" value="${map.offlineReservationDto.id }">
							</form>
						</div>
						<div class="col d-grid">
							<form action="./counselReviewPage" method="get">
								<c:choose>
									<c:when test="${!empty map.offlineSurveyDto.id }">
										<input class="btn btn-dark" type="submit" value="리뷰확인">
									</c:when>
									<c:when test="${empty map.offlineSurveyDto.id && map.offlineReservationDto.state == '완료' }">
										<input class="btn btn-outline-dark" type="submit" value="리뷰작성">
									</c:when>
									<c:otherwise>
										<input class="btn btn-outline-dark" type="submit" value="리뷰작성" disabled="disabled">
									</c:otherwise>
								</c:choose>
								<input name="reservation_id" type="hidden" value="${map.offlineReservationDto.id }">
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-1"></div>
		</div>
		
		<pre>
		
		
		
		
		
		
		
		</pre>
	
	
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>