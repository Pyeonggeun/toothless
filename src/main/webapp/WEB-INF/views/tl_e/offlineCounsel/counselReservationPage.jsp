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
	
		<div class="row py-2">
            <div class="col-1 pe-2 text-end">
                <img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
            </div>
            <div class="col-3 ps-0 pt-2 fw-bold fs-3 text-start ">
                MK University<span class="fs-6"> | </span> <span class="fs-5">상담센터</span> 
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
			    <span class="fw-bold">${sessionStudentInfo.name }</span>님
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
		
		<!-- 상단 내비게이션 -->
		<div class="row fw-bold" style="background-color: #133369;">
			<div class="col ms-5">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle fw-bold text-white" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">상담신청</a>
				    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">온라인 상담신청</a></li>
                        <li><a class="dropdown-item" href="./selectCounselorPage">오프라인 상담신청</a></li>
                        <li><a class="dropdown-item" href="#">집단 상담신청</a></li>
                    </ul>
				  </li>
				</ul>
			</div>
			<div class="col">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link fw-bold text-white" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">공지사항</a>
				  </li>
				</ul>
			</div>
			<div class="col">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link fw-bold text-white" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">자유게시판</a>
				  </li>
				</ul>
			</div>
			<div class="col">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link fw-bold text-white" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">상담원 정보</a>
				  </li>
				</ul>
			</div>
			<div class="col">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle fw-bold text-white" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">마이페이지</a>
				    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="./checkOfflineCounselReservationStudentPage">예약 조회</a></li>
                        <li><a class="dropdown-item" href="#">상담이력 조회</a></li>
                    </ul>
				  </li>
				</ul>
			</div>
		</div>
		
		<!-- 상단 배너 -->
		<div class="row">
			<div class="col d-grid px-0" style="background-image: url('../../resources/img/offlineCounsel/offlineCounselBanner5.jpg'); height: 27em">
				<div class="row">
					<div class="col-3">
						<span class="fs-1 fw-bold" style="font-size: xx-large;">학생 상담</span>
					</div>
				</div>
			</div>
		</div>
	
		<!-- 본문 -->
		<div class="row">
			<div class="col-2"></div>
			<div class="col">
				<div class="row pt-5">
					<div class="col text-center py-2 fs-5 border border-white border-1 rounded" style="background-color: rgb(231, 231, 226);">
						상담 선택
					</div>
					<div class="col text-center bg-dark text-white py-2 fs-5 border border-white border-1 rounded">
						상담 신청
					</div>
					<div class="col text-center py-2 fs-5 border border-white border-1 rounded" style="background-color: rgb(231, 231, 226);">
						신청 완료
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		
		<!-- 상담원 정보 -->
		<div class="row pt-5">
			<div class="col-2"></div>
			<div class="col border border-dark rounded">
				<div class="row border-bottom border-dark fs-5 fw-bold rounded" style="background-color: rgb(246, 246, 242);">
					<div class="col-3 ps-4 py-2 border-end border-dark">
						상담사명
					</div>
					<div class="col-9 py-2 ps-4">
						경력사항
					</div>
				</div>
				<div class="row">
					<div class="col-3 border-end border-dark">
						<div class="row">
							<div class="col pt-4 px-4">
								<img class="img-fluid" src="../../resources/img/counselorImage/${counselorDto.profileImage }">
							</div>
						</div>
						<div class="row pt-4 pb-3">
							<div class="col text-center fs-4">
								${counselorDto.name }
							</div>
						</div>
					</div>
					<div class="col-9 pt-4 ps-4">
						${counselorDto.career }
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		
		<div class="row pt-5">
			<div class="col-2"></div>
			<div class="col">
				<i class="bi bi-info-circle-fill"></i>
				<span>&nbsp;&nbsp;일정 선택</span>
			</div>
			<div class="col-2"></div>
		</div>
		
		<form action="./counselReservationProcess" method="get">
		<!-- 일정(7일) -->
		<div class="row pt-3">
			<div class="col-2"></div>
			<div class="col">
				<div class="row">
					<c:forEach items="${sevenDaysList }" var="dayMap">
						<!-- 아래의 col 한 개를 반복문으로 돌려서 출력 -->
						<div class="col-3 border border-dark rounded">
							<div class="row">
								<div class="col">
									<div class="row py-2 rounded border-dark border-bottom" style="background-color: rgb(246, 246, 242);">
										<div class="col text-center fs-5 fw-bold">
											${dayMap.month }/${dayMap.date }
											<span>
												<c:choose>
													<c:when test="${dayMap.day == 1 }">
														(월)
													</c:when>
													<c:when test="${dayMap.day == 2 }">
														(화)
													</c:when>
													<c:when test="${dayMap.day == 3 }">
														(수)
													</c:when>
													<c:when test="${dayMap.day == 4 }">
														(목)
													</c:when>
													<c:when test="${dayMap.day == 5 }">
														(금)
													</c:when>
													<c:when test="${dayMap.day == 6 }">
														(토)
													</c:when>
													<c:when test="${dayMap.day == 7 }">
														(일)
													</c:when>
												</c:choose>
											</span>
										</div>
									</div>
									<div class="row" style="height: 23em;">
										<div class="col pb-3">
											<c:choose>
												<c:when test="${dayMap.day == 6 || dayMap.day == 7 }">
													<div class="row pt-3 align-self-center">
														<div class="col text-center fs-4 fw-bold pt-5 mt-5 text-danger">
															휴무
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<c:forEach items="${dayMap.timeList }" var="time">
														<c:if test="${time.hour != 12 }">
															<div class="row pt-3">
																<div class="col text-center form-check ps-5">
																	<c:set var="vs" value="0"/>
																	<c:forEach items="${time.reservationDateInfoList }" var="dateInfo">
																		<c:if test="${time.dateString == dateInfo }">
																			<c:set var="vs" value="${vs + 1 }"/>
																		</c:if>
																	</c:forEach>
																	<c:choose>
																		<c:when test="${(vs >= 1 && time.state != '취소') || time.state == '완료' || time.state == '노쇼' || time.state == '신청' }">
																			<input class="form-check-input border-dark" name="reservationDate" type="radio" value="${dayMap.year }.${dayMap.month }.${dayMap.date }.${time.hour }.${dayMap.day}" disabled>
																		</c:when>
																		<c:otherwise>
																			<input class="form-check-input border-dark" name="reservationDate" type="radio" value="${dayMap.year }.${dayMap.month }.${dayMap.date }.${time.hour }.${dayMap.day}">
																		</c:otherwise>
																	</c:choose>
																	<label class="form-check-label">${time.hour}시 - ${time.hour + 1 }시</label>
																</div>
															</div>
														</c:if>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		
		<div class="row pt-5">
			<div class="col-2"></div>
			<div class="col">
				<i class="bi bi-info-circle-fill"></i>
				<span>&nbsp;&nbsp;남기고 싶은 말</span>
			</div>
			<div class="col-2"></div>
		</div>
		
		<div class="row pt-3">
			<div class="col-2"></div>
			<div class="col">
				<div class="row">
					<div class="col">
						<textarea name="text" class="rounded" rows="5" cols="150"></textarea>
					</div>
					<div class="col">
						<input class="form-check-input border-dark" type="radio" value="1" disabled>
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		<div class="row pt-5">
			<div class="col-2"></div>
			<div class="col-3"></div>
			<div class="col d-grid">
				<input name="student_pk" type="hidden" value="${sessionStudentInfo.student_pk }">
				<input name="type_category_id" type="hidden" value="${type_category_id }">
				<input name="counselor_id" type="hidden" value="${counselorDto.id }">
				<input class="btn btn-dark btn-lg" type="submit" value="신청하기">
			</div>
			<div class="col-3"></div>
			<div class="col-2"></div>
		</div>
		</form>
		
		
		
		<pre>
		
		
		
		
		
		
		</pre>
	
	
	</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>