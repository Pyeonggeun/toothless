<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <a class="navbar-brand" href="../commons/counselCenterStudentMainPage"><img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;"></a>
            </div>
            <div class="col-3 ps-0 pt-2 fw-bold fs-3 text-start ">
                <a class="navbar-brand" href="../commons/counselCenterStudentMainPage">MK University<span class="fs-6"> | </span> <span class="fs-5">상담센터</span></a>
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
			    <span class="fw-bold">${sessionStudentInfo.name }</span>님
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
                        <li><a class="dropdown-item" href="./selectCounselorPage">오프라인 상담신청</a></li>
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
                        <li><a class="dropdown-item" href="../offlineCounsel/checkOfflineCounselReservationStudentPage">예약 조회</a></li>
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
				<div class="row" style="display: flex;">
					<c:forEach items="${list }" var="map">
						<!-- 여기서 col 한 개를 반복문 돌려서 출력하면 됨 -->
						<div class="col-4">
							<div class="row">
								<div class="col border border-dark m-2 shadow-sm rounded" style="min-height: 30em;">
									<div class="row border-bottom">
										<!-- 나중에 카테고리 리스트 반복문으로 돌릴 때 choose,when으로 ${category_pk == 1} 조건으로 이미지 변경 -->
										<div class="col-3 py-2">
											<c:choose>
												<c:when test="${map.typeCategoryDto.id == 1 }">
													<img class="img-fluid" src="../../resources/img/offlineCounsel/personality.png">
												</c:when>
												<c:when test="${map.typeCategoryDto.id == 2 }">
													<img class="img-fluid" src="../../resources/img/offlineCounsel/relationship.png">
												</c:when>
												<c:when test="${map.typeCategoryDto.id == 3 }">
													<img class="img-fluid" src="../../resources/img/offlineCounsel/oppositeGender.png">
												</c:when>
												<c:when test="${map.typeCategoryDto.id == 4 }">
													<img class="img-fluid" src="../../resources/img/offlineCounsel/depression.png">
												</c:when>
												<c:when test="${map.typeCategoryDto.id == 5 }">
													<img class="img-fluid" src="../../resources/img/offlineCounsel/career.png">
												</c:when>
												<c:when test="${map.typeCategoryDto.id == 6 }">
													<img class="img-fluid" src="../../resources/img/offlineCounsel/academic.png">
												</c:when>
											</c:choose>										
										</div>
										<div class="col pt-4 fw-bold fs-4">
											${map.typeCategoryDto.name }
										</div>
									</div>
									<div class="row fs-5">
										<div class="col ps-4">
											<!-- 반복문: 상담원 리스트 -->
											<c:forEach items="${map.counselorByCategoryList }" var="map2">
												<div class="row pt-3 pb-2">
													<div class="col">
														<i class="bi bi-person-circle"></i>&nbsp;&nbsp;
														<span><a class="navbar-brand" href="./counselReservationPage?type_category_id=${map2.counselorTypeDto.type_category_id }&counselor_id=${map2.counselorDto.id }">${map2.counselorDto.name } 상담사</a></span>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
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