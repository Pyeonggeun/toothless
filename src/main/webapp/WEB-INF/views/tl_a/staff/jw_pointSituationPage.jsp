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
	
	// 전체 리스트
	function reloadPointSituationList(){
		
		const url = "./restGetAllPointSituationList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const pointSituationBox = document.getElementById("pointSituationBox");
			pointSituationBox.innerHTML = "";
			for(e of response.data){
				
				const pointSituationWrapper = document.querySelector("#pointTemplete .pointSituationWrapper").cloneNode(true);
				
				const studentNameSpace = pointSituationWrapper.querySelector(".studentNameSpace");
				studentNameSpace.innerText = e.studentInfoDto.name;
				
				const buildingNameSpace = pointSituationWrapper.querySelector(".buildingNameSpace");
				buildingNameSpace.innerText = e.dormBuildingDto.name;
				
				const roomNameSpace = pointSituationWrapper.querySelector(".roomNameSpace");
				roomNameSpace.innerText = e.dormRoomDto.room_name;
				
				const totalPointSpace = pointSituationWrapper.querySelector(".totalPointSpace");
				totalPointSpace.innerText = e.intSumPointValue;
				
				pointSituationBox.appendChild(pointSituationWrapper);
			
			}
		})
	}
	
	function reloadPointSituationListByDormPk(dorm_pk){
		
		const url = "./restGetPointSituationListByDormPk?dorm_pk=" + dorm_pk;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const pointSituationBox = document.getElementById("pointSituationBox");
			pointSituationBox.innerHTML = "";
			for(e of response.data){
				
				const pointSituationWrapper = document.querySelector("#pointTemplete .pointSituationWrapper").cloneNode(true);
				
				const studentNameSpace = pointSituationWrapper.querySelector(".studentNameSpace");
				studentNameSpace.innerText = e.studentInfoDto.name;
				
				const buildingNameSpace = pointSituationWrapper.querySelector(".buildingNameSpace");
				buildingNameSpace.innerText = e.dormBuildingDto.name;
				
				const roomNameSpace = pointSituationWrapper.querySelector(".roomNameSpace");
				roomNameSpace.innerText = e.dormRoomDto.room_name;
				
				const totalPointSpace = pointSituationWrapper.querySelector(".totalPointSpace");
				totalPointSpace.innerText = e.intSumPointValue;
				
				pointSituationBox.appendChild(pointSituationWrapper);
			
			}
		})
	}
	
	let selectedElement = null;
	  
	function toggleBackgroundColor(element) {
	    if (selectedElement) {
	    	selectedElement.classList.remove('selected', 'fw-bold', 'text-white');
	    	selectedElement.style.backgroundColor  = '';
	    }
	
	    element.classList.add('selected', 'fw-bold', 'text-white');
	    element.style.backgroundColor = 'black';
	    selectedElement = element;
	}
	
	function reloadBuildingName(){
		
		const url = "./restBuildingList"
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const buildingListBox = document.getElementById("buildingListBox");
			buildingListBox.innerHTML = "";
			
			for(e of response.data){
				
				const buildingNameWrapper = document.querySelector("#buildingTemplete .buildingNameWrapper").cloneNode(true);
				buildingNameWrapper.setAttribute("onclick", "reloadPointSituationListByDormPk("+e.dorm_pk+")");
				buildingNameWrapper.addEventListener('click', function() {
					toggleBackgroundColor(this);
				});
				
				const buildingName = buildingNameWrapper.querySelector(".buildingName");
				buildingName.innerText = e.name;
				
				buildingListBox.appendChild(buildingNameWrapper);
			}
			
		})
		
	}
	
	window.addEventListener("DOMContentLoaded", () => {
		reloadPointSituationList();
		reloadBuildingName();
	})
	
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
					상벌점 관리
				</div>
			</div>
			
			<!-- 카테고리 -->
			<div class="row mt-2">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link text-black" href="./jw_pointCategoryPage">상벌 코드</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-black" href="./jw_pointManagementPage">상벌 관리</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active text-black" href="./jw_pointSituationPage">학생 상벌 현황</a>
						</li>
					</ul>
				</div>
			</div>
			
			<div id="buildingListBox" class="row">
				
			</div>
			
			<div id="buildingTemplete" class="d-none">
				<div class="buildingNameWrapper col-1 border py-4 mx-2 rounded border-dark btn text-center">
					<div class="row">
						<div class="buildingName col ms-2 fw-bold">
							동나오는곳
						</div>
					</div>
				</div>
			</div>
			<!-- 세부내용 시작 -->			
			<div class="row">
				<div class="col">
					<!-- 목록 -->
					<div class="row py-3 justify-content-between">
						<div class="col-1">
						</div>
						<div class="col-2 me-1">
							<select class="form-select mx-1 form-select-sm rounded-0" aria-label="Default select example">
								<option selected value="1">최신순</option>
								<option value="2">상점 높은순</option>
								<option value="3">벌점 높은순</option>
							</select>
						</div>
					</div>
					
					<!-- 세부내용 -->
					<div class="row py-3">
						<div class="col">
							<table class="table table-bordered text-center align-middle">
								<thead>
									<tr class="align-middle border-bottom border-2">
										<th scope="col" class="col-3 text-bg-light">이름</th>
										<th scope="col" class="col-3 text-bg-light">기숙사명</th>
										<th scope="col" class="col-3 text-bg-light">호</th>
										<th scope="col" class="col-3 text-bg-light">총 점수</th>
									</tr>
								</thead>
								<tbody id="pointSituationBox">

								</tbody>
							</table>
						</div>
					</div>
					
					<table id="pointTemplete" class="d-none">
						<tr class="pointSituationWrapper">
							<td class="studentNameSpace">학생이름나오는곳</td>
							<td class="buildingNameSpace">기숙사명나오는곳</td>
							<td class="roomNameSpace">호나오는곳</td>
							<td class="totalPointSpace">총점수나오는곳</td>
						</tr>
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