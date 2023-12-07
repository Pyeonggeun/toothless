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
				<jsp:include page="./companyTopNavi.jsp"></jsp:include>
			</div>
		</div>
	 	<%-- (예정) 기업이 올린 공고목록 + 우리 기업 지원자목록 --%>
		<div class="row">
			<%-- 기업이 올린 공고 목록 시작 --%>
			<div class="col-5 px-5 mx-5">
				<!-- 채용공고 -->
				<div class="row mt-3 border-bottom border-2 border-dark">
					<div class="col fs-5 fw-bold mt-5">채용공고</div>
					<a class="col fs-5 fw-bold mt-5 text-end navbar-brand"
						href="../ny_posting/jobPostingListForCompanyPage"><i class="bi bi-plus-lg"></i></a>
				</div>
				<!-- 기업정보 -->
				<c:forEach items="${jobPostingForCompanyMainPage}" var="mainPagePosting">
					<div class="row my-3 pb-3 border-bottom ">
						<div class="col-1 pt-3 ps-0 ms-2 me-2">
							<c:choose>
								<c:when test="${mainPagePosting.postingDeadlineList.contains(mainPagePosting.jobPostingDto.job_posting_pk)}">
									<span class="badge text-bg-danger">마감임박!</span>
								</c:when>
								<c:when test="${mainPagePosting.endPostingList.contains(mainPagePosting.jobPostingDto.job_posting_pk)}">
									<span class="badge text-bg-secondary">채용마감</span>
								</c:when>
							</c:choose>
						</div>
						<div class="col-8 ps-4">
							<div class="row">
								<!-- 공고제목 -->
								<div class="col-7 ps-0 pt-2">
									<a class="navbar-brand" href="../ny_posting/jobPostingDetailForCompanyPage?id=${mainPagePosting.jobPostingDto.job_posting_pk}">
 										<span class="d-inline-block text-truncate" style="max-width: 500px;">
 											${mainPagePosting.jobPostingDto.posting_name}
 										</span>
									</a>
								</div>
							</div>
							<div class="row pt-0 pb-2" >
								<!-- 분야/지역/기간 태그  -->
								<div class="col-8 ps-0">
									<a class="navbar-brand" href="../ny_posting/jobPostingDetailForCompanyPage?id=${mainPagePosting.jobPostingDto.job_posting_pk}">
									<span class="text-secondary">#&nbsp;${mainPagePosting.jobFieldCategoryDto.job_field_category_name} 
									#&nbsp;${mainPagePosting.jobPostingDto.job_position}
									#&nbsp;${mainPagePosting.companyDto.com_address}</span>
									</a>
								</div>
							</div>
						</div>
						<div class="col ps-5">
							<div class="row pt-2 ps-4">
								<div class="col">
									<c:choose>
										<c:when test="${mainPagePosting.allPostingInterest == 0}">
											<i class="text-warning bi bi-star"></i>
										</c:when>
										<c:otherwise>
											<i class="text-warning bi bi-star-fill"></i>
										</c:otherwise>
									</c:choose>
									<span>${mainPagePosting.allPostingInterest}</span>	
								</div>
							</div>
							<div class="row">
								<div class="col">
									<fmt:formatDate value="${mainPagePosting.jobPostingDto.posting_deadline}" pattern="~ MM.dd(EEE)"/>
								</div>
							</div>
						</div>
					</div>				
				</c:forEach>
			</div>
			<!-- 기업이 올린 공고 목록 끝 -->
			<%-- (예정) 우리기업 지원자 목록 --%>	
			<div class="col px-5 me-5 mt-3 border-start">
				<!-- 공고 지원한 학생목록 -->
				<div class="row border-bottom border-2 border-dark">
					<div class="col fs-5 fw-bold mt-5">(예정)기업 지원자</div>
					<div class="col fs-5 fw-bold mt-5 text-end"><i class="bi bi-plus-lg"></i></div>
				</div>
			</div>
			<!-- (예정) 우리기업 지원자 목록 끝 -->
		</div>
		<!-- (예정)가족기업일 경우 이력서 공개 학생의 이력서 목록 -->
		<div class="row">
			<div class="col px-5 mx-5 mt-3 border-top">
				<!-- 공고 지원한 학생목록 -->
				<div class="row border-bottom border-2 border-dark">
					<div class="col fs-5 fw-bold mt-5">(예정)이력서 공개 학생의 이력서 목록</div>
					<div class="col fs-5 fw-bold mt-5 text-end"><i class="bi bi-plus-lg"></i></div>
				</div>
			</div>
		</div>
		<!-- (예정)가족기업일 경우 이력서 공개 학생의 이력서 목록 끝-->
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>