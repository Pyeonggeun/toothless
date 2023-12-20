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
			<%-- 가족기업 뱃지 달기 --%>
			<div class="col">
				<div class="row bg-body-white border-bottom mt-4 pb-0">
					<a class="col-1 pe-2 text-end navbar-brand" href="../common/companyMainPage">
		                <img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
		            </a>
		            <a class="col-4 ps-0 fw-bold fs-1 text-start navbar-brand" href="../common/companyMainPage">
		                MK University<span class="fs-6"> | </span> <span class="fs-5">취업지원센터</span> 
		            </a>
			    	<div class="col"></div>
			    	<div class="col-1 mt-5 pb-2 pe-0 text-secondary text-end">
						<%-- mainPage --%>
						<c:choose>
							<c:when test="${!empty sessionExternalInfo and company.companyDto.is_family_company=='Y'}">
								<li style="list-style-type: none;" class="nav-item dropdown ms-auto"><a
									class="fw-bold nav-link dropdown-toggle" href="../../another/external/loginPage" role="button"
									data-bs-toggle="dropdown" aria-expanded="false">
										<span class="badge text-bg-info text-white me-1">Family</span>
										${company.companyDto.com_name} 님</a>
									<ul class="dropdown-menu">
										<li><a href="../common/companyLogoutProcess"
											class="dropdown-item">로그아웃</a></li>
									</ul>
								</li>
							</c:when>
							<c:when test="${!empty sessionExternalInfo and company.companyDto.is_family_company=='N'}">
								<li style="list-style-type: none;" class="nav-item dropdown ms-auto"><a
									class="fw-bold nav-link dropdown-toggle" href="../../another/external/loginPage" role="button"
									data-bs-toggle="dropdown" aria-expanded="false">
										${company.companyDto.com_name} 님</a>
									<ul class="dropdown-menu">
										<li><a href="../common/companyLogoutProcess"
											class="dropdown-item">로그아웃</a></li>
									</ul>
								</li>
							</c:when>
							<c:otherwise>
								<li style="list-style-type: none;" class="nav-item"><a href="../../another/external/loginPage"
									class="nav-link">로그인</a></li>
							</c:otherwise>
						</c:choose>
					</div>
			    	<div class="col-1 px-0"></div>
		   		</div>
		   		<div class="row text-center py-2 fw-bold text-light" style="background-color: #133369">
		            <div class="col-2"></div>
		            <div class="col align-self-center">
		                <a class="navbar-brand" href="../ny_posting/myCompanyInterestListPage">관심기업체크리스트</a>
		            </div>
		            <div class="col align-self-center">
		                <a class="navbar-brand" href="../ny_posting/myCompanyApplyStudentListPage">기업지원자리스트</a>
		            </div>
		            <div class="col align-self-center">
		                <a class="navbar-brand" href="../ny_posting/jobPostingListForCompanyPage">채용공고리스트</a>
		            </div>
		            <c:if test="${company.companyDto.is_family_company=='Y'}">
		            <div class="col align-self-center">
		                <a class="navbar-brand" href="../sb_resume/publicResumeByStudentListPage">공개이력서리스트</a>
		            </div>	
		            </c:if>
		            <div class="col align-self-center">
		                <a class="navbar-brand" href="../common/employmentMainPage">취업지원센터</a>
		            </div>
		            <div class="col-2"></div>
		        </div>
			</div>
		</div>
		<div class="row">
			<div class="col px-0">
				<img  class="opacity-55" src="../../resources/img/employment/companyBanner.png" style="width: 120rem; height : 30rem;">
			</div>		
		</div>
	 	<%-- 전체 크기 --%>
		<div class="row">
			<%-- 왼쪽 여백--%>
			<div class="col-2"></div>
			<%-- 채용공고 리스트 양식 --%>
			<div class="col">
				<%-- 채용공고 --%>
				<div class="row border-bottom border-3">
					<div class="col fs-4 fw-bold mt-5 pb-3">채용공고리스트</div>
					<div class="col-7"></div>
					<a class="col-2 mt-5 mb-3 pt-2 btn btn-outline-secondary" href="../common/companyMainPage">
						<i class="bi bi-house"></i>&nbsp;&nbsp;메인페이지로
					</a>
				</div>
				<%-- 검색 바 --%>
				<div class="row mt-3 p-2">
					<div class="col">
						<div class="row">
							<div class="col text-secondary border p-3">
								<c:forEach items="${jobFieldCategory}" var="jobField">
									 <input name="job_field_category_pk" value="${jobField.job_field_category_pk}" type="checkbox">${jobField.job_field_category_name}&nbsp; 
								</c:forEach> 
							</div>  
						</div>
						<div class="row">
							<div class="col-6 border p-3">
								<input type="text" class="searchWord form-control border-0" placeholder="직무검색"> 
							</div>
							<div class="col-6 border p-3">
								<input type="text" class="searchWord form-control border-0" placeholder="지역검색"> 
							</div>
						</div>
						<div class="row">
							<div class="col-2 border p-3">
								<select class="searchType form-select border-0">
									<option value="posting_name">제목</option>
									<option value="posting_contents">내용</option>
								</select>				
							</div>
							<div class="col-8 border p-3">
								 <input type="text" class="searchWord form-control border-0" placeholder="검색내용을 입력해주세요"> 
							</div>
							<div class="col border p-3">
								<button onclick="search()" class="form-control bg-white border-0">
									<span class="fw-bold text-secondary">검색</span>
								</button>
							</div>						
						</div>
					</div>
				</div>
				<div class="row mt-5 pb-3 border-bottom border-3 border-dark">
					<c:if test="${!empty sessionExternalInfo}">
						<div class="col-1 pt-1">
							총 <span class="fw-bold">${companyPostingCount}</span>건
						</div>
					</c:if>
					<div class="col-8"></div>
					<div class="col-3 btn-group btn-group-sm">
						<a href="./jobPostingListForCompanyPage" class="btn btn-outline-dark active" aria-current="page">전체</a>
					    <a href="#" class="btn btn-outline-dark">진행중</a>
					    <a href="#" class="btn btn-outline-dark">마감</a>
					</div>
				</div>
				<c:choose>
					<c:when test="${empty companyPostingList}">
						<div class="row mt-3">
							<div class="col fw-bold text-center">
								등록된 채용공고가 없습니다
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${companyPostingList}" var="companyPosting">
							<div class="row mt-3 ps-5 pb-3 border-bottom">
								<div class="col-1 pt-3">
									<c:choose>
										<c:when test="${companyPosting.postingDeadlineList.contains(companyPosting.jobPostingDto.job_posting_pk)}">
											<span class="badge text-bg-danger">마감임박!</span>
										</c:when>
										<c:when test="${companyPosting.endPostingList.contains(companyPosting.jobPostingDto.job_posting_pk)}">
											<span class="badge text-bg-secondary">채용마감</span>
										</c:when>
									</c:choose>
								</div>
								<div class="col-8 ps-4">
									<div class="row">
										<%-- 공고제목 --%>
										<div class="col ps-0 pt-2">
											<a class="navbar-brand" href="./jobPostingDetailForCompanyPage?id=${companyPosting.jobPostingDto.job_posting_pk}">
		 										${companyPosting.jobPostingDto.posting_name}
											</a>
										</div>
									</div>
									<div class="row pt-0 pb-2" >
										<%-- 분야/지역/기간 태그 --%>
										<div class="col-8 ps-0">
											<a class="navbar-brand" href="./jobPostingDetailForCompanyPage?id=${companyPosting.jobPostingDto.job_posting_pk}">
											<span class="text-secondary">#&nbsp;${companyPosting.jobFieldCategoryDto.job_field_category_name} #&nbsp;${companyPosting.jobPostingDto.job_position}
											#&nbsp;${companyPosting.companyDto.com_address}</span>
											</a>
										</div>
									</div>
								</div>
								<div class="col">
									<div class="row pt-2">
										<div class="col ps-5">
											<c:choose>
												<c:when test="${companyPosting.allPostingInterest == 0}">
													<i class="text-warning bi bi-star"></i>
												</c:when>
												<c:otherwise>
													<i class="text-warning bi bi-star-fill"></i>
												</c:otherwise>
											</c:choose>
											<span>${companyPosting.allPostingInterest}</span>	
										</div>
									</div>
									<div class="row">
										<div class="col">
											<fmt:formatDate value="${companyPosting.jobPostingDto.posting_deadline}" pattern="~yyyy.MM.dd(EEE)"/>
										</div>
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