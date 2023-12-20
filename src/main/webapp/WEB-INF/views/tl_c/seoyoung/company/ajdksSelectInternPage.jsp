
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
<script>
	function updateFormAction() {
		var certificationForm = document.getElementById("certificationForm");

		certificationForm.action = "./certificationProcess?student_pk="
				+ selectionStudent.STUDENT_PK;
	}

</script>
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
						<span>&#035;&nbsp;중앙정보기술인재개발원 님 환영합니다</span>
					</div>
					<div class="col pe-2 text-end nolinenoblue">
						<a href="./ajdksCompanyLogoutProcess">로그아웃</a>
					</div>
				</div>

				<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
				<div class="row">
					<div class="col mx-5">

						<!-- 본문작성공간 -->

						<div class="row">
							<div class="col mx-4">

								<!-- 본문작성공간 -->
								<br> <br>
								<div class="container">

									<div class="row">
										<h2>
											<span class="fw-bolder"><i
												class="bi bi-building-check"></i>&nbsp;실습생 선발 </span>
										</h2>
									</div>
									<br>
									<div class="row ps-3">
										<table class="table text-center align-middle ">
											<thead class="table">
												<tr style="background-color: #f2f5f7;">
													<th scope="col">#</th>
													<th scope="col">학번</th>
													<th scope="col">이름</th>
													<th scope="col">성별</th>
													<th scope="col">전화번호</th>
													<th scope="col">이메일</th>
													<th scope="col">신청일</th>
													<th scope="col">선발여부</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list2}" var="selectionStudent">
													<tr>
														
														<th scope="row">${selectionStudent.STUDENT_APPLYING_PK}</th>
														<td scope="row">${selectionStudent.STUDENT_ID}</td>
														<td scope="row">
															<div
																class="modal modal-fullscreen  modal-dialog-scrollable"
																id="exampleModalToggle?student_pk=${selectionStudent.STUDENT_PK}"
																aria-hidden="true"
																aria-labelledby="exampleModalToggleLabel" tabindex="-1">

																<div
																	class="modal-dialog modal-fullscreen modal-dialog-scrollable">
																	<div class="modal-content">
																		<div class="modal-header">
																			<br>
																			<h5 class="modal-title text-start"
																				id="exampleModalToggleLabel">
																				<span class="fw-bolder"><i
																					class="bi bi-calendar-check"></i>&nbsp; 신청내역 조회</span>
																			</h5>
																			<button type="button" class="btn-close"
																				data-bs-dismiss="modal" aria-label="Close"></button>
																		</div>
																		<div class="modal-body px-5" style="overflow-y: auto">
																			<br>
																			<div class="row text-start mb-3">
																				<h5>
																					<i class="bi bi-bookmarks"></i> &nbsp; <span
																						class="fw-bold">기본정보</span>
																				</h5>
																			</div>

																			<div class="row mx-3 pe-3">

																				<div class="col-2 text-center">
																					<div class="row border" style="height: 300px;">
																						<img src="/Git_imageFile/${selectionStudent.SELF_INTRODUCTION_IMG}">
																					</div>
																				</div>
																				<div class="col-3">
																					<div
																						class="row border d-flex align-items-center justify-content-center bg-secondary bg-opacity-10"
																						style="height: 75px; background-color: #f2f5f7; font-weight: bold;">
																						학생명/성별 *</div>
																					<div
																						class="row border d-flex align-items-center justify-content-center bg-secondary bg-opacity-10"
																						style="height: 75px; background-color: #f2f5f7; font-weight: bold;">
																						전화번호/휴대폰 *</div>
																					<div
																						class="row border d-flex align-items-center justify-content-center bg-secondary bg-opacity-10"
																						style="height: 75px; background-color: #f2f5f7; font-weight: bold;">
																						이메일 *</div>
																					<div
																						class="row border d-flex align-items-center justify-content-center bg-secondary bg-opacity-10"
																						style="height: 75px; background-color: #f2f5f7; font-weight: bold;">
																						주소 *</div>
																				</div>


																				<div class="col-7  text-center ">
																					<div
																						class="row border d-flex align-items-center justify-content-center"
																						style="height: 75px;">
																						${selectionStudent.NAME} /
																						${selectionStudent.GENDER}</div>
																					<div
																						class="row border d-flex align-items-center justify-content-center"
																						style="height: 75px;">
																						${selectionStudent.PHONE}</div>
																					<div
																						class="row border d-flex align-items-center justify-content-center"
																						style="height: 75px;">
																						${selectionStudent.EMAIL}</div>
																					<div
																						class="row border d-flex align-items-center justify-content-center"
																						style="height: 75px;">
																						${selectionStudent.ADDRESS}</div>
																				</div>
																				<hr style="border-top: 2px solid; margin-bottom: 0;">
																			</div>
																			<br>
																			<div class="row text-start mb-3">
																				<h5>
																					<i class="bi bi-bookmarks"></i> &nbsp; <span
																						class="fw-bold">학적정보</span>
																				</h5>
																			</div>
																			<!-- 1열-->
																			<div class="row  px-4">
																				<div class="col-2">
																					<div
																						class="row border d-flex align-items-center justify-content-center bg-secondary bg-opacity-10"
																						style="height: 50px; background-color: #CFE2FF; font-weight: bold;">
																						이름</div>
																				</div>
																				<div class="col-4">
																					<div
																						class="row border d-flex align-items-center justify-content-center"
																						style="height: 50px;">
																						${selectionStudent.NAME}</div>
																				</div>

																				<div class="col-2">
																					<div
																						class="row border d-flex align-items-center justify-content-center bg-secondary bg-opacity-10"
																						style="height: 50px; background-color: #f2f5f7; font-weight: bold;">
																						현재학기</div>
																				</div>
																				<div class="col-4 pe-4">
																					<div
																						class="row border d-flex align-items-center justify-content-center"
																						style="height: 50px;">
																						${selectionStudent.SEMESTER_PK}학기</div>
																				</div>
																			</div>

																			<!--  2열 왼쪽 -->
																			<div class="row  px-4">
																				<div class="col-2">
																					<div
																						class="row border d-flex align-items-center justify-content-center bg-secondary bg-opacity-10"
																						style="height: 50px; background-color: #f2f5f7; font-weight: bold;">
																						전공</div>
																				</div>
																				<div class="col-4">
																					<div
																						class="row border d-flex align-items-center justify-content-center"
																						style="height: 50px;">
																						${selectionStudent.DEPARTMENTNAME}</div>
																				</div>


																				<!-- 2열 오른쪽 -->
																				<div class="col-2">
																					<div
																						class="row border d-flex align-items-center justify-content-center bg-secondary bg-opacity-10"
																						style="height: 50px; background-color: #f2f5f7; font-weight: bold;">
																						취득학점</div>
																				</div>
																				<div class="col-4 pe-4">
																					<div
																						class="row border d-flex align-items-center justify-content-center"
																						style="height: 50px;">전자공학과</div>
																				</div>
																			</div>

																			<!-- 3열 왼쪽  -->
																			<div class="row px-4">
																				<div class="col-2">
																					<div
																						class="row border d-flex align-items-center justify-content-center bg-secondary bg-opacity-10"
																						style="height: 50px; background-color: #f2f5f7; font-weight: bold;">
																						담당교수</div>
																				</div>
																				<div class="col-4">
																					<div
																						class="row border d-flex align-items-center justify-content-center"
																						style="height: 50px;">
																						${selectionStudent.PROFFESSORNAME}</div>
																				</div>

																			</div>
																			<br>
																			<div class="row">
																				<div class="accordion" id="accordionExample"
																					style="-bs-accent: #f2f5f7;">
																					<div class="accordion-item">
																						<h2 class="accordion-header">

																							<button class="accordion-button collapsed"
																								type="button" data-bs-toggle="collapse"
																								data-bs-target="#collapseTwo"
																								aria-expanded="false"
																								aria-controls="collapseTwo"
																								style="background-color: #f2f5f7;"
																								onclick="certificationForm()">
																								<i class="bi bi-bookmarks "></i> &nbsp; 자격증
																							</button>

																						</h2>
																						<div id="collapseTwo"
																							class="accordion-collapse collapse"
																							data-bs-parent="#accordionExample"
																							style="-bs-accent: #f2f5f7;">
																							<div class="accordion-body">
																								<table class="table text-center align-middle ">
																									<thead class="table">
																										<tr style="background-color: #f2f5f7;">
																											<th scope="col">#</th>
																											<th scope="col">자격증</th>
																											<th scope="col">취득일</th>
																										</tr>
																									</thead>
																									<tbody>
																										<c:forEach items="${CertificationList}"
																											var="CertificationList"
																											varStatus="loopStatus">
																											<tr>
																												<td class="text-center">${loopStatus.index + 1}</td>
																												<td class="text-center">${CertificationList.CERTIFICATION_NAME}</td>
																												<td class="text-center">${CertificationList.CERTIFICATION_ACQUISITION_DATE}</td>
																											</tr>
																										</c:forEach>
																									</tbody>
																								</table>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																			<br>
																			<div class="row">
																				<div class="accordion" id="accordionExample"
																					style="-bs-accent: #f2f5f7;">
																					<div class="accordion-item">
																						<h1 class="accordion-header">
																							<button class="accordion-button" type="button"
																								data-bs-toggle="collapse"
																								data-bs-target="#collapseOne"
																								aria-expanded="true" aria-controls="collapseOne"
																								style="background-color: #f2f5f7;"
																								>
																								<i class="bi bi-bookmarks "></i> &nbsp; 지원이력서
																							</button>
																						</h1>
																						<div id="collapseOne"
																							class="accordion-collapse collapse	"
																							data-bs-parent="#accordionExample">
																							<div class="accordion-body">
																								<div class="row">
																									<table class="table">
																										<thead>
																											<tr>
																												<th class="col-md-3">#</th>
																												<th class="span10">내용</th>

																											</tr>
																										</thead>
																										<tbody>
																											<tr>
																												<th>지원 동기</th>
																												<td>${selectionStudent.ANSWER1}</td>
																											</tr>
																											<tr>
																												<th>전공 및 기술 능력</th>
																												<td>${selectionStudent.ANSWER2}</td>
																											</tr>
																											<tr>
																												<th>주요경력 및 자격사항</th>
																												<td>${selectionStudent.ANSWER3}</td>
																											</tr>
																											<tr>
																												<th>성격 및 장단점</th>
																												<td>${selectionStudent.ANSWER4}</td>
																											</tr>
																										</tbody>
																									</table>
																								</div>

																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																			<!-- 학적 정보 row 끝 -->
																		</div>
																		<br>
																		<div class="row">
																			<div class="modal-footer">
																				<a
																					href="./updateSelectInternProcess?status=불합격&student_pk=${selectionStudent.STUDENT_PK}&internship_course_pk=${selectionStudent.INTERNSHIP_COURSE_PK}"
																					class="btn bbtn btn-secondary"
																					data-bs-toggle="modal" role="button">불합격 </a> <a
																					href="./updateSelectInternProcess?status=합격&student_pk=${selectionStudent.STUDENT_PK}&internship_course_pk=${selectionStudent.INTERNSHIP_COURSE_PK}"
																					class="btn bbtn btn-primary" data-bs-toggle="modal"
																					role="button">합격 <input
																					name="internship_course_pk" type="hidden"
																					value="${companyList.INTERNSHIP_COURSE_PK}"><input
																					name="student_pk" type="hidden"
																					value="${companyList.STUDENT_PK}">
																				</a>
																			</div>
																		</div>
																	</div>
																</div>

															</div> <a class="btn btn btn-light" data-bs-toggle="modal"
															href="#exampleModalToggle?student_pk=${selectionStudent.STUDENT_PK}"
															role="button"> ${selectionStudent.NAME}</a>
														</td>
														<td scope="row">${selectionStudent.GENDER}</td>
														<td scope="row">${selectionStudent.PHONE}</td>
														<td scope="row">${selectionStudent.EMAIL}</td>
														<td scope="row">${selectionStudent.CREATED_AT}</td>
														<td scope="row">${selectionStudent.STATUS}</td>
														<td scope="row">
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


	<!-- 전체 container 출구 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>