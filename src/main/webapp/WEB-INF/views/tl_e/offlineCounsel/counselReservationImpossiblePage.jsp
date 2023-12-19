<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
			<div class="col mx-0 px-0" style="height: 35em;">
				<img class="banner img-fluid" src="./../../resources/img/groupCounsel/fff.jpg" style="width:100%; height: 100%;">
			
				<div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height:100%; position: relative; bottom: 100%;"></div>
				<!-- 
				<div class="title-text fw-bold" style="font-size: 3.5em; color: white; top: 70%;">Mk University | 상담센터</div>
				<!--<div class="title-text" style="font-size: 1.5em; color: white; top: 42%;"></div> -->
				<div style="color: white; position: relative; font-size: 4em; bottom: 148%; transform: translate(-50%, -50%); text-align: center; left: 20.5%;">MKU 상담센터</div>
				<div style="color: white; position: relative; font-size: 5em; bottom: 154%; transform: translate(-50%, -50%); text-align: center; left: -18%; border-top:1px; border-top-style: solid; border-top-color: white;"></div>
				<div style="color: white; position: relative; font-size: 1.4em; bottom: 148%; transform: translate(-50%, -50%); text-align: center; left: 19.6%;">너와 나 그리고 우리를 위한 마음을 위한 치료</div>
				<div style="color: white; position: relative; font-size: 1.4em; bottom: 147%; transform: translate(-50%, -50%); text-align: center; left: 24.3%;">마음도 관리가 필요합니다</div>		
				<div style="height:13em; width:14em; border-radius: 0px 50px 0px 0px; background-color: #679467; opacity:0.9; position: relative; font-size: 1.4em; bottom: 155.2%; transform: translate(-50%, -50%); text-align: center; left: 86.7%;"></div>				
				<div style="font-weight:900; color: #464646; position: relative; font-size: 1.5em; bottom: 225%; transform: translate(-50%, -50%); text-align: center; left: 84%;">Contact Us</div>
				<div style="font-weight:900; color: white; position: relative; font-size: 2.8em; bottom: 212%; transform: translate(-50%, -50%); text-align: center; left: 86.3%;">1544-3054</div>
				<div style="color: white; position: relative; font-size: 0.9em; bottom: 215%; transform: translate(-50%, -50%); text-align: center; left: 85.5%;">E-mail. mkmk@naver.com</div>
				<div style="color: white; position: relative; font-size: 0.9em; bottom: 214%; transform: translate(-50%, -50%); text-align: center; left: 84.5%;">Tel. 010-4097-3054</div>
			</div>
		</div>
	
		<!-- 본문 -->
		<div class="row">
			<div class="col-2"></div>
			<div class="col">
				<div class="row pt-5">
					<div class="col text-center py-2 fs-5 border border-white border-1 rounded" style="background-color: rgb(231, 231, 226);">
						상담 선택
					</div>
					<div class="col text-center py-2 fs-5 border border-white border-1 rounded" style="background-color: rgb(231, 231, 226);">
						상담 신청
					</div>
					<div class="col text-center bg-dark text-white py-2 fs-5 border border-white border-1 rounded">
						신청 실패
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	
		<div class="row pt-5 mt-5">
			<div class="col-2"></div>
			<div class="col border" style="background-color: rgb(254, 254, 252);">
				<div class="row pt-3">
					<div class="col text-center fs-1 fw-bold text-danger">
						<i class="bi bi-exclamation-circle"></i>
					</div>
				</div>
				<div class="row pt-3">
					<div class="col text-center">
						<span class="fs-4 fw-bold">상담 예약에 실패하였습니다.</span><br> 
						<span class="fs-6">이미 예약이 완료된 날짜와 시간입니다.<br>
						다른 날짜와 시간으로 예약을 진행해주세요.</span>
					</div>
				</div>
				<div class="row pt-4 pb-5">
					<div class="col-4"></div>
						<div class="col">
							<form class="d-grid" action="./selectCounselorPage" method="post">
								<input class="btn btn-dark" type="submit" value="예약페이지로 돌아가기">
							</form>
						</div>
					<div class="col-4"></div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		
		<pre>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		</pre>
	
	
	</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>