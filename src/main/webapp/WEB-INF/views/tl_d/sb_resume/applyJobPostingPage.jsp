<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<title>ApplyJobPostingPage</title>
</head>
<body>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			
			<div class="col-2">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			<div class="col-1 border-start"></div>
			<%-- 내용 시작 --%>
			<div class="col">
				
				<div class="row">
					<div class="col-7 fs-5 fw-bold mt-5">채용 정보</div>
					<div class="col fs-5 fw-bold mt-5"> 이력서 목록</div>
					<div class="col mt-5 mb-1 d-flex justify-content-end">
						<a class="btn btn-outline-dark" href="../ny_posting/jobPostingListForStudentPage" role="button">
						<i class="bi bi-list"></i>채용공고목록
						</a>
									
					</div>
				</div>
				
				<!-- 기업정보 -->
				<div class="row border-bottom border-dark"></div>
				<div class="row">
					<%-- 채용정보 --%>
					<div class="col-7">
						<div class="row border border-top">
							<!-- 간략한 채용정보 -->
							<div class="col p-4 ms-2 mt-2">
								<div class="row">
									<div class="col">
										<!-- 기업명 + 가족기업 여부 -->
										<div class="row">
											<c:if test="${jobPostingDetailForStudent.companyDto.is_family_company ne null and jobPostingDetailForStudent.companyDto.is_family_company eq 'Y'}">
												<div class="col-2">
													<span class="badge text-bg-info text-white">Family</span>
												</div>
											</c:if>
											<div class="col ps-2">${jobPostingDetailForStudent.companyDto.com_name}
												
											</div>
											<div class="col-2 px-0 pe-2">
												<c:if test="${empty sessionStudentInfo}">
													<i class="ps-3 text-warning bi bi-star"></i>
												</c:if>
												<%-- <c:if test="${!empty sessionStudentInfo}">
													<a class="navbar-brand" href="./interestingProcess?job_posting_pk=${jobPostingDetailForStudent.jobPostingDto.job_posting_pk}&student_pk=${sessionStudentInfo.student_pk}">
													<c:choose>
														<c:when test="${checkMyInteresting == 0}">
															<i class="ps-3 text-warning bi bi-star"></i>
														</c:when>
														<c:when test="${checkMyInteresting >= 1}">
															<i class="ps-3 text-warning bi bi-star-fill"></i>
														</c:when>
													</c:choose>
													</a>
												</c:if>
												<span>${jobPostingDetailForStudent.allPostingInterest}</span> --%>
											</div>
										</div>
										<!-- 공고제목 -->
										<div class="row mt-1">
											<div class="col fs-4">${jobPostingDetailForStudent.jobPostingDto.posting_name}</div>
										</div>
										<!-- 분야 / 지역  -->
										<div class="row mt-1">
											<div class="col">
												<span class="text-secondary">#&nbsp;${jobPostingDetailForStudent.jobFieldCategoryDto.job_field_category_name} 
												#&nbsp;${jobPostingDetailForStudent.jobPostingDto.job_position}
												#&nbsp;${jobPostingDetailForStudent.companyDto.com_address}</span>
											</div>
										</div>
										<!-- 마감일 -->
										<div class="row mt-1">
											<div class="col-1 me-5 text-secondary">
												#&nbsp;<fmt:formatDate value="${jobPostingDetailForStudent.jobPostingDto.posting_deadline}" pattern="~MM/dd(EEE)"/>
											</div>
											<div class="col">
												<c:choose>
													<c:when test="${jobPostingDetailForStudent.postingDeadlineList.contains(jobPostingDetailForStudent.jobPostingDto.job_posting_pk)}">
														<span class="badge text-bg-danger">마감임박!</span>
													</c:when>
													<c:when test="${jobPostingDetailForStudent.endPostingList.contains(jobPostingDetailForStudent.jobPostingDto.job_posting_pk)}">
														<span class="badge text-bg-secondary">채용마감</span>
													</c:when>
												</c:choose>
											</div>
										</div>
									</div>
									
								</div>
							</div>
							<!-- 기업정보 -->
							<div class="col-3 p-3 border-start my-2">
								<div class="row">
									<div class="col text-secondary">기업정보</div>
								</div>
								<!-- 기업명 -->						
								<div class="row">
									<div class="col fs-5 fw-bold mt-1">
										${jobPostingDetailForStudent.companyDto.com_name}
									</div>
								</div>
								<!-- 기업규모 -->
								<div class="row">
									<div class="col mt-1">
										<span class="text-secondary">기업형태</span>&nbsp;${jobPostingDetailForStudent.comScaleCategoryDto.com_scale_category_name}
									</div>
								</div>
								<!-- 채용담당자 -->
								<div class="row">
									<div class="col mt-1">
										<span class="text-secondary">대표자</span>&nbsp;${jobPostingDetailForStudent.companyDto.com_bossname}
									</div>
								</div>
								<div class="row">
									<!-- 기업정보 -->
									<div class="col-4 mt-1">
										<a class="navbar-brand badge bg-outline-dark text-secondary rounded-0 border"
											href="../gw_company/studentViewDetailCompanyPage?com_pk=${jobPostingDetailForStudent.companyDto.com_pk}">기업정보 ></a>
									</div>
									<!-- 채용공고보기(기능구현은 나중에) -->
									<div class="col mt-1">
										<span class="badge bg-outline-dark text-secondary rounded-0 border">진행중인 채용보기 ></span>
									</div> 
								</div> 
							</div>
						</div>

						<!-- 채용내용 -->
						<div class="row mt-3 border-bottom border-dark">
							<div class="col fs-5 fw-bold">우대사항</div>
						</div>
						<!-- 우대사항 -->
						<div class="row border">
							<div class="col p-3 ms-3">
								${jobPostingDetailForStudent.jobPostingDto.preference}	
							</div>
						</div>
						<!-- 채용인원 -->
						<div class="row mt-3 border-bottom border-dark">
							<div class="col fs-5 fw-bold">채용인원</div>
						</div>
						<div class="row border">
							<div class="col p-3 ms-3">
								&nbsp;&nbsp;${jobPostingDetailForStudent.jobPostingDto.hire_number} 명	
							</div>
						</div>
						<!-- 채용마감일 까지 -->
						<div class="row mt-3">
							<div class="col fs-4 fw-bold text-center">
								<c:choose>
							        <c:when test="${!empty jobPostingDetailForStudent.deadlineDDay and jobPostingDetailForStudent.deadlineDDay > 0}">
							            채용마감까지 <span class="text-danger">${jobPostingDetailForStudent.deadlineDDay}</span>일 
							        </c:when>
							        <c:when test="${jobPostingDetailForStudent.endPostingList.contains(jobPostingDetailForStudent.jobPostingDto.job_posting_pk)}">
							            채용 마감되었습니다
							        </c:when>
							    </c:choose>	
							</div>
						</div>
						
						
					</div>
					
					
					<%-- 이력서 정보 --%>
					<div class="col">
						<div class="row border ms-1">
							
							<div class="col p-3 ms-3">
								<form action="./applyJobPostingProcess" method="post">
									<div class="dropdown">
										<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
											이력서 선택
										</button>
										<ul class="dropdown-menu">
										    <c:forEach items="${resumeList}" var="list">
										        <c:choose>
										            <c:when test="${list.main_resume eq 'Y'}">
										                <li><a class="dropdown-item" href="./applyJobPostingPage?job_posting_pk=${jobPostingDetailForStudent.jobPostingDto.job_posting_pk }&resume_pk=${list.resume_pk }"><strong>${list.resume_title}</strong></a></li>
										                <li><hr class="dropdown-divider"></li>
										            </c:when>
										            <c:otherwise>
										                <li><a class="dropdown-item" href="./applyJobPostingPage?job_posting_pk=${jobPostingDetailForStudent.jobPostingDto.job_posting_pk }&resume_pk=${list.resume_pk }">${list.resume_title}</a></li>
										            </c:otherwise>
										        </c:choose>
										    </c:forEach>
										</ul>
									</div>
								<c:choose>
									<c:when test="${empty resumeList}">
										<div class="row mt-3">
											<div class="col-8 fw-bold">
												이력서 등록이 필요합니다.
											</div>
											<div class="col">
												<a class="btn btn-primary" href="./resumeRegistrationPage" role="button">이력서 등록</a>
											</div>
										</div>
									</c:when>
									<c:when test="${resumeDto.main_resume eq 'Y' }">
										
										<div class="row mt-3">
											<div class="col">
												이력서 제목 
											</div>
										</div>
										<div class="row mt-5">
											<div class="col-3">
												<span class="badge text-bg-success">메인 이력서</span>
											</div>
											<div class="col">
												${resumeDto.resume_title }
											</div>
										</div>	
									</c:when>
									<c:otherwise>
										
										<div class="row mt-3">
											<div class="col">
												이력서 제목 
											</div>
										</div>
										<div class="row mt-5">
											<div class="col-3"></div>
											<div class="col">
												${resumeDto.resume_title }
											</div>
										</div>	
									</c:otherwise>
								</c:choose>	
											
								<div class="row mt-5">
									<div class="col"></div>
								</div>
								<div class="row mt-5">
									<div class="col">
										전화번호 
									</div>
								</div>
								<div class="row">
									<div class="col-2"></div>
									<div class="col">
										<input type="text" name="vol_phone" value="${sessionStudentInfo.phone }">
									</div>
								</div>
								
								<div class="row mt-3">
									<div class="col">
										이메일
									</div>
								</div>
								<div class="row">
									<div class="col-2"></div>
									<div class="col">
										<input type="text" name="vol_email" value="${sessionStudentInfo.email }">
									</div>
								</div>
								<div class="row mt-5">
									<div class="col"></div>
								</div>
								<div class="row mt-2">
									<div class="col"></div>
									<div class="col d-flex justify-content-end">
										<input type="hidden" name="job_posting_pk" value="${jobPostingDetailForStudent.jobPostingDto.job_posting_pk}">
										<c:if test="${not empty resumeDto.resume_pk }">
											<input type="hidden" name="resume_pk" value="${resumeDto.resume_pk }">
											<button type="submit" class="btn btn-success">지원하기</button>
										</c:if>
										<c:if test="${empty resumeDto.resume_pk }">
											<button type="submit" class="btn btn-gray" disabled>지원하기</button>
										</c:if>
									</div>
									
								</div>
								</form>	
							</div>
							
						</div>
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col fs-5 fw-bold">상세요강</div>
				</div>
				<div class="row border">
					<div class="col">
						<div class="row border-top border-dark">
							<div class="col-2">
								<img src="../../resources/img/employment/${jobPostingDetailForStudent.jobPostingDto.posting_mainimage}">
							</div>
						</div>
						<div class="row">
							<!-- 채용내용 -->
							<div class="col mt-3 ms-5 pb-3">
								${jobPostingDetailForStudent.jobPostingDto.posting_contents}				
							</div>
						</div>
					</div>
				</div>
				
				
				
				
			</div>
			<div class="col-2"></div>
		</div>
			
	</div>
	
	<div class="container">
		<div style="height: 200px;"></div>
	</div>
	<div class="row">
		<div class="col">
			<jsp:include page="../common/futter.jsp"></jsp:include>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>