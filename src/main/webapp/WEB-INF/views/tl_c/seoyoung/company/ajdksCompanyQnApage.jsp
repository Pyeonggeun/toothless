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
					<div class="col">

						<div class="row w-auto px-0">
							<img src="../../../resources/img/studentMainPageimg/FAQ.png"
								class="img-fluid px-0" alt="...">
						</div>
						<br>
						<div class="row ms-5 me-5 py-2 border-5 border-dark border-bottom">
							<h3>
								<span class="fw-bolder mt-5 
								
								"><i
									class="bi bi-calendar-check "></i>&nbsp; 프로그램 안내</span>
							</h3>
						</div>
						<div
								class="row py-2 ms-5 me-5 mb-3 border-1 border-dark align-self-center border-bottom border-top text-center border-secondary fs-5 fw-semibold"
								style="background-color: #f2f5f7;">
								<div class="col align-self-center text-center">#</div>
								<div class="col-6 align-self-center">제목</div>
								<div class="col align-self-center text-center">등록자</div>
								<div class="col align-self-center text-center">등록일</div>
								<div class="col align-self-center text-center">추천</div>
								<div class="col align-self-center text-center">조회수</div>
							</div>
							<div class="row py-2 ms-5 me-5 mb-2 fs-6 ">
								<div class="col align-self-center text-center">61</div>
								<div class="col-6">7. 실습 수행-OJT수행계획서는 어떻게 작성하며 어디에 제출해야 하나요?</div>
								<div class="col align-self-center text-center">박**</div>
								<div class="col align-self-center text-center">2023-02-17</div>
								<div class="col align-self-center text-center">15</div>
								<div class="col align-self-center text-center">469</div>
							</div>
							<div class="row py-2  ms-5 me-5 mb-2 fs-6 ">
								<div class="col align-self-center text-center">60</div>
								<div class="col-6">7. 실습 수행-실습지원비를 받는 경우 세금을 비롯 공제해야 하는 것들이 있나요?</div>
								<div class="col align-self-center text-center">김**</div>
								<div class="col align-self-center text-center">2023-01-31</div>
								<div class="col align-self-center text-center">17</div>
								<div class="col align-self-center text-center">1,822</div>
							</div>
							<div class="row py-2  ms-5 me-5 mb-2 fs-6 ">
								<div class="col align-self-center text-center">59</div>
								<div class="col-6">8. 실습 종료-실습을 종료한 사실을 확인 또는 증명해주는 서류가 있나요?</div>
								<div class="col align-self-center text-center">오**</div>
								<div class="col align-self-center text-center">2022-08-14</div>
								<div class="col align-self-center text-center">17</div>
								<div class="col align-self-center text-center">1,429</div>
							</div>
							<div class="row py-2  ms-5 me-5 mb-2 fs-6 "">
								<div class="col align-self-center text-center">58</div>
								<div class="col-6">7. 실습 수행-예비군훈련을 받는 경우 어떻게 처리되나요?</div>
								<div class="col align-self-center text-center">이**</div>
								<div class="col align-self-center text-center">2022-01-16</div>
								<div class="col align-self-center text-center">11</div>
								<div class="col align-self-center text-center">491</div>
							</div>
							<div class="row py-2  ms-5 me-5 mb-2 fs-6 ">
								<div class="col align-self-center text-center">57</div>
								<div class="col-6">상반기 취업역량강화교육 과정 안내</div>
								<div class="col align-self-center text-center">예*</div>
								<div class="col align-self-center text-center">2022-01-11</div>
								<div class="col align-self-center text-center">23</div>
								<div class="col align-self-center text-center">431</div>
							</div>
							<div class="row py-2  ms-5 me-5 mb-2 fs-6 ">
								<div class="col align-self-center text-center">56</div>
								<div class="col-6">7. 실습 수행-정부지원금은 얼마이며 언제 받나요?</div>
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
				
		<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>
				
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