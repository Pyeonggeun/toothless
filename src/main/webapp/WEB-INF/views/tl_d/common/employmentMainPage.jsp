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
                        MK University<span class="fs-6"> | </span> <span class="fs-5">학생포털사이트</span> 
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
        <!-- 메뉴 -->
        <div class="row text-center py-1 fw-bold text-light" style="background-color: #133369">
            <div class="col-2"></div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="../ny_posting/jobPostingListForStudentPage">채용공고</a>
            </div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="./mainpage">프로그램</a>
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
		<!-- 아래 쪽 -->
		<div class="row">
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>