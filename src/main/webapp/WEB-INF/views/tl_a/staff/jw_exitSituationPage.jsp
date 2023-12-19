<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Insert title here</title>
<script>
	
	// 전체 리스트
	function reloadExitSituationList(){
		
		const url = "./restGetAllExitSituationList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const exitSituationBox = document.getElementById("exitSituationBox");
			exitSituationBox.innerHTML = "";
			for(e of response.data){
				
				const exitSituationWrapper = document.querySelector("#templete .exitSituationWrapper").cloneNode(true);
				
				const studentNameSpace = exitSituationWrapper.querySelector(".studentNameSpace");
				studentNameSpace.innerText = e.studentInfoDto.name;
				
				const buildingNameSpace = exitSituationWrapper.querySelector(".buildingNameSpace");
				buildingNameSpace.innerText = e.dormBuildingDto.name;
				
				const roomNameSpace = exitSituationWrapper.querySelector(".roomNameSpace");
				roomNameSpace.innerText = e.dormRoomDto.room_name;
				
				const reasonSpace = exitSituationWrapper.querySelector(".reasonSpace");
				reasonSpace.innerText = e.exitDto.reason;
				
				const exitDateSpace = exitSituationWrapper.querySelector(".exitDateSpace");
				const date1 = new Date(e.exitDto.exit_date);
				exitDateSpace.innerText = date1.getFullYear() + "." + ((date1.getMonth())+1) + "." + date1.getDate();
				
				const applyDateSpace = exitSituationWrapper.querySelector(".applyDateSpace");
				const date2 = new Date(e.exitDto.apply_create_at);
				applyDateSpace.innerText = date2.getFullYear() + "." + ((date2.getMonth())+1) + "." + date2.getDate();
				
				exitSituationBox.appendChild(exitSituationWrapper);
			
			}
		})
	}
	
	// dorm_pk별 리스트
	function reloadExitSituationListByDormPk(dorm_pk){
		
		const url = "./restGetExitSituationListByDormPk?dorm_pk=" + dorm_pk;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const exitSituationBox = document.getElementById("exitSituationBox");
			exitSituationBox.innerHTML = "";
			for(e of response.data){
				
				const exitSituationWrapper = document.querySelector("#templete .exitSituationWrapper").cloneNode(true);
				
				const studentNameSpace = exitSituationWrapper.querySelector(".studentNameSpace");
				studentNameSpace.innerText = e.studentInfoDto.name;
				
				const buildingNameSpace = exitSituationWrapper.querySelector(".buildingNameSpace");
				buildingNameSpace.innerText = e.dormBuildingDto.name;
				
				const roomNameSpace = exitSituationWrapper.querySelector(".roomNameSpace");
				roomNameSpace.innerText = e.dormRoomDto.room_name;
				
				const reasonSpace = exitSituationWrapper.querySelector(".reasonSpace");
				reasonSpace.innerText = e.exitDto.reason;
				
				const exitDateSpace = exitSituationWrapper.querySelector(".exitDateSpace");
				const date1 = new Date(e.exitDto.exit_date);
				exitDateSpace.innerText = date1.getFullYear() + "." + ((date1.getMonth())+1) + "." + date1.getDate();
				
				const applyDateSpace = exitSituationWrapper.querySelector(".applyDateSpace");
				const date2 = new Date(e.exitDto.apply_create_at);
				applyDateSpace.innerText = date2.getFullYear() + "." + ((date2.getMonth())+1) + "." + date2.getDate();
				
				exitSituationBox.appendChild(exitSituationWrapper);
			
			}
		})
		
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
				buildingNameWrapper.setAttribute("onclick", "reloadExitSituationListByDormPk("+e.dorm_pk+")");
				buildingNameWrapper.addEventListener('click', function() {
				      this.classList.toggle('selected');
				      this.classList.add('fw-bold', 'text-white');
				      this.style.backgroundColor = 'black';
				      
				});
				
				const buildingName = buildingNameWrapper.querySelector(".buildingName");
				buildingName.innerText = e.name;
				
				buildingListBox.appendChild(buildingNameWrapper);
			}
		})
		
	}
	
	function clickEvent(dorm_pk){
		
		const buildingListBox = document.getElementById("buildingListBox");
		
		buildingListBox.addEventListener('click', function() {
		      this.classList.toggle('selected');
		      this.classList.add('fw-bold', 'text-white');
		      this.style.backgroundColor = 'black';
		});
		
		
		
		
	}

	window.addEventListener("DOMContentLoaded", () => {
		reloadExitSituationList();
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
					사생 관리
				</div>
			</div>
			
			<!-- 카테고리 -->
			<div class="row mt-2">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active text-black" href="./jw_exitSituationPage">외출/외박 현황</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-black" href="./jw_callAttendSituationPage">점호 참석 현황</a>
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
								<th scope="col" class="col-1 text-bg-light">이름</th>
								<th scope="col" class="col-1 text-bg-light">기숙사명</th>
								<th scope="col" class="col-1 text-bg-light">호</th>
								<th scope="col" class="col-5 text-bg-light">사유</th>
								<th scope="col" class="col-2 text-bg-light">외출/외박 일</th>
								<th scope="col" class="col-2 text-bg-light">외출/외박 신청일</th>
							</tr>
						</thead>
						<tbody id="exitSituationBox">
							
						</tbody>
					</table>
				</div>
			</div>
			
			<table id="templete" class="d-none">
				<tr class="exitSituationWrapper">
					<td class="studentNameSpace">이름나오는곳</td>
					<td class="buildingNameSpace">기숙사명나오는곳</td>
					<td class="roomNameSpace">호나오는곳</td>
					<td class="reasonSpace">사유나오는곳</td>
					<td class="exitDateSpace">외출/외박일나오는곳</td>
					<td class="applyDateSpace">외출/외박신청일나오는곳</td>
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