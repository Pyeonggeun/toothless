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
<title>프로그램 목록 페이지-교직원용</title>
</head>
<body>
	<!-- 취업팀용 페이지 -->
	<div class="container-fluid">
		<div class="row">
			<!-- 취업팀 상단 네비 바 -->
			<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			<!-- 취업팀 메뉴 바 -->
			<div class="col-2 border-end pb-0">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			
			<div class="col">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<div class="row mb-2 mt-5 border-bottom border-3 border-bs-border pb-3 mb-3 fw-bold fs-4">프로그램 목록</div>
						<div class="row border-bottom border-2 border-black pb-3 mb-3 mt-5">
							      <div class="col-1 text-center fw-bold">No.</div>
							      <div class="col text-center fw-bold">프로그램명</div>
							      <div class="col-3 text-center fw-bold">글쓴이</div>
							      <div class="col-2 text-center fw-bold">프로그램 현황</div>
						</div>
						
						<c:set var="currentTime" value="<%= new java.util.Date() %>" />
						
						<c:forEach items="${programList}" var="list">
							<div class="row border-bottom border-bs-border pb-3 mb-3">
								<div class="col-1 text-center fw-bold pt-1">${list.programDto.program_pk}</div>
								<div class="col"><a class="btn text-truncate ms-4" href="./programViewDetailsPage?program_pk=${list.programDto.program_pk}" style="max-width: 30em;">${list.programDto.prg_name}</a></div>
								<div class="col-3 text-center pt-1">${list.staffInfoDto.name}</div>
								<div class="col-2 text-center pt-1">
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
						</c:forEach> 
						
						<div class="row">
							<div class="col text-end"> 
								<a class="btn btn-primary" href="./registerProgramPage">프로그램 등록</a> 
							</div>
						</div>
					</div>
					<div class="col-2"></div>
				</div>
			</div>
		</div>
		<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
		<!-- futter -->
		<div class="row">
			<div class="col">
				<jsp:include page="../common/futter.jsp"></jsp:include>
			</div>
		</div>
	</div>
	


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>