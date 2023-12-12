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
					호 정보 관리 
				</div>
			</div>
			
			<!-- 카테고리 -->
			<div class="row mt-2">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					<ul class="nav nav-tabs">
					<li class="nav-item ta">
					    <a class="nav-link active text-black" href="./sj_manageRoomInfo">호실 정보 전체보기</a>
					  </li>

					</ul>
				</div>
			</div>
			
			<!-- 세부내용 시작 -->
			<div class="row">
				<div class="col text-center fs-5 fw-bold my-4">
					상벌점 
				</div>
			</div>			
			<div class="row border rounded p-3">
				<div class="col py-4 px-4 text-center">
							
				<c:choose>
				    <c:when test="${not empty point}">
				        <span class="fw-bold">상벌점</span> <span class="mz-2">${point[0].SUM}</span>
				    </c:when>
				    <c:otherwise>
				        상벌점이 없습니다.
				    </c:otherwise>
				</c:choose>
				
		
		
		
               <!-- dorm_student_pk를 hidden input으로 전달 -->
               
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