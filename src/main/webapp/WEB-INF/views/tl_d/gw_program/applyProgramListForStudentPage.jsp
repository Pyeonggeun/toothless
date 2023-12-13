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
<title>신청한 프로그램(학생용)</title>
</head>
<body>
	<!-- 학생용 페이지 -->
	<div class="container-fluid">
		<div class="row">
			<!-- 학생 상단 네비 바 -->
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			<div class="col-1"></div>
			<!-- 학생용 메뉴 바 -->
			<div class="col-2 border-end pb-0">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			
			<div class="col">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<div class="row mb-2 mt-5 border-bottom border-3 border-bs-border pb-3 mb-3 fw-bold fs-4">내 신청 프로그램</div>
						<div class="row border-bottom border-2 border-black pb-3 mb-3 mt-5">
							      <div class="col text-center fw-bold">프로그램명</div>
							      <div class="col-3 text-center fw-bold">프로그램 현황</div>
						</div>
						
						<c:forEach items="${studentApplyProgram}" var="list">
							<c:if test="${list.programApplyDto.student_pk==sessionStudentInfo.student_pk}">
								<div class="row border-bottom border-bs-border pb-3 mb-3">
									<div class="col"><a class="btn ms-4" href="./programViewDetailsPage?program_pk=${list.programDto.program_pk}">${list.programDto.prg_name}</a></div>
									<div class="col-3 text-center pt-1">
										 <c:choose>
							                <c:when test="${list.programDto.prg_schedule lt now}">
							                	<c:choose>
							                		<c:when test="${list.programApplyDto.prg_is_student_attend=='Y'}">
														<span class="text-center badge text-bg-primary">수료완료</span>
													</c:when>
							                		<c:otherwise>
														<span class="text-center badge text-bg-secondary">수료미완료</span>
													</c:otherwise>
							                	</c:choose>
							                </c:when>
							                <c:otherwise>
							                     <span class="text-center badge text-bg-secondary">진행 전</span>
							                </c:otherwise>
							            </c:choose>
									</div>
								</div>
							</c:if>
						</c:forEach>
						
						<div class="row">
							<div class="col text-end"> 
								<a class="btn btn-primary" href="../common/studentMyPage">마이페이지로</a> 
							</div>
						</div>
					</div>
					<div class="col-2"></div>
				</div>
			</div>
		</div>
	</div>
	


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>