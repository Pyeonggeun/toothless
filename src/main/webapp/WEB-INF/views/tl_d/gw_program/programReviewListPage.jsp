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
<title>프로그램 리뷰</title>
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
						<div class="row mt-5">
							<div class="col ps-0 ms-0">
								<a class="btn" href="./programViewDetailsPage?program_pk=${program.programDto.program_pk}">${program.programDto.prg_name}</a>
							</div>
							<div class="col"></div>
						</div>
						<div class="row mb-2 ps-2 border-bottom border-3 border-bs-border pb-3 mb-3">
							<div class="col-2 ps-0 ms-0 fw-bold fs-4">프로그램 리뷰</div>
							<!-- 평점 평균 들어갈곳 -->
							<div class="col ps-0 ms-0 pt-1 fs-5"></div>
							
						</div>
						<!-- <div class="row border-bottom border-2 border-black pb-3 mb-3 mt-5">
						      <div class="col-2 text-center fw-bold">평점</div>
						      <div class="col text-center fw-bold">평가</div>
						</div> -->
						
						<c:forEach items="${studentApplyProgram}" var="list">
							<c:if test="${!empty list.programReviewDto.prg_score}">
								<div class="row border-bottom border-bs-border pb-3 mb-3">
									
								    <div class="col-2">
								    	<div class="row mb-3">
								    		<div class="col fw-bold">평점</div>
								    		<div class="col">${list.programReviewDto.prg_score}</div>
								    	</div> 
								    	<div class="row mb-3"> 
								    		<div class="col fw-bold">참여자</div>
								    		<div class="col">${list.studentInfoDto.name}</div>
								    	</div>
								    	<div class="row mb-3">
								    		<div class="col fw-bold">개선사항</div>
								    		<div class="col">${list.programReviewDto.prg_comment}</div>
								    		
								    	</div>
									</div>
								</div>	
							</c:if>		
						</c:forEach>
						
						<div class="row">
							<div class="col text-end"> 
								<a class="btn btn-primary" href="./programViewDetailsPage?program_pk=${program.programDto.program_pk }">프로그램 페이지로</a> 
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