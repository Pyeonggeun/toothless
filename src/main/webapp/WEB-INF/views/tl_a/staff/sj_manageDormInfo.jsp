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
			
			<!-- 기숙사명 -->
			<div class="row border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col">
					<div class="row mb-4">
						<div class="col text-center fw-bold fs-5">
							기숙사명
						</div>
					</div>
					
				</div>
				<div class="col">
					<div class="row mb-4">
						<div class="col text-center fw-bold fs-5">
							주소
						</div>
					</div>
					
				</div>
				<div class="col">
					<div class="row mb-4">
						<div class="col text-center fw-bold fs-5">
							기숙사 대표 이미지
						</div>
					</div>
					
				</div>
				<div class="col">
					<div class="row mb-4">
						<div class="col text-center">
							
						</div>
					</div>
				</div>
					</div>
					<c:forEach items="${dormBuilding }" var="dorm">
						<input type="hidden" value="${dorm.dorm_pk }">
						<div class="row my-4 border rounded">
							<div class="col">
								<div class="row">
									<div class="col text-center py-5 my-5">
										${dorm.name }
									</div>
								</div>
							</div>
							<div class="col">
								<div class="row">
									<div class="col text-center py-5 my-5">
										${dorm.address }
									</div>
								</div>
							</div>
							<div class="col">
								<div class="row">
									<div class="col my-3">
										<img src="/uploadDormMainImg/${dorm.main_img }" class="d-grid img-fluid">
									</div>
								</div>
							</div>
							<div class="col">
								<div class="row">
									<div class="col d-grid py-5 my-3">
										<button type="button" class="btn btn-outline-secondary py-4">
											<a href="./deleteForDormInfoProcess?dorm_pk=${dorm.dorm_pk }" class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">
											삭제
											</a>
										</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				
				
			</div>
			
			
		</div> <!-- 우측내용 col 끝 -->
		
		<!-- 수정/삭제-->
		
            
        
	</div> <!-- main row 끝 -->
	

</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>