<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Insert title here</title>


<script>

	let sessionStaffId = null;
	
	// 세션정보 가져오기
	function getSessionStaffId(){
		
		fetch("./getSessionStaffId")
		.then(response => response.json())
		.then(response => {
			sessionStaffId = response.data.sessionSaffId;
		});		
	}
	
	// 해당 탭만 active되게
	function activeTab(tabNum) {
		
		// 모든 탭 초기화
	    const tabs = document.querySelectorAll("#tabs > *");

	    tabs.forEach(tab => {
	        tab.classList.remove("bg-primary", "text-white");
	    });
		
		const tab = document.getElementById(tabNum);
		tab.classList.add("bg-primary", "text-white"); 
	}
	

	// 납부현황 탭 보여주기
	function mj_managePaymentPage(){
		
		miniMap();
		
		// 리스트 들고오는 함수
		getPaymentAllList();
		
		// 양식
		const secondRow = document.querySelector("#secondRow");

		// 세부내용
		const firstTab = document.querySelectorAll("#firstTab > *");
		for (e of firstTab) {
			secondRow.appendChild(e);
		}
		
		// 해당 탭만 active되게
		activeTab("tab1");
		
	}
	
	// 선발완료 목록(= 납부전체) 가져오기
	function getPaymentAllList(){
		
		const url = "./getPaymentList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const paymentInfoListBox = document.querySelector("#paymentInfoListBox");
			paymentInfoListBox.innerHTML = "";
			
			// 선발완료 전체리스트
			const dormSelectedList = response.data.dormSelectedList;
			
			// 학년도/학기 정보 들어있는 map
            const thisSemesterJoinDormInfo = response.data.thisSemesterJoinDormInfo;

			// 선발완료 개수
			const countDormSelectedList = response.data.countDormSelectedList;
			document.querySelector("#countApplyList").innerText = "검색결과 (총 " + countDormSelectedList + " 개)";
			document.querySelector("#num1").innerText = countDormSelectedList;
			

			for(e of dormSelectedList){
				
				// 반복문 돌면서 계속 양식 복사!
				const paymentInfoWrapper = document.querySelector(".paymentInfoWrapper").cloneNode(true);
				
				// innerText로 반복문 돌면서 내용 변경하기
				paymentInfoWrapper.querySelector(".semester_year").innerHTML = 
					thisSemesterJoinDormInfo.thisSemesterDto.semester_year +
				    '<span class="semester">xx학기</span>'; 
			    paymentInfoWrapper.querySelector(".semester_year .semester").innerText = thisSemesterJoinDormInfo.thisSemesterDto.semester;
			    paymentInfoWrapper.querySelector(".studentName").innerText = e.studentInfo.name;
			    paymentInfoWrapper.querySelector(".studentYear").innerText = e.studentYear;
			    paymentInfoWrapper.querySelector(".student_id").innerText = e.studentInfo.student_id;
			    paymentInfoWrapper.querySelector(".departmentName").innerText = e.departmentInfo.name ;
			    paymentInfoWrapper.querySelector(".address").innerText = e.studentInfo.address;
			    paymentInfoWrapper.querySelector(".priority_select").innerText = e.selectedDto.priority_select;
				
			    paymentInfoListBox.appendChild(paymentInfoWrapper);
				
				// 버튼
				const chooseBox = paymentInfoWrapper.querySelector(".chooseBox"); // 현재 반복에서 .chooseBox 찾기
				
				// 기존 내용 초기화 --> 안해주면 버튼이 계속 쌓이겠지...
				chooseBox.innerHTML = "";
				
				const paymentStatus = e.selectedDto.payment_status;

				const button = document.createElement("button");
				button.type = "button";
				button.classList.add("fw-bold", "rounded-0", "btn", "btn-sm", "mb-1", "d-grid", "mx-2");

			   
			    if (paymentStatus == "N") {
			        // 결제 안된 경우
			        button.classList.add("btn-primary");
			        button.textContent = "납부확인";

			        // 클릭하면 납부 프로세스 실행 
		            button.setAttribute("onclick", "mj_updatePaymentStatusProcess("+ e.selectedDto.dorm_application_pk +", 'Y', 1)");
					
			    } else if (paymentStatus == "Y") {
			        // 결제 완료된 경우
			        button.classList.add("btn-secondary");
			        button.textContent = "납부완료";
			        button.disabled = true;
			    }

		        chooseBox.appendChild(button);

			}
			
			
		});
		
		
	}
	
	// 납부완료 탭 보여주기
	function mj_managePaymentYesPage(){
		
		miniMap();
		
		// 리스트 들고오는 함수
		getPaymentYesList();
		
		// 양식
		const secondRow = document.querySelector("#secondRow");

		// 세부내용
		const firstTab = document.querySelectorAll("#firstTab > *");
		for (e of firstTab) {
			secondRow.appendChild(e);
		}
		
		// 해당 탭만 active되게
		activeTab("tab2");
	
	}
	
	// 납부완료 목록 가져오기
	function getPaymentYesList(){
		
		const url = "./getPaymentList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const paymentInfoListBox = document.querySelector("#paymentInfoListBox");
			paymentInfoListBox.innerHTML = "";
			
			// 납부완료 전체리스트
			const paymentYesList = response.data.paymentYesList;
			
			// 학년도/학기 정보 들어있는 map
            const thisSemesterJoinDormInfo = response.data.thisSemesterJoinDormInfo;

			// 납부완료 개수
			const countPaymentYesList = response.data.countPaymentYesList;
			document.querySelector("#countApplyList").innerText = "검색결과 (총 " + countPaymentYesList + " 개)";
			
			for(e of paymentYesList){
				
				// 반복문 돌면서 계속 양식 복사!
				const paymentInfoWrapper = document.querySelector(".paymentInfoWrapper").cloneNode(true);
				
				// innerText로 반복문 돌면서 내용 변경하기
				paymentInfoWrapper.querySelector(".semester_year").innerHTML = 
					thisSemesterJoinDormInfo.thisSemesterDto.semester_year +
				    '<span class="semester">xx학기</span>'; 
			    paymentInfoWrapper.querySelector(".semester_year .semester").innerText = thisSemesterJoinDormInfo.thisSemesterDto.semester;
			    paymentInfoWrapper.querySelector(".studentName").innerText = e.studentInfo.name;
			    paymentInfoWrapper.querySelector(".studentYear").innerText = e.studentYear;
			    paymentInfoWrapper.querySelector(".student_id").innerText = e.studentInfo.student_id;
			    paymentInfoWrapper.querySelector(".departmentName").innerText = e.departmentInfo.name ;
			    paymentInfoWrapper.querySelector(".address").innerText = e.studentInfo.address;
			    paymentInfoWrapper.querySelector(".priority_select").innerText = e.paymentYesDto.priority_select;
				
			    paymentInfoListBox.appendChild(paymentInfoWrapper);
				
				// 버튼
				const chooseBox = paymentInfoWrapper.querySelector(".chooseBox"); // 현재 반복에서 .chooseBox 찾기
				
				// 기존 내용 초기화 --> 안해주면 버튼이 계속 쌓이겠지...
				chooseBox.innerHTML = "";
				
				const paymentStatus = e.paymentYesDto.payment_status;

				const button = document.createElement("button");
				button.type = "button";
				button.classList.add("fw-bold", "rounded-0", "btn", "btn-sm", "mb-1", "d-grid", "mx-2");

			   
			    if (paymentStatus == "Y") {
			        // 납부 완료된 경우
			        button.classList.add("btn-danger");
			        button.textContent = "납부취소";

			        // 클릭하면 납부 프로세스 실행 
		            button.setAttribute("onclick", "mj_updatePaymentStatusProcess("+ e.paymentYesDto.dorm_application_pk +", 'N', 2)");
					
			    } 

		        chooseBox.appendChild(button);

			}
			
			
		});
		
		
	}

	// 납부완료 탭 보여주기
	function mj_managePaymentNoPage(){
		
		miniMap();
		
		// 리스트 들고오는 함수
		getPaymentNoList();
		
		// 양식
		const secondRow = document.querySelector("#secondRow");

		// 세부내용
		const firstTab = document.querySelectorAll("#firstTab > *");
		for (e of firstTab) {
			secondRow.appendChild(e);
		}
		
		// 해당 탭만 active되게
		activeTab("tab3");
	
	}
	
	// 미납부 목록 가져오기
	function getPaymentNoList(){
		
		const url = "./getPaymentList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const paymentInfoListBox = document.querySelector("#paymentInfoListBox");
			paymentInfoListBox.innerHTML = "";
			
			// 미납부 전체리스트
			const paymentNoList = response.data.paymentNoList;
			
			// 학년도/학기 정보 들어있는 map
            const thisSemesterJoinDormInfo = response.data.thisSemesterJoinDormInfo;

			// 납부완료 개수
			const countPaymentNoList = response.data.countPaymentNoList;
			document.querySelector("#countApplyList").innerText = "검색결과 (총 " + countPaymentNoList + " 개)";
			
			for(e of paymentNoList){
				
				// 반복문 돌면서 계속 양식 복사!
				const paymentInfoWrapper = document.querySelector(".paymentInfoWrapper").cloneNode(true);
				
				// innerText로 반복문 돌면서 내용 변경하기
				paymentInfoWrapper.querySelector(".semester_year").innerHTML = 
					thisSemesterJoinDormInfo.thisSemesterDto.semester_year +
				    '<span class="semester">xx학기</span>'; 
			    paymentInfoWrapper.querySelector(".semester_year .semester").innerText = thisSemesterJoinDormInfo.thisSemesterDto.semester;
			    paymentInfoWrapper.querySelector(".studentName").innerText = e.studentInfo.name;
			    paymentInfoWrapper.querySelector(".studentYear").innerText = e.studentYear;
			    paymentInfoWrapper.querySelector(".student_id").innerText = e.studentInfo.student_id;
			    paymentInfoWrapper.querySelector(".departmentName").innerText = e.departmentInfo.name ;
			    paymentInfoWrapper.querySelector(".address").innerText = e.studentInfo.address;
			    paymentInfoWrapper.querySelector(".priority_select").innerText = e.paymentNoDto.priority_select;
				
			    paymentInfoListBox.appendChild(paymentInfoWrapper);
				
				// 버튼
				const chooseBox = paymentInfoWrapper.querySelector(".chooseBox"); // 현재 반복에서 .chooseBox 찾기
				
				// 기존 내용 초기화 --> 안해주면 버튼이 계속 쌓이겠지...
				chooseBox.innerHTML = "";
				
				const paymentStatus = e.paymentNoDto.payment_status;

				const button = document.createElement("button");
				button.type = "button";
				button.classList.add("fw-bold", "rounded-0", "btn", "btn-sm", "mb-1", "d-grid", "mx-2");

			   
			    if (paymentStatus == "N") {
			        // 미납부 경우
			        button.classList.add("btn-primary");
			        button.textContent = "납부확인";

			        // 클릭하면 납부 프로세스 실행 
		            button.setAttribute("onclick", "mj_updatePaymentStatusProcess("+ e.paymentNoDto.dorm_application_pk +", 'Y', 3)");
					
			    } 

		        chooseBox.appendChild(button);

			}
			
			
		});
		
		
	}
	
	function miniMap(){
		
		const url = "./getPaymentList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const countDormSelectedList = response.data.countDormSelectedList;
			document.querySelector("#num1").innerText = countDormSelectedList;
			
			const countPaymentYesList = response.data.countPaymentYesList;
			document.querySelector("#num2").innerText = countPaymentYesList;
			
			const countPaymentNoList = response.data.countPaymentNoList;
			document.querySelector("#num3").innerText = countPaymentNoList;
		});
		
	}
	
	
	// 납부 프로세스
	function mj_updatePaymentStatusProcess(dormApplicationPk, paymentStatus, pageNum){
		
		
		if(sessionStaffId == null){
			
			if(confirm("로그인 후 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?")){
				
				location.href = "./loginPage"
			} 
			return;	
		}
		
		
		const url = "./mj_updatePaymentStatusProcess?payment_status="+ paymentStatus +"&dorm_application_pk=" + dormApplicationPk;

		// fetch를 통해 POST 요청 전송
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			if(paymentStatus == 'Y'){
				if(pageNum == 1){
					mj_managePaymentPage();
				}else if(pageNum == 2){
					mj_managePaymentYesPage();
				}else if(pageNum == 3){
					mj_managePaymentNoPage();
				}
			}else if(paymentStatus == 'N'){
				
				if(pageNum == 1){
					mj_managePaymentPage();
				}else if(pageNum == 2){
					mj_managePaymentYesPage();
				}else if(pageNum == 3){
					mj_managePaymentNoPage();
				}
			}
			
			
		});
		
	}




	// 페이지의 DOM이 로드되면 실행될 함수 등록!! 
	//	--> 함수가 실행이 안되면 값을 못 가져오는거...
	window.addEventListener("DOMContentLoaded", () => {
		getSessionStaffId();	
		mj_managePaymentPage();
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
		
			<!-- 제목/탭 -->
			<div class="row">
				<div class="col my-3 fs-4 fw-bold">
					납부 관리
				</div>
			</div>
		
			<!-- 카테고리 -->
			<div class="row">
				<div class="col mt-2 fw-bold text-center px-2 py-2 mb-3">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active text-black" onclick="mj_managePaymentPage()">납부 현황</a>
					  </li>
					</ul>
				</div>
			</div>
			
			<!-- 세부내용 -->
			<div class="row">
				<div id="secondRow" class="col">
				
				</div>
			</div>
			
	<!-- 복붙할 내용 모음 -->
		<!-- row2 -->
		<div id="firstTab" class="d-none">
			<!-- 세부내용 시작 -->			
			<div class="row">
				<div class="col">
					<!-- 미니맵 -->
					<div id="tabs" class="row">
						<div id="tab1" onclick="mj_managePaymentPage()" class="col border py-4 mx-2 rounded">
							<div class="row">
								<div class="col ms-2">
									전체
								</div>
							</div>
							
							<div class="row mt-2">
								<div class="col ms-2">
									<span id="num1" class="fs-5 fw-bold"></span>건
								</div>
							</div>
						</div>
						<div id="tab2" onclick="mj_managePaymentYesPage()" class="col border py-4 mx-2 rounded">
							<div class="row">
								<div class="col ms-2">
									납부 완료
								</div>
							</div>
							
							<div class="row mt-2">
								<div class="col ms-2">
									<span id="num2" class="fs-5 fw-bold"></span>건
								</div>
							</div>
						</div>
						<div id="tab3" onclick="mj_managePaymentNoPage()" class="col border py-4 mx-2 rounded">
							<div class="row">
								<div class="col ms-2">
									미납부
								</div>
							</div>
							<div class="row mt-2">
								<div class="col ms-2">
									<span id="num3" class="fs-5 fw-bold"></span>건
								</div>
							</div>
						</div>					
						<div class="col-7"></div>
					</div>
					
					
					<!-- 상품목록 -->
					<div class="row mt-4 py-3 justify-content-between">
						<div id="countApplyList" class="col-6">
							검색결과 (총 x개)
							<button type="button" class="ms-5 px-3 border-secondary-subtle rounded-0 px-0 fw-bold btn btn-sm btn-light">
		           				<i class="bi bi-download"></i>
		           				납부 목록 다운로드
		           			</button>
						</div>
						<div class="col-2 me-1 justify-content-end">
							<select class="form-select mx-1 form-select-sm rounded-0" aria-label="Default select example">
							  <option selected>내림차순</option>
							  <option value="1">오름차순</option>
							</select>
						</div>
					</div>
					
					<!-- 표 -->
					<table class="table table-bordered p-0 text-center align-middle">
					  <thead>
					    <tr class="align-middle border-bottom border-2">
					      <th scope="col" class="col text-bg-light"></th>
					      <th scope="col" class="col-2 text-bg-light">학년도/학기</th>
					      <th scope="col" class="col-1 text-bg-light">이름</th>
					      <th scope="col" class="col-1 text-bg-light">학년</th>
					      <th scope="col" class="col-2 text-bg-light">학번</th>
					      <th scope="col" class="col-1 text-bg-light">학과</th>
					      <th scope="col" class="col-2 text-bg-light">주소</th>
					      <th scope="col" class="col-1 text-bg-light">우선선발</th>
					      <th scope="col" class="col text-bg-light">납부여부</th>
					    </tr>
					  </thead>
					  
					  <tbody id="paymentInfoListBox">
					   		    
					  </tbody>
					</table>
				</div>
				
				<!-- 납부현황 리스트 -->
				<table id="paymentInfoTemplate" class="d-none">
				 <tr class="paymentInfoWrapper">
			      <td class="p-0 pt-1 text-center">
				    <div class="form-check m-0 px-1 d-inline-block">
				        <input class="form-check-input m-0 p-0" type="checkbox" value="" id="flexCheckDefault">
				        <label class="form-check-label" for="flexCheckDefault">
				        </label>
				    </div>
				  </td>
				  <td class="semester_year">
				  	<span class="semester"></span>
				  </td>
				  <td class="studentName"></td>
				  <td class="studentYear"></td>
				  <td class="student_id"></td>
				  <td class="departmentName"></td>
				  <td class="address"></td>
				  <td class="priority_select"></td>
				  <td class="chooseBox d-grid"></td>
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