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
							<c:when test="${!empty sessionExternalInfo}">
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
	 	<%-- 전체 크기 --%>
		<div class="row">
			<%-- 공고상세 --%>
			<div class="col-7 px-5 mx-5">
				<%-- 채용정보 --%>
				<div class="row">
					<div class="col fs-5 fw-bold mt-5">채용정보</div>
				</div>
				<%-- 기업정보 --%>
				<div class="row border-bottom border-3 border-dark"></div>
				<div class="row border border-top">
					<%-- 간략한 채용정보 --%>
					<div class="col p-4 ms-2">
						<div class="row">
							<div class="col mt-2">
								<%-- 기업명 + 가족기업 여부 --%>
								<div class="row">
									<c:if test="${jobPostingDetailForCompany.companyDto.is_family_company ne null and jobPostingDetailForCompany.companyDto.is_family_company eq 'Y'}">
										<div class="col-1"><span class="badge text-bg-info text-white">Family</span></div>
									</c:if>
									<div class="col ps-2">${jobPostingDetailForCompany.companyDto.com_name}</div>
								</div>
								<%-- 공고제목 --%>
								<div class="row mt-1">
									<div class="col fs-4">${jobPostingDetailForCompany.jobPostingDto.posting_name}</div>
								</div>
								<%-- 분야 / 지역 --%>
								<div class="row">
									<div class="col">
										<span class="text-secondary">#&nbsp;${jobPostingDetailForCompany.jobFieldCategoryDto.job_field_category_name} 
										#&nbsp;${jobPostingDetailForCompany.jobPostingDto.job_position}
										#&nbsp;${jobPostingDetailForCompany.companyDto.com_address}</span>
									</div>
								</div>
								<%-- 마감일 --%>
								<div class="row">
									<div class="col-1 me-5 text-secondary">
										#&nbsp;<fmt:formatDate value="${jobPostingDetailForCompany.jobPostingDto.posting_deadline}" pattern="~MM/dd(EEE)"/>
									</div>
									<div class="col">
										<c:choose>
											<c:when test="${jobPostingDetailForCompany.postingDeadlineList.contains(jobPostingDetailForCompany.jobPostingDto.job_posting_pk)}">
												<span class="badge text-bg-danger">마감임박!</span>
											</c:when>
											<c:when test="${jobPostingDetailForCompany.endPostingList.contains(jobPostingDetailForCompany.jobPostingDto.job_posting_pk)}">
												<span class="badge text-bg-secondary">채용마감</span>
											</c:when>
										</c:choose>
									</div>
								</div>
							</div>
							<div class="col-1 mt-2">
								<c:choose>
									<c:when test="${jobPostingForStudent.allPostingInterest == 0}">
										<i class="text-warning bi bi-star"></i>
									</c:when>
									<c:otherwise>
										<i class="text-warning bi bi-star-fill"></i>
									</c:otherwise>
								</c:choose>
							<span>${jobPostingDetailForCompany.allPostingInterest}</span>	
							</div>
						</div>
					</div>
					<%-- 기업정보 --%>
					<div class="col-3 p-3 border-start mt-4 mb-2">
						<div class="row">
							<div class="col text-secondary">기업정보</div>
						</div>
						<%-- 기업명 --%>						
						<div class="row">
							<div class="col fs-5 fw-bold mt-1">
								${jobPostingDetailForCompany.companyDto.com_name}
							</div>
						</div>
						<%-- 기업규모 --%>
						<div class="row">
							<div class="col mt-1">
								<span class="text-secondary">기업형태</span>&nbsp;${jobPostingDetailForCompany.comScaleCategoryDto.com_scale_category_name}
							</div>
						</div>
						<%-- 채용담당자 --%>
						<div class="row">
							<div class="col mt-1">
								<span class="text-secondary">대표자</span>&nbsp;${jobPostingDetailForCompany.companyDto.com_bossname}
							</div>
						</div>
					</div>
				</div>
				<%-- 이미지 --%>
				<div class="row mt-3">
					<div class="col fs-5 fw-bold">상세요강</div>
				</div>
				<div class="row border">
					<div class="col">
						<div class="row border-top border-3 border-dark">
							<div class="col-2 px-5 pt-5">
								<img src="../../resources/img/employment/${jobPostingDetailForCompany.jobPostingDto.posting_mainimage}">
							</div>
						</div>
						<div class="row">
							<%-- 채용내용 --%>
							<div class="col mt-3 ms-5 pb-3">
								${jobPostingDetailForCompany.jobPostingDto.posting_contents}				
							</div>
						</div>
					</div>
				</div>
				<%-- 우대사항 --%>
				<div class="row mt-3 border-bottom border-3 border-dark">
					<div class="col fs-5 fw-bold">우대사항</div>
				</div>
				<div class="row border">
					<div class="col p-3 ms-3">
						${jobPostingDetailForCompany.jobPostingDto.preference}	
					</div>
				</div>
				<%-- 채용인원 --%>
				<div class="row mt-3 border-bottom border-3 border-dark">
					<div class="col fs-5 fw-bold">채용인원</div>
				</div>
				<div class="row border">
					<div class="col p-3 ms-3">
						&nbsp;&nbsp;${jobPostingDetailForCompany.jobPostingDto.hire_number} 명	
					</div>
				</div>
				<%-- 채용마감일 까지 --%>
				<div class="row mt-3">
					<div class="col fs-4 fw-bold text-center">
						<c:choose>
					        <c:when test="${!empty jobPostingDetailForCompany.deadlineDDay and jobPostingDetailForCompany.deadlineDDay > 0}">
					            채용마감까지 <span class="text-danger">${jobPostingDetailForCompany.deadlineDDay}</span>일 
					        </c:when>
					        <c:when test="${jobPostingDetailForCompany.endPostingList.contains(jobPostingDetailForCompany.jobPostingDto.job_posting_pk)}">
					            채용 마감되었습니다
					        </c:when>
					    </c:choose>	
					</div>
				</div>
				<div class="row mt-2">
					<div class="col-10 me-2"></div>
					<div class="col ms-5"><a class="btn btn-outline-secondary" href="./jobPostingListForCompanyPage"><i class="bi bi-card-text"></i>&nbsp;목록으로</a></div>
				</div>
				<div class="row mb-5 pb-5">
					<div class="col mb-5 pb-5"></div>
				</div>
			</div>	
			<%-- 오른쪽 --%>	
			<div class="col px-5  border-start">
				<%-- 공고 지원한 학생목록 --%>
				<div class="row border-bottom border-2 border-dark">
					<div class="col fs-5 fw-bold mt-5">지원한 학생</div>
					<div class="col-7"></div>
					 <a class="col-2 btn btn-sm btn-outline-secondary mt-5 mb-1" 
					 	href="../sb_resume/viewResumeByApplyStudentPage?job_posting_pk=${jobPostingDetailForCompany.jobPostingDto.job_posting_pk}">
					 	<span class="fw-bold" style="font-size: 1.1em">이력서 보기</span>	
					 </a> 
				</div>
				<%-- 목록명 --%>
				<div class="row mt-4 mb-1 fw-bold text-secondary text-center border-bottom border-dark">
					<%-- 이름 --%>
					<div class="col-2">이름</div>
					<%-- 생년월일 --%>
					<div class="col-2">생년월일</div>
					<%-- 성별 --%>
					<div class="col-2">성별</div>
					<%-- 이메일 --%>
					<div class="col-4">이메일</div>
					<%-- 졸업여부 --%>
					<div class="col-2">졸업여부</div>
				</div>
				<c:forEach items="${applyStudentList}" var="applyStudent">
					<%-- 목록 --%>
					<div class="row my-2 pb-2 text-center border-bottom">
						<div class="col-2">${applyStudent.studentInfoDto.name}</div>
						<div class="col-2">
						<fmt:formatDate value="${applyStudent.studentInfoDto.birth}" pattern="yyMMdd"/> </div>
						<div class="col-2">${applyStudent.studentInfoDto.gender}</div>
						<div class="col-4">${applyStudent.studentInfoDto.email}</div>
						<div class="col-2">
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
				<%-- 스크랩한 학생 목록 --%>
				<div class="row border-bottom border-2 border-dark">
					<div class="col fs-5 fw-bold mt-5">스크랩한 학생</div>
				</div>
				<%-- 목록명 --%>
				<div class="row mt-4 mb-1 fw-bold text-secondary text-center border-bottom border-dark">
					<%-- 이름 --%>
					<div class="col-2">이름</div>
					<%-- 생년월일 --%>
					<div class="col-2">생년월일</div>
					<%-- 성별 --%>
					<div class="col-2">성별</div>
					<%-- 이메일 --%>
					<div class="col-4">이메일</div>
					<%-- 졸업여부 --%>
					<div class="col-2">졸업여부</div>
				</div>
				<c:forEach items="${interestStudentList}" var="interestStudent">
					<%-- 목록 --%>
					<div class="row my-2 pb-2 text-center border-bottom">
						<div class="col-2">${interestStudent.studentInfoDto.name}</div>
						<div class="col-2">
						<fmt:formatDate value="${interestStudent.studentInfoDto.birth}" pattern="yyMMdd"/> </div>
						<div class="col-2">${interestStudent.studentInfoDto.gender}</div>
						<div class="col-4">${interestStudent.studentInfoDto.email}</div>
						<div class="col-2">
							<c:choose>
								<c:when test="${! interestStudent.graduationInfoDtoList.contains(interestStudent.studentInfoDto.student_pk)}">
									재학생
								</c:when>
								<c:otherwise>
									졸업생
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
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