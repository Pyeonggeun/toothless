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
	<jsp:include page="../commons/staff/topNavi3.jsp"></jsp:include>
	
	
	<!-- 내용시작 -->
	<div class="row">
		<!-- 좌측 카테고리 -->
		<jsp:include page="../commons/staff/leftCategory2.jsp"></jsp:include>
		
		<!-- 우측내용 -->
		<div class="col mx-5">
			<!-- 카테고리명 -->
			<div class="row my-3">
				<div class="col fs-4 fw-bold">
					동 정보 관리
				</div>
			</div>
			
			<!-- 카테고리 
			<div class="row mt-2 text-center">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active text-black" href="#">&nbsp; A동 &nbsp;</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-black" href="#">&nbsp; B동 &nbsp;</a>
					  </li>
					</ul>
				</div>
			</div>
			-->
			
			
			<!-- 세부내용 시작 -->
			
			<!-- 기숙사 start -->
			<div class="row">
				<c:forEach items="${dormBuilding }" var="dorm">
				
					<div class="col-md-3 my-3">
						<div class="card" style="width: 18rem;">
			
							<img src="/uploadDormMainImg/${dorm.main_img }" class="d-grid img-fluid card-img-top" style="height:11em;">
							<!-- /uploadDormMainImg/${dorm.main_img } -->
							
							<div class="card-body">
							    <h5 class="card-title fw-bold">${dorm.name }</h5>
							    <p class="card-text">${dorm.address }</p>
							
						   		<a href="./deleteForDormInfoProcess?dorm_pk=${dorm.dorm_pk }" class="btn btn-outline-danger rounded-3 d-grid">삭제</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 기숙사 end -->
			
			
			
			
		</div> <!-- 우측내용 col 끝 -->
		
		<!-- 수정/삭제-->
		
            <pre>
            </pre>
        
	</div> <!-- main row 끝 -->
	

</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>