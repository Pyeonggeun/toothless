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
						<span>&#035;&nbsp;${ajdksCompanyInfoDto.company_name } 님 환영합니다</span>
					</div>
					<div class="col pe-2 text-end nolinenoblue">
						<a href="../../taeho/external/ajdksCompanyLogoutProcess">로그아웃</a>
					</div>
				</div>

				<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
				<div class="row">


					<!-- 본문작성공간 -->
					<div class="col border-start ">

						<div class="row w-auto px-0">
							<img src="../../../resources/img/studentMainPageimg/현장실습%20프로그램%20안내.png"
								class="img-fluid px-0" alt="...">
						</div>
						<br>
						<div class="row ms-5 me-5 py-2 border-5 border-dark border-bottom">
							<h3>
								<span class="fw-bolder mt-5 	"><i
									class="bi bi-calendar-check "></i>&nbsp; 프로그램 안내</span>
							</h3>
						</div>
						<div class="p-3">
							<img
								src="../../../resources/img/studentMainPageimg/img_field02.jpg"
								class="img-fluid px-0" alt="...">

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