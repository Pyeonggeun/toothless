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
	
	function reloadDormStudentList(){
		
		const url = "./restGetAllDormStudent";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const executiveAssignmentBox = document.getElementById("executiveAssignmentBox");
			executiveAssignmentBox.innerHTML = "";
			
			for(e of response.data){
				
				const dormStudentListWrapper = document.querySelector("#dormStudentTemplete .dormStudentListWrapper").cloneNode(true);
				
				const studentNameSpace = dormStudentListWrapper.querySelector(".studentNameSpace");
				studentNameSpace.innerText = e.studentInfoDto.name;
				
				const buildingNameSpace = dormStudentListWrapper.querySelector(".buildingNameSpace");
				buildingNameSpace.innerText = e.dormBuildingDto.name;
				
				const floorSpace = dormStudentListWrapper.querySelector(".floorSpace");
				floorSpace.innerText = e.dormRoomDto.dorm_floor;
				
				const roomNameSpace = dormStudentListWrapper.querySelector(".roomNameSpace");
				roomNameSpace.innerText = e.dormRoomDto.room_name;
				
				
				const assignmentSpace = dormStudentListWrapper.querySelector(".assignmentSpace");
				assignmentSpace.classList.add("d-grid")
				const button = document.createElement('button');
				button.type = "button";
				button.classList.add("fw-bold", "rounded-0", "btn", "btn-sm", "mb-1", "mx-2");
				if(e.isExecutiveCheck == 0){
					button.innerText = "배정"
					button.classList.add("btn-outline-secondary");
					button.setAttribute("onclick", "registerExecutive("+e.dormStudentDto.dorm_student_pk+")");
					assignmentSpace.appendChild(button);
				} else{
					button.innerText = "배정 취소"
					button.classList.add("btn-outline-danger");
					button.setAttribute("onclick", "deleteExecutive("+e.dormStudentDto.dorm_student_pk+")");
					assignmentSpace.appendChild(button);
				}
				
				executiveAssignmentBox.appendChild(dormStudentListWrapper);
			}
			
		})
		
	}
	
	function registerExecutive(dorm_student_pk){
		
		const url = "./restRegisterExecutiveProcess?dorm_student_pk=" + dorm_student_pk;
		
		const option = {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: "dorm_student_pk=" + dorm_student_pk
		};
		
		fetch(url, option)
		.then(response => response.json())
		.then(response => {
			reloadDormStudentList()
		})
		
	}
	
	function deleteExecutive(dorm_student_pk){
		
		const url = "./restdeleteExecutiveProcess?dorm_student_pk" + dorm_student_pk;
		
		const option = {
				method: "post",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				},
				body: "dorm_student_pk=" + dorm_student_pk
			}
		
		fetch(url, option)
		.then(response => response.json())
		.then(response => {
			reloadDormStudentList()
		})
		
	}
	
	function reloadDormStudentListByDormPk(dorm_pk){
		
		const url = "./restGetAllDormStudentByDormPk?dorm_pk=" + dorm_pk;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const executiveAssignmentBox = document.getElementById("executiveAssignmentBox");
			executiveAssignmentBox.innerHTML = "";
			
			for(e of response.data){
				
				const dormStudentListWrapper = document.querySelector("#dormStudentTemplete .dormStudentListWrapper").cloneNode(true);
				
				const studentNameSpace = dormStudentListWrapper.querySelector(".studentNameSpace");
				studentNameSpace.innerText = e.studentInfoDto.name;
				
				const buildingNameSpace = dormStudentListWrapper.querySelector(".buildingNameSpace");
				buildingNameSpace.innerText = e.dormBuildingDto.name;
				
				const floorSpace = dormStudentListWrapper.querySelector(".floorSpace");
				floorSpace.innerText = e.dormRoomDto.dorm_floor;
				
				const roomNameSpace = dormStudentListWrapper.querySelector(".roomNameSpace");
				roomNameSpace.innerText = e.dormRoomDto.room_name;
				
				
				const assignmentSpace = dormStudentListWrapper.querySelector(".assignmentSpace");
				assignmentSpace.classList.add("d-grid")
				const button = document.createElement('button');
				button.type = "button";
				button.classList.add("fw-bold", "rounded-0", "btn", "btn-sm", "mb-1", "mx-2");
				if(e.isExecutiveCheck == 0){
					button.innerText = "배정"
					button.classList.add("btn-outline-secondary");
					button.setAttribute("onclick", "registerExecutive("+e.dormStudentDto.dorm_student_pk+")");
					assignmentSpace.appendChild(button);
				} else{
					button.innerText = "배정 취소"
					button.classList.add("btn-outline-danger");
					button.setAttribute("onclick", "deleteExecutive("+e.dormStudentDto.dorm_student_pk+")");
					assignmentSpace.appendChild(button);
				}
				
				executiveAssignmentBox.appendChild(dormStudentListWrapper);
			}
			
		})
		
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
				buildingNameWrapper.setAttribute("onclick", "reloadDormStudentListByDormPk("+e.dorm_pk+")");
				
				const buildingName = buildingNameWrapper.querySelector(".buildingName");
				buildingName.innerText = e.name;
				
				buildingListBox.appendChild(buildingNameWrapper);
			}
			
		})
		
	}
	
	window.addEventListener("DOMContentLoaded", () => {
		reloadDormStudentList();
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
								<a class="nav-link active text-black" href="./jw_executiveAssignmentPage">임원 배정</a>
							</li>
							<li class="nav-item">
								<a class="nav-link text-black" href="./jw_executiveRoomAssignmentPage">임원별 호실 배정</a>
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
				<div class="row my-3 py-3">
					<div class="col">
						<!-- 세부내용 -->
						<table class="table table-bordered text-center align-middle">
							<thead>
								<tr class="align-middle border-bottom border-2">
									<th scope="col" class="col-2 text-bg-light">이름</th>
									<th scope="col" class="col-2 text-bg-light">기숙사명</th>
									<th scope="col" class="col-2 text-bg-light">층</th>
									<th scope="col" class="col-2 text-bg-light">호</th>
									<th scope="col" class="col-1 text-bg-light">배정</th>
								</tr>
							</thead>
							<tbody id="executiveAssignmentBox">

							</tbody>
						</table>
					</div>
				</div>
				
				<table id="dormStudentTemplete" class="d-none">
					<tr class="dormStudentListWrapper">
						<td class="studentNameSpace"></td>
						<td class="buildingNameSpace"></td>
						<td class="floorSpace"></td>
						<td class="roomNameSpace"></td>
						<td class="assignmentSpace"></td>
					</tr>
				</table>
				
				
			</div>
		</div>
	</div> <!-- 우측내용 col 끝 -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>