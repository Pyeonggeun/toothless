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

.labelcolor2 {
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
				<div class="row mt-3 mb-3 ">
					<div class="col"></div>
				</div>

				<!-- 상단 헤더 -->
				<div class="row mt-3 mb-3 ">
					<div class="col">
						<div class="row">
							<div class="col">

								<!-- 상단 텍스트 -->
								<h3 class="jb-700 fontcolor2">
									<i class="bi bi-box-arrow-in-down-right"></i> 현장실습 기업목록
								</h3>

							</div>
						</div>
					</div>
				</div>

				<!-- 선 -->
				<div class="row mt-3">
					<div class="col-10 border border-secondary-subtle"></div>
				</div>

				<!-- 본문 작성 공간 -->
				<form class="row mt-4 mb-4">

					<!-- 반복문 -->
					<c:forEach items="${list }" var="map">
						<div class="col-3 m-3">

							<div class="card border-black shadow mb-3">
								<div class="card-body text">
									<h5 class="card-title fw-bold">
										<a
											href="ajdksInternshipDtl?
									internship_course_pk=${map.AjdksInternshipCourseDto.internship_course_pk}
									&company_pk=${map.AjdksInternshipCourseDto.company_pk}
									&professor_pk=${map.AjdksInternshipCourseDto.professor_pk}
									&department_pk=${map.AjdksInternshipCourseDto.department_pk}">
											${map.AjdksInternshipCourseDto.course_title}</a>
									</h5>
									<p class="card-text" style="font-size: 0.9em;">
										선발결과 발표일 <br>
										${map.AjdksInternshipCourseDto.announcement_date}
									</p>
								</div>

								<div class="card-footer labelcolor jb-700"
									style="font-size: 0.9em;">${map.company_name}</div>

							</div>

						</div>
					</c:forEach>

				</form>

				<!-- 하단 버튼 -->

				<div class="btn-group m-3 border shadow" role="group"
					aria-label="Default button group">
					<a href="./ajdksInternshipRegForm" class="btn labelcolor"> <i
						class="bi bi-pencil-square"></i> 등록페이지
					</a> <a href="./ajdksInternshipList" onclick="javascript:fn_reg();"
						class="btn labelcolor"><i class="bi bi-list-ul"></i> 목록으로</a>
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