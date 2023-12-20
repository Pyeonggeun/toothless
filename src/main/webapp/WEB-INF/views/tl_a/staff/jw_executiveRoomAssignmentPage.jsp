<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script>
	
	// 전체 리스트
	function reloadExecutiveList(){
		
		const url = "./restGetAllExecutive";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const executiveBox = document.getElementById("executiveBox");
			executiveBox.innerHTML = "";
			for(e of response.data){
				
				const executiveWrapper = document.querySelector("#templete .executiveWrapper").cloneNode(true);
				
				const studentNameSpace = executiveWrapper.querySelector(".studentNameSpace");
				studentNameSpace.innerText = e.studentInfoDto.name;
				
				const buildingNameSpace = executiveWrapper.querySelector(".buildingNameSpace");
				buildingNameSpace.innerText = e.dormBuildingDto.name;
				
				const floorSpace = executiveWrapper.querySelector(".floorSpace");
				floorSpace.innerText = e.dormRoomDto.dorm_floor;
				
				const roomNameSpace = executiveWrapper.querySelector(".roomNameSpace");
				roomNameSpace.innerText = e.dormRoomDto.room_name;
				
				const floorListSpace = executiveWrapper.querySelector(".floorListSpace");
				floorListSpace.classList.add("d-grid")
				
				for(i of e.dormRoomListByDormFloorAndDormPkListAndNY){
					console.log(i.isCount)
					const button = document.createElement('button');
					button.classList.add("fw-bold", "rounded-0", "btn", "btn-sm", "mx-2", "my-1");
					
					if(i.isCount == 0){
						button.innerText = i.dormRoomListByDormFloorAndDormPk.room_name + "배정"
						button.classList.add("btn-primary");
						button.setAttribute("onclick", "registerManageRoom("+
							"'" +
							i.dormRoomListByDormFloorAndDormPk.dorm_room_pk +
							"', '" +
							e.executiveDto.executive_pk +
						"')");
						floorListSpace.appendChild(button);
					} else {
						button.innerText = i.dormRoomListByDormFloorAndDormPk.room_name + "배정 취소"
						button.classList.add("btn-danger");
						button.setAttribute("onclick", "removeManageRoom("+
							"'" +
							i.dormRoomListByDormFloorAndDormPk.dorm_room_pk +
							"', '" +
							e.executiveDto.executive_pk +
						"')");
						floorListSpace.appendChild(button);
					}
				}
				
				executiveBox.appendChild(executiveWrapper);
			}
		})
	}
	
	// dorm_pk별 리스트
	function reloadExecutiveListByDormPk(dorm_pk){
		
		const url = "./restGetExecutiveByDormPk?dorm_pk=" + dorm_pk;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const executiveBox = document.getElementById("executiveBox");
			executiveBox.innerHTML = "";
			for(e of response.data){
				
				const executiveWrapper = document.querySelector("#templete .executiveWrapper").cloneNode(true);
				
				const studentNameSpace = executiveWrapper.querySelector(".studentNameSpace");
				studentNameSpace.innerText = e.studentInfoDto.name;
				
				const buildingNameSpace = executiveWrapper.querySelector(".buildingNameSpace");
				buildingNameSpace.innerText = e.dormBuildingDto.name;
				
				const floorSpace = executiveWrapper.querySelector(".floorSpace");
				floorSpace.innerText = e.dormRoomDto.dorm_floor;
				
				const roomNameSpace = executiveWrapper.querySelector(".roomNameSpace");
				roomNameSpace.innerText = e.dormRoomDto.room_name;
				
				const floorListSpace = executiveWrapper.querySelector(".floorListSpace");
				floorListSpace.classList.add("d-grid")
				
				for(i of e.dormRoomListByDormFloorAndDormPkListAndNY){
					console.log(i.isCount)
					const button = document.createElement('button');
					button.classList.add("fw-bold", "rounded-0", "btn", "btn-sm", "mx-2", "my-1");
					
					if(i.isCount == 0){
						button.innerText = i.dormRoomListByDormFloorAndDormPk.room_name + "배정"
						button.classList.add("btn-primary");
						button.setAttribute("onclick", "registerManageRoom("+
							"'" + i.dormRoomListByDormFloorAndDormPk.dorm_room_pk + "', '" + e.executiveDto.executive_pk + "')"
						);
						floorListSpace.appendChild(button);
					} else {
						button.innerText = i.dormRoomListByDormFloorAndDormPk.room_name + "배정 취소"
						button.classList.add("btn-danger");
						button.setAttribute("onclick", "removeManageRoom("+
							"'" + i.dormRoomListByDormFloorAndDormPk.dorm_room_pk +
							"', '" + e.executiveDto.executive_pk +
						"')");
						floorListSpace.appendChild(button);
					}
				}
				
				executiveBox.appendChild(executiveWrapper);
			}
		})
		
	}
	
	function registerManageRoom(dorm_room_pk, executive_pk){
		
		const url = "./restRegisterExecutiveManagementRoom";
		const params = new URLSearchParams();
		params.append('dorm_room_pk', dorm_room_pk);
		params.append('executive_pk', executive_pk);

		const option = {
			method: "POST",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: params
		};
		
		fetch(url, option)
		.then(response => response.json())
		.then(response => {
			reloadExecutiveList();
		})
		
	}
	
	function removeManageRoom(dorm_room_pk, executive_pk){
		
		const url = "./restRemoveExecutiveManagementRoom";
		const params = new URLSearchParams();
		params.append('dorm_room_pk', dorm_room_pk);
		params.append('executive_pk', executive_pk);

		const option = {
			method: "POST",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: params
		};
		
		fetch(url, option)
		.then(response => response.json())
		.then(response => {
			reloadExecutiveList();
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
	
	// 건물명 반복문
	function reloadBuildingName(){
		
		const url = "./restBuildingList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const buildingListBox = document.getElementById("buildingListBox");
			buildingListBox.innerHTML = "";
			for(e of response.data){
				
				const buildingNameWrapper = document.querySelector("#buildingTemplete .buildingNameWrapper").cloneNode(true);
				buildingNameWrapper.setAttribute("onclick", "reloadExecutiveListByDormPk("+e.dorm_pk+")");
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
		reloadExecutiveList();
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
					임원 관리
				</div>
			</div>
			
			<!-- 카테고리 -->
			<div class="row mt-2">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link text-black" href="./jw_executiveAssignmentPage">임원 배정</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active text-black" href="./jw_executiveRoomAssignmentPage">임원별 호실 배정</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-black" href="./jw_executiveAssignmentSituationPage">임원 배정 현황</a>
						</li>
						<li class="nav-item">
							<a class="nav-link text-black" href="./jw_diaryManagementPage">일지 관리</a>
						</li>
					</ul>
				</div>
			</div>
			
			<!-- 미니맵 -->
			<div id="buildingListBox" class="row">
				
			</div>
			
			<!-- 반복될 건물명 -->
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
			<div class="row my-3 py-3">
				<div class="col">
					<table class="table table-bordered text-center align-middle">
						<thead>
							<tr class="align-middle border-bottom border-2">
								<th scope="col" class="col-2 text-bg-light">임원 이름</th>
								<th scope="col" class="col-2 text-bg-light">기숙사명</th>
								<th scope="col" class="col-2 text-bg-light">층</th>
								<th scope="col" class="col-2 text-bg-light">호</th>
								<th scope="col" class="col-2 text-bg-light">각 층 배정 리스트</th>
							</tr>
						</thead>
						<tbody id="executiveBox">

						</tbody>
					</table>
				</div>
			</div>
			
			<table id="templete" class="d-none">
				<tr class="executiveWrapper">
					<td class="studentNameSpace">이름나오는곳</td>
					<td class="buildingNameSpace">기숙사명나오는곳</td>
					<td class="floorSpace">층나오는곳</td>
					<td class="roomNameSpace">호나오는곳</td>
					<td class="floorListSpace"></td>
				</tr>
			</table>
			
		</div> <!-- 우측내용 끝 -->
            
        
	</div> <!-- main row 끝 -->
	

</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>