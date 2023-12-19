<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title> AJDKS TEMPLATE FOR STAFF </title>
<style>
	/*교직원좌측메뉴바설정*/
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
	
	.staffleftmenubar input + label + .content {
	    display: none;
	}
	
	.staffleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

</style>

</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<div class="row">
	<div class="col">
		<jsp:include page="../../common/ajdksHighestMenubarForStaff.jsp"></jsp:include>
	</div>
</div>
<div class="row">

	<!-- 좌측메뉴바 -->
	<jsp:include page="../../common/ajdksSideMenubarForStaff.jsp"></jsp:include>
	
	<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
	<div class="col">
		<div class="row">
			<div class="col mx-4">
			
			<!-- 본문작성공간 -->
				
				<div class="container-fluid">
					<div class="row">
						<div class="col-9">
							<div class="row mt-5 border-top border-bottom border-start border-end bg-body-secondary">
								<div class="d-flex align-items-center justify-content-center">
									<div class="col text-center" style="font-size: 5em;">
										<i class="bi bi-people-fill"></i>
									</div>
									<div class="col text-center border-start">
									  <div class="row">
									    <div class="col" style="font-size: 2.5em;">12</div>
									  </div>
									  <div class="row">
									  	<div class="col">결제대기</div>
									  </div>
									</div>
									<div class="col text-center border-start">
									  <div class="row">
									    <div class="col" style="font-size: 2.5em;">12</div>
									  </div>
									  <div class="row">
									  	<div class="col">접수</div>
									  </div>
									</div>
									<div class="col text-center border-start">
									  <div class="row">
									    <div class="col" style="font-size: 2.5em;">12</div>
									  </div>
									  <div class="row">
									  	<div class="col">접수대기</div>
									  </div>
									</div>
									<div class="col text-center border-start">
									  <div class="row">
									    <div class="col" style="font-size: 2.5em;">185</div>
									  </div>
									  <div class="row">
									  	<div class="col">메일</div>
									  </div>
									</div>
								</div>
							</div>
							<div class="row bg-body-secondary">
								<div class="d-flex align-items-center justify-content-center">
									<div class="col text-center">
										<div class="row">
											<div class="col text-center" style="font-size: 3em; width: 80px;">
												<i class="bi bi-envelope"></i>
											</div>
											<div class="col mt-4 text-center d-flex justify-content-start" style="font-size: 1em;">
												웹메일
											</div>
										</div>
									</div>
									<div class="col text-center">
										<div class="row">
											<div class="col text-center" style="font-size: 3em;">
												<i class="bi bi-chat-square-text"></i>
											</div>
											<div class="col mt-4 text-center d-flex justify-content-start" style="font-size: 1em;">
												메세지
											</div>
										</div>
									</div>
									<div class="col text-center">
										<div class="row">
											<div class="col text-center" style="font-size: 3em;">
												<i class="bi bi-folder2"></i>
											</div>
											<div class="col mt-4 text-center d-flex justify-content-start" style="font-size: 1em;">
												웹디스크
											</div>
										</div>
									</div>
									<div class="col text-center">
										<div class="row">
											<div class="col text-center" style="font-size: 3em;">
												<i class="bi bi-bank2"></i>
											</div>
											<div class="col mt-4 text-center d-flex justify-content-start" style="font-size: 1em;">
												도서관
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="container mt-4">
							  <div class="row g-2">
							    <div class="col-6">
							      <div class="p-3">
							      	<div class="row bg-body-secondary">
							      		<div class="col mt-1 text-center fw-bold d-flex justify-content-start" style="font-size: 1.2em;">학사공지</div>
							      		<div class="col-2 fw-bold" style="font-size: 1.2em;">+more</div>
							      	</div>
							      	<div class="row mt-2">
							      		<div class="col d-flex justify-content-start">
						      				<ul>
						      					<li>MK대학교 2024년도 신입생 입시지원 안내</li>
							      				<li>2024년 장학생 선발기준</li>
							      				<li>현장실습 선발 발표일</li>
							      				<li>교육프로그램 안내</li>
							      				<li>MK대학교 현장실습 장학금 수여식 개최</li>
						      				</ul>
							      		</div>
							      	</div>
							      </div>
							    </div>
							    <div class="col-6">
							      <div class="p-3">
							      	<div class="row bg-body-secondary">
							      		<div class="col mt-1 fw-bold text-center d-flex justify-content-start" style="font-size: 1.2em;">단과대공지</div>
							      		<div class="col-2 fw-bold" style="font-size: 1.2em;">+more</div>
							      	</div>
							      	<div class="row mt-2">
							      		<div class="col d-flex justify-content-start">
						      				<ul>
						      					<li>MK대학교 2024년도 신입생 입시지원 안내</li>
							      				<li>2024년 장학생 선발기준</li>
							      				<li>현장실습 선발 발표일</li>
							      				<li>교육프로그램 안내</li>
							      				<li>MK대학교 현장실습 장학금 수여식 개최</li>
						      				</ul>
							      		</div>
							      	</div>
							      </div>
							    </div>
							  </div>
							</div>
							<div class="row mt-2">
								<div class="col border-bottom border-light-subtle"></div>
							</div>
							<div class="row mt-5">
								<div class="col fw-bold" style="font-size: 1.5em;">
									IT 서비스
								</div>
							</div>
							<div class="row mt-3 border text-center fs-6 py-3 bg-light">
								<div class="col fw-bold ">스마트캠퍼스(클럽)</div>
								<div class="col fw-bold ">메세지발송(PUSH/UMS)</div>
								<div class="col fw-bold ">전자세금계산서</div>
								<div class="col fw-bold">Office 365</div>
							</div>
							<div class="row mt-4 border fs-6 py-2 bg-light">
								<div class="col">
									<div class="row">
										<div class="col text-center">
											<i class="bi bi-pc-display-horizontal" style="font-size: 2em;"></i>
										</div>
										<div class="col-8 border-end d-flex align-items-center">시설/전산업무요청</div>
									</div>
								</div>
								<div class="col">
									<div class="row">
										<div class="col text-center">
											<i class="bi bi bi-headset" style="font-size: 2em;"></i></i>
										</div>
										<div class="col-8 border-end d-flex align-items-center">IT HelpDesk A/S요청</div>
									</div>
								</div>
								<div class="col">
									<div class="row">
										<div class="col text-center">
											<i class="bi bi bi-person-workspace" style="font-size: 2em;"></i>
										</div>
										<div class="col-6 text-center border-end d-flex align-items-center">원격지원</div>
									</div>
								</div>
								<div class="col">
									<div class="row">
										<div class="col text-center">
											<i class="bi bi-telephone-fill" style="font-size: 2em;"></i>
										</div>
										<div class="col-6 text-center d-flex align-items-center">전화번호</div>
									</div>
								</div>
							</div>					
						</div>
						<div class="col">	
							<div class="row mt-5 mx-2 border-top border-bottom border-end bg-light">
								<div class="col">
									<div class="row">
										<div class="col">
											<div class="row border-start">
												<div class="col d-flex align-items-center">
													<i class="bi bi-calendar3" style="font-size: 1.5em;"></i>
													<span style="font-size: 1em;"> &nbsp;&nbsp;학사일정</span>
												</div>
												<div class="col-2  d-flex align-items-center">
													<span class="fs-5">7</span> <span>건</span>
												</div>
											</div>
											<div class="row bg-white border-top border-start">
												<div class="col mt-2">
													<ul>
														<li>신입생 오리엔테이션...</li>
														<li>새학기 수강신청 안내...</li>
														<li>재학생 방학특강 신청 안내</li>
														<li>현장실습 신청일자 </li>
														<li>현장실습 교육프로그램 안내..</li>
														<li>산업체 등록 현황</li>
														<li>현장실습 과정 메뉴얼</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="row border-top">
										<div class="col">
											<div class="row border-start">
												<div class="col d-flex align-items-center">
													<i class="bi bi-calendar3" style="font-size: 1.5em;"></i>
													<span style="font-size: 1em;"> &nbsp;&nbsp;교내사이트</span>
												</div>
											</div>
											<div class="row bg-white border-top border-start">
												<div class="col mt-2">
											     	<ul>
														<li>신입생 오리엔테이션...</li>
														<li>새학기 수강신청 안내...</li>
														<li>재학생 방학특강 신청 안내</li>
														<li>현장실습 신청일자 </li>
														<li>현장실습 교육프로그램 안내..</li>
														<li>겨울 워크샵 공지</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="row border-top">
										<div class="col">
											<div class="row border-start">
												<div class="col d-flex align-items-center">
													<i class="bi bi-clock-history" style="font-size: 1.5em;"></i>
													<span style="font-size: 1em;"> &nbsp;&nbsp;최근 사용한 메뉴</span>
												</div>
											</div>
											<div class="row bg-white border-top border-start">
												<div class="col mt-2">
											     	<p>1. 단과대 공지</p>
											     	<p>2. 산업체 등록</p>
											     	<p>3. 웹메일</p>
											     	<p>4. 학사일정</p>
											     	<p>5. 시설/전산 요청</p>
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
		</div>
	</div>
	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>