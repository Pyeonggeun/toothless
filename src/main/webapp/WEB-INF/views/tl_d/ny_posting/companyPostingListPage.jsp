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
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>
		</div>
	 	<%-- 전체 크기 --%>
		<div class="row">
			<%-- 취업팀 메뉴 바 --%>
			<div class="col-2">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			<%-- 가운데 여백--%>	
			<div class="col-1 border-start"></div>
			<%-- 채용공고 리스트 양식 --%>
			<div class="col">
				<!-- 채용공고 -->
				<div class="row">
					<div class="col fs-4 fw-bold mt-5 pb-3 border-bottom border-3">기업별 공고리스트</div>
				</div>
				<div class="row mt-5 pb-3 border-bottom">
					<div class="col-9 pt-1">
						총 <span class="fw-bold">${companyPostingCount}</span>건
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
				<c:forEach items="${companyPostingList}" var="companyPosting">
				<div class="row border-bottom">
					<!-- 1번째 기업 + 가족기업 뱃지 칸 -->
					<div class="col pt-3 ms-2 pe-0">
						<div class="row mt-3">
							<!-- 기업명 -->
							<div class="col pe-0">
								${companyPosting.companyDto.com_name}
							</div>
						</div>
						<div class="row">
							<!-- 가족기업여부 -->
							<div class="col ms-1">
								<c:if test="${companyPosting.companyDto.is_family_company ne null and companyPosting.companyDto.is_family_company eq 'Y'}">
									<span class="badge text-bg-info text-white">Family</span>
								</c:if>						
							</div>
						</div>
					</div>
					<!-- 공고제목 -->
					<div class="col-7 mt-1 pt-4 px-0 pb-2">
						<div class="row">
							<div class="col">
								<a class="navbar-brand" href="./jobPostingDetailPage?id=${companyPosting.jobPostingDto.job_posting_pk}">
									${companyPosting.jobPostingDto.posting_name}
								</a>
							</div>
						</div>
						<div class="row mt-1 pb-1">
						<!-- 분야/지역/기간 태그  -->
							<div class="col-7">
								<a class="text-dark navbar-brand" href="./jobPostingDetailPage?id=${companyPosting.jobPostingDto.job_posting_pk}">
									<span class="text-secondary">#&nbsp;${companyPosting.jobFieldCategoryDto.job_field_category_name} #&nbsp;${companyPosting.jobPostingDto.job_position}
									#&nbsp;${companyPosting.companyDto.com_address} #&nbsp;<fmt:formatDate value="${companyPosting.jobPostingDto.posting_deadline}" pattern="~MM/dd(EEE)"/></span>
									<c:choose>
										<c:when test="${companyPosting.postingDeadlineList.contains(companyPosting.jobPostingDto.job_posting_pk)}">
											<span class="badge text-bg-danger">마감임박!</span>
										</c:when>
										<c:when test="${companyPosting.endPostingList.contains(companyPosting.jobPostingDto.job_posting_pk)}">
											<span class="badge text-bg-secondary">채용마감</span>
										</c:when>
									</c:choose>
								</a>
							</div>
						</div>
					</div>
					<div class="col py-3 ps-2 pe-3 text-end">
						<c:choose>
							<c:when test="${empty sessionStaffInfo}">
								<div class="row">
									<div class="col pb-1">
										<button class="btn btn-outline-dark" disabled>수정</button>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<button class="btn btn-dark" disabled>삭제</button>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="row">
									<div class="col pb-1">
										<a class="btn btn-outline-dark" href="./modifyJobPostingPage?id=${companyPosting.jobPostingDto.job_posting_pk}">수정</a>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<a class="btn btn-dark" href="./removeJobPostingProcessForCompany?id=${companyPosting.jobPostingDto.job_posting_pk}">삭제</a>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				</c:forEach> 
			</div>
			<%-- 오른쪽 --%>	
			<div class="col-2"></div>	
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