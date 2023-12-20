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
				<img  class="opacity-55" src="../../resources/img/employment/companyBanner.png" style="width: 120rem; height : 30rem;">
			</div>		
		</div>
	 	<%-- 관심기업 학생목록 --%>
		<div class="row">
			<%-- 관심기업 학생 --%>
			<div class="col-5 px-5 mx-5">
				<%-- 관심기업 학생 --%>
				<div class="row mt-3 pb-2 border-bottom border-2">
					<div class="col fs-5 fw-bold mt-5">기업에 관심이 있는 학생</div>
					<a class="col fs-5 fw-bold mt-5 text-end navbar-brand"href="../ny_posting/myCompanyInterestListPage">
					<i class="bi bi-plus-lg"></i></a>
				</div>
				<%-- 목록명 --%>
				<div class="row mt-4 mb-1 pb-2 fw-bold text-secondary text-center border-bottom border-dark">
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
					<c:when test="${empty interestCompanyList}">
						<div class="row mt-3">
							<div class="col fw-bold text-center">
								해당 리스트가 없습니다
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${interestCompanyList}" var="interestCompany">
							<%-- 목록 --%>
							<div class="row my-2 pb-2 text-center border-bottom">
								<div class="col">${interestCompany.studentInfoDto.name}</div>
								<div class="col">
								<fmt:formatDate value="${interestCompany.studentInfoDto.birth}" pattern="yyMMdd"/></div>
								<div class="col">${interestCompany.studentInfoDto.gender}</div>
								<div class="col">${interestCompany.studentInfoDto.email}</div>
								<div class="col">
									<c:choose>
										<c:when test="${! interestCompany.graduationInfoDtoList.contains(interestCompany.studentInfoDto.student_pk)}">
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
			<%-- 기업이 올린 공고 목록 끝 --%>
			<%-- 우리기업 지원자 목록 --%>	
			<div class="col px-5 me-5 mt-3">
				<div class="row pb-2 border-bottom border-2">
					<div class="col fs-5 fw-bold mt-5">기업 지원자</div>
					<a class="col fs-5 fw-bold mt-5 text-end navbar-brand" 
						href="../ny_posting/myCompanyApplyStudentListPage"><i class="bi bi-plus-lg"></i></a>
				</div>
				<%-- 목록명 --%>
				<div class="row mt-4 mb-1 pb-2 fw-bold text-secondary text-center border-bottom border-dark">
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
					<c:when test="${empty applyListForMainPage}">
						<div class="row mt-3">
							<div class="col fw-bold text-center">
								해당 리스트가 없습니다
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${applyListForMainPage}" var="applyList">
							<%-- 목록 --%>
							<div class="row my-2 pb-2 text-center border-bottom">
								<div class="col">${applyList.studentInfoDto.name}</div>
								<div class="col">
								<fmt:formatDate value="${applyList.studentInfoDto.birth}" pattern="yyMMdd"/> </div>
								<div class="col">${applyList.studentInfoDto.gender}</div>
								<div class="col">${applyList.studentInfoDto.email}</div>
								<div class="col">
									<c:choose>
										<c:when test="${! applyList.graduationInfoDtoList.contains(applyList.studentInfoDto.student_pk)}">
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
			<%-- 우리기업 지원자 목록 끝 --%>
		</div>
		<div class="row mx-4">
			<div class="col">
				<%-- 채용공고 --%>
				<div class="row mt-3 mx-3 pb-2 border-bottom border-2">
					<div class="col fs-5 fw-bold mt-5">채용공고</div>
					<a class="col fs-5 fw-bold mt-5 text-end navbar-brand"
						href="../ny_posting/jobPostingListForCompanyPage"><i class="bi bi-plus-lg"></i></a>
				</div>
				<%-- 기업정보 --%>
				<c:choose>
					<c:when test="${empty jobPostingForCompanyMainPage}">
						<div class="row mt-3">
							<div class="col fw-bold text-center">
								등록된 채용공고가 없습니다
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${jobPostingForCompanyMainPage}" var="mainPagePosting">
						<div class="row mx-3 my-3 pb-3 border-bottom">
							<div class="col-1 pt-3 ps-5 ms-5 me-2">
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
									<%-- 공고제목 --%>
									<div class="col-7 ps-0 pt-2">
										<a class="navbar-brand" href="../ny_posting/jobPostingDetailForCompanyPage?id=${mainPagePosting.jobPostingDto.job_posting_pk}">
											<span class="d-inline-block text-truncate" style="max-width: 500px;">
												${mainPagePosting.jobPostingDto.posting_name}
											</span>
										</a>
									</div>
								</div>
								<div class="row pt-0 pb-2" >
									<%-- 분야/지역/기간 태그  --%>
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
									<div class="col pt-1">
										<fmt:formatDate value="${mainPagePosting.jobPostingDto.posting_deadline}" pattern="~ MM.dd(EEE)"/>
									</div>
								</div>
							</div>
						</div>				
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<%-- 가족기업일 경우 이력서 공개 학생의 이력서 목록 --%>
		<c:if test="${company.companyDto.is_family_company=='Y'}">
		<div class="row">
				<div class="col ps-4 pe-5 mx-5 mt-3">
					<%-- 공고 지원한 학생목록 --%>
					<div class="row pb-2 border-bottom border-2">
						<div class="col fs-5 fw-bold mt-5">공개 이력서 목록</div>
						<div class="col fs-5 fw-bold mt-5 text-end">
						<a class="col fs-5 fw-bold mt-5 text-end navbar-brand" 
						href="../sb_resume/publicResumeByStudentListPage"><i class="bi bi-plus-lg"></i></a>
						</div>
					</div>
					<div class="row mt-4 mb-1 pb-2 fw-bold text-secondary text-center border-bottom border-dark">
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
					<c:when test="${empty mainResumeList}">
						<div class="row mt-3">
							<div class="col fw-bold text-center">
								공개된 이력서가 없습니다
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${mainResumeList}" var="mainResume">
							<%-- 목록 --%>
								<div class="row my-2 pb-2 text-center border-bottom">
									<div class="col">${mainResume.studentInfoDto.name}</div>
									<div class="col">
										<fmt:formatDate value="${mainResume.studentInfoDto.birth}" pattern="yyMMdd"/>
									</div>
									<div class="col">${mainResume.studentInfoDto.gender}</div>
									<div class="col">${mainResume.studentInfoDto.email}</div>
									<div class="col">
										<c:choose>
											<c:when test="${! mainResume.graduationInfoDtoList.contains(applyList.studentInfoDto.student_pk)}">
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
		</div>
		</c:if>
		<%-- 가족기업일 경우 이력서 공개 학생의 이력서 목록 끝--%>
		<div class="row pb-5 mb-5"><div class="col pb-5 mb-5"></div></div>
		<%-- futter --%>
		<div class="row">
			<div class="col">
				<jsp:include page="./futter.jsp"></jsp:include>
			</div>
		</div>	
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>