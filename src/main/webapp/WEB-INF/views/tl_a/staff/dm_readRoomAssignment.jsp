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

	function adongClick(callBackFuc){

		//A동 클릭버튼 속성 조작
		const adongText = document.querySelector("#dongWrapper .adong");
		adongText.setAttribute("style", "background-color: black;"+"color: white;");
		
		const bdongText = document.querySelector("#dongWrapper .bdong");
		bdongText.setAttribute("style", "background-color: white;"+"color: black;");
		console.log(adongText);
		//내용수정
		callBackFuc();
		
	}
	
	// 안에 내용 랜더링 콜백함수로 사용
	function contentUpdate(){
		// restAPI 사용해서 리스트를 끌어올거임..
		
		const templete = document.querySelector("#templete");
		templete.innerHTML = "";
		
		fetch("./AdongList")
		.then(response => response.json())
		.then(response => {
			
			// 템플릿 양식을 그대로 들고옴
			for(e of response.data){
				const tr = document.createElement("tr");
				const td1 = document.createElement("td");
				const td2 = document.createElement("td");
				const td3 = document.createElement("td");
				
				//const buildname = templeteDt.querySelector("#buildname");
				//buildname.innerText = e.dormBuildingDto.name;
				
				//const roomname = templeteDt.querySelector("#roomname");
				//roomname.innerText = e.dormRoomDto.room_name;
				
				//const studentname = templeteDt.querySelector("#studentname");
				//studentname.innerText = e.studentInfoDto.name;
				
				td1.innerText = e.dormBuildingDto.name;
				td2.innerText = e.dormRoomDto.room_name;
				td3.innerText = e.studentInfoDto.name;
				
				tr.appendChild(td1);
				tr.appendChild(td2);
				tr.appendChild(td3);
				
				templete.appendChild(tr);
				
			}
			
			
			
			
		});
			
		
	}
	
	function bdongClick(callBackFuc){

		//A동 클릭버튼 속성 조작
		const bdongText = document.querySelector("#dongWrapper .bdong");
		bdongText.setAttribute("style", "background-color: black;"+"color: white;");
		
		const adongText = document.querySelector("#dongWrapper .adong");
		adongText.setAttribute("style", "background-color: white;"+"color: black;");
		console.log(bdongText);
		//내용수정
		callBackFuc();
		
	}
	
	// ★★★★★★★★★★★ 여기 내용 수정하는거 Adong 엘리먼트에서 값을받아와서 파라미터로 값넘겨줘서  
	function contentUpdate2(){
		// restAPI 사용해서 리스트를 끌어올거임..
		
		const templete = document.querySelector("#templete");
		templete.innerHTML = "";
		
		fetch("./BdongList")
		.then(response => response.json())
		.then(response => {
			
			// 템플릿 양식을 그대로 들고옴
			for(e of response.data){
				const tr = document.createElement("tr");
				const td1 = document.createElement("td");
				const td2 = document.createElement("td");
				const td3 = document.createElement("td");
				
				td1.innerText = e.dormBuildingDto.name;
				td2.innerText = e.dormRoomDto.room_name;
				td3.innerText = e.studentInfoDto.name;
				
				tr.appendChild(td1);
				tr.appendChild(td2);
				tr.appendChild(td3);
				
				templete.appendChild(tr);
				
			}
			
			
			
			
		});
			
		
	}
	
	// 동리스트 버튼 일반 출력 
	function dongListSequence(){
		
		
		
		const url = "./buildingInfoList";
		fetch(url)
		.then(response => response.json())
		.then(response => {
			let count = 0;
			for(e of response.data){
				
				//카운트 이거 동이름으로 sequence네임 만들려고
				count++;
				const Wrapper = document.querySelector("#Wrapper").cloneNode(true);
				Wrapper.classList.remove("d-none");
				
				//마우스 오버
				Wrapper.setAttribute("onmouseover","mouseoverChangeColor(this)");
				Wrapper.setAttribute("onmouseout","mouseoutChangeColor(this)");
				
				//마우스 버튼
				Wrapper.setAttribute("onclick", "dongListSequenceButton(" + e.dorm_pk + ",this" + ")");
				Wrapper.querySelector(".dongName").innerText = e.name;
				
				console.log(Wrapper);
				
				document.querySelector("#dongWrapper").appendChild(Wrapper);
				
				
				
			}
			
			
			
		});
		
	}
	
	// 버튼을 눌렀을때 리스트 출력
	function dongListSequenceButton(dorm_pk, element){
		
		
		// 버튼 리스트 초기화시키고 다시로드 시켜야됨 왜냐면 버튼 색 문제
		
		
		
		// 이미 색상을 바꿈 
		const dongWrapper = document.querySelectorAll(".dongName"); 
		for(e of dongWrapper){
			e.style.color = "black";
		}
		
		const bgdong = document.querySelectorAll(".bgdong");
		for(e of bgdong){
			e.style.backgroundColor = "white";
		}
		
		element.querySelector(".dongName").style.color = "white";
		element.style.backgroundColor = "black";
		
		
		
		// 리스트 초기화 먼저 때려줘야됨 		
		document.querySelector("#templete").innerHTML = "";
		
		const url = "./selectListTest?dorm_pk=" + dorm_pk;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			for(e of response.data){
				
				const HoWrapper = document.querySelector("#HoWrapper").cloneNode(true);
				HoWrapper.querySelector(".buildname").innerText = e.DONGNAME;
				HoWrapper.querySelector(".roomname").innerText = e.ROOMNAME;
				HoWrapper.querySelector(".studentname").innerText = e.STUDENTNAME;
				
				document.querySelector("#templete").appendChild(HoWrapper);
								
			}
			
		})
		
		
	}
	
	// 마우스 오버시 색상 변경 
	function mouseoverChangeColor(element){
		
		element.style.backgroundColor = "black";
		element.querySelector(".dongName").style.color = "white";
		
	}
	// 마우스 아웃시 색상 변경 (기본값으로 할거임)
	function mouseoutChangeColor(element){
		
		element.style.backgroundColor = "white";
		element.querySelector(".dongName").style.color = "black";
		
	}
	
	
	
	// 기본적으로 전체 배정현황이 나와야함 
	function allDormStudentAssignList(){
		
		document.querySelector("#templete").innerHTML = "";
		
		const url = "./allDormStudent";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			for(e of response.data){
				
				const HoWrapper = document.querySelector("#HoWrapper").cloneNode(true);
				HoWrapper.querySelector(".buildname").innerText = e.dormBuildingDto.name;
				HoWrapper.querySelector(".roomname").innerText = e.dormRoomDto.room_name;
				HoWrapper.querySelector(".studentname").innerText = e.studentInfoDto.name;
				
				document.querySelector("#templete").appendChild(HoWrapper);
			}
			
			
		})
		
	}
	
	// 검색했을시 리스트가 뽑일거임 지금리스트 전체 삭제하고 리로드시키면됨 이것도 쿼리가 중요
	function searchList(funcClick){
		
		const searchTemplete = funcClick.closest(".searchTemplete");
		const searchType = searchTemplete.querySelector(".searchType").value;
		const searchWord = searchTemplete.querySelector(".searchWord").value;
		
		const url = "./searchList?searchWord=" + searchWord + "&searchType=" + searchType;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const templete = document.querySelector("#templete");
			templete.innerHTML = "";
			
			for(e of response.data){
				
				const HoWrapper = document.querySelector("#HoWrapper").cloneNode(true);
				HoWrapper.querySelector(".buildname").innerText = e.DONGNAME;
				HoWrapper.querySelector(".roomname").innerText = e.ROOMNAME;
				HoWrapper.querySelector(".studentname").innerText = e.STUDENTNAME;
				
				templete.appendChild(HoWrapper);
				
			}
			
			
		})
		
		
		
		
	}
	
	window.addEventListener("DOMContentLoaded", () => {
		
		dongListSequence();
		allDormStudentAssignList();
	});
	
	
	
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
					  <!--  여기 배정현황은 링크가 아닌 온클릭 전체리스트출력으로 해야됨 -->
					  <li class="nav-item">
					    <a class="nav-link active text-black" href="./dm_readRoomAssignment">배정 현황</a>
					  </li>
					</ul>
				</div>
			</div>
			<div class="row" id="dongWrapper">
				<!--  <div class="adong col border py-4 mx-2 rounded border-dark btn text-center" onclick="adongClick(contentUpdate)">
					<div class="row">
							<div class="col ms-2 fw-bold">
								A동
							</div>
					</div>
				</div>
				<div class="bdong col border py-4 mx-2 rounded border-dark btn text-center" onclick="bdongClick(contentUpdate2)">
					<div class="row">
							<div class="col ms-2 fw-bold">
								B동
							</div>
					</div>
					
				</div>-->
				
			</div>
			<div id="searchTemplete" class="searchTemplete row mt-4">
				<div class="searchWrapper col-2">
					<select id="searchType" class="searchType form-select" aria-label="Default select example">	
					  <option value="studentname" selected>학생이름</option>
					  <option value="dongname">동</option>
					  <option value="roomname">호수</option>
					</select>
				</div>
				<div class="col">
					<input id="searchWord" type="text" class="searchWord form-control">
				</div>
				<div class="col-2 d-grid ps-4">
					<i class="bi bi-search" role="button" onclick="searchList(this)" style="font-size: 1.6em"></i>
				</div>
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
						<tbody id="templete">
							
						</tbody>
					</table>
				</div>
			</div>
			
		</div> <!-- 우측내용 col 끝 -->
            
        
	</div> <!-- main row 끝 -->
<div class="modal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">호실 배정</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>정말로 배정 하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          <button onclick="AssignmentComplete()" type="button" class="btn btn-primary">배정하기</button>
        </div>
      </div>
    </div>
  </div>

</div>
							<!-- 호리스트 출력 -->
							<table class="d-none">
							<tr id="HoWrapper">
								<td class="buildname"></td>
								<td class="roomname"></td>
								<td class="studentname"></td>
							</tr>
							</table>
							<!-- 동출력 먼저. -->
							<div id="Wrapper" class="bgdong col-1 border py-4 mx-2 rounded border-dark btn text-center d-none" onclick="dongListSequenceButton(this)">
								<div class="row"><!-- 여기를 뜯어내야함 버튼을 눌렀을 때 -->
									<div class="dongName col ms-2 fw-bold">
										A동
									</div>
								</div>
							</div>
							
							 
							 

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>