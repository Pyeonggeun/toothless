<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>회사 상세보기</title>
</head>
<body>

<div class="containar">
	<div class="row"> 
			<!-- 학생용 상단 네비 바 -->
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
	</div>
	<div class="row">
		<!-- 학생용 메뉴 바 -->
		<div class="col-2 me-5 border-end">
			<jsp:include page="../common/studentMenu.jsp"></jsp:include>
		</div>
		
		
		<div class="col">
			<div class="row border-bottom border-3 border-black mt-5 mb-2 pb-3 fs-4 fw-bold">
				<div class="col-3">기업 상세정보</div>
			</div> 
			<div class="row fs-5 mt-5 mb-3 fw-bold">
				<div class="col-2 pb-3">${companyMap.companyDto.com_name}</div>
				<div class="col pb-1"> 
					<c:if test="${empty sessionStudentInfo}">
						<i class="text-black bi bi-suit-heart"></i> ${companyMap.interestCompany}
					</c:if>
					<c:if test="${!empty sessionStudentInfo}">
						<c:choose>
							<c:when test="${myInterestCompany==0}">
								<a href="./interestCompanyProcess?com_pk=${companyMap.companyDto.com_pk}&student_pk=${sessionStudentInfo.student_pk}"><i class="text-black bi bi-suit-heart"></i></a>
								${companyTotalInterest}
							</c:when>
							<c:when test="${myInterestCompany!=0}">
								<a href="./deleteInterestCompanyProcess?com_pk=${companyMap.companyDto.com_pk}&student_pk=${sessionStudentInfo.student_pk}"><i class="text-danger bi bi-suit-heart-fill"></i></a>
								${companyTotalInterest}
							</c:when>
						</c:choose>	
					</c:if>
					
						
					
				</div>
			</div>
			<div class="row border-top border-3 border-bottom border-bs-border">
				<div class="col"> 
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">사업자등록번호</div>
						<div class="col p-1 ps-4">${companyMap.companyDto.business_number}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">대표자 명</div>
						<div class="col p-1 ps-4">${companyMap.companyDto.com_bossname}</div>
						<div class="col-2 border-start border-end border-bs-border p-1 ps-2 fw-bold">기업규모</div>
						<div class="col p-1 ps-4">${companyMap.comScaleCategoryDto.com_scale_category_name}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">기업 주소</div>
						<div class="col p-1 ps-4">${companyMap.companyDto.com_address}</div>
					</div>
					<div class="row py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">가족기업여부</div>
						<div class="col p-1 ps-4">${companyMap.companyDto.is_family_company}</div>
					</div>
				</div>
			</div>
			<!-- 기업채용정보 -->
			
			<div class="row border-bottom border-3 border-black mt-5 mb-4 pb-3 fs-4 fw-bold">
				<div class="col">진행중인 기업 채용정보</div>
			</div> 
			
			<c:forEach items="${companyPostingListForStudent}" var="companyPostingForStudent">
					<div class="row mt-4">
						<!-- 기업명 -->
						<div class="col-2 pe-0">
							${companyPostingForStudent.companyDto.com_name}
						</div>
						<!-- 공고제목 -->
						<div class="col-9 ps-0 pt-1">
							<a class="text-dark navbar-brand" href="../ny_posting/jobPostingDetailForStudentPage?id=${companyPostingForStudent.jobPostingDto.job_posting_pk}">
								${companyPostingForStudent.jobPostingDto.posting_name}
							</a>
						</div>
						<!-- 별 크기 생각해보기 -->
						
						<!-- 여기를 해야하는거임!!! 별!!!! -->
						
						<div class="col-1">
							
							<c:choose>
								<c:when test="${companyPostingForStudent.allPostingInterest == 0}">
									<i class="text-warning bi bi-star"></i>
								</c:when>
								<c:otherwise>
									<i class="text-warning bi bi-star-fill"></i>
								</c:otherwise>
							</c:choose>
							<span>${companyPostingForStudent.allPostingInterest}</span>
						</div>
						
						
						
					</div>
					<div class="row mt-1 pb-3 border-bottom">
						<!-- 가족기업여부 -->
						<div class="col-2  ms-1">
							<c:if test="${companyPostingForStudent.companyDto.is_family_company ne null and companyPostingForStudent.companyDto.is_family_company eq 'Y'}">
								<span class="badge text-bg-info text-white">Family</span>
							</c:if>						
						</div>
						<!-- 분야/지역/기간 태그  -->
						<div class="col-7 ps-0">
							<a class="text-dark navbar-brand" href="./jobPostingDetailForStudentPage?id=${companyPostingForStudent.jobPostingDto.job_posting_pk}">
								<span class="text-secondary">#&nbsp;${companyPostingForStudent.jobFieldCategoryDto.job_field_category_name} #&nbsp;${companyPostingForStudent.jobPostingDto.job_position}
								#&nbsp;${companyPostingForStudent.companyDto.com_address} #&nbsp;<fmt:formatDate value="${companyPostingForStudent.jobPostingDto.posting_deadline}" pattern="~MM/dd(EEE)"/></span>
								<c:forEach items="${companyPostingForStudent.postingDeadlineList}" var="deadline">
									<c:if test="${deadline == companyPostingForStudent.jobPostingDto.job_posting_pk}">
										<span class="badge text-bg-danger">마감임박!</span>
									</c:if>
								</c:forEach>
								<c:forEach items="${companyPostingForStudent.endPostingList}" var="endPosting">
									<c:if test="${endPosting == companyPostingForStudent.jobPostingDto.job_posting_pk}">
										<span class="badge text-bg-secondary">채용마감</span>
									</c:if>
								</c:forEach>
							</a>
						</div>
						<div class="col me-3 text-end">
							<c:choose>
								<c:when test="${companyPostingForStudent.endPostingList.contains(companyPostingForStudent.jobPostingDto.job_posting_pk)}">
									<button class="btn btn-dark btn-sm" disabled>채용마감</button>
								</c:when>
								<c:when test="${companyPostingForStudent.myApplyPostingList.contains(companyPostingForStudent.jobPostingDto.job_posting_pk)}">
									<button class="btn btn-dark btn-sm" disabled>지원완료</button>
								</c:when>
								<c:when test="${empty sessionStudentInfo}">
									<button class="btn btn-dark btn-sm" disabled>지원하기</button>
								</c:when>
								<c:otherwise>
									<a class="btn btn-dark btn-sm"
										href="../sb_resume/applyJobPostingPage?job_posting_pk=${companyPostingForStudent.jobPostingDto.job_posting_pk}">지원하기</a>
								</c:otherwise>
							</c:choose>
							
						</div>
					</div>
					</c:forEach> 
			
		</div> 
		
		<div class="col-1"></div>
		
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