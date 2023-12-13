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
					상벌점 관리
				</div>
			</div>
			
			<!-- 카테고리 -->
			<div class="row mt-2">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link text-black" href="./mj_pointCategoryPage">상벌 코드</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active text-black" href="./jw_pointManagementPage">상벌 관리</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-black" href="./jw_pointSituationPage">학생 상벌 현황</a>
						</li>
					</ul>
				</div>
			</div>
			

			<!-- 세부내용 시작 -->			
			<div class="row">
				<div class="col">
					<!-- 세부내용 -->
					<div class="row py-3 mb-4">
						<div class="col">
							<table class="table table-bordered text-center align-middle">
								<thead>
									<tr class="align-middle border-bottom border-2">
										<th scope="col" class="col-1 text-bg-light">이름</th>
										<th scope="col" class="col-1 text-bg-light">기숙사명</th>
										<th scope="col" class="col-1 text-bg-light">호</th>
										<th scope="col" class="col text-bg-light">상벌/사유/부여</th>
										<!-- <th scope="col" class="col-4 text-bg-light">사유</th>
										<th scope="col" class="col-1 text-bg-light">부여</th> -->
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${pointManagementListMap}" var="pointManagementListMap">
									<tr>
										<td>${pointManagementListMap.studentInfoDto.name}</td>
										<td>${pointManagementListMap.dormBuildingDto.name}</td>
										<td>${pointManagementListMap.dormRoomDto.room_name}</td>
										<td colspan="3">
											<form action="./jw_pointRegisterProcess" method="post">
												<select name="point_category_pk" class="border-secondary-subtle form-select mx-1 form-select-sm rounded-0" aria-label="Default select example">
													<option>선택해주세요.</option>
													<c:forEach items="${pointManagementListMap.pointCategoryDto}" var="pointCategoryList">
														<option value="${pointCategoryList.point_category_pk}">${pointCategoryList.content}</option>
													</c:forEach>
												</select>
												<input type="hidden" name="dorm_student_pk" value="${pointManagementListMap.dormStudentDto.dorm_student_pk}">
												<input type="text" name="reason" class="form-control">
												<input type="submit" value="부여">
											</form>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
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