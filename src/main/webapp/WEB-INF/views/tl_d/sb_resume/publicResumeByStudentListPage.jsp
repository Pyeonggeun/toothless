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
		<div class="row">
			<!-- 가족기업 뱃지 달기 -->
			<div class="col">
				<jsp:include page="../common/companyTopNavi.jsp"></jsp:include>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<img  class="opacity-55" src="../../resources/img/employment/companyBanner.png" style="width: 117rem; height : 30rem;">
			</div>		
		</div>
	 	<%-- 전체 크기 --%>
		<div class="row">
			<%-- 가운데 여백--%>	
			<div class="col-2"></div>
			<%-- 채용공고 리스트 양식 --%>
			<div class="col">
				<!-- 채용공고 -->
				<div class="row">
					<div class="col fs-4 fw-bold mt-4 pb-3 border-bottom border-3">공개된 이력서 목록</div>
				</div>
			<%-- 	<div class="row mt-4 pb-3 border-bottom border-3 border-dark">
					<div class="col-1 pt-1">
						총 <span class="fw-bold"></span>건
					</div>
				</div> --%>
				<div class="row mt-3 mb-1 text-secondary border-bottom border-dark border-2">
					<!-- 이름 -->
					<div class="col-8">이력서 제목</div>
					
					<!-- 졸업여부 -->
					<div class="col">졸업여부</div>
					<!-- <div class="col px-0">지원한공고보기</div> -->
				</div>
				<c:forEach items="${applyStudentList}" var="applyStudent" >
					<!-- 목록 -->
					<div class="row my-2 border-bottom">
						<div class="col">${applyStudent.studentInfoDto.name}</div>
						<div class="col">
						<fmt:formatDate value="${applyStudent.studentInfoDto.birth}" pattern="yyMMdd"/> </div>
						<div class="col">${applyStudent.studentInfoDto.gender}</div>
						<div class="col">${applyStudent.studentInfoDto.email}</div>
						<div class="col">
							<c:choose>
								<c:when test="${! applyStudent.graduationInfoDtoList.contains(applyStudent.studentInfoDto.student_pk)}">
									재학생
								</c:when>
								<c:otherwise>
									졸업생
								</c:otherwise>
							</c:choose>
						</div>
						<!-- <a class="col-1 btn btn-outline-dark pb-1 mb-1 me-5"
							href="../ny_posting/jobPostingDetailForCompanyPage?id=">공고보기</a> -->
					</div>
				</c:forEach>
			</div>
			<%-- 오른쪽 --%>	
			<div class="col-2"></div>	
		</div>
		<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>