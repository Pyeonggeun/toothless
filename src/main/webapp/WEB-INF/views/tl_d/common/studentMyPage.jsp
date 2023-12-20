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
				<jsp:include page="./studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
		<!-- 전체크기 -->
		<div class="row">
			<!-- 왼쪽 여백 -->
			<%-- 학생 메뉴 바 --%>
			<div class="col-2"> 
				<jsp:include page="./studentMenu.jsp"></jsp:include>
			</div>
			<!-- 메인기능쪽 -->
			<div class="col ps-5 pe-4 border-start">
				<div class="row"> 
				<!-- 가운데 여백 --> 
					<%-- 학생 정보 --%>  
					<div class="col-4 p-0 me-4">
						<div class="row ps-0 pe-1 pt-4 pb-4 ms-3 mt-5 mb-3 border rounded-3">
							<div class="col-1"></div>
							<!-- 사진 --> 
							<div class="col pe-0 mt-2 fs-4 text-secondary">
								<img class="img-fluid" src="../../resources/img/employment/user.png">
							</div>
							<!-- 학생정보(나중에 추가하려면 추가하기) -->
							<div class="col mt-2 ps-0">
								<!-- 이름 -->
								<div class="row">
									<div class="col text-secondary">이름
										<span class="text-dark ps-3">${sessionStudentInfo.name}</span>
									</div>
								</div>
								<!-- 학번 -->
								<div class="row">
									<div class="col text-secondary">학번
										<span class="text-dark ps-3">${sessionStudentInfo.student_id}</span>
									</div>
								</div>
								<!-- 학과 -->
								<div class="row">
									<div class="col text-secondary">학과
										<span class="text-dark ps-3">${studentDepartmentName}</span>
									</div>
								</div>
								<!-- 전화번호 -->
								<div class="row">
									<div class="col text-secondary">전화번호
										<span class="text-dark ps-3">${sessionStudentInfo.phone}</span>
									</div>
								</div>
								<!-- 이메일 -->
								<div class="row">
									<div class="col text-secondary">이메일
										<span class="text-dark ps-3">${sessionStudentInfo.email}</span>
									</div>
								</div>
								<!-- 구직희망신청상태 나중에 if문 -->
								<div class="row">
									<a class="col mt-1 ms-2 me-5 btn btn-secondary btn-sm" href="#">구직희망중</a>
								</div>
							</div>
							<div class="col-1"></div>
						</div>
					</div>
					<!-- 학생 정보 끝 -->
					<%-- 상담이력 --%>	
					<div class="col mx-5 mt-3 px-5 pb-0">
						<!-- 공고 지원한 학생목록 -->
						<div class="row border-bottom border-2">
							<div class="col fs-5 fw-bold mt-5 pb-1">상담이력</div>
							<div class="col fs-5 fw-bold mt-5 text-end"><i class="bi bi-plus-lg"></i></div>
						</div>
						
						<c:choose>
							<c:when test="${getMyOnlineConsultingListNumFive!=null}">
								<c:forEach items="${getMyOnlineConsultingListNumFive }" var="e">
								
									<div class="row my-3 border-bottom">
										<div class="col">
											<!-- 상담 번호 -->
											<div class="row pb-2">
												<div class="col-3 ms-2">No.<span class="fw-bold">${e.onlineConsultingDto.on_consulting_pk}</span></div>
												<div class="col ms-2">
													${sessionStudentInfo.name}				
												</div>
												<div class="col ms-2">
													<c:choose>
														<c:when test="${e.onlineConsultingReplyDto==null}">
															<span class="badge text-bg-danger">미답변</span>
														</c:when>
														<c:otherwise>
															<a href="../jm_consulting/myOnlineConsultingPage?on_consulting_pk=${e.onlineConsultingDto.on_consulting_pk}"><span class="badge text-bg-primary">답변완료</span></a>
														</c:otherwise>
													</c:choose>		
												</div>
												<div class="col-2">
													<fmt:formatDate pattern="yyyy-MM-dd" value="${e.onlineConsultingDto.created_at}"/>
												</div>			
											</div>
											<!-- 이름 -->
										
										</div>
									</div>
								  </c:forEach>								
							</c:when>
							
							<c:otherwise>
								<span class="fw-bold mt-3">상담이력이 없습니다!</span>
							</c:otherwise>
							
						</c:choose>
						
					
					</div>
					<!-- 상담이력 -->
				</div>
				<div class="row pt-3 ps-0 me-3"><div class="col"></div></div>
				<div class="row ms-1 pt-0 my-3">
					<div class="col-4 me-4 ps-3">
						<!-- (예정)신청한 공고정보 -->
						<div class="row border-bottom border-2">
							<div class="col fs-5 fw-bold mt-5 pb-1">신청채용정보</div>
							<div class="col fs-5 fw-bold mt-5 text-end">
								<a class="navbar-brand" href="../sb_resume/postApplyListPage">
									<i class="bi bi-plus-lg"></i>
								</a>	
							</div>
						</div>
						<c:forEach items="${applyPostListForMyPage }" var="list">
							<div class="row my-3 border-bottom">
								<div class="col-4">
									<!-- 회사 이름 -->
									<div class="row">
										<div class="col ms-2">${list.companyDto.com_name }</div>
									</div>
									<!-- 가족기업여부 -->
									<div class="row mb-2">
										<div class="col ms-2">
											<c:if test="${list.companyDto.is_family_company ne null and list.companyDto.is_family_company eq 'Y'}">
												<span class="badge text-bg-info text-white">Family</span>
											</c:if>						
										</div>
									</div>
								</div>
								<div class="col">
									<!-- 공고 제목 -->
									<div class="row">
										<div class="col">
											${list.postDto.posting_name }
										</div>
									</div>
									<!-- #카테고리 #콘텐츠 #주소 지역 #마감일 -->
									<div class="row mb-3">
										<div class="col">
											<span class="text-secondary">#&nbsp;${list.jfcDto.job_field_category_name} #&nbsp;${list.postDto.job_position}
											#&nbsp;${list.companyDto.com_address} #&nbsp;<fmt:formatDate value="${list.postDto.posting_deadline}" pattern="~MM/dd(EEE)"/></span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- 신청한 공고정보 끝 -->
					</div>
					<div class="col mx-5 px-5">
						<!-- 관심채용정보 -->
						<div class="row border-bottom border-2">
							<div class="col fs-5 fw-bold mt-5 pb-1">관심채용정보</div>
							<div class="col fs-5 fw-bold mt-5 text-end"><i class="bi bi-plus-lg"></i></div>
						</div>
						<c:choose>
							<c:when test="${empty interestpostingForMyPage}">
								<div class="row mt-3">
									<div class="col fw-bold text-center">
										스크랩한 채용공고가 없습니다
									</div>
								</div>
							</c:when>
							<c:otherwise>
							<c:forEach items="${interestpostingForMyPage}" var="interestPosting">
								<div class="row mt-3 border-bottom">
									<!-- 1번째 칸 -->
									<div class="col-2">
										<div class="row">
											<!-- 기업명 -->
											<div class="col pe-0 pt-1 text-truncate">
												<a class="navbar-brand" href="./companyPostingListForStudentPage?com_pk=${interestPosting.companyDto.com_pk}">
													${interestPosting.companyDto.com_name}
												</a>
				<!-- 								<i class="text-danger bi bi-suit-heart"></i>
				 -->						</div>
										</div>
										<div class="row">
											<!-- 가족기업여부 -->
											<div class="col ms-1">
												<c:if test="${interestPosting.companyDto.is_family_company ne null and interestPosting.companyDto.is_family_company eq 'Y'}">
													<span class="badge text-bg-info text-white">Family</span>
												</c:if>						
											</div>
										</div>
									</div>
									<!-- 2번째 칸 -->
									<div class="col-8 mt-1 pb-3">
										<div class="row">
											<!-- 공고제목 -->
											<div class="col ms-1 ps-0 pt-1">
												<!-- 링크 더 좋은 방법 생각해보기 -->
												<a class="navbar-brand" href="../ny_posting/jobPostingDetailForStudentPage?id=${interestPosting.jobPostingDto.job_posting_pk}">
												<span class="d-inline-block text-truncate" style="max-width: 500px;">
													${interestPosting.jobPostingDto.posting_name}
												</span>
												</a>
											</div>
										</div>
										<div class="row">
											<!-- 분야/지역/기간 태그  -->
											<div class="col ps-0">
												<a class="navbar-brand" href="./jobPostingDetailPage?id=${interestPosting.jobPostingDto.job_posting_pk}">
												<span class="text-secondary">#&nbsp;${interestPosting.jobFieldCategoryDto.job_field_category_name} #&nbsp;${interestPosting.jobPostingDto.job_position}
												#&nbsp;${interestPosting.companyDto.com_address} #&nbsp;<fmt:formatDate value="${interestPosting.jobPostingDto.posting_deadline}" pattern="~MM/dd(EEE)"/></span>
												<c:choose>
													<c:when test="${interestPosting.postingDeadlineList.contains(interestPosting.jobPostingDto.job_posting_pk)}">
														<span class="badge text-bg-danger">마감임박!</span>
													</c:when>
													<c:when test="${interestPosting.endPostingList.contains(interestPosting.jobPostingDto.job_posting_pk)}">
														<span class="badge text-bg-secondary">채용마감</span>
													</c:when>
												</c:choose>
												</a>
											</div>
										</div>
									</div>
									<!-- 3번째 칸 -->
									<div class="col pt-3">
										<div class="row">
											<div class="col">
												<c:choose>
													<c:when test="${interestPosting.endPostingList.contains(interestPosting.jobPostingDto.job_posting_pk)}">
														<button class="btn btn-dark btn-sm" disabled>채용마감</button>
													</c:when>
													<c:when test="${empty sessionStudentInfo}">
														<button class="btn btn-dark btn-sm" disabled>지원하기</button>
													</c:when>
													<c:otherwise>
														<a class="btn btn-dark btn-sm" 
															href="../sb_resume/applyJobPostingPage?job_posting_pk=${interestPosting.jobPostingDto.job_posting_pk}">지원하기</a>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
						</c:choose>
						<!-- 관심채용정보 끝 -->
					</div>
				</div>
				<div class="row pt-3 ps-0 me-3"><div class="col"></div></div>
				<div class="row ms-1 pt-0 my-3">
					<div class="col-4 me-4 ps-3">
						<!-- (예정)신청한 프로그램 -->
						<div class="row border-bottom border-2 mb-3">
							<div class="col fs-5 fw-bold mt-5 pb-1">이수예정 프로그램</div>
							<div class="col fs-5 fw-bold mt-5 text-end">
								<a class="navbar-brand" href="../gw_program/applyProgramListForStudentPage">
									<i class="bi bi-plus-lg"></i>
								</a>
							</div>
						</div>
						
								<c:set var="currentTime" value="<%= new java.util.Date() %>" />
								<c:forEach items="${applyProgramListForMyPage}" var="list"> 
									<c:if test="${list.programApplyDto.student_pk==sessionStudentInfo.student_pk }">
										<c:if test="${list.programDto.prg_schedule.before(currentTime)}">
											<div class="row border-bottom border-bs-border pb-3 mb-3">
												<div class="col-1 text-center fw-bold pt-1">${list.programDto.program_pk}</div>
												<div class="col">
													<a class="btn ms-4" href="../gw_program/programViewDetailsForStudentPage?program_pk=${list.programDto.program_pk}">${list.programDto.prg_name}</a>
												</div>
												<div class="col-4 text-center mt-2">
													<span class="border border-0 py-2 px-3 mb-0 text-white fw-bold bg-primary rounded-3" style="font-size: 1em;"><fmt:formatDate value="${list.programDto.prg_schedule}" pattern="MM.dd"/>&nbsp;개강</span>
												</div> 
											</div> 
										</c:if>
									</c:if>
								</c:forEach>
							
						<!-- 신청한 프로그램 끝 -->
					</div>
					<div class="col mx-5 px-5">
						<!-- 공지사항 -->
						<div class="row border-bottom border-2">
							<div class="col fs-5 fw-bold mt-5 pb-1">공지사항</div>
							<div class="col fs-5 fw-bold mt-5 text-end"><i class="bi bi-plus-lg"></i></div>
							
						</div>
						<!-- 공지사항 끝 -->
					</div>
				</div>
			</div>
		</div>
		<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
		<!-- futter -->
		<div class="row">
			<div class="col">
				<jsp:include page="./futter.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>