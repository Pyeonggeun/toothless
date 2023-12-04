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
	
		<div class="row py-2">
            <div class="col-1 pe-2 text-end">
                <img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
            </div>
            <div class="col-3 ps-0 pt-2 fw-bold fs-3 text-start ">
                MK University<span class="fs-6"> | </span> <span class="fs-5">학생포털사이트</span> 
            </div>
            <div class="col-2"></div>
            <div class="col">
            	<div class="row pt-3">
            		<div class="col-9 d-grid">
            			<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            		</div>
            		<div class="col d-grid">
            			<button class="btn btn-outline-dark" type="submit">Search</button>
            		</div>
            	</div>
            </div>
			<div class="col-1 pt-3 me-0 pe-0 text-center dropdown nav-item">
			  <a class="nav-link pt-2 dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    <span class="fw-bold">학생아이디</span>님
			  </a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">정보 수정</a></li>
			    <li><a class="dropdown-item" href="#">마이페이지</a></li>
			    <li><hr class="dropdown-divider"></li>
			    <li><a class="dropdown-item" href="#"><span><i class="bi bi-power"></i></span>&nbsp;로그아웃</a></li>
			  </ul>
			</div>
			<div class="col-1"></div>
		</div>
		
		<!-- 상단 내비게이션 -->
		<div class="row fw-bold" style="background-color: #133369;">
			<div class="col ms-5">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle fw-bold text-white" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">상담신청</a>
				    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">온라인 상담신청</a></li>
                        <li><a class="dropdown-item" href="#">오프라인 상담신청</a></li>
                        <li><a class="dropdown-item" href="#">집단 상담신청</a></li>
                    </ul>
				  </li>
				</ul>
			</div>
			<div class="col">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link fw-bold text-white" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">공지사항</a>
				  </li>
				</ul>
			</div>
			<div class="col">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link fw-bold text-white" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">자유게시판</a>
				  </li>
				</ul>
			</div>
			<div class="col">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link fw-bold text-white" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">상담원 정보</a>
				  </li>
				</ul>
			</div>
			<div class="col">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle fw-bold text-white" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">마이페이지</a>
				    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">예약 조회</a></li>
                        <li><a class="dropdown-item" href="#">상담이력 조회</a></li>
                    </ul>
				  </li>
				</ul>
			</div>
		</div>
		
		<!-- 상단 배너 -->
		<div class="row">
			<div class="col d-grid px-0">
				<img class="img-fluid" src="../../resources/img/offlineCounsel/offlineCounselBanner5.jpg">
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
						신청 완료
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
										<span>우울/불안</span>&nbsp;문제
									</div>
								</div>
								<div class="row pt-2 pb-4">
									<div class="col">
										<span class="fw-bold">상담원명: </span>
										<span>김현영</span>&nbsp;상담사
									</div>
								</div>
							</div>
							<div class="col ps-4">
								<div class="row pt-4 pb-2">
									<div class="col">
										<span class="fw-bold">일시 : </span>
										<span>2023년 12월 6일(수) 14:00</span>
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
	
	
	</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>