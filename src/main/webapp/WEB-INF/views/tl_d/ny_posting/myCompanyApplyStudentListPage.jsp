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
				<img class="opacity-55 img-fluid" src="../../resources/img/employment/companyBanner.jpg">
			</div>		
		</div>
	 	<%-- 전체 크기 --%>
		<div class="row">
			<%-- 가운데 여백--%>	
			<div class="col-2"></div>
			<%-- 채용공고 리스트 양식 --%>
			<div class="col">
				<%-- 채용공고 --%>
				<div class="row border-bottom border-3">
					<div class="col fs-4 fw-bold mt-5 pb-3">기업지원자리스트</div>
					<div class="col-7"></div>
					<a class="col-2 mt-5 mb-3 pt-2 btn btn-outline-secondary" href="../common/companyMainPage">
						<i class="bi bi-house"></i>&nbsp;&nbsp;메인페이지로
					</a>
				</div>
				<div class="row mt-5 mb-1 pb-2 fw-bold text-secondary text-center border-bottom border-dark border-2">
					<%-- 이름 --%>
					<div class="col">이름</div>
					<%-- 생년월일 --%>
					<div class="col">생년월일</div>
					<%-- 성별 --%>
					<div class="col">성별</div>
					<%-- 이메일 --%>
					<div class="col">이메일</div>
					<%-- 졸업여부 --%>
					<div class="col">졸업여부</div>
				</div>
				<c:choose>
					<c:when test="${empty applyStudentList}">
						<div class="row mt-3">
							<div class="col fw-bold text-center">
								해당 리스트가 없습니다
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${applyStudentList}" var="applyStudent">
							<%-- 목록 --%>
							<div class="row my-2 pb-2 text-center border-bottom">
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