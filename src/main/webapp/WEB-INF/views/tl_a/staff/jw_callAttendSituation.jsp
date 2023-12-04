<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
	<!-- 최상단 -->
	<jsp:include page="../commons/staff/topNavi.jsp"></jsp:include>
	
	<!-- 기숙사관리 탭 페이지 -->
	<jsp:include page="../commons/staff/topNavi2.jsp"></jsp:include>
	
	
	<!-- 내용시작 -->
	<div class="row">
		<!-- 좌측 카테고리 -->
		<jsp:include page="../commons/staff/leftCategory.jsp"></jsp:include>
		
		<!-- 우측내용 -->
		<div class="col mx-5">
			<!-- 카테고리명 -->
			<div class="row my-3">
				<div class="col fs-4 fw-bold">
					사생 관리
				</div>
			</div>
			
			<!-- 카테고리 -->
			<div class="row mt-2">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link text-black" href="./jw_exitSituation">외출/외박 현황</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link active text-black" href="./jw_callAttendSituation">점호 참석 현황</a>
					  </li>
					</ul>
				</div>
			</div>
			
			<!-- 미니맵 -->
			<div class="row">
				<div class="col border py-4 mx-2 rounded">
					<div class="row">
						<div class="col ms-2">
							<a href="./orderManagePage" class="text-black" style="text-decoration: none;">
							A동
							</a>
						</div>
					</div>
					
					<div class="row mt-2">
						<div class="col ms-2">
							<a href="./orderManagePage" class="text-black" style="text-decoration: none;">
							<span class="fs-5 fw-bold">
								x
							</span>건
							</a>
						</div>
					</div>
				</div>
				<div class="col border py-4 mx-2 rounded">
					<div class="row">
						<div class="col ms-2">
							<a href="./deliveryManagePageStateB" class="text-black" style="text-decoration: none;">
							B동
							</a>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col ms-2">
							<a href="./deliveryManagePageStateB" class="text-black" style="text-decoration: none;">
							<span class="fs-5 fw-bold">
								x
							</span>건
							</a>
						</div>
					</div>
				</div>					
				<div class="col-8"></div>
			</div>

			<!-- 세부내용 시작 -->			
			<div class="row">
				<div class="col">
					<!-- 목록 -->
					<div class="row py-3">
						<div class="col">
							~~목록 (총 x개) -> 필요시사용
						</div>
					</div>
					
					<!-- 세부내용 -->
					<div class="row mt-2">
						<div class="col">
							너의 꿈을 펼치는 곳
						</div>
					</div>
				</div>
			</div>
			
		</div> <!-- 우측내용 col 끝 -->
            
        
	</div> <!-- main row 끝 -->
	

</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>