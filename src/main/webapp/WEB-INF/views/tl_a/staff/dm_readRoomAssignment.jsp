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
					  <li class="nav-item">
					    <a class="nav-link active text-black" href="./dm_readRoomAssignment">배정 현황</a>
					  </li>
					</ul>
				</div>
			</div>
			<div class="row" id="dongWrapper">
				<div class="adong col border py-4 mx-2 rounded border-dark btn text-center" onclick="adongClick(contentUpdate)">
					<div class="row"><!-- 여기를 뜯어내야함 버튼을 눌렀을 때 -->
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
						<tbody id="templete">
							<c:if test="${!empty dormList}">
							<c:forEach items="${dormList }" var="dormList">
							<tr class="HoWrapper">
								<td id="buildname">${dormList.dormBuildingDto.name }</td>
								<td id="roomname">${dormList.dormRoomDto.room_name }</td>
								<td id="studentname">${dormList.studentInfoDto.name }</td>
							</tr>
							</c:forEach>
							</c:if>
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

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>