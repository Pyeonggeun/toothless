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
        
        <script>
        
        </script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
	 	<%-- 전체 크기 --%>
		<div class="row">
			<%-- 왼쪽 여백--%>
			<div class="col-1"></div>
			<%-- 취업팀 메뉴 바 --%>
			<div class="col-1 me-5">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			<%-- 가운데 여백--%>	
			<div class="col-1 px-0 border-start"></div>
			<%-- 채용공고 리스트 양식 --%>
			<div class="col">
				<!-- 채용공고 -->
				<div class="row">
					<div class="col fs-4 fw-bold mt-5 text-center">채용공고리스트</div>
				</div>
				<div class="row mt-5 pb-3 border-bottom">
					<div class="col-9 pt-1">
						총 <span class="fw-bold">${postingCount}</span>건
					</div>
					<div class="col">
						<select class="form-select form-select-sm">
						    <option selected>정확도순</option>
						    <option value="1">등록일순</option>
						    <option value="2">마감임박순</option>
						    <!-- <option value="3"></option> -->
						</select>
					</div>
				</div>
				<!-- 리스트 출력 -->
				<c:forEach items="${jopPostingForStudent}" var="jobPostingForStudent">
					<div class="row mt-3 pb-3 border-bottom">
						<!-- 1번째 칸 -->
						<div class="col-2 mt-2 ps-4">
							<div class="row">
								<!-- 기업명 -->
								<div class="col pe-0">
									<a class="navbar-brand" href="./companyPostingListForStudentPage?com_pk=${jobPostingForStudent.companyDto.com_pk}">${jobPostingForStudent.companyDto.com_name}</a>
									<i class="text-danger bi bi-suit-heart"></i>
								</div>
							</div>
							<div class="row">
								<!-- 가족기업여부 -->
								<div class="col mt-1 ms-1">
									<c:if test="${jobPostingForStudent.companyDto.is_family_company ne null and jobPostingForStudent.companyDto.is_family_company eq 'Y'}">
										<span class="badge text-bg-info text-white">Family</span>
									</c:if>						
								</div>
							</div>
						</div>
						<!-- 2번째 칸 -->
						<!-- 공고제목 -->
						<div class="col-8 ps-4 pt-2">
							<div class="row">
								<div class="col">
								<!-- 링크 더 좋은 방법 생각해보기 -->
								<a class="navbar-brand" href="./jobPostingDetailForStudentPage?id=${jobPostingForStudent.jobPostingDto.job_posting_pk}">
										${jobPostingForStudent.jobPostingDto.posting_name}
								</a>
								</div>
							</div>
							<div class="row">
								<!-- 분야/지역/기간 태그  -->
								<div class="col">
									<a class="navbar-brand" href="./jobPostingDetailPage?id=${jobPostingForStudent.jobPostingDto.job_posting_pk}">
									<span class="text-secondary">#&nbsp;${jobPostingForStudent.jobFieldCategoryDto.job_field_category_name} #&nbsp;${jobPostingForStudent.jobPostingDto.job_position}
									#&nbsp;${jobPostingForStudent.companyDto.com_address} #&nbsp;<fmt:formatDate value="${jobPostingForStudent.jobPostingDto.posting_deadline}" pattern="~MM/dd(EEE)"/></span>
									<c:choose>
										<c:when test="${jobPostingForStudent.postingDeadlineList.contains(jobPostingForStudent.jobPostingDto.job_posting_pk)}">
											<span class="badge text-bg-danger">마감임박!</span>
										</c:when>
										<c:when test="${jobPostingForStudent.endPostingList.contains(jobPostingForStudent.jobPostingDto.job_posting_pk)}">
											<span class="badge text-bg-secondary">채용마감</span>
										</c:when>
									</c:choose>
									</a>
								</div>
							</div>
						</div>
						<!-- 3번째 칸 -->
						<!-- 별 크기 생각해보기 -->
						<div class="col-2">	
							<div class="row">
								<div class="col ms-3 mb-1">
									<c:choose>
										<c:when test="${jobPostingForStudent.allPostingInterest == 0}">
											<i class="text-warning bi bi-star"></i>
										</c:when>
										<c:otherwise>
											<i class="text-warning bi bi-star-fill"></i>
										</c:otherwise>
									</c:choose>
									<span>${jobPostingForStudent.allPostingInterest}</span>	
								</div>
							</div>
							<div class="row">
								<div class="col">
									<c:choose>
										<c:when test="${jobPostingForStudent.endPostingList.contains(jobPostingForStudent.jobPostingDto.job_posting_pk)}">
											<button class="btn btn-dark btn-sm" disabled>채용마감</button>
										</c:when>
										<c:when test="${empty sessionStudentInfo}">
											<button class="btn btn-dark btn-sm" disabled>지원하기</button>
										</c:when>
										<c:otherwise>
											<a class="btn btn-dark btn-sm" 
												href="../sb_resume/applyJobPostingPage?job_posting_pk=${jobPostingForStudent.jobPostingDto.job_posting_pk}">지원하기</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
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