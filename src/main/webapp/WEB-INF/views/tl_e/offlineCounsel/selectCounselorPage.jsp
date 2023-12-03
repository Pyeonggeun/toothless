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
					<div class="col text-center bg-dark text-white py-2 fs-5 border border-white border-1 rounded">
						상담 선택
					</div>
					<div class="col text-center py-2 fs-5 border border-white border-1 rounded" style="background-color: rgb(231, 231, 226);">
						상담 신청
					</div>
					<div class="col text-center py-2 fs-5 border border-white border-1 rounded" style="background-color: rgb(231, 231, 226);">
						신청 완료
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	
		<div class="row pt-5">
			<div class="col-2"></div>
			<div class="col">
				<i class="bi bi-info-circle-fill"></i>
				<span>&nbsp;상담하고 싶은 주제 및 상담사를 선택해주세요.</span>
			</div>
			<div class="col-2"></div>
		</div>
		<div class="row pt-3">
			<div class="col-2"></div>
			<div class="col">
				<div class="row">
					<!-- 여기서 col 한 개를 반복문 돌려서 출력하면 됨 -->
					<div class="col-4">
						<div class="row">
							<div class="col border border-dark m-2 shadow-sm rounded" style="min-height: 19em;">
								<div class="row border-bottom">
									<!-- 나중에 카테고리 리스트 반복문으로 돌릴 때 choose,when으로 ${category_pk == 1} 조건으로 이미지 변경 -->
									<div class="col-3 py-2">
										<img class="img-fluid" src="../../resources/img/offlineCounsel/personality.png">
									</div>
									<div class="col pt-4 fw-bold fs-4">
										성격 문제
									</div>
								</div>
								<div class="row fs-5">
									<div class="col ps-4">
										<!-- 반복문: 상담원 리스트 -->
										<div class="row pt-4">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;
												<span><a class="navbar-brand" href="#">김현영 상담사</a></span>
											</div>
										</div>
										<div class="row pt-3">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;
												<span><a class="navbar-brand" href="#">김현영 상담사</a></span>
											</div>
										</div>
										<div class="row pt-3">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;
												<span><a class="navbar-brand" href="#">김현영 상담사</a></span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 여기서 col 한 개를 반복문 돌려서 출력하면 됨 -->
					<div class="col-4">
						<div class="row">
							<div class="col border border-dark m-2 shadow-sm rounded" style="min-height: 19em;">
								<div class="row border-bottom">
									<div class="col-3 py-2">
										<img class="img-fluid" src="../../resources/img/offlineCounsel/relationship.png">
									</div>
									<div class="col pt-4 fw-bold fs-4">
										대인/가족관계
									</div>
								</div>
								<div class="row fs-5">
									<div class="col ps-4">
										<!-- 반복문: 상담원 리스트 -->
										<div class="row pt-4">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3 pb-4">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 여기서 col 한 개를 반복문 돌려서 출력하면 됨 -->
					<div class="col-4">
						<div class="row">
							<div class="col border border-dark m-2 shadow-sm rounded" style="min-height: 19em;">
								<div class="row border-bottom">
									<div class="col-3 py-2">
										<img class="img-fluid" src="../../resources/img/offlineCounsel/oppositeGender.png">
									</div>
									<div class="col pt-4 fw-bold fs-4">
										이성 문제
									</div>
								</div>
								<div class="row fs-5">
									<div class="col ps-4">
										<!-- 반복문: 상담원 리스트 -->
										<div class="row pt-4">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3 pb-4">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>								
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 여기서 col 한 개를 반복문 돌려서 출력하면 됨 -->
					<div class="col-4">
						<div class="row">
							<div class="col border border-dark m-2 shadow-sm rounded" style="min-height: 19em;">
								<div class="row border-bottom">
									<div class="col-3 py-2">
										<img class="img-fluid" src="../../resources/img/offlineCounsel/depression.png">
									</div>
									<div class="col pt-4 fw-bold fs-4">
										우울/불안 문제
									</div>
								</div>
								<div class="row fs-5">
									<div class="col ps-4">
										<!-- 반복문: 상담원 리스트 -->
										<div class="row pt-4">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3 pb-4">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>								
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 여기서 col 한 개를 반복문 돌려서 출력하면 됨 -->
					<div class="col-4">
						<div class="row">
							<div class="col border border-dark m-2 shadow-sm rounded" style="min-height: 19em;">
								<div class="row border-bottom">
									<div class="col-3 py-2">
										<img class="img-fluid" src="../../resources/img/offlineCounsel/career.png">
									</div>
									<div class="col pt-4 fw-bold fs-4">
										진로 문제
									</div>
								</div>
								<div class="row fs-5">
									<div class="col ps-4">
										<!-- 반복문: 상담원 리스트 -->
										<div class="row pt-4">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3 pb-4">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>								
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 여기서 col 한 개를 반복문 돌려서 출력하면 됨 -->
					<div class="col-4">
						<div class="row">
							<div class="col border border-dark m-2 shadow-sm rounded" style="min-height: 19em;">
								<div class="row border-bottom">
									<div class="col-3 py-2">
										<img class="img-fluid" src="../../resources/img/offlineCounsel/academic.png">
									</div>
									<div class="col pt-4 fw-bold fs-4">
										학업 문제
									</div>
								</div>
								<div class="row fs-5">
									<div class="col ps-4">
										<!-- 반복문: 상담원 리스트 -->
										<div class="row pt-4">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>
										<div class="row pt-3 pb-4">
											<div class="col">
												<i class="bi bi-person-circle"></i>&nbsp;&nbsp;김현영 상담사
											</div>
										</div>								
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 이 위까지 지우고 반복문으로 변경 -->
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