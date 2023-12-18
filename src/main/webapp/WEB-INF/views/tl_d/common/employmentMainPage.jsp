<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        
</head>
<body>
	<div class="container-fluid">
		<!-- 상단바 -->
		<div class="row">
            <div class="col">
                <div class="row my-1 pt-4 text-center">
                    <div class="col-1 pe-2 text-end">
                        <img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
                    </div>
                    <div class="col-3 ps-0 fw-bold fs-1 text-start ">
                        MK University<span class="fs-6"> | </span> <span class="fs-5">취업지원센터</span> 
                    </div>
                    <div class="col-6"></div>
                    <div class="col-1 mt-5 pb-2 text-secondary text-end">
						<%-- mainPage --%>
						<c:choose>
							<c:when test="${!empty sessionStudentInfo}">
								<li style="list-style-type: none;" class="nav-item dropdown ms-auto"><a
									class="fw-bold nav-link dropdown-toggle" href="#" role="button"
									data-bs-toggle="dropdown" aria-expanded="false">
										${sessionStudentInfo.name} 님</a>
									<ul class="dropdown-menu">
										<li><a href="../common/studentMyPage"
											class="dropdown-item">마이페이지</a></li>
										<li><a href="../common/studentLogoutProcessForMain"
											class="dropdown-item">로그아웃</a></li>
									</ul>
								</li>
							</c:when>
							<c:otherwise>
								<li style="list-style-type: none;" class="nav-item"><a href="../../another/student/loginPage"
									class="nav-link">로그인</a></li>
							</c:otherwise>
						</c:choose>
					</div>
                </div>
            </div>
        </div>
        <!-- 상단부 : 메뉴 -->
        <div class="row text-center py-2 fw-bold text-light" style="background-color: #133369">
            <div class="col-2"></div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="../ny_posting/jobPostingListForStudentPage">채용공고</a>
            </div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="../gw_program/programListForStudentPage">프로그램</a>
            </div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="../../tl_e/commons/counselCenterStudentMainPage">취업컨설팅</a>
            </div>
            <!-- 드롭다운 만들 예정 -->
            <div class="col align-self-center">
                <a class="navbar-brand" href="../../tl_a/student/jw_mainPage">게시판</a>
            </div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="../../tl_a/student/jw_mainPage">공지사항</a>
            </div>
            <div class="col-2"></div>
        </div>
        <!-- 중앙부 : 단일 배너 -->
        <div class="row">
        	<div class="col px-0">
				<img class="img-fluid" src="../../resources/img/employment/employmentBanner.jpg">
        	</div>
        </div>
		<!-- 하단부 : 프로그램리스트 + 공지사항 + 링크등 -->
		<div class="row mb-5">
			<div class="col-1 ms-5 me-3"></div>
			<!-- 공지사항 -->
			<div class="col-3 mx-3">
				<div class="row border-bottom border-2">
					<div class="col fs-5 fw-bold mt-5 pb-1">공지사항</div>
					<div class="col fs-5 fw-bold mt-5 text-end">
						<a class="navbar-brand" href="#">
							<i class="bi bi-plus-lg"></i>
						</a>	
					</div>
				</div>
			</div>
			<!-- 프로그램 -->
			<div class="col-3 mx-3 mb-5">
				<div class="row border-bottom border-2 mb-3">
					<div class="col fs-5 fw-bold mt-5 pb-1">프로그램</div>
					<div class="col fs-5 fw-bold mt-5 text-end">
						<a class="navbar-brand" href="../gw_program/programListForStudentPage">
							<i class="bi bi-plus-lg"></i>
						</a>	
					</div>
				</div>
				<c:set var="currentTime" value="<%= new java.util.Date() %>" />
				<c:forEach items="${programList}" var="list" varStatus="loop">
					<c:if test="${loop.index < 5}">
						<div class="row border-bottom border-bs-border pb-2 mb-2">
							<div class="col-1 text-center fw-bold pt-1">${list.programDto.program_pk}</div>
							<div class="col"><a class="btn" href="../gw_program/programViewDetailsForStudentPage?program_pk=${list.programDto.program_pk}">${list.programDto.prg_name}</a></div>
							<div class="col-3 text-center pt-1">
								<c:choose>
						                <c:when test="${list.programDto.prg_apply_deadline.before(currentTime)}">
						                	<span class="text-center badge text-bg-secondary">마감</span>
						                </c:when>
						                <c:otherwise>
						                	 <span class="text-center badge text-bg-primary">모집중</span>
						                </c:otherwise>
						            </c:choose>
							</div>
						</div>
					</c:if>
				</c:forEach> 
			</div>
			<!-- 캘린더 -->
			<div class="col-3 ms-3">
				<div class="row mt-5">
					<div class="col mt-3">
						<img class="img-fluid" src="../../resources/img/employment/calender.png">
					</div>
				</div>
			</div>
		</div>
		<!-- 링크들 -->
		<div class="row mb-3">
			<div class="col-1"></div>
			<div class="col">
				<img class="img-fluid mx-5" src="../../resources/img/employment/employmentcenter.jpg">			
				<img class="img-fluid mx-5" src="../../resources/img/employment/onlinecenter.jpg">			
				<img class="img-fluid mx-5" src="../../resources/img/employment/jobkorea.jpg">			
				<img class="img-fluid mx-5" src="../../resources/img/employment/saramin.jpg">			
				<img class="img-fluid mx-5" src="../../resources/img/employment/worknet.jpg">			
				<img class="img-fluid mx-5" src="../../resources/img/employment/workplus.jpg">			
			</div>
		</div>
		<!-- 최하단 : 개인정보처리방침 + 주소 등 -->
		<div class="row py-4" style="background-color: #808080">
			<div class="col-1 pt-1 pe-2 text-end">
                <img class="opacity-25" src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
            </div>
            <div class="col pt-1">
            	<div class="row">
            		<div class="col text-white">
		            	<span class="pe-2">개인정보처리방침</span><span>|</span>
		            	<span class="pe-2">이메일무단수집거부</span><span>|</span>
		            	<span class="pe-2">대학정보공시</span><span>|</span>
		            	<span class="pe-2">사이트맵</span>
            		</div>
            	</div>
            	<div class="row">
            		<div class="col text-dark">
            			서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층) / TEL:010-4761-2103 / E-MAIL:se001lec@naver.com
            		</div>
            	</div>
            	<div class="row">
            		<div class="col text-dark" style="font-size: 0.9rem;">
            			COPYRIGHT© 2023 MINKUE UNIVERSITY ALL RIGHTS RESERVED.
            		</div>
            	</div>
            </div>
		</div>
		<div class="col"></div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>