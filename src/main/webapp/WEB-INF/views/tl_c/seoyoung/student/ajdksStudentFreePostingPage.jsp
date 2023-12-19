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
	background-color: #CDCDD3;
}

.accordion { -
	-bs-accordion-btn-focus-box-shadow: none;
}

/*table*/
.table{
	--bs-table-bg:none;
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
								<img src="../../../resources/img/studentMainPageimg/자유게시판.png"
									class="img-fluid px-0" alt="...">
							</div>
							<br>
							<div
								class="row ms-5 me-5 mb-3 py-2 border-5 border-dark border-bottom">
								<h3>
									<span class="fw-bolder mt-5 mb-5 "><i
										class="bi bi-calendar-check "></i>&nbsp; 자유게시판</span>
								</h3>
							</div>
							<div class="row ms-5 me-5 py-2 ">
								<h4>
									<span class="fw-bolder mt-5 mb-5 ">> Search</span>
								</h4>
							</div>
							<nav class="navbar navbar-light py-2 ms-5 me-5 mb-3"
								id="searchCompany" style="background-color: #f2f5f7;">
								<div class="col py-2 ms-5 me-5 mb-3">
									<div class="row ms-3 mt-3 me-3 mb-3">
										<div class="input-group col px-0 ">
											<span class="fw-bolder py-2 fs-6 px-3">제목명</span> <input
												id="searchCompanyWord" onkeyup="pressEnter()" type="text"
												class="form-control"> <a href="#"
												onclick="searchByCompany()" role="button"
												class="btn btn-Secondary  bg-light"> <i
												class="bi bi-search"></i></a>
										</div>
									</div>

								</div>
							</nav>
							<div
								class="row py-2 ms-5 me-5 mb-3 border-1 border-dark align-self-center border-bottom border-top text-center border-secondary fs-5 fw-semibold"
								style="background-color: #f2f5f7;">
								<div class="col align-self-center text-center">#</div>
								<div class="col-6 align-self-center">제목</div>
								<div class="col align-self-center text-center">등록자</div>
								<div class="col align-self-center text-center">등록일</div>
								<div class="col align-self-center text-center">추천</div>
								<div class="col align-self-center text-center">초회수</div>
							</div>
							<div class="row py-2 ms-5 me-5 mb-2 fs-6 ">
								<div class="col align-self-center text-center">561</div>
								<div class="col-6">방학이 끝나갑니다.</div>
								<div class="col align-self-center text-center">박**</div>
								<div class="col align-self-center text-center">2023-02-17</div>
								<div class="col align-self-center text-center">15</div>
								<div class="col align-self-center text-center">469</div>
							</div>
							<div class="row py-2  ms-5 me-5 mb-2 fs-6 ">
								<div class="col align-self-center text-center">560</div>
								<div class="col-6">졸업기준, 엑셀 관련.</div>
								<div class="col align-self-center text-center">김**</div>
								<div class="col align-self-center text-center">2023-01-31</div>
								<div class="col align-self-center text-center">17</div>
								<div class="col align-self-center text-center">1,822</div>
							</div>
							<div class="row py-2  ms-5 me-5 mb-2 fs-6 ">
								<div class="col align-self-center text-center">559</div>
								<div class="col-6">현장실습에 관한 질문입니다</div>
								<div class="col align-self-center text-center">오**</div>
								<div class="col align-self-center text-center">2022-08-14</div>
								<div class="col align-self-center text-center">17</div>
								<div class="col align-self-center text-center">1,429</div>
							</div>
							<div class="row py-2  ms-5 me-5 mb-2 fs-6 "">
								<div class="col align-self-center text-center">558</div>
								<div class="col-6">새해인사가 늦었지만 .</div>
								<div class="col align-self-center text-center">이**</div>
								<div class="col align-self-center text-center">2022-01-16</div>
								<div class="col align-self-center text-center">11</div>
								<div class="col align-self-center text-center">491</div>
							</div>
							<div class="row py-2  ms-5 me-5 mb-2 fs-6 ">
								<div class="col align-self-center text-center">557</div>
								<div class="col-6">상반기 취업역량강화교육 과정 안내</div>
								<div class="col align-self-center text-center">예*</div>
								<div class="col align-self-center text-center">2022-01-11</div>
								<div class="col align-self-center text-center">23</div>
								<div class="col align-self-center text-center">431</div>
							</div>
							<div class="row py-2  ms-5 me-5 mb-2 fs-6 ">
								<div class="col align-self-center text-center">556</div>
								<div class="col-6">이거보여주려고어그로끌었다</div>
								<div class="col align-self-center text-center">예*</div>
								<div class="col align-self-center text-center">2022-01-01</div>
								<div class="col align-self-center text-center">53</div>
								<div class="col align-self-center text-center">1031</div>
							</div>
							<div class="row py-5">
								<nav aria-label="...">
									<ul class="pagination justify-content-center">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1" aria-disabled="true">이전</a></li>
										<li class="page-item active"><a class="page-link"
											href="#">1</a></li>
										<li class="page-item" aria-current="page"><a
											class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">다음</a></li>
									</ul>
								</nav>
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