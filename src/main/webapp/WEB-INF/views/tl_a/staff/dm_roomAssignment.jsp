<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!--  jquery start -->
<script>
	
	function selectA(seleteDongVal){
		
		// 옵션 id 초기화 먼저
		const selectHo = document.getElementById("selectHo");
		console.log(seleteDongVal.value);
		console.log(selectHo.value);
		selectHo.innerHTML = "";
		
		// 초기화 끝
		
		const selectDong = document.getElementById("selectDong").value;
		
		
		
		
		// dongHoList가져와서 역직렬화후 품
		fetch("./dongHoList")
		.then(response => response.json())
		.then(response => {
			
			// 렌더링 하는곳
			// createElement로 나중에 바꾸기.
			for(e of response.data){
				if(e.dormBuildingDto.dorm_pk == seleteDongVal.value){
					// 옵션태그 반복문 돌면서 리스트 생성 value 값도 넣어줘야함
					selectHo.innerHTML += "<option value=" + e.dormRoomDto.dorm_room_pk + ">" + e.dormRoomDto.room_name + "</option>";
					
				}
			}
			
		});
	}

	// 버튼 누를시 모달창이 뜨고 그 다음에 저장하기를 눌렀을경우 => 값들이 날라가야한다,
	function submitExe(element){
		
		// 모달출력
		const modal = bootstrap.Modal.getOrCreateInstance("#modal");
		modal.show();
		
		
	}
	
	// 12.12 모달 hide() 부분 확실하게 배정을 완료시키는 부분
	function assignmentComplete(){
		
		// 여기서는 배정을 정말로 완료시켜서 값이 인설트가 가능하도록 해주어야함
		// 값을 인설트 시키고 모달 창을 페이드 시켜야 함.
		
		const studentPk = document.querySelector("#student");
		
		const url = "./assignmentAdd";
		fetch(url, {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: "student_pk=" + studentPk + "&selectHo=" + selectHo 
		})
		.then(response => response.json())
		.then(response => {
			
		})
		;
		
		
		
		
		const modal = bootstrap.Modal.getOrCreateInstance("#modal");
		modal.hide();
		
	}
		// 12.12 배정 취소시키고 리스트 다시 출력
		function assignCancel(dorm_student_pk){
		
		// 잘날라옴..
			
		fetch("./assignCancel?dorm_student_pk=" + dorm_student_pk)
		.then(response => response.json())
		.then(response => {
			// 취소했을때 랜더링 ==> 아마 리스트 리로드되는 함수를 써야할듯..?
			const assigntable = document.querySelector("#assigntable");
			assigntable.innerHTML = "";
			
			assignNeedAddList();
			assignNeedCancelList();
					
		})
		;
		
	}
	
	
	// 이거 100줄이 전체 배정필요한 리스트 출력
	function assignNeedAddList(){
		//배정이 필요한 리스트
		fetch("./assignNeedAddList")
		.then(response => response.json())
		.then(response => {
			
			for(e of response.data){
				// 템플릿 클론 생성(가상) 클론노드시 아이디값이랑 다 복사해서 가져오는지..?
				const templete = document.querySelector("#listTemplete").cloneNode(true);
				// 가상 템플릿 숨김제거
				templete.classList.remove("d-none");
				templete.setAttribute("id","addList");
				
				//템플릿 복사완료
				const studentname = templete.querySelector("#studentname");
				
				
				studentname.innerText = e.studentInfoDto.name;
				
				// 템플릿에서 <td id="dormInfo">를 찾음 결국엔 여기에다 붙여야하는게 맞음..
				const dormInfo = templete.querySelector("#dormInfo");
				dormInfo.innerText = "";
				
				
				// 동 리스트를 가져와서 셀렉트바에 전부 넣을거임
				fetch("./buildingInfoList")
					.then(response => response.json())
					.then(response => {
						// select바 생성
						const selectbar = document.createElement("select");
						selectbar.classList.add("form-select");
						
						// 여기서 셀렉트가 바뀌면서 selectbar2가 변경이 되어줘야함
						selectbar.setAttribute("onchange","selectoption("+ 'this' +")");
						selectbar.setAttribute("id","dongList")
						
						for(ee of response.data){
							// option 생성해서 셀렉트 바에 붙임
							const dongElement = document.createElement("option");
							dongElement.setAttribute("value",ee.dorm_pk);
							dongElement.innerText = ee.name;
							selectbar.appendChild(dongElement);
							
						}
						
						dormInfo.appendChild(selectbar);
						
					});
				
				
				
				// 룸정보 셀렉트를 만듬 => 똑같이 템플릿에 붙일거임
				const dormroomInfo = templete.querySelector("#dormroomInfo");
				dormroomInfo.innerText="";
				
				fetch("./hoInfoList")
					.then(response => response.json())
					.then(response => {
						// 셀렉트바 생성
						const selectbar2 = document.createElement("select");
						selectbar2.classList.add("angry");
						selectbar2.classList.add("form-select");
						// 
						selectbar2.setAttribute("id","hoList");
						
						for(e of response.data){
							// 호실 정보 옵션 추가
							const dongElement = document.createElement("option");
							dongElement.setAttribute("value",e.dorm_room_pk);
							dongElement.innerText = e.room_name;
							selectbar2.appendChild(dongElement);
							dormroomInfo.appendChild(selectbar2);
						}
						
					});
				// 템플릿에 다 갖다붙임
				templete.appendChild(dormInfo);
				templete.appendChild(dormroomInfo);
				
				// 가상의 템플릿을 존재하는 테이블 assigntable 갖다붙임 
				const assigntable = document.querySelector("#assigntable");
				assigntable.appendChild(templete);
				
				// 배정하기일때는 버튼이 배정으로 바뀌어야함. => 안에있는 태그를 삭제시키고 생성시킬까..? 요소 바꾸기 힘들다
				const buttonchange = templete.querySelector("#buttonchange");
				buttonchange.innerHTML = "";
				
				// 그냥 buttonchange 안에 있는 내용을 날려버리고 태그생성해서 만듬
				// % 여기 배정 버튼 링크를 모달링크로 할거임
				const change = document.createElement("a");
				change.innerText = "배정";
				// 12.12 이거 누르면 모달창으로 이동하는데 값을 넘겨줘야
				change.setAttribute("onclick","submitExe("+ 'this' +")");
				change.classList.add("btn-primary", "btn");
				buttonchange.appendChild(change);
				templete.appendChild(buttonchange);	
				
			}	
				
					
		})
		;
	}
	// 이거 셀렉트 옵션 바꿔주는거
	function selectoption(element){
		// 밸류값 잘넘어오는거 확인완료
		const thisvalue = element.value;
		//밑에코드는 id = listTemplete 현재 정보의 테이블이 나오고
		const listTemplete = element.closest(".listTemplete");
		const dormroomInfo = listTemplete.querySelector("#dormroomInfo .angry");
		
		// 안에 요소 다 날려버리고 다시 나오도록 해야함..!
		// dormroomInfo 안에 옵션값들을 넣어줄건데 넣는건 fetch안쪽에서
		dormroomInfo.innerHTML = "";
		
		//이거 그냥여기서 엘리먼트 날려서 동pk에 해당하는 애들만출력하자..
		fetch("./selectList?dorm_pk=" + thisvalue)
		.then(response => response.json())
		.then(response => {
			
			for(e of response.data){
				// 옵션셋을 여기서 해주면됨 사뿐사뿐~
				const optionset = document.createElement("option");
				optionset.innerText = e.room_name;
				optionset.setAttribute("value",e.dorm_room_pk);
				dormroomInfo.appendChild(optionset);
				
				
			}
			
			
			
			
		});
		
		
		
	}
	
	function assignNeedCancelList(){
		//배정이 완료된 리스트
		
		
		fetch("./assignNeedCancelList")
		.then(response => response.json())
		.then(response => {
			
			// 클론노드 붙일곳
			
			
			for(e of response.data){
				
				//템플릿 클론시켜서 여긴 동 호수 반복문 돌릴필요가 없음!! 배정이아님.
				const templete = document.querySelector("#listTemplete").cloneNode(true);
				templete.classList.remove("d-none");
				templete.setAttribute("id","cancelList");
				// 학생키값을 날려줘야되서 input hidden 타입으로 넘겨줄거 (더쉬운방법으로함..)
				
				//const student_pk = document.createElement("input");
				//student_pk.setAttribute("id","studentPk");
				//student_pk.setAttribute("type","hidden");
				//student_pk.setAttribute("value", e.studentInfoDto.student_pk);
				//templete.appendChild(student_pk);
				const studentname = templete.querySelector("#studentname");
				studentname.innerText = e.studentInfoDto.name;
				const dormInfo = templete.querySelector("#dormInfo");
				dormInfo.innerText = e.dormBuildingDto.name;
				const dormroomInfo = templete.querySelector("#dormroomInfo");
				dormroomInfo.innerText = e.dormRoomDto.room_name;
				// 말도안되는짓함..
				// dormroomInfo.setAttribute("value",e.dormRoomDto.dorm_room_pk);
				const change = templete.querySelector("#buttonchange .change");
				change.setAttribute("onclick","assignCancel("+ e.dormStudentDto.dorm_student_pk +")");
				
				// 갖다가 붙임
				const assigntable = document.querySelector("#assigntable");
				assigntable.appendChild(templete);
				
			}
			
			
			
					
		})
		;
	}
	
	//랜더링 부분 미배정 , 배정완료 => 끝
	
	//미배정
	function roomAssignmentY(){
		// 초기화먼저
		const assigntable = document.querySelector("#assigntable");
		assigntable.innerHTML = "";
		// 미배정 리스트만 출력
		assignNeedAddList();
		
		const button1 = document.querySelector("#button1");
		button1.removeAttribute("style");
		const bbutton1 = document.querySelector("#button1 .bbutton1");
		bbutton1.setAttribute("style","color: black;");
		// 미배정 백그라운드 컬러가 블랙이어야함
		const button2 = document.querySelector("#button2");
		button2.setAttribute("style","background-color: black;");
		const bbutton2 = document.querySelector("#button2 .bbutton2");
		bbutton2.setAttribute("style","color: white;");
		const button3 = document.querySelector("#button3");
		button3.removeAttribute("style");
		const bbutton3 = document.querySelector("#button3 .bbutton3");
		bbutton3.setAttribute("style","color: black;");
		
		
		
	}
	
	//배정완료
	function roomAssignmentN(){
		
		const assigntable = document.querySelector("#assigntable");
		assigntable.innerHTML = "";
		
		assignNeedCancelList();
		
		const button1 = document.querySelector("#button1");
		button1.removeAttribute("style");
		const bbutton1 = document.querySelector("#button1 .bbutton1");
		bbutton1.setAttribute("style","color: black;");
		// 배정완료 백그라운드 컬러가 블랙이어야함
		const button3 = document.querySelector("#button3");
		button3.setAttribute("style","background-color: black;");
		const bbutton3 = document.querySelector("#button3 .bbutton3");
		bbutton3.setAttribute("style","color: white;");
		
		const button2 = document.querySelector("#button2");
		button2.removeAttribute("style");
		const bbutton2 = document.querySelector("#button2 .bbutton2");
		bbutton2.setAttribute("style","color: black;");
		
	}
	
	//전체
	function roomAssignmentAll(){
		
		const assigntable = document.querySelector("#assigntable");
		assigntable.innerHTML = "";
		
		assignNeedAddList();
		assignNeedCancelList();
		
		const button3 = document.querySelector("#button3");
		button3.removeAttribute("style");
		const bbutton3 = document.querySelector("#button3 .bbutton3");
		bbutton3.setAttribute("style","color: black;");
		// 전체 백그라운드 컬러가 블랙이어야함
		const button1 = document.querySelector("#button1");
		button1.setAttribute("style","background-color: black;");
		const bbutton1 = document.querySelector("#button1 .bbutton1");
		bbutton1.setAttribute("style","color: white;");
		
		const button2 = document.querySelector("#button2");
		button2.removeAttribute("style");
		const bbutton2 = document.querySelector("#button2 .bbutton2");
		bbutton2.setAttribute("style","color: black;");
		
	}
	
	window.addEventListener("DOMContentLoaded", ()=> {
		//바로실행
		assignNeedAddList();
		assignNeedCancelList();
		
	});
	
	
</script>
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
				<div id="button1" class="col border py-4 mx-2 rounded border-dark btn text-center" onclick="roomAssignmentAll()" style="background-color: black;">
					<div class="row">
						<div class="bbutton1 col ms-2 fw-bold" style="color: white;">
							전체
						</div>
					</div>
				</div>
				<div id="button2" class="col border py-4 mx-2 rounded border-dark btn text-center" onclick="roomAssignmentY()">
					<div class="row">
						<div class="bbutton2 col ms-2 fw-bold">
							미배정
						</div>
					</div>
				</div>
                <div id="button3" class="col border py-4 mx-2 rounded border-dark btn text-center" onclick="roomAssignmentN()">
					<div class="row">
						<div class="bbutton3 col ms-2 fw-bold">
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
						<tbody id="assigntable"><!-- ajax 들어가서 배정하기를 하기 -->
							
						</tbody>
					</table>
				</div>
			</div>
			
		</div> <!-- 우측내용 col 끝 -->
            
        
	</div> <!-- main row 끝 -->
	<div id="modal" class="modal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">호실 배정</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>정말로 배정하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          
          <button onclick="assignmentComplete()" type="button" class="btn btn-primary">배정완료</button>
        </div>
      </div>
    </div>
  </div>

</div>
							<table>
								<tr id="listTemplete" class="listTemplete d-none">
									<td id="studentname">이름 (기본 반복문)</td>
									<td id="dormInfo">동 (반복문안에 반복문 콜백함수사용)</td>	
	                                <td id="dormroomInfo">호수(반복문안에 반복문 똑같이 콜백함수)</td>
									<td id="buttonchange"><a onclick="assignCancel()" class="change btn btn-danger" role="button">배정취소</a></td>
								</tr>
							</table>
							
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>