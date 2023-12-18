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
								<img src="../../../resources/img/studentMainPageimg/team.png"
									class="img-fluid px-0" alt="...">
							</div>
							<br>
							<div class="row ms-3 mt-3 mb-1">
								<h4>
									<span class="fw-bolder mt-5"><i
										class="bi bi-calendar-check"></i>&nbsp;현장실습 지원팀 소개</span>
								</h4>
							</div>

							<div class="row p-3 ms-5 me-5">
								<div class="col">
									<img
										src="../../../resources/img/studentMainPageimg/supt_info_main_img.jpg"
										class="img-fluid" alt="...">
								</div>
								<div class="col">
									<h5>
										안녕하십니까? <br>현장실습지원팀은 학생들이 재학 중 국내·외 다양한 기업이나 기관에서 실습교육을
										통해 전공실무능력 향상, 진로적성 파악, 업무 이해능력 습득 등의 현장 실무 체험을 지원하고 있습니다. 이러한
										학생들의 직무적성 및 진로 탐색 기회를 체계적으로 지원하고자 2023년 조직 개편으로 신설 하였습니다.<br>
										<br> 현장실습 참여 인원 및 기업 수는 매년 꾸준히 증가하고 있습니다. 현장실습 경험을 통해
										기업현장에 대한 이해도가 높아진 학생들은 취업준비 태도가 상대적으로 적극적이고 자신감이 넘치며, 무엇보다 졸업
										후 진로 설계 역량이 높아집니다. <br> <br> 현장실습지원팀은 지속적인 현장실습 참여
										기업 및 기관 발굴과 희망 학생 매칭을 통해 재학생들의 진로탐색, 취업역량 강화에 도움이 되도록 지원하고자
										합니다. 다양한 현장실습 프로그램이 운영되고 있으니 학생 여러분들의 적극적인 참여를 바랍니다.
									</h5>
								</div>

							</div>


							<div class="row ms-5 me-5 	mt-5 pt-3">

								<!-- 공지사항 -->
								<div class="col me-4">

									<div
										class="row fs-5 pb-1 border-bottom border-bd-border border-2">
										<div class="col ms-5 fw-bold">
											<i class="bi bi-bookmark-check"></i> 공지사항
										</div>
										<div class="col-1 text-end fs-5 me-1">
											<a href="#" class="btn"><i
												class="bi bi-plus-lg text-primary"></i></a>
										</div>

									</div>
									<div class="row  fw-semibold fs-6 pb-1 ms-5 my-2">
										<div class="col text-center">#</div>
										<div class="col-7 text-center">제목</div>
										<div class="col text-center">등록일</div>

									</div>
									<div class="row fs-6 pb-1 ms-5 my-1">
										<div class="col  text-center">45</div>
										<div class="col-7">[공지] [현장실습] 인턴 채용 안내</div>
										<div class="col  text-center">23.12.11</div>

									</div>
									<div class="row fs-6 pb-1 ms-5 my-1">
										<div class="col  text-center">44</div>
										<div class="col-7">[공지] [현장실습] 2023 동계방학</div>
										<div class="col  text-center">23.11.21</div>

									</div>
									<div class="row fs-6 pb-1 ms-5  my-1">
										<div class="col text-center">43</div>
										<div class="col-7">[공지] 2023학년도 동계 글로벌 현장실습</div>
										<div class="col text-center">23.10.17</div>

									</div>
									<div class="row fs-6 pb-1 ms-5  my-1">
										<div class="col text-center">42</div>
										<div class="col-7">[공지] [현장실습] 인턴 채용 안내</div>
										<div class="col text-center">23.10.17</div>
									</div>
								</div>


								<!-- 현장실습과정 조회 -->
								<div class="col me-4">
									<div
										class="row fs-5 pb-1 border-bottom border-bd-border border-2">
										<div class="col ms-5  fw-bold">
											<i class="bi bi-bookmark-check"></i> 학점인정 안내
										</div>
										<div class="col-1 text-end fw-bold fs-5  me-1">
											<a href="#" class="btn"><i
												class="bi bi-plus-lg text-primary"></i></a>
										</div>
										<div class="row  fw-semibold fs-6 pb-1 ms-5 my-2">
										<div class="col-2 text-center">구분</div>
										<div class="col-7 text-center">단기 현장실습</div>
										<div class="col-3 text-center">장기 현장실습</div>

									</div>
									<div class="row fs-6 pb-1 ms-5 my-1">
										<div class="col-2  text-center">실습기간</div>
										<div class="col-4 text-center">방학 중 1개월 이상 2개월 미만</div>
										<div class="col-3 text-center">방학 중 2개월 이상</div>
										<div class="col-3  text-center">학기 중 4개월 이상</div>

									</div>
									<div class="row fs-6 pb-1 ms-5 my-1">
										<div class="col  text-center">인정학점수</div>
										<div class="col-4 text-center">3학점</div>
										<div class="col-3 text-center">6학점</div>
										<div class="col-3  text-center">15학점</div>

									</div>
									<div class="row fs-6 pb-1 ms-5  my-1">
										<div class="col  text-center">신청시기</div>
										<div class="col-7 text-center">5월, 11월 공지</div>
										<div class="col-3  text-center">1월, 7월 공지</div>

									</div>
									<div class="row fs-6 pb-1 ms-5  my-1">
										<div class="col  text-center">신청자격</div>
										<div class="col-10 text-center">3, 4학년 재학생</div>
									</div>
									</div>
									<div class="row fs-6 pb-1 ms-5  my-1 text-end">
									<p class="fst-italic fs-6">※ 5학기 이상 등록한 학생들에 의하며 졸업예정자 및 휴학생은 학점인정 불가 합니다.</p>
									</div>
								</div>


							</div>


							<div class="row ms-5 me-5 	mt-5 pt-3">
								<!-- 현장실습 프로세스 -->
								<div class="col me-4">
									<div
										class="row fs-5 pb-1 border-bottom border-bd-border border-2">
										<div class="col ms-5  fw-bold">
											<i class="bi bi-bookmark-check"></i> 현장실습 프로세스
										</div>
										<div class="col-1 text-end fw-bold fs-5  me-1">
											<a href="#" class="btn"><i
												class="bi bi-plus-lg text-primary"></i></a>
										</div>
										<div class="row fw-semibold pb-1 mx-5 text-center my-2">
											<img
												src="../../../resources/img/studentMainPageimg/process.png	"
												class="w-60" alt="...">
										</div>
									</div>

									<div class="row"></div>
								</div>


								<!-- 현장실습 교육 프로그램 -->
								<div class="col me-4">
									<div
										class="row fs-5 pb-1 mb-2 border-bottom border-bd-border border-2">
										<div class="col ms-5 fw-bold">
											<i class="bi bi-bookmark-check"></i> 담당업무 및 연락처
										</div>
										<div class="col-1 text-end fw-bold fs-5 me-1">
											<a href="../gw_company/companyManagementPage" class="btn"><i
												class="bi bi-plus-lg text-primary"></i></a>
										</div>
										<div class="row  fw-semibold fs-6 pb-1 ms-5 my-2">
											<div class="col text-center">성명</div>
											<div class="col-2 text-center">직위</div>
											<div class="col-4 text-center">담당업무</div>
											<div class="col-3 text-center">교내전화</div>

										</div>
										<div class="row fs-6 pb-1 ms-5 my-1">
											<div class="col text-center">김은비</div>
											<div class="col-2  text-center">학생처장</div>
											<div class="col-4">학생처 총괄</div>
											<div class="col-3  text-center">02-940-8676</div>

										</div>
										<div class="row fs-6 pb-1 ms-5 my-1">
											<div class="col text-center">김태호</div>
											<div class="col-2  text-center">현장실습지원팀장</div>
											<div class="col-4">현장실습지원팀 업무 총괄</div>
											<div class="col-3  text-center">02-940-5606</div>
										</div>
										<div class="row fs-6 pb-1 ms-5  my-1">
											<div class="col text-center">이서영</div>
											<div class="col-2  text-center">직원</div>
											<div class="col-4">
												대학평가 및 국고사업 총괄<br>국내/외 장단기 현장실습 운영<br>교육과정 현장실습 운영<br>정부지원사업
												수주<br>규정 관리
											</div>
											<div class="col-3  text-center">02-940-5606</div>
										</div>
										<div class="row fs-6 pb-1 ms-5  my-1">
											<div class="col text-center">김우재</div>
											<div class="col-2  text-center">직원</div>
											<div class="col-4">
												현장실습 대학정보공시 관리<br>현장실습온라인시스템 운영<br>국내 장단기 현장실습 운영
												<br>현장실습 설명회 운영<br>우수인재 추천
											</div>
											<div class="col-3  text-center">02-940-5606</div>
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
	</div>
	<!-- 전체 container 출구 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>