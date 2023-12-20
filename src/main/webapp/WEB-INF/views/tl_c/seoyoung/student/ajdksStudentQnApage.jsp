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
					<div class="col">

						<!-- 본문작성공간 -->
						<div class="col border-start ">

							<div class="row w-auto px-0">
								<img src="../../../resources/img/studentMainPageimg/FAQ.png"
									class="img-fluid px-0" alt="...">
							</div>
							<br>
							<div
								class="row ms-5 me-5 mb-5 py-2 border-5 border-dark border-bottom">
								<h3>
									<span class="fw-bolder mt-5 mb-5 "><i
										class="bi bi-calendar-check "></i>&nbsp;현장실습(인턴십) FAQ</span>
								</h3>
							</div>
							<div class="row ms-3 mt-3 mb-1 p-3 " style="color: #E27849;">
								<div class="col-1"></div>
								<div class="col-1 ms-2	">
									<p class="h1">
										<i class="bi bi-quora"></i>
									</p>
								</div>
								<div class="col mt-2  mb-5" style="color: #7B4F42">
									<h4>현장실습(인턴십) 학점인정 기준과 참여방법은 어떻게 되나요?</h4>
								</div>

							</div>
							<div class="row"></div>
							<div class="row ms-5 mt-3 mb-1 me-5 lh-base">
								<div class="col-2"></div>
								<div class="col">
									<h5>
										<span class="h2 "><i class="bi bi-chat-right-quote"></i></span>
										&nbsp; 현장실습(인턴십)은 국내외 기업(기관)에서 실시하는 현장실습으로 장기현장실습과 단기현장실습으로
										나눠집니다. <br>
									</h5>
								</div>
							</div>
							<div
								class="row ms-5 mb-5 me-4 align-items-center border-2 border-dark border-bottom">
								<div class="col-2"></div>
								<div class="col ms-5 mb-5 me-5 lh-base">
									<h5>
										- 장기 현장실습의 경우 정규학기 중 진행되며 4개월 이상 근무 시 최대 15학점 인정됩니다.<br>
										- 단기 현장실습의 경우 방학 중 진행되며 실습기간에 따라 3~6학점 인정됩니다.<br> - 현장실습
										프로그램에 따라 실습지원비가 지급되며 실습지원비는 변경될 수 있습니다
									</h5>
								</div>
							</div>


							<div class="row ms-3 mt-5 mb-2 p-3 " style="color: #E27849;">
								<div class="col-1"></div>
								<div class="col-1 ms-2	">
									<p class="h1">
										<i class="bi bi-quora"></i>
									</p>
								</div>
								<div class="col mt-2 mb-5" style="color: #7B4F42">
									<h4>현장실습(인턴십)과 IPP가 혼돈되는데, 어떻게 구분하나요?</h4>
								</div>

							</div>
							<div class="row"></div>
							<div class="row ms-5 mt-3 lh-base">

								<div class="col-2"></div>
								<div class="col">
									<h5>
										<span class="h2 "><i class="bi bi-chat-right-quote"></i></span>
										&nbsp; 학교의 모든 현장실습(인턴십)은 현장실습지원팀의 행정처리 하에 총괄 진행됩니다. <br>
									</h5>
								</div>
							</div>
							<div class="row"></div>
							<div
								class="row ms-5  mb-5 me-4 align-items-center border-2 border-dark border-bottom">
								<div class="col-2"></div>
								<div class="col ms-5 mb-5 me-5 lh-base">
									<h5>&nbsp; 단, IPP사업은 학과별로 IPP담당교수가 배정되어 있고
										KW-IPP공동훈련센터(02-940-8687,8​)에서 주관하여 진행합니다.</h5>
								</div>
							</div>

							<div class="row ms-3 mt-3 mb-1 p-3 " style="color: #E27849;">
								<div class="col-1"></div>
								<div class="col-1 ms-2	">
									<p class="h1">
										<i class="bi bi-quora"></i>
									</p>
								</div>
								<div class="col mt-2  mb-5	" style="color: #7B4F42">
									<h4>현장실습(인턴십)은 총 몇 번까지 학점인정이 가능한가요?</h4>
								</div>

							</div>
							<div class="row"></div>
							<div class="row ms-5 mt-3 mb-1 lh-base">
								<div class="col-2"></div>
								<div class="col">
									<h5>
										<span class="h2 "><i class="bi bi-chat-right-quote"></i></span>
										&nbsp; 재학 중 장기(학기중) 현장실습의 학점인정 가능 횟수는 1회입니다. <br>
									</h5>
								</div>
							</div>
							<div class="row ms-5 mb-1 lh-base">
								<div class="col-2"></div>
								<div class="col ms-5 me-5 lh-base">
									<h5>&nbsp;단, IPP를 포함할 경우 2회까지 가능하도록 제도화 되어있습니다.</h5>
								</div>
							</div>
							<div class="row"></div>
							<div class="row ms-5 mb-4 me-4 me-5 align-items-center">
								<div class="col-2"></div>
								<div class="col ms-5 mb-5 me-5 lh-base">
									<h5>&nbsp;단기(방학중) 현장실습은 2회까지 학점인정 가능합니다.</h5>
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