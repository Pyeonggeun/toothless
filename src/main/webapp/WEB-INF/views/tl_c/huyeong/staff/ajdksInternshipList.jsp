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
									<i class="bi bi-box-arrow-in-down-right "></i> 현장실습 기업목록
								</h3>

							</div>
						</div>
					</div>
				</div>

				<!-- 본문 작성 공간 -->
				<form class="row">
				
				<!-- 반복문 -->
				<c:forEach items="${list }" var="map">
					<div class="col-3 m-2">

							<div class="card border-black shadow mb-3">
								<div class="card-body text">
									<h5 class="card-title fw-bold"><a href="ajdksInternshipDtl?internship_course_pk=${map.AjdksInternshipCourseDto.internship_course_pk}
									&company_pk=${map.AjdksInternshipCourseDto.company_pk}&professor_pk=${map.AjdksInternshipCourseDto.professor_pk}&department_pk=${map.AjdksInternshipCourseDto.department_pk}">${map.AjdksInternshipCourseDto.course_title}</a></h5>
									<p class="card-text"> <!-- 내용 있어야함 --></p>
								</div>
								<div class="card-footer labelcolor border">
									${map.company_name}
								</div>
							</div>

						</div>
				</c:forEach>
				
				</form>

				<!-- 여백 -->
				<div class="row mt-2 mb-2 ">
					<div class="col">
						<div class="row"></div>
					</div>
				</div>


				<!-- 하단 버튼 -->
				<div class="col-12 d-flex justify-content-end">

					<form class="row row-cols-lg-auto g-3 align-items-center">

						<div class="col">
							<a href="./ajdksInternshipRegForm" class="btn labelcolor"><i
								class="bi bi-pencil-square"></i> 등록</a>
						</div>

						<div class="col">
							<a href="./ajdksInternshipList" class="btn labelcolor"><i
								class="bi bi-list-ul"></i> 목록으로</a>
						</div>

						<!-- 고도화 진행시 사용 -->

						<div class="col">
							<a href="" type="button" class="btn labelcolor"
								data-bs-toggle="modal" data-bs-target="#exampleModal"> <i
								class="bi bi-file-earmark-arrow-down"></i> 임시저장
							</a>

							<!-- 임시저장 Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5 fw-bold" id="exampleModalLabel">
												현장실습 안내 페이지 저장 완료</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body jb-small">임시 저장이 완료되었습니다. 연속 저장할
											경우 기존 임시 저장 내역으로부터 덮어 씌워지므로 유의해주시기 바랍니다.</div>
										<div class="modal-footer">
											<a type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">닫기</a> <a href="" type="button"
												class="btn labelcolor">저장 완료</a>
										</div>
									</div>
								</div>
							</div>
						</div>

					</form>

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