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
			<div class="col-1"></div>
			<%-- 학생 메뉴 바 --%>
			<div class="col-1 me-5">
				<jsp:include page="./studentMenu.jsp"></jsp:include>
			</div>
			<!-- 메인기능쪽 -->
			<div class="col ms-3 ps-5 pe-4 border-start">
				<div class="row">
				<!-- 가운데 여백 -->
					<%-- 학생 정보 --%>
					<div class="col-4 p-0 me-4">
						<div class="row p-3 mt-5">
							<!-- 사진 -->
							<div class="col ps-5 pe-0 mt-2 fs-4 text-secondary">
								<img class="img-fluid" src="../../resources/img/employment/user.png">
							</div>
							<!-- 학생정보(나중에 추가하려면 추가하기) -->
							<div class="col mt-2 ps-0">
								<!-- 이름 -->
								<div class="row">
									<div class="col">이름</div>
								</div>
								<!-- 학번 -->
								<div class="row">
									<div class="col">학번</div>
								</div>
								<!-- 학과 -->
								<div class="row">
									<div class="col">학과</div>
								</div>
								<!-- 전화번호 -->
								<div class="row">
									<div class="col">전화번호</div>
								</div>
								<!-- 이메일 -->
								<div class="row">
									<div class="col">이메일</div>
								</div>
								<!-- 구직희망신청상태 나중에 if문 -->
								<div class="row">
									<a class="col mt-1 ms-2 me-5 btn btn-secondary btn-sm" href="#">구직희망중</a>
								</div>
							</div>
						</div>
					</div>
					<!-- 학생 정보 끝 -->
					<%-- (예정) 상담이력 --%>	
					<div class="col mx-5 mt-3 px-5 pb-0 border-start">
						<!-- 공고 지원한 학생목록 -->
						<div class="row border-bottom border-2 border-dark">
							<div class="col fs-5 fw-bold mt-5 pb-1">(예정)상담이력</div>
							<div class="col fs-5 fw-bold mt-5 text-end"><i class="bi bi-plus-lg"></i></div>
						</div>
					</div>
					<!-- (예정) 상담이력 -->
				</div>
				<div class="row pt-3 ps-0 me-3 border-bottom"><div class="col"></div></div>
				<div class="row pt-0 my-3">
					<div class="col-4 me-4 ps-3">
						<!-- (예정)신청한 공고정보 -->
						<div class="row border-bottom border-2 border-dark">
							<div class="col fs-5 fw-bold mt-5 pb-1">(예정)신청채용정보</div>
							<div class="col fs-5 fw-bold mt-5 text-end"><i class="bi bi-plus-lg"></i></div>
						</div>
						<!-- (예정)신청한 공고정보 끝 -->
					</div>
					<div class="col mx-5 px-5 border-start">
						<!-- 관심채용정보 -->
						<div class="row border-bottom border-2 border-dark">
							<div class="col fs-5 fw-bold mt-5 pb-1">관심채용정보</div>
							<div class="col fs-5 fw-bold mt-5 text-end"><i class="bi bi-plus-lg"></i></div>
						</div>
						<c:forEach items="${interestpostingForMyPage}" var="interestPosting">
						<div class="row mt-3  border-bottom">
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
										<a class="navbar-brand" href="./jobPostingDetailForStudentPage?id=${interestPosting.jobPostingDto.job_posting_pk}">
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
										<span class="text-secondary">#&nbsp;${interestPosting.jobFieldCategoryDto.job_field_category_name} #&nbsp;${jobPostingForStudent.jobPostingDto.job_position}
										#&nbsp;${interestPosting.companyDto.com_address} #&nbsp;<fmt:formatDate value="${jobPostingForStudent.jobPostingDto.posting_deadline}" pattern="~MM/dd(EEE)"/></span>
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
						<!-- 관심채용정보 끝 -->
					</div>
				</div>
				<div class="row pt-3 ps-0 me-3 border-bottom"><div class="col"></div></div>
				<div class="row pt-0 my-3">
					<div class="col-4 me-4 ps-3">
						<!-- (예정)신청한 프로그램 -->
						<div class="row border-bottom border-2 border-dark">
							<div class="col fs-5 fw-bold mt-5 pb-1">(예정)이수예정 프로그램</div>
							<div class="col fs-5 fw-bold mt-5 text-end"><i class="bi bi-plus-lg"></i></div>
						</div>
						<!-- (예정)신청한 프로그램 끝 -->
					</div>
					<div class="col mx-5 px-5 border-start ">
						<!-- (예정)공지사항 혹은 설문조사 -->
						<div class="row border-bottom border-2 border-dark">
							<div class="col fs-5 fw-bold mt-5 pb-1">(예정)공지사항 혹은 설문조사</div>
							<div class="col fs-5 fw-bold mt-5 text-end"><i class="bi bi-plus-lg"></i></div>
						</div>
						<!-- (예정)공지사항 혹은 설문조사 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>