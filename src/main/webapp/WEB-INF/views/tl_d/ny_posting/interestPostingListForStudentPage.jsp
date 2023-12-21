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
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
	 	<%-- 전체 크기 --%>
		<div class="row">
			<%-- 취업팀 메뉴 바 --%>
			<div class="col-2">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			<%-- 가운데 여백--%>	
			<div class="col-1 border-start"></div>
			<%-- 채용공고 리스트 양식 --%>
			<div class="col">
				<%-- 채용공고 --%>
				<div class="row">
					<div class="col fs-4 fw-bold mt-5 pb-3 border-bottom border-3">관심공고리스트</div>
				</div>
				<div class="row mt-5 pb-3 border-bottom">
					<c:if test="${!empty sessionStudentInfo}">
					<div class="col-9 pt-1">
						총 <span class="fw-bold">${totalInterestPostingCount}</span>건
					</div>
					</c:if>
					<div class="col">
						<select class="form-select form-select-sm">
						    <option selected>정확도순</option>
						    <option value="1">등록일순</option>
						    <option value="2">마감임박순</option>
						    <!-- <option value="3"></option> -->
						</select>
					</div>
				</div>
				<c:choose>
					<c:when test="${empty totalInterestPostingList}">
						<div class="row mt-3">
							<div class="col fw-bold fs-4 text-center">
								스크랩한 채용공고가 없습니다
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${totalInterestPostingList}" var="totalInteresting">
							<div class="row py-4 ps-5 border-bottom">
								<div class="col-2">
									<div class="row pt-2 ps-2">
										<!-- 기업명 -->
										<div class="col pe-0">
											<a class="navbar-brand" href="./companyPostingListForStudentPage?com_pk=${totalInteresting.companyDto.com_pk}">${totalInteresting.companyDto.com_name}</a>
											<c:choose>
												<c:when test="${totalInteresting.interestCompany.contains(totalInteresting.companyDto.com_pk)}">
													<i class="text-danger bi bi-suit-heart-fill"></i>
												</c:when>
												<c:otherwise>
													<i class="text-danger bi bi-suit-heart"></i>
												</c:otherwise>
											</c:choose> 
										</div>
									</div>
									<div class="row">
										<%-- 가족기업여부 --%>
										<div class="col-2 ms-1">
											<c:if test="${totalInteresting.companyDto.is_family_company ne null and totalInteresting.companyDto.is_family_company eq 'Y'}">
												<span class="badge text-bg-info text-white">Family</span>
											</c:if>						
										</div>
									</div>
								</div>
								<%-- 공고제목 --%>
								<div class="col-7 pt-1">
									<div class="row">
										<a class="col navbar-brand" href="./jobPostingDetailForStudentPage?id=${totalInteresting.jobPostingDto.job_posting_pk}">
												${totalInteresting.jobPostingDto.posting_name}
										</a>
									</div>
									<div class="row">
										<%-- 분야/지역/기간 태그 --%>
										<div class="col-7">
											<a class="navbar-brand" href="./jobPostingDetailPage?id=${totalInteresting.jobPostingDto.job_posting_pk}">
											<span class="text-secondary">#&nbsp;${totalInteresting.jobFieldCategoryDto.job_field_category_name} #&nbsp;${totalInteresting.jobPostingDto.job_position}
											#&nbsp;${totalInteresting.companyDto.com_address} #&nbsp;<fmt:formatDate value="${totalInteresting.jobPostingDto.posting_deadline}" pattern="~MM/dd(EEE)"/></span>
											<c:choose>
												<c:when test="${totalInteresting.postingDeadlineList.contains(totalInteresting.jobPostingDto.job_posting_pk)}">
													<span class="badge text-bg-danger">마감임박!</span>
												</c:when>
												<c:when test="${totalInteresting.endPostingList.contains(totalInteresting.jobPostingDto.job_posting_pk)}">
													<span class="badge text-bg-secondary">채용마감</span>
												</c:when>
											</c:choose>
											</a>
										</div>
									</div>
								</div>
								<div class="col me-3">
									<div class="row px-5 mx-2 mt-2">
										<c:choose>
											<c:when test="${totalInteresting.endPostingList.contains(totalInteresting.jobPostingDto.job_posting_pk)}">
												<button class="col btn btn-dark btn-sm" disabled>채용마감</button>
											</c:when>
											<c:when test="${totalInteresting.myApplyPostingList.contains(totalInteresting.jobPostingDto.job_posting_pk)}">
												<button class="col btn btn-dark btn-sm" disabled>지원완료</button>
											</c:when>
											<c:when test="${empty sessionStudentInfo}">
												<button class="col btn btn-dark btn-sm" disabled>지원하기</button>
											</c:when>
											<c:otherwise>
												<a class="col btn btn-dark btn-sm" 
													href="../sb_resume/applyJobPostingPage?job_posting_pk=${totalInteresting.jobPostingDto.job_posting_pk}">지원하기</a>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<%-- 오른쪽 --%>	
			<div class="col-2"></div>	
		</div>
		<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
		<%-- futter --%>
		<div class="row">
			<div class="col">
				<jsp:include page="../common/futter.jsp"></jsp:include>
			</div>
		</div>	
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>