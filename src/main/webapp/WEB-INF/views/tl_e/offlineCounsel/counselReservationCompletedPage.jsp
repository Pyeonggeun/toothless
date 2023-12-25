<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gowun+Dodum&family=Quicksand:wght@300&display=swap" rel="stylesheet">
	
	<style>
		*{
			font-family: 'Gowun Dodum', sans-serif;
		}
	</style>
	
</head>
<body>
	
	<div class="container-fluid">
	
		<div class="row">
			<div class="col">
				<jsp:include page="../commons/studentTopArea.jsp"></jsp:include>
			</div>
		</div>	
		
		<!-- 상단 배너 -->
		<div class="row">
		    <div class="col mx-0 px-0" style="height: 35em; position: relative;">
		        <img class="banner img-fluid" src="/toothless/resources/img/groupCounsel/fff.jpg" style="width: 100%; height: 100%;">
		
		        <div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height: 100%; position: absolute; bottom: 0; left: 0;"></div>
		
		        <div class="title-text" style="font-size: 4em; color: white; position: absolute; bottom: 48%; left: 20.5%; transform: translate(-50%, 50%);">오프라인 상담</div>
		
		        <div style="color: white; position: absolute; font-size: 5em; bottom: 36%; transform: translate(-50%, -50%); text-align: center; left: -8%; border-top: 1px; border-top-style: solid; border-top-color: white; width: 80%;"></div>
		
		        <div style="color: white; position: absolute; font-size: 1.4em; bottom: 24.5%; transform: translate(-50%, -50%); text-align: center; left: 19.6%;">너와 나 그리고 우리를 위한 마음을 위한 치료</div>
		
		        <div style="color: white; position: absolute; font-size: 1.4em; bottom: 17.5%; transform: translate(-50%, -50%); text-align: center; left: 24.2%;">마음도 관리가 필요합니다</div>
		
		        <div style="height: 17em; width: 18em; border-radius: 0px 50px 0px 0px; background-color: #679467; opacity: 0.9; position: absolute; bottom: -24.2%; transform: translate(-50%, -50%); text-align: center; left: 85%;"></div>
		
		        <div style="font-weight: 900; color: #464646; position: absolute; font-size: 1.5em; bottom: 34%; transform: translate(-50%, -50%); text-align: center; left: 82%;">Contact Us</div>
		
		        <div style="font-weight: 900; color: white; position: absolute; font-size: 2.6em; bottom: 10%; transform: translate(-50%, -50%); text-align: center; left: 84%;">1544-3054</div>
		
		        <div style="color: white; position: absolute; font-size: 0.9em; bottom: 8%; transform: translate(-50%, -50%); text-align: center; left: 83.5%;">E-mail. mkmk@naver.com</div>
		
		        <div style="color: white; position: absolute; font-size: 0.9em; bottom: 3%; transform: translate(-50%, -50%); text-align: center; left: 82.5%;">Tel. 010-4097-3054</div>
		    </div>
		</div>
	
		<!-- 본문 -->
		<div class="row">
			<div class="col-2"></div>
			<div class="col">
				<div class="row pt-5 mt-5">
					<div class="col text-center py-2 fs-5 border border-white border-1 rounded" style="background-color: #b6dbb6;">
						STEP <i class="bi bi-1-circle"></i> 상담원 선택
					</div>
					<div class="col text-center py-2 fs-5 border border-white border-1 rounded" style="background-color: #b6dbb6;">
						STEP <i class="bi bi-2-circle"></i> 일정 선택
					</div>
					<div class="col text-center text-white py-2 fs-5 border border-white border-1 rounded" style="background-color: #679467;">
						STEP <i class="bi bi-3-circle"></i> 예약 완료
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	
		<div class="row pt-5 mt-5">
			<div class="col-2"></div>
			<div class="col border" style="background-color: rgb(254, 254, 252);">
				<div class="row pt-3">
					<div class="col text-center fs-1 fw-bold" style="color: #133369;">
						<i class="bi bi-check-circle"></i>
					</div>
				</div>
				<div class="row pt-3">
					<div class="col text-center fs-4 fw-bold">
						상담 예약이 완료되었습니다.
					</div>
				</div>
				<div class="row pt-2">
					<div class="col text-center">
						향후 상담관련 안내는 센터에서 진행할 예정입니다.
					</div>
				</div>
				<div class="row pt-5 pb-5 px-5 mx-3">
					<div class="col border border-dark rounded" style="background-color: rgb(246, 246, 242);">
						<div class="row py-2">
							<div class="col border-end ps-4">
								<div class="row pt-4 pb-2">
									<div class="col">
										<span class="fw-bold">상담주제 : </span>
										<span>${categoryName }</span>
									</div>
								</div>
								<div class="row pt-2 pb-4">
									<div class="col">
										<span class="fw-bold">상담원명: </span>
										<span>${counselorName }</span>&nbsp;상담사
									</div>
								</div>
							</div>
							<div class="col ps-4">
								<div class="row pt-4 pb-2">
									<div class="col">
										<span class="fw-bold">일시 : </span>
										<span>${year }년 ${month }월 ${date }일(${day }) ${hour }:00</span>
									</div>
								</div>
								<div class="row pt-2 pb-4">
									<div class="col">
										<span class="fw-bold">장소: </span>
										mk대학교 서울캠퍼스 한빛관 상담센터 5층
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		<pre>
		
		
		
		</pre>
		<div class="row mt-5" style="background-color: #5a5a5a; height: 14em;">
			<div class="col-1"></div>
			<div class="col">
				<div class="row" style="height: 4em;"></div>
				<div class="row">
					<div class="col">
						<span style="font-size: 1.4em; color: #FF8200; font-weight: 500;">개인정보처리방침</span>
						<span style="font-size: 1.2em; color: white; font-weight: 500;">▪</span>
						<span style="font-size: 1.2em; color: white; font-weight: 500;">이메일무단수집거부</span>
					</div>
				</div>
				<div class="row pt-4">
					<div class="col">
						<div class="fw-bold" style="color:#d2d2d2; font-size: 0.9em;">서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층) / 대표자:정현경 / 사업자등록번호:220-90-07535 / 통신판매번호:제 강남-8062호 / TEL:02-561-1911 / FAX:02-538-2613</div>
					</div>
				</div>
				<div class="row pt-2">
					<div class="col">
						<div class="fw-bold" style="color:#d2d2d2; font-size: 0.9em;">©2023 MK NATIONAL UNIVERSITY. ALL RIGHTS RESERVED.</div>
					</div>
				</div>
				<div class="row pt-4" style="border-bottom-style: solid; border-bottom-color: gray; border-bottom-width: 1px;"></div>
			</div>
			<div class="col-1"></div>
		</div>
	</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>