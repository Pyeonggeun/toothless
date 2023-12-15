<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>


	<!-- 상단 배너 -->
	
	<jsp:include page="./staffTopArea.jsp"></jsp:include>
	
	
	
	
	<!-- 상단 배너 이미지 -->	

	<div class="row">
		<div class="col fw-bold text-center">
			<img src="../../resources/img/counselCenterStaff/topBanner01.jpg" class="border border-dark" style="max-width: 100%; height: auto;">
		</div>
	</div>
	
	
	
	
	<!-- 중메뉴 -->

	<div class="container">
		<div class="row text-center fw-bold mt-4">
			<div class="col text-primary-emphasis">집단상담</div>
			<div class="col text-primary-emphasis">공지사항</div>
			<div class="col text-primary-emphasis">자유게시판</div>
		</div>
		<div class="row text-center mt-3">
			<div class="col">
				<div class="row">
					<div class="col-2"></div>
					<div class="col" style="border-top: 1.3px solid #ffa500;"></div>
					<div class="col-2"></div>
				</div>
			</div>
			<div class="col">
				<div class="row">
					<div class="col-2"></div>
					<div class="col" style="border-top: 1.3px solid #ffa500;"></div>
					<div class="col-2"></div>
				</div>
			</div>
			<div class="col">
				<div class="row">
					<div class="col-2"></div>
					<div class="col" style="border-top: 1.3px solid #ffa500;"></div>
					<div class="col-2"></div>
				</div>
			</div>
		</div>
		<div class="row mt-2" style="font-weight: bold; font-size: 0.6em; color: navy; text-align:end;">
			<div class="col-3">
				<a href="../groupcounsel/staff/groupCounselListPage" class="link-offset-2 link-underline link-underline-opacity-0" style="color: mediumblue;">more</a>
			</div>
			<div class="col-4">
				<a href="../notice/noticeMainPage_Staff" class="link-offset-2 link-underline link-underline-opacity-0" style="color: mediumblue;">more</a>
			</div>
			<div class="col">
				<a href="../freeboardCounsel/freeboardCounselPage" class="link-offset-2 link-underline link-underline-opacity-0" style="color: mediumblue;">more</a>
			</div>
			<div class="col-1"></div>
		</div>
		
		
		
		
		<!-- 리스트 -->
		
			<!-- 집단상담 -->
		<div class="row mt">
			<div class="col">
				<c:forEach items="${groupCounselList }" var="groupCounselList">
					<c:set var="title" value="${groupCounselList.title}" />
					<div class="row mt-1" style="font-size: 0.8em;">
						<div class="col-3"></div>
						<div class="col fw-bold">
							<c:choose>
								<c:when test="${fn:length(title) > 9 }">
									<c:set var="cutedTitle" value="${fn:substring(title, 0, 9)}"></c:set>
									<a href="../groupcounsel/staff/groupCounselDetailPage?id=${groupCounselList.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${cutedTitle }...</a>
								</c:when>
								<c:otherwise>
									<a href="../groupcounsel/staff/groupCounselDetailPage?id=${groupCounselList.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${title }</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col">
							<fmt:formatDate value="${groupCounselList.created_at }" pattern="yy.MM.dd"/>
						</div>
						<div class="col-2"></div>
					</div>
				</c:forEach>
			</div>
			
			<!-- 공지사항 -->
			<div class="col">
				<c:forEach items="${noticeList }" var="noticeList">
					<c:set var="title" value="${noticeList.title}" />
					<div class="row mt-1" style="font-size: 0.8em;">
						<div class="col-1"></div>
						<div class="col-6 text-center fw-bold">
							<c:choose>
								<c:when test="${fn:length(title) > 9 }">
									<c:set var="cutedTitle" value="${fn:substring(title, 0, 9)}"></c:set>
									<a href="..//notice/readNoticeBoardPage?id=${noticeList.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${cutedTitle }...</a>
								</c:when>
								<c:otherwise>
									<a href="..//notice/readNoticeBoardPage?id=${noticeList.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${title }</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col">
							<fmt:formatDate value="${noticeList.created_at}" pattern="yy.MM.dd"/>
						</div>
						<div class="col-3"></div>
					</div>
				</c:forEach>
			</div>
			
			
			<!-- 자유게시판 -->
			<div class="col">
				<c:forEach items="${freeboardList }" var="freeboardList">
					<c:set var="title" value="${freeboardList.title}" />
					<div class="row" style="font-size: 0.8em;">
						<div class="col-3"></div>
						<div class="col fw-bold">
							<c:choose>
								<c:when test="${fn:length(title) > 9 }">
									<c:set var="cutedTitle" value="${fn:substring(title, 0, 9)}"></c:set>
									<a href="../freeboardCounsel/readFreeboardPostPage?id=${freeboardList.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${cutedTitle }...</a>
								</c:when>
								<c:otherwise>
									<a href="../freeboardCounsel/readFreeboardPostPage?id=${freeboardList.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${title }</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col mt-1">
							<fmt:formatDate value="${freeboardList.created_at }" pattern="yy.MM.dd"/>
						</div>
						<div class="col-2"></div>
					</div>
				</c:forEach>
			</div>
		</div>	
		

		
		
		<!-- 통계 -->
		
		<div class="row"></div>
		<div class="row text-center border rounded-1">
			<div class="col">
				통계1
			</div>
			<div class="col">
				통계2
			</div>
			<div class="col">
				통계3
			</div>
		</div>
	</div>
	
	

	<!-- 풋터 -->
	
	<div class="row">
		<div class="col text-center fw-bold">
			<hr>Footer
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>