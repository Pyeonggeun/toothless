<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%
String formattedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date());
%>
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
					<div class="col mx-4">

						<!-- 본문작성공간 -->
						<br> <br>
						<div class="container">

							<div class="row">
								<h2>
									<span class="fw-bolder"><i class="bi bi-calendar-check"></i>&nbsp;현장실습
										기관조회</span>
								</h2>
							</div>
							<br>

							<form>
								<nav class="navbar navbar-light">
									<div class="col">
										<div class="row ms-3 mt-3 me-3 mb-3">
											<div class="col-2 px-0">
												<select class="form-select" id="inputCategory">
													<option selected>업종 선택</option>
													<option value="1">제조업</option>
													<option value="2">건설업</option>
													<option value="3">정보통신업</option>
													<option value="4">금융업</option>
													<option value="5">부동산업</option>
												</select>
											</div>
											<div class="input-group col px-0 ">
												<input class="form-control" type="search"
													placeholder="Search" aria-label="Search">
												<button class="input-group-prepend btn btn-primary btn-outline-light" style="background-color: #CFE2FF;" >
													<i class="bi bi-search" ></i>
												</button>

											</div>

										</div>
									</div>

								</nav>
							</form>
							<br>
							<div class="row text-center">
								<table class="table text-center align-middle ">
									<thead class="table-primary">
										<tr>
											<th scope="col">#</th>
											<th scope="col">업종</th>
											<th scope="col">회사명</th>
											<th scope="col">소재지</th>
											<th scope="col">실습기간</th>
											<th scope="col">모집기간</th>
											<th scope="col">접수마감</th>
											<th scope="col">자격요건</th>
											<th scope="col">선발인원</th>
											<th scope="col">&nbsp;지원</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${list}" var="companyList">
											<tr>
												<th scope="row">${companyList.INTERNSHIP_COURSE_PK}</th>
												<th scope="row">${companyList.COMPANY_CATEGORY_NAME}</th>
												<th scope="row">${companyList.COMPANY_NAME}</th>
												<th scope="row">${companyList.ADDRESS}</th>
												<th><fmt:formatDate
														value="${companyList.INTERNSHIP_START_DATE}"
														pattern="yyyy-MM-dd hh:mm" /> ~ <br> <fmt:formatDate
														value="${companyList.INTERNSHIP_END_DATE}"
														pattern="yyyy-MM-dd hh:mm" /></th>
												<th><fmt:formatDate
														value="${companyList.APPLYING_START_DATE}"
														pattern="yyyy-MM-dd hh:mm" /> ~ <br> <fmt:formatDate
														value="${companyList.APPLYING_END_DATE}"
														pattern="yyyy-MM-dd hh:mm" /></th>
												<th><fmt:formatDate
														value="${companyList.ANNOUNCEMENT_DATE}"
														pattern="yyyy-MM-dd hh:mm" /></th>
												<th scope="row">${companyList.SEMESTER_QUALIFICATION}학년</th>
												<th scope="row">${companyList.INTERNSHIP_TOTAL_MEMBER}명</th>
												<td scope="row">
													<div class="modal modal-fullscreen"
														id="exampleModalToggle?internship_course_pk=${companyList.INTERNSHIP_COURSE_PK}"
														aria-hidden="true"
														aria-labelledby="exampleModalToggleLabel" tabindex="-1">
														<div class="modal-dialog modal-fullscreen">
															<div class="modal-content ">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalToggleLabel">현장학습신청</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<div class="modal-body">
																	<div class="card">
																		<img
																			src="../../../resources/img/companyImage/company1.jpg"
																			class="card-img-top" alt="...">
																		<div class="card-body">
																			<h4 class="card-title fw-bolder">${companyList.COMPANY_NAME}</h4>
																			<p class="card-text">
																			<table class="table">
																				<thead>
																					<tr>
																						<th scope="col">과정명</th>
																						<td class="text-start"><span
																							class="text-muted ">${companyList.COURSE_TITLE}</span></td>
																						<th scope="col">자격조건</th>
																						<td class="text-start"><span
																							class="text-muted">${companyList.SEMESTER_QUALIFICATION}
																								학년 &nbsp;</span></td>
																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<th scope="col">대표자명</th>
																						<td class="text-start"><span
																							class="text-muted ">${companyList.CEO_NAME}</span></td>
																						<th scope="col">실습인원</th>
																						<td class="text-start"><span
																							class="text-muted">${companyList.INTERNSHIP_TOTAL_MEMBER}
																								명 &nbsp;</span></td>
																					</tr>
																					<tr>
																						<th scope="row">주소</th>
																						<td class="text-start"><span
																							class="text-muted">${companyList.ADDRESS}</span></td>

																					</tr>
																					<tr>
																						<th scope="col">선발방법</th>
																						<td class="text-start"><span
																							class="text-muted">MK 학생만 선발</span></td>
																					</tr>
																					<tr>
																						<th scope="col">운형유형</th>
																						<td class="text-start"><span
																							class="text-muted">채용연계형</span></td>
																					</tr>
																					<tr>
																						<th scope="col">실습기간</th>
																						<td class="text-start"><span
																							class="text-muted"><fmt:formatDate
																									value="${companyList.INTERNSHIP_START_DATE}"
																									pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
																									value="${companyList.INTERNSHIP_END_DATE}"
																									pattern="yyyy-MM-dd" /></span></td>
																						<th scope="col">정규실습 시간</th>
																						<td class="text-start"><span
																							class="text-muted"><fmt:formatDate
																									value="${companyList.INTERNSHIP_START_DATE}"
																									pattern="hh:mm" /> ~ <fmt:formatDate
																									value="${companyList.INTERNSHIP_END_DATE}"
																									pattern="hh:mm" /></span></td>
																					</tr>
																					<tr>
																						<th scope="col">실습요일</th>
																						<td class="text-start"><span
																							class="text-muted">주 5일</span></td>
																					</tr>
																					<tr>
																						<th scope="col">전형방법</th>
																						<td class="text-start"><span
																							class="text-muted">면접선발</span></td>
																					</tr>
																					<tr>
																						<th scope="col">모집기간</th>
																						<td class="text-start"><span
																							class="text-muted"><fmt:formatDate
																									value="${companyList.APPLYING_START_DATE}"
																									pattern="yyyy.MM.dd hh:mm" /> ~ <fmt:formatDate
																									value="${companyList.APPLYING_END_DATE}"
																									pattern="yyyy-MM-dd hh:mm" /></span></td>
																					</tr>
																					<tr>
																						<th scope="col">선발결과발표일</th>
																						<td class="text-start"><span
																							class="text-muted"><fmt:formatDate
																									value="${companyList.ANNOUNCEMENT_DATE}"
																									pattern="yyyy-MM-dd hh:mm" /></span></td>
																					</tr>
																					<tr>
																						<th scope="col">등록일자</th>
																						<td class="text-start"><span
																							class="text-muted"><fmt:formatDate
																									value="${companyList.CREATED_AT}"
																									pattern="yyyy-MM-dd hh:mm" /></span></td>
																					</tr>

																				</tbody>

																			</table>

																			<p class="card-text">
																				<small class="text-muted">MK University</small>
																			</p>

																		</div>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-bs-dismiss="modal">닫기</button>
																	<a class="btn bbtn btn-primary" data-bs-toggle="modal"
																		href="#exampleModalToggle2?internship_course_pk=${companyList.INTERNSHIP_COURSE_PK}"
																		role="button">다음</a>
																</div>
															</div>
														</div>
													</div>
													<form action="./studentApplyProcess" method="get">

														<input name="internship_course_pk" type="hidden"
															value="${companyList.INTERNSHIP_COURSE_PK}"> <input
															name="student_pk" type="hidden"
															value="${sessionStudentInfo.student_pk}">

														<div class="modal fade"
															id="exampleModalToggle2?internship_course_pk=${companyList.INTERNSHIP_COURSE_PK}"
															aria-hidden="true"
															aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
															<div class="modal-dialog modal-dialog-centered">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="exampleModalToggleLabel2">현장학습신청</h5>
																		<button type="button" class="btn-close"
																			data-bs-dismiss="modal" aria-label="Close"></button>
																	</div>
																	<div class="modal-body">
																		신청하시겠습니까?</br> *신청 하시면 결과 발표 때까지 지원이 불가 합니다.
																	</div>
																	<c:if test="${tf eq 'yes'}">
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-bs-dismiss="modal">뒤로가기</button>
																			<button type="submit" class="btn btn-primary">신청</button>
																		</div>
																	</c:if>
																	<c:if test="${tf eq 'no'}">
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-bs-dismiss="modal">뒤로가기</button>
																			<a class="btn btn-primary" data-bs-toggle="modal"
																				href="#exampleModalToggle3" role="button">신청</a>
																		</div>
																	</c:if>


																</div>

															</div>

														</div>
														<div class="modal fade " id="exampleModalToggle3"
															aria-hidden="true"
															aria-labelledby="exampleModalToggleLabel3" tabindex="-1">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="exampleModalToggleLabel2">현장학습신청</h5>
																		<button type="button" class="btn-close"
																			data-bs-dismiss="modal" aria-label="Close"></button>
																	</div>
																	<div class="modal-body">
																		<p>이미 신청한 내역이 있습니다.</p>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary"
																			data-bs-dismiss="modal">닫기</button>
																	</div>
																</div>
															</div>
														</div>
														<a class="btn btn btn-light" data-bs-toggle="modal"
															href="#exampleModalToggle?internship_course_pk=${companyList.INTERNSHIP_COURSE_PK}"
															role="button">상세보기</a>
													</form>
												</td>
											<tr>
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
	<!-- 전체 container 출구 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>