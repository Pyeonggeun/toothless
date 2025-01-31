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
					배정 현황
				</div>
			</div>
			
			<!-- 카테고리 -->
			<div class="row mt-2">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link text-black" href="./dm_roomAssignment">호실 배정</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link active text-black" href="./dm_readRoomAssignment">배정 현황</a>
					  </li>
					</ul>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col border py-4 mx-2 rounded border-dark text-center">
					<div class="row">
                        <a href="./dm_readRoomAssignmentA" role="button" style="text-decoration: none; color: black;">
						<div class="col ms-2 fw-bold">
							A동
						</div>
                        </a>
					</div>
				</div>
				<div class="col border py-4 mx-2 rounded btn text-center" style="background-color: black;">
					<div class="row">
						<div class="col ms-2 fw-bold" style="color: white;">
							B동
						</div>
					</div>
					
				</div>
				<div class="col-8"></div>
			</div>

			
			<div class="row my-3 py-3">
				<div class="col">
					<table class="table table-bordered text-center align-middle">
						<thead>
							<tr class="border-bottom border-2">
								<th scope="col" class="col-2 text-bg-light">동</th>
								<th scope="col" class="col-2 text-bg-light">호수</th>
								<th scope="col" class="col-2 text-bg-light">이름</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty dormListB}">
							<c:forEach items="${dormListB }" var="dormListB">
							<tr>
								<td>${dormListB.dormBuildingDto.name }</td>
								<td>${dormListB.dormRoomDto.room_name }</td>
								<td>${dormListB.studentInfoDto.name }</td>
							</tr>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
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