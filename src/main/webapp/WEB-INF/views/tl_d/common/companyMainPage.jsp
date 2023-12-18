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
	 	<%-- 관심기업 학생목록 --%>
		<div class="row">
			<%-- 관심기업 학생 --%>
			<div class="col-5 px-5 mx-5">
				<!-- 관심기업 학생 -->
				<div class="row mt-3 pb-2 border-bottom border-2">
					<div class="col fs-5 fw-bold mt-5">기업에 관심이 있는 학생</div>
					<!-- <a class="col fs-5 fw-bold mt-5 text-end navbar-brand"href="#">
					<i class="bi bi-plus-lg"></i></a> -->
				</div>
				<!-- 목록명 -->
				<div class="row mt-3 mb-1 text-secondary border-bottom">
					<!-- 이름 -->
					<div class="col ms-4 px-0">이름</div>
					<!-- 생년월일 -->
					<div class="col ms-4 px-0">생년월일</div>
					<!-- 성별 -->
					<div class="col px-0">성별</div>
					<!-- 이메일 -->
					<div class="col px-0">이메일</div>
					<!-- 졸업여부 -->
					<div class="col px-0">졸업여부</div>
				</div>
				<c:forEach items="${interestCompanyList}" var="interestCompany">
					<!-- 목록 -->
					<div class="row my-2 border-bottom">
						<div class="col-2 ms-3">${interestCompany.studentInfoDto.name}</div>
						<div class="col ps-5">
						<fmt:formatDate value="${interestCompany.studentInfoDto.birth}" pattern="yyMMdd"/> </div>
						<div class="col-1 ps-5">${interestCompany.studentInfoDto.gender}</div>
						<div class="col-4 ps-5 pe-0">${interestCompany.studentInfoDto.email}</div>
						<div class="col ps-0 pe-5">
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
			</div>
			<!-- 기업이 올린 공고 목록 끝 -->
			<%-- 우리기업 지원자 목록 --%>	
			<div class="col px-5 me-5 mt-3 border-start">
				<!-- 공고 지원한 학생목록, 공고를 띄우는게 낫지 않나..?-->
				<div class="row pb-2 border-bottom border-2">
					<div class="col fs-5 fw-bold mt-5">기업 지원자</div>
					<a class="col fs-5 fw-bold mt-5 text-end navbar-brand" 
						href="../ny_posting/myCompanyApplyStudentListPage"><i class="bi bi-plus-lg"></i></a>
				</div>
				<!-- 목록명 -->
				<div class="row mt-3 mb-1 text-secondary border-bottom">
					<!-- 이름 -->
					<div class="col ms-4 px-0">이름</div>
					<!-- 생년월일 -->
					<div class="col ms-4 px-0">생년월일</div>
					<!-- 성별 -->
					<div class="col px-0">성별</div>
					<!-- 이메일 -->
					<div class="col px-0">이메일</div>
					<!-- 졸업여부 -->
					<div class="col px-0">졸업여부</div>
				</div>
				<c:forEach items="${applyListForMainPage}" var="applyList">
					<!-- 목록 -->
					<div class="row my-2 border-bottom">
						<div class="col-2 ms-3">${applyList.studentInfoDto.name}</div>
						<div class="col ps-5">
						<fmt:formatDate value="${applyList.studentInfoDto.birth}" pattern="yyMMdd"/> </div>
						<div class="col-1 ps-5">${applyList.studentInfoDto.gender}</div>
						<div class="col-4 ps-5 pe-0">${applyList.studentInfoDto.email}</div>
						<div class="col ps-0 pe-5">
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
			</div>
			<!-- 우리기업 지원자 목록 끝 -->
		</div>
		<div class="row mx-5">
			<div class="col">
				<!-- 채용공고 -->
				<div class="row mt-3 mx-3 pb-2 border-bottom border-2">
					<div class="col fs-5 fw-bold mt-5">채용공고</div>
					<a class="col fs-5 fw-bold mt-5 text-end navbar-brand"
						href="../ny_posting/jobPostingListForCompanyPage"><i class="bi bi-plus-lg"></i></a>
				</div>
				<!-- 기업정보 -->
				<c:forEach items="${jobPostingForCompanyMainPage}" var="mainPagePosting">
					<div class="row mx-3 my-3 pb-3 border-bottom">
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
								<div class="col pt-1">
									<fmt:formatDate value="${mainPagePosting.jobPostingDto.posting_deadline}" pattern="~ MM.dd(EEE)"/>
								</div>
							</div>
						</div>
					</div>				
				</c:forEach>
			</div>
		</div>
		<!-- (예정)가족기업일 경우 이력서 공개 학생의 이력서 목록 -->
		<c:if test="${company.companyDto.is_family_company=='Y'}">
				<div class="col ps-4 pe-5 mx-5 mt-3">
					<!-- 공고 지원한 학생목록 -->
					<div class="row pb-2 border-bottom border-2">
						<div class="col fs-5 fw-bold mt-5">이력서 공개 학생의 이력서 목록</div>
						<div class="col fs-5 fw-bold mt-5 text-end">
						<a class="col fs-5 fw-bold mt-5 text-end navbar-brand" 
						href="../sb_resume/publicResumeByStudentListPage"><i class="bi bi-plus-lg"></i></a>
						</div>
					</div>
					<div class="row mt-3 mb-1 text-secondary border-bottom">
					<!-- 이름 -->
					<div class="col ms-4 px-0">이름</div>
					<!-- 생년월일 -->
					<div class="col ms-4 px-0">생년월일</div>
					<!-- 성별 -->
					<div class="col px-0">성별</div>
					<!-- 이메일 -->
					<div class="col px-0">이메일</div>
					<!-- 졸업여부 -->
					<div class="col px-0">졸업여부</div>
				</div>
				<c:forEach items="${mainResumeList}" var="mainResume">
					<!-- 목록 -->
						<div class="row my-2 border-bottom">
							<div class="col ms-4 px-0">${mainResume.studentInfoDto.name}</div>
							<div class="col ms-4 px-0">
								<fmt:formatDate value="${mainResume.studentInfoDto.birth}" pattern="yyMMdd"/>
							</div>
							<div class="col px-0">${mainResume.studentInfoDto.gender}</div>
							<div class="col px-0">${mainResume.studentInfoDto.email}</div>
							<div class="col px-0">
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
				
			</div>
		</c:if>
		<!-- 가족기업일 경우 이력서 공개 학생의 이력서 목록 끝-->
		
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>