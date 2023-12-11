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
<title>AJDKS TEMPLATE FOR STAFF</title>


<style>
/*교직원좌측메뉴바설정*/
body {
	font-family: "Noto Sans CJK KR";
}

.jb-700 {
	font-weight: 700;
}

.jb-bolder {
	font-weight: bolder;
}

.jb-x-small {
	font-size: x-small;
}

.jb-small {
	font-size: small;
}

.jb-medium {
	font-size: medium;
}

.labelcolor {
	color: white;
	background: #2B3D77;
}

.fontcolor {
	color: $blue-800;
}

.fontcolor2 {
	color: #2B3D77;
}

.staffleftmenubar input {
	display: none;
}

.staffleftmenubar label {
	display: block;
	cursor: pointer;
	background: #0C2145;
	transition: ease .1s;
}

.staffleftmenubar label:hover {
	background: #0C2145;
	opacity: 50%;
}

.staffleftmenubar .content {
	background: #091933;
	transition: ease .5s;
}

.staffleftmenubar input+label+.content {
	display: none;
}

.staffleftmenubar input:checked+label+.content {
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
				<jsp:include page="../../common/ajdksHighestMenubarForStaff.jsp"></jsp:include>
			</div>
		</div>
		<div class="row">

			<!-- 좌측 메뉴바 -->
			<jsp:include page="../../common/ajdksSideMenubarForStaff.jsp"></jsp:include>

			<!-- 본문 -->
			<div class="col mx-5">


				<!-- 여백 -->
				<div class="row mt-3 mb-3">
					<div class="col"></div>
				</div>


				<!-- 상단 헤더 -->
				<div class="row mt-3 mb-3">
					<div class="col">
						<div class="row">
							<div class="col">

								<!-- 상단 텍스트 -->
								<h3 class="jb-700 fontcolor2">
									<i class="bi bi-box-arrow-in-down-right "></i> 관리자 현장실습과정 상세 및 수정
								</h3>

							</div>
						</div>
					</div>
				</div>

				<form name="frm" id="frm" action="./ajdksInternshipModify" method="post">

					<!-- 본문 작성 공간 -->

					<div class="row">
						<div class="col-md-5 mt-2 mb-2">
							<label for="inputCity" class="form-label jb-700"> 글 제목 </label> 
							<input name="course_title" type="text" class="form-control" style="font-size: 0.9em;" id="course_title" value="${AjdksInternshipCourseDto.course_title}" >
						</div>
						<input name="internship_course_pk" type="hidden"  value="${AjdksInternshipCourseDto.internship_course_pk}" >
						<div class="col-md-5 mt-2 mb-2">
							<label for="inputState" class="form-label jb-700"> 인원 수 </label>
							<select name="internship_total_member" id="internship_total_member" class="form-select" style="font-size: 0.9em;">
								<c:choose>
									<c:when test="${AjdksInternshipCourseDto.internship_total_member == 1 }">
										<option value="1" selected="selected">1</option>
									</c:when>
									<c:otherwise>
										<option value="1">1</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${AjdksInternshipCourseDto.internship_total_member == 2 }">
										<option value="2" selected="selected">2</option>
									</c:when>
									<c:otherwise>
										<option value="2">2</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${AjdksInternshipCourseDto.internship_total_member == 3 }">
										<option value="3" selected="selected">3</option>
									</c:when>
									<c:otherwise>
										<option value="3">3</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${AjdksInternshipCourseDto.internship_total_member == 4 }">
										<option value="4" selected="selected">4</option>
									</c:when>
									<c:otherwise>
										<option value="4">4</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${AjdksInternshipCourseDto.internship_total_member == 4 }">
										<option value="5" selected="selected"></option>
									</c:when>
									<c:otherwise>
										<option value="5">5</option>
									</c:otherwise>
								</c:choose>
							</select>
						</div>

						<div class="col-md-5 mt-2 mb-2">
							<label for="inputState" class="form-label jb-700"> 자격요건 </label>
							<select name="semester_qualification" id="semester_qualification" class="form-select" style="font-size: 0.9em;">
								<c:choose>
									<c:when test="${AjdksInternshipCourseDto.semester_qualification == 1 }">
										<option value="1" selected="selected">1학기</option>
									</c:when>
									<c:otherwise>
										<option value="1">1학기</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${AjdksInternshipCourseDto.semester_qualification == 2 }">
										<option value="2" selected="selected">2학기</option>
									</c:when>
									<c:otherwise>
										<option value="2">2학기</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${AjdksInternshipCourseDto.semester_qualification == 3 }">
										<option value="3" selected="selected">3학기</option>
									</c:when>
									<c:otherwise>
										<option value="3">3학기</option>
									</c:otherwise>
								</c:choose>	
								<c:choose>
									<c:when test="${AjdksInternshipCourseDto.semester_qualification == 4 }">
										<option value="4" selected="selected">4학기</option>
									</c:when>
									<c:otherwise>
										<option value="4">4학기</option>
									</c:otherwise>
								</c:choose>	
								<c:choose>
									<c:when test="${AjdksInternshipCourseDto.semester_qualification == 5 }">
										<option value="5" selected="selected">5학기</option>
									</c:when>
									<c:otherwise>
										<option value="5">5학기</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${AjdksInternshipCourseDto.semester_qualification == 6 }">
										<option value="6" selected="selected">6학기</option>
									</c:when>
									<c:otherwise>
										<option value="6">6학기</option>
									</c:otherwise>
								</c:choose>									
								<c:choose>
									<c:when test="${AjdksInternshipCourseDto.semester_qualification == 7 }">
										<option value="7" selected="selected">7학기</option>
									</c:when>
									<c:otherwise>
										<option value="7">7학기</option>
									</c:otherwise>
								</c:choose>																		
							</select>
						</div>
						
					</div>

					<div class="row mt-2 mb-3 ">

						<div class="col">
							<div class="row"></div>
						</div>

					</div>


					<table class="table">

						<thead class="table table-sm jb-700">
							<tr>
								<th scope="col"><i class="bi bi-check-circle-fill"></i> 필수
									날짜 입력 항목</th>
								<th scope="col"><i class="bi bi-calendar3"></i> 날짜 입력</th>
							</tr>
						</thead>


						<!-- 기능 고도화 시 사용될 항목 -->
						<tbody class="table table-sm align-middle">
							<tr>
								<td scope="row" style="font-size: 0.9em;">- 모집기간시작</td>
								<td scope="row"><input name="applying_start_date" type="date" class="form-control" style="font-size: 0.9em;" value="${applying_start_date}"></td>
							</tr>
							<tr>
								<td scope="row" style="font-size: 0.9em;">- 모집기간종료</td>
								<td scope="row"><input name="applying_end_date" type="date" class="form-control" style="font-size: 0.9em;" value="${applying_end_date}"></td>

							</tr>
							<tr>
								<td scope="row" style="font-size: 0.9em;">- 실습기간시작</td>
								<td scope="row"><input name="internship_start_date" type="date" class="form-control" style="font-size: 0.9em;" value="${internship_start_date}"></td>
							</tr>
							<tr>
								<td scope="row" style="font-size: 0.9em;">- 실습기간종료</td>
								<td scope="row"><input name="internship_end_date" type="date" class="form-control" style="font-size: 0.9em;" value="${internship_end_date}"></td>

							</tr>
							<tr>
								<td scope="row" style="font-size: 0.9em;">- 선발결과발표일</td>
								<td scope="row"><input name="announcement_date" type="date" class="form-control" style="font-size: 0.9em;" value="${announcement_date}"></td>
							</tr>

						</tbody>
					</table>
					
										
				<!-- 교수 셀렉트 -->
				<div class="col-4 mt-4 mb-4 ">
					<label for="inputState" class="form-label jb-700" >교수명</label> 
					<select name="professor_pk" id="professor_pk" class="form-select jb-small" style="font-size: 0.9em;">
						<c:forEach items="${list }" var="map">
							<c:choose>
								<c:when test="${map.professorInfoDto.professor_pk == AjdksInternshipCourseDto.professor_pk }">
									<option value="${map.professorInfoDto.professor_pk}" selected="selected">${map.professorInfoDto.name}</option>
								</c:when>
								<c:otherwise>
									<option value="${map.professorInfoDto.professor_pk}">${map.professorInfoDto.name}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				
			    <!-- 사업체 셀렉트 -->
				<div class="col-4 mt-4 mb-4">
				<label for="inputState" class="form-label jb-700 "> 사업체명</label> 
					<select name="company_pk" id="company_pk" class="form-select" style="font-size: 0.9em;">
						<c:forEach items="${complist }" var="map">
							<c:choose>
								<c:when test="${map.AjdksCompanyInfoDto.company_pk == AjdksInternshipCourseDto.company_pk }">
									<option value="${map.AjdksCompanyInfoDto.company_pk}" selected="selected">${map.AjdksCompanyInfoDto.company_name}</option>
								</c:when>
								<c:otherwise>
									<option value="${map.AjdksCompanyInfoDto.company_pk}">${map.AjdksCompanyInfoDto.company_name}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</select>
				</div>
				
				<!-- 학과 셀렉트 -->
				<div class="col-4 mt-4 mb-4">
				<label for="inputState" class="form-label jb-700 " > 학과명</label> 
					<select name="department_pk" id="department_pk" class="form-select" style="font-size: 0.9em;">
						<c:forEach items="${departList }" var="map">
							<c:choose>
								<c:when test="${map.DepartmentCategoryDto.department_pk == AjdksInternshipCourseDto.department_pk }">
									<option value="${map.DepartmentCategoryDto.department_pk}" selected="selected">${map.DepartmentCategoryDto.name}</option>
								</c:when>
								<c:otherwise>
									<option value="${map.DepartmentCategoryDto.department_pk}">${map.DepartmentCategoryDto.name}</option>
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
				</select>
				</div>
				
				</form>

				<!-- 여백용도 -->
				<div class="row mt-2 mb-2">
					<div class="col">
						<div class="row"></div>
					</div>
				</div>


				<!-- 하단 버튼 -->
				<div class="col-12 justify-content-end">

					<div class="row">
						<div class="col-2 d-grid mt-2 mb-2">
							<button onclick="javascript:fn_reg();" class="btn labelcolor">
								<i class="bi bi-pencil-square"></i> 수정
							</button>
						</div>

						<div class="col-2 d-grid mt-2 mb-2">
							<a href="./ajdksInternshipList" class="btn labelcolor"><i
								class="bi bi-list-ul"></i> 목록으로</a>
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

	<script>
		function fn_reg() {
			const frm = document.getElementById("frm");

			if (frm.course_title.value == "") {
				alert("제목을 입력하여 주십시오.");
				frm.course_title.focus();
				return;
			}

			if (frm.applying_start_date.value == "") {
				alert("모집기간 시작 일자를 입력하여 주십시오.");
				frm.applying_start_date.focus();
				return;
			}
			if (frm.applying_end_date.value == "") {
				alert("모집기간종료 일자를 입력하여 주십시오.");
				frm.applying_end_date.focus();
				return;
			}
			if (frm.internship_start_date.value == "") {
				alert("실습기간시작 일자를 입력하여 주십시오.");
				frm.internship_start_date.focus();
				return;
			}
			if (frm.internship_end_date.value == "") {
				alert("실습기간종료 일자를 입력하여 주십시오.");
				frm.internship_end_date.focus();
				return;
			}
			if (frm.announcement_date.value == "") {
				alert("선발결과발표일 일자를 입력하여 주십시오.");
				frm.announcement_date.focus();
				return;
			}

			frm.submit();
		}
	</script>
</body>
</html>