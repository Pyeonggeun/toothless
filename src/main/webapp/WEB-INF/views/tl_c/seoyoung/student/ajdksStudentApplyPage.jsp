

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>AJDKS TEMPLATE FOR STUDENT</title>
<style>
/*학생좌측메뉴바설정*/
.studentleftmenubar input {
	display: none;
}

.studentleftmenubar label {
	display: block;
	cursor: pointer;
	background: #0C2145;
	transition: ease .1s;
}

.studentleftmenubar label:hover {
	background: #0C2145;
	opacity: 50%;
}

.studentleftmenubar .content {
	background: #091933;
	transition: ease .5s;
}

.studentleftmenubar input+label+.content {
	display: none;
}

.studentleftmenubar input:checked+label+.content {
	display: block;
}

/*a태그기본설정제거*/
.nolinenoblue>a {
	text-decoration: none;
	color: #000000;
}

/*accordion*/
.accordion { -
	-bs-accordion-btn-focus-border-color: #CDCDD3;
	-bs-accordion-btn-focus-box-shadow: 0 0 0 0.25rem #CDCDD3;
}

.accordion-button:not(.collapsed) {
	background-color: #f2f5f7;
}

.accordion { -
	-bs-accordion-btn-focus-box-shadow: none;
}

/*table*/
.table{
	--bs-table-bg:none;
	text-align: center;  
}

.th{
	text-align: center;  
}
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- 전체 container 입구 -->

		<div class="row">
			<div class="col">
				<jsp:include page="../../common/ajdksHighestMenubarForStudent.jsp"></jsp:include>
			</div>
		</div>
		<div class="row">

			<!-- 좌측메뉴바 -->
			<jsp:include page="../../common/ajdksSideMenubarForStudent.jsp"></jsp:include>

			<!-- 본문 : 자유롭게 이용하세요 화이팅 -->

			<div class="col">
				<div class="row">
					<div class="col mx-5 ">

						<!-- 본문작성공간 -->
						<br> <br>


						<div class="row ">
							<h2>
								<span class="fw-bolder border-bottom"><i
									class="bi bi-calendar-check"></i>&nbsp;신청내역 조회</span>
							</h2>
						</div>

						<br>
						<div class="row ps-3 me-1">

							<table class="table text-center align-middle ">
								<thead class="table">
									<tr  style="background-color: #f2f5f7;">
										<th scope="col">#</th>
										<th scope="col">기관명</th>
										<th scope="col">소재지</th>
										<th scope="col">실습기간</th>
										<th scope="col">결과발표일</th>
										<th scope="col">선발인원</th>
										<th scope="col">선발여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="companyList">
										<td scope="row">${companyList.INTERNSHIP_COURSE_PK}</td>
										<td scope="row">${companyList.COMPANY_NAME}</td>
										<td scope="row">${companyList.ADDRESS}</td>
										<td><fmt:formatDate
												value="${companyList.INTERNSHIP_START_DATE}"
												pattern="yyyy-MM-dd hh:mm" /> ~ <br> <fmt:formatDate
												value="${companyList.INTERNSHIP_END_DATE}"
												pattern="yyyy-MM-dd hh:mm" /></td>
										<td><fmt:formatDate
												value="${companyList.ANNOUNCEMENT_DATE}"
												pattern="yyyy-MM-dd hh:mm" /></td>
										<td scope="row">${companyList.INTERNSHIP_TOTAL_MEMBER}명</td>
										<td scope="row">${companyList.STATUS}</td>
									</c:forEach>
								</tbody>
							</table>

						</div>
						<br>
						<div class="row text-center">
							<div class="accordion accordion-secondary	"
								id="accordionExample bg-primary" style="-bs-accent: #f2f5f7;">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-bolder " type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne"
											style="-bs-accent: #f2f5f7;">
											<i class="bi bi-bookmarks "></i> &nbsp;지원이력서
										</button>
									</h2>
									<div id="collapseOne" class="accordion-collapse collapse show"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<div class="row ">
												<table class="table ">
													<thead>
														<tr style="background-color: #f2f5f7;">
															<th class="col-md-3">#</th>
															<th class="span10">내용</th>

														</tr>
													</thead>
													<tbody >
														<tr >
															<th style="vertical-align : middle">지원 동기</th>
															<td>${selfIntroduction.answer1}</td>
														</tr>
														<tr>
															<th style="vertical-align : middle">전공 및 기술 능력</th>
															<td>${selfIntroduction.answer2}</td>
														</tr>
														<tr>
															<th style="vertical-align : middle">주요경력 및 자격사항</th>
															<td>${selfIntroduction.answer3}</td>
														</tr>
														<tr>
															<th style="vertical-align : middle">성격 및 장단점</th>
															<td>${selfIntroduction.answer4}</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="row text-end">
												<p class="fst-italic  fs-6">* 신청 결과가 나오기 전까지 자기소개서 수정이
													불가 합니다.</p>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="row text-center">
							<div class="accordion" id="accordionExample">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button fw-bolder" " type="button"
											data-bs-toggle="collapse" data-bs-target="#collapseTwo"
											aria-expanded="true" aria-controls="collapseOne">
											<i class="bi bi-bookmarks "></i> &nbsp;이전신청내역
										</button>
									</h2>
									<div id="collapseTwo" class="accordion-collapse collapse show"
										data-bs-parent="#accordionExample">
										<div class="accordion-body">
											<table class=" table text-center align-middle ">
												<thead class="table">
													<tr style="background-color: #f2f5f7;">
														<th scope="col">#</th>
														<th scope="col">기관명</th>
														<th scope="col">소재지</th>
														<th scope="col">실습기간</th>
														<th scope="col">결과발표일</th>
														<th scope="col">선발인원</th>	
														<th scope="col">선발여부</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${list2}" var="companyList"
														varStatus="loopStatus">
														<tr>
															<td class="text-center">${loopStatus.index + 1}</td>
															<td scope="row">${companyList.COMPANY_NAME}</td>
															<td scope="row">${companyList.ADDRESS}</td>
															<td><fmt:formatDate
																	value="${companyList.INTERNSHIP_START_DATE}"
																	pattern="yyyy-MM-dd hh:mm" /> ~ <br> <fmt:formatDate
																	value="${companyList.INTERNSHIP_END_DATE}"
																	pattern="yyyy-MM-dd hh:mm" /></td>
															<td><fmt:formatDate
																	value="${companyList.ANNOUNCEMENT_DATE}"
																	pattern="yyyy-MM-dd hh:mm" /></td>
															<td scope="row">${companyList.INTERNSHIP_TOTAL_MEMBER}명</td>
															<td scope="row">${companyList.STATUS}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- 전체 container 출구 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>


