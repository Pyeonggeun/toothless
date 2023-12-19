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
<title>프로그램 목록 페이지-학생용</title>
</head>
<body>
	<!-- 취업팀용 페이지 -->
	<div class="container-fluid">
		<div class="row">
			<!-- 취업팀 상단 네비 바 -->
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			<!-- 취업팀 메뉴 바 -->
			<div class="col-2 border-end pb-0">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			
			<div class="col">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<div class="row mb-2 mt-5 border-bottom border-3 border-bs-border pb-3 mb-3 fw-bold fs-4">프로그램 목록</div>
						
						<div class="row mt-4"> 
							<c:set var="currentTime" value="<%= new java.util.Date() %>" />
							<c:forEach items="${programList}" var="list" varStatus="loop">
							        <c:if test="${loop.index % 4 == 0}">
							            <div class="row mt-4"></div>
							        </c:if>
									<div class="col border border-secondery rounded-4 p-0 m-4">
										<div class="row"> 
											<img class="img-fluid" src="../../resources/img/employment/${list.programDto.prg_main_image}" style="height: 10em; weight: 10em;">
											
										</div>  
										<div class="row mt-2"> 
											<div class="col mt-1 mb-1 ms-2 ps-3">
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
										<div class="row">
											<div class="col">
												<a class="btn text-truncate fw-bold" href="../gw_program/programViewDetailsForStudentPage?program_pk=${list.programDto.program_pk}" style="font-size: 1.1em">${list.programDto.prg_name}</a>
											</div>
										</div>
										<div class="row">
											<div class="col-1"></div>
											<div class="col border-bottom"></div>
											<div class="col-1"></div>
										</div> 
										<div class="row mt-2 ps-3">
											<div class="col-5 fw-bold">모집기간</div>
											<div class="col ps-0">
												<fmt:formatDate value="${list.programDto.prg_apply_deadline}" pattern="yyyy.MM.dd"/>
											</div>
										</div>
										
										<div class="row ps-3 pb-4">
											<div class="col-5 fw-bold">운영기간</div>
											<div class="col ps-0">
												<fmt:formatDate value="${list.programDto.prg_schedule}" pattern="yyyy.MM.dd"/>
											</div>
										</div>
										
									</div>
									 <c:if test="${loop.index % 4 == 3 || loop.last}">
						            <c:forEach var="dummy" begin="${loop.index + 1}" end="${loop.index + (3 - loop.index % 4)}">
						                <div class="col-md-3 dummy"></div>
						            </c:forEach>
						        </c:if>
						        <c:if test="${loop.index % 4 == 3 && !loop.last}">
						            <div class="row mt-4"></div>
						        </c:if>
							</c:forEach> 
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