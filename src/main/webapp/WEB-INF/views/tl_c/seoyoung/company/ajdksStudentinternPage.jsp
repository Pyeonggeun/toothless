<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="formattedNow" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>AJDKS TEMPLATE FOR COMPANY</title>
<style>
/*산업체좌측메뉴바설정*/
.companyleftmenubar input {
	display: none;
}

.companyleftmenubar label {
	display: block;
	cursor: pointer;
	background: #22212E;
	transition: ease .1s;
}

.companyleftmenubar label:hover {
	background: #22212E;
	opacity: 50%;
}

.companyleftmenubar .content {
	background: #1C1C26;
	transition: ease .5s;
}

.companyleftmenubar input+label+.content {
	display: none;
}

.companyleftmenubar input:checked+label+.content {
	display: block;
}

/*a태그기본설정제거*/
.nolinenoblue>a {
	text-decoration: none;
	color: #000000;
}

/*accordion*/
.accordion { -
	-bs-accordion-btn-focus-border-color: #f2f5f7;
	-bs-accordion-btn-focus-box-shadow: 0 0 0 0.25rem #f2f5f7;
}

.accordion-button:not(.collapsed) {
	background-color: #f2f5f7;
}

.accordion { -
	-bs-accordion-btn-focus-box-shadow: none;
}

/*table*/
.table { -
	-bs-table-bg: none;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- 전체 container 입구 -->

		<div class="row">

			<!-- 좌측메뉴바 : col-2 -->
			<jsp:include page="../../common/ajdksTemplateForCompany.jsp"></jsp:include>

			<!-- 메인화면 -->
			<div class="col">
				<!-- 안내문구 -->
				<div class="row py-2"
					style="box-shadow: 2px 2px 2px gray; font-size: 0.9em;">
					<div class="col ps-2">
						<span>&#035;&nbsp;${ajdksCompanyInfoDto.company_name } 님
							환영합니다</span>
					</div>
					<div class="col pe-2 text-end nolinenoblue">
						<a href="../../taeho/external/ajdksCompanyLogoutProcess">로그아웃</a>
					</div>
				</div>

				<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
				<div class="row">
					<div class="col mx-5">

						<!-- 본문작성공간 -->
						<br> <br>
						<div class="row mt-2">
							<div class="col-auto">
								<h2>
									<span class="fw-bolder"><i class="bi bi-building-check"></i>&nbsp;현장
										실습 과정 조회 </span>
								</h2>
							</div>
							<div class="col text-start mt-3">
								<h6>
									<span class="align-text-bottom">상세 과정 선택</span>
								</h6>
							</div>
						</div>

						<br>

						<div class="row row-cols-2 mt-2 mb-4">
							<c:forEach items="${list}" var="companyList">
								<div class="col px-3 text-center">
									<div class="card mb-3 px-3btext-center">
										<c:if test="${companyList.DATE_CHECK eq 'yes'}">
											<div class="card-header bg-secondary bg-opacity-25"
												style="background-color: #f2f5f7;">진행중</div>
										</c:if>
										<c:if test="${companyList.DATE_CHECK eq 'not'}">
											<div class="card-header bg-secondary bg-opacity-25"
												style="background-color: #f2f5f7;">진행예정</div>
										</c:if>
										<c:if test="${companyList.DATE_CHECK eq 'no'}">
											<div class="card-header bg-secondary bg-opacity-25"
												style="background-color: #f2f5f7;">종료</div>
										</c:if>
										<div class="card-body">
											<h5 class="card-title">
												<p class="fs-4 fw-bolder">
													<i class="bi bi-bookmarks"></i>
													&nbsp;${companyList.COMPANY_NAME}
												</p>
											</h5>
											<p class="card-text fs-6">
												과정 : ${companyList.COURSE_TITLE}<br> 현장실습 진행기간 :
												<fmt:formatDate value="${companyList.INTERNSHIP_START_DATE}"
													pattern="yyyy-MM-dd hh:mm" />
												~
												<fmt:formatDate value="${companyList.INTERNSHIP_END_DATE}"
													pattern="yyyy-MM-dd hh:mm" />
												<br> 모집기간 :
												<fmt:formatDate value="${companyList.APPLYING_START_DATE}"
													pattern="yyyy-MM-dd hh:mm" />
												~
												<fmt:formatDate value="${companyList.APPLYING_END_DATE}"
													pattern="yyyy-MM-dd hh:mm" />
											</p>
											<c:if test="${companyList.DATE_CHECK eq 'yes'}">
												<a
													href="./ajdksSelectInternPage?internship_course_pk=${companyList.INTERNSHIP_COURSE_PK}"
													class="d-grid btn bg-secondary bg-opacity-10"
													style="background-color: #f2f5f7; outline-color: #f2f5f7;">상세보기</a>
											</c:if>
											<c:if test="${companyList.DATE_CHECK eq 'not'}">
												<a class="d-grid btn bg-secondary bg-opacity-10"
													style="background-color: #f2f5f7; outline-color: #f2f5f7;"
													onclick="alert('진행 예정인 실습 과정 입니다.');">상세보기</a>

											</c:if>
											<c:if test="${companyList.DATE_CHECK eq 'no'}">
												<a class="d-grid btn bg-secondary bg-opacity-10"
													style="background-color: #f2f5f7; outline-color: #f2f5f7;"
													onclick="alert('종료된 실습 과정 입니다.');">상세보기</a>

											</c:if>

										</div>
									</div>
								</div>
							</c:forEach>
						</div>


					</div>
				</div>
				<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>
			</div>
		</div>
		<!-- 전체 container 출구 -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>
</body>
</html>