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

<script>
	
	function selectA(seleteDongVal){
		
		// 옵션 id 초기화 먼저
		const selectHo = document.getElementById("selectHo");
		console.log(seleteDongVal.value);
		
		selectHo.innerHTML = "";
		console.log(selectHo);
		
		// dongHoList가져와서 역직렬화후 품
		fetch("./dongHoList")
		.then(response => response.json())
		.then(response => {
			
			// 렌더링 하는곳
			
			for(e of response.data){
				if(e.dormBuildingDto.dorm_pk == seleteDongVal.value){
					
					selectHo.innerHTML += "<option value=" + e.dormRoomDto.dorm_room_pk + ">" + e.dormRoomDto.room_name + "</option>";
					
				}
			}
			
		});
	}
	
</script>
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
					배정 관리
				</div>
			</div>
			
			<!-- 카테고리 -->
			<div class="row mt-2">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active text-black" href="./dm_roomAssignment">호실 배정</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-black" href="./dm_readRoomAssignment">배정 현황</a>
					  </li>
					</ul>
				</div>
			</div>
			
			<!-- 미니맵 -->
			<div class="row">
				<div class="col border py-4 mx-2 rounded border-dark btn text-center" onclick="location.href='./dm_roomAssignment'">
					<div class="row">
						<div class="col ms-2 fw-bold">
							전체
						</div>
					</div>
				</div>
                <div class="col border py-4 mx-2 rounded btn text-center" onclick="location.href='./dm_roomAssignmentN'" style="background-color: black;">
					<div class="row">
						<div class="col ms-2 fw-bold" style="color: white;">
							미배정
						</div>
					</div>
				</div>
                <div class="col border py-4 mx-2 rounded border-dark btn text-center" onclick="location.href='./dm_roomAssignmentY'">
					<div class="row">
						<div class="col ms-2 fw-bold">
							배정완료
						</div>
					</div>
				</div>
				<div class="col-8"></div>
			</div>

			<!-- 세부내용 시작 -->			
			<div class="row my-3 py-3">
				<div class="col">
					<table class="table table-bordered text-center align-middle">
						<thead>
							<tr class="border-bottom border-2">
								<th scope="col" class="col-2 text-bg-light">이름</th>
								<th scope="col" class="col-2 text-bg-light">동</th>
								<th scope="col" class="col-2 text-bg-light">호수</th>
                                <th scope="col" class="col-1 text-bg-light">배정/배정취소</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty studentAssignmentList }">
							<c:forEach items="${studentAssignmentList }" var="studentAssignmentList">
							<form action="./assignmentAddProcess" method="post">
							<tr>
								<td>${studentAssignmentList.studentInfoDto.name}<input name="student_pk" type="hidden" value="${studentAssignmentList.studentInfoDto.student_pk }"></td><!-- 테이블 엮어서 반복문 -->
								<td>
                                    <select id="selectDong" class="form-select" onchange="selectA(this)">
                                        <c:forEach items="${dormBuildingDtos }" var="dormBuildingDtos">
                                        <option value="${dormBuildingDtos.dorm_pk }">${dormBuildingDtos.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <select id="selectHo" name="dorm_room_pk" class="form-select"> 
                                        <c:forEach items="${dormRoomDtos }" var="dormRoomDtos">
                                        <option value="${dormRoomDtos.dorm_room_pk }">${dormRoomDtos.room_name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
								<td><input type="submit" class="btn btn-primary" value="&nbsp;&nbsp;&nbsp;배정&nbsp;&nbsp;&nbsp;"></td>
							</tr>
							</form>
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