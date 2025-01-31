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
			
			
			<!-- 카테고리 -->
			<div class="row mt-2">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					
					<ul class="nav nav-tabs">
					<li class="nav-item ta">
					    <a class="nav-link active text-black" href="./sj_manageRoomImages">전체보기</a>
					  </li>
					<c:forEach items="${category }" var="da">
					  <li class="nav-item ">
					    <a class="nav-link text-secondary" href="./sj_manageRoomImagesPesonelPage?dorm_amount=${da.dorm_amount}">${da.dorm_amount }인실</a>
					  </li>
					  </c:forEach>
					  
					</ul>
				</div>
			</div>
			
			
			
			
			
			<!-- 상세이미지ㄱㄱ -->
			
            <div class="row">
				<div class="col fs-4 fw-bold my-3">
					인실 별 이미지
				</div>
			</div>	
			
			<!-- 상세이미지 리스트 출력 -->
			<div class="row">
				<c:forEach items="${dormAmount }" var="ct">
					<div class="col-md-3 my-3">
						<div class="card" style="width: 18rem;">
			
							<img src="/uploadRoomImgs/${ct.dorm_imgs }" class="d-grid img-fluid card-img-top" style="height:11em;">
							<div class="card-body">
							    <h5 class="card-title fw-bold">${ct.dorm_amount }인실 상세이미지</h5>
							    <p class="card-text">${dorm.address }</p>
						   		<a class="btn btn-outline-danger d-grid" href="./deleteForRoomDatailProcess?dorm_amount_pk=${ct.dorm_amount_pk }" role="button">삭제하기</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
		</div>
			
			
						
			<pre>
			
			
			</pre>
			
		</div>
		<!-- 우측내용 끝 -->
            
        
	</div> <!-- main row 끝 -->
	

</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>