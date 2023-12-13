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

	let sessionStaffId = null;
	
	// 세션정보 가져오기
	function getSessionStaffId(){
		
		fetch("./getSessionStaffId")
		.then(response => response.json())
		.then(response => {
			sessionStaffId = response.data.sessionSaffId;
		});		
	}
	
	// 신청현황 탭 보여주기
	function mj_readApplyDormInfoPage(){
		
		// 리스트 들고오는 함수
		readApplyDormInfoList();
		
		// 양식
		const firstRow = document.querySelector("#firstRow");
		const secondRow = document.querySelector("#secondRow");

		// 제목/탭
		const commons = document.querySelectorAll("#commons > *");
		for (e of commons) {
			firstRow.appendChild(e);
		}
		
		// 세부내용
		const firstTab = document.querySelectorAll("#firstTab > *");
		for (e of firstTab) {
			secondRow.appendChild(e);
		}
		
		
		// 해당 탭만 active되게
		const tab1 = document.getElementById("tab1");
		tab1.classList.add("active");  
		
		const tab2 = document.getElementById("tab2");
		tab2.classList.remove("active"); 
		
	}

	// 선발현황 탭 보여주기
	function mj_readSelectedDormStudentPage(){
		
		// 리스트 들고오는 함수
		readSelectedDormStudentList();
		
		// 양식
		const firstRow = document.querySelector("#firstRow");
		const secondRow = document.querySelector("#secondRow");

		// 제목/탭
		const commons = document.querySelectorAll("#commons > *");
		for (e of commons) {
			firstRow.appendChild(e);
		}
		
		// 세부내용
		const firstTab = document.querySelectorAll("#firstTab > *");
		for (e of firstTab) {
			secondRow.appendChild(e);
		}
		
		
		// 해당 탭만 active되게
		const tab1 = document.getElementById("tab1");
		tab1.classList.remove("active");  
		
		const tab2 = document.getElementById("tab2");
		tab2.classList.add("active"); 
		
	}
	
	// 신청 목록 가져오기
	function readApplyDormInfoList(){
		
		const url = "./getApplyDormInfoList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const applyDormInfoListBox = document.querySelector("#applyDormInfoListBox");
			applyDormInfoListBox.innerHTML = "";
			
			// 입사신청 전체리스트
			const applyList = response.data.applyList;
			
			// 학년도/학기 정보 들어있는 map
            const thisSemesterJoinDormInfo = response.data.thisSemesterJoinDormInfo;

			// 입사신청 개수
			const countApplyList = response.data.countApplyList;
			document.querySelector("#countApplyList").innerText = "검색결과 (총 " + countApplyList + " 개)";
			
			// 검색조건 변경
			const processEnd = document.querySelector("#processEnd");
			processEnd.innerText = "선발 완료";
			
			// 다운로드 버튼 변경
			const downloadButton = document.querySelector("#downloadButton");
			downloadButton.innerText = "신청 목록 다운로드";
			
			
			for(e of applyList){
				
				// 반복문 돌면서 계속 양식 복사!
				const applyDormInfoWrapper = document.querySelector(".applyDormInfoWrapper").cloneNode(true);
				
				// innerText로 반복문 돌면서 내용 변경하기
				applyDormInfoWrapper.querySelector(".semester_year").innerHTML = 
					thisSemesterJoinDormInfo.thisSemesterDto.semester_year +
				    '<span class="semester">xx학기</span>'; 
				applyDormInfoWrapper.querySelector(".semester_year .semester").innerText = thisSemesterJoinDormInfo.thisSemesterDto.semester;
				applyDormInfoWrapper.querySelector(".studentName").innerText = e.studentInfo.name;
				applyDormInfoWrapper.querySelector(".studentYear").innerText = e.studentYear;
				applyDormInfoWrapper.querySelector(".student_id").innerText = e.studentInfo.student_id;
				applyDormInfoWrapper.querySelector(".departmentName").innerText = e.departmentInfo.name ;
				applyDormInfoWrapper.querySelector(".address").innerText = e.studentInfo.address;
				applyDormInfoWrapper.querySelector(".priority_select").innerText = e.applyInfo.priority_select;
				
				applyDormInfoListBox.appendChild(applyDormInfoWrapper);
				
				// 버튼
				const chooseBox = applyDormInfoWrapper.querySelector(".chooseBox"); // 현재 반복에서 .chooseBox 찾기
				
				// 기존 내용 초기화 --> 안해주면 버튼이 계속 쌓이겠지...
				chooseBox.innerHTML = "";
				
				const selectionStatus = e.applyInfo.selection_status;

		        const button = document.createElement("button");
		        button.type = "button";
		        button.classList.add("fw-bold", "rounded-0", "btn", "btn-sm", "mb-1", "d-grid", "mx-2");

		        if (selectionStatus == "N") {
		            // 선발 가능한 상태
		            button.classList.add("btn-primary");
		            button.textContent = "선발하기";

		            // 클릭하면 선발 프로세스 실행 
		            button.setAttribute("onclick", "mj_selectDormStudentProcess("+ e.applyInfo.dorm_application_pk +", 'Y')");
					
		            
		            
		        } else if(selectionStatus == "Y") {
		            // 선발 완료 상태
		            button.classList.add("btn-secondary");
		            button.textContent = "선발완료";
		            button.disabled = true;
		        }

		        chooseBox.appendChild(button);

			}
			
			
		});
		
		
	}
	
	// 선발 목록 가져오기
	function readSelectedDormStudentList(){
		
		const url = "./getSelectedDormStudentList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const applyDormInfoListBox = document.querySelector("#applyDormInfoListBox");
			applyDormInfoListBox.innerHTML = "";
			
			// 선발완료 전체리스트
			const dormSelectedList = response.data.dormSelectedList;
			
			// 학년도/학기 정보 들어있는 map
            const thisSemesterJoinDormInfo = response.data.thisSemesterJoinDormInfo;

			// 선발완료 개수
			const countDormSelectedList = response.data.countDormSelectedList;
			document.querySelector("#countApplyList").innerText = "검색결과 (총 " + countDormSelectedList + " 개)";
			
			// 검색조건 변경
			const processEnd = document.querySelector("#processEnd");
			processEnd.innerText = "취소 불가";
			
			// 다운로드 버튼 변경
			const downloadButton = document.querySelector("#downloadButton");
			downloadButton.innerText = "선발 목록 다운로드";
			
			for(e of dormSelectedList){
				
				// 반복문 돌면서 계속 양식 복사!
				const applyDormInfoWrapper = document.querySelector(".applyDormInfoWrapper").cloneNode(true);
				
				// innerText로 반복문 돌면서 내용 변경하기
				applyDormInfoWrapper.querySelector(".semester_year").innerHTML = 
					thisSemesterJoinDormInfo.thisSemesterDto.semester_year +
				    '<span class="semester">xx학기</span>'; 
				applyDormInfoWrapper.querySelector(".semester_year .semester").innerText = thisSemesterJoinDormInfo.thisSemesterDto.semester;
				applyDormInfoWrapper.querySelector(".studentName").innerText = e.studentInfo.name;
				applyDormInfoWrapper.querySelector(".studentYear").innerText = e.studentYear;
				applyDormInfoWrapper.querySelector(".student_id").innerText = e.studentInfo.student_id;
				applyDormInfoWrapper.querySelector(".departmentName").innerText = e.departmentInfo.name ;
				applyDormInfoWrapper.querySelector(".address").innerText = e.studentInfo.address;
				applyDormInfoWrapper.querySelector(".priority_select").innerText = e.selectedDto.priority_select;
				
				applyDormInfoListBox.appendChild(applyDormInfoWrapper);
				
				// 버튼
				const chooseBox = applyDormInfoWrapper.querySelector(".chooseBox"); // 현재 반복에서 .chooseBox 찾기
				
				// 기존 내용 초기화 --> 안해주면 버튼이 계속 쌓이겠지...
				chooseBox.innerHTML = "";
				
				const selectionStatus = e.selectedDto.selection_status;
				const paymentStatus = e.selectedDto.payment_status;

				const button = document.createElement("button");
				button.type = "button";
				button.classList.add("fw-bold", "rounded-0", "btn", "btn-sm", "mb-1", "d-grid", "mx-2");

			    // 선발 완료 상태
			    if (paymentStatus == "N") {
			        // 결제 안된 경우
			        button.classList.add("btn-danger");
			        button.textContent = "선발취소";

			        // 클릭하면 선발 프로세스 실행 
		            button.setAttribute("onclick", "mj_selectDormStudentProcess("+ e.selectedDto.dorm_application_pk +", 'N')");
					
			    } else if (paymentStatus == "Y") {
			        // 결제 완료된 경우
			        button.classList.add("btn-secondary");
			        button.textContent = "취소불가";
			        button.disabled = true;
			    }

		        chooseBox.appendChild(button);

			}
			
			
		});
		
		
	}
	
	
	
	
	// 선발 프로세스
	function mj_selectDormStudentProcess(dormApplicationPk, selectionStatus){
		
		if(sessionStaffId == null){
			
			if(confirm("로그인 후 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?")){
				
				location.href = "./loginPage"
			} 
			return;	
		}
		
		const url = "./mj_selectDormStudentProcess?selection_status="+ selectionStatus +"&dorm_application_pk=" + dormApplicationPk;

		// fetch를 통해 POST 요청 전송
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			if(selectionStatus == 'Y'){
				readApplyDormInfoList();	// 수정되는 순간 reload해서 사용자에게 보여주기
			}else if(selectionStatus == 'N'){
				readSelectedDormStudentList();
			}
			
		});
		
	}
	
	
	
	
	// 페이지의 DOM이 로드되면 실행될 함수 등록!! 
	//	--> 함수가 실행이 안되면 값을 못 가져오는거...
	window.addEventListener("DOMContentLoaded", () => {
		getSessionStaffId();	
		mj_readApplyDormInfoPage();
	});

</script>

</head>
<body>
<div class="container-fluid">
	<!-- 최상단 -->
	<jsp:include page="../commons/staff/topNavi.jsp"></jsp:include>
	
	<!-- 내용시작 -->
	<div class="row">
		<!-- 좌측 카테고리 -->
		<jsp:include page="../commons/staff/leftCategory.jsp"></jsp:include>
		
		<!-- 우측내용 -->
		<div class="col mx-5">
		
			<!-- 제목/탭 -->
			<div class="row">
				<div id="firstRow" class="col">
				
				</div>
			</div>
			
			<!-- 세부내용 -->
			<div class="row">
				<div id="secondRow" class="col">
				
				</div>
			</div>
			
		</div>
		
	</div>	
</div>
<!-- container끝 -->	
	
	<!-- 복붙할 내용 모음 -->
		<!-- row1 -->
		<div id="commons" class="d-none">
			<!-- 제목/탭 -->
			<div class="row">
				<div class="col my-3 fs-4 fw-bold">
					선발 관리
				</div>
			</div>
			
			<!-- 카테고리 -->
			<div class="row">
				<div class="col mt-2 fw-bold text-center px-2 py-2 mb-3">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a id="tab1" class="nav-link text-black" onclick="mj_readApplyDormInfoPage()">신청 현황</a>
					  </li>
					  <li class="nav-item">
					    <a id="tab2" class="nav-link text-black" onclick="mj_readSelectedDormStudentPage()">선발 현황</a>
					  </li>
					</ul>
				</div>
			</div>
		</div>
		
		
		<!-- row2 -->
		<div id="firstTab" class="d-none">
		
			<!-- 세부내용 시작 -->			
			<div class="row">
				<div class="col">
				
					<!-- 상품 주요 정보 -->
					<div class="row mb-3">
						<div class="col fs-5 fw-bold">
							검색조건
						</div>
					</div>
					<div class="row">
						<div class="col border rounded-0 mx-2" style="background-color: #eeeeee;">
							<div class="row border-bottom py-2">
								<div class="col-2 text-center align-self-center fw-bold">
									기준일
								</div>
								<div class="col align-self-center">
									<!-- 버튼들 -->
					            	<div class="row">
					            		<div class="col-2 text-end">
											<select class="border-secondary-subtle form-select mx-1 form-select-sm rounded-0" aria-label="Default select example">
											  <option selected>학년도</option>
											  <option value="1">학기</option>
											</select>
										</div>
					            		<div class="col-2 align-self-center">
					            			<input type="date" class="border border-secondary-subtle form-control rounded-0 py-1" style="font-size: 0.9rem; color: #aaaaaa">
					            		</div> ~ 
					            		<div class="col-2 align-self-center">
					            			<input type="date" class="border-secondary-subtle form-control rounded-0 py-1" style="font-size: 0.9rem; color: #aaaaaa">
					            		</div>
					            	</div>
								</div>
							</div>
							<div class="row border-bottom py-2">
								<div class="col-2 text-center align-self-center fw-bold">
									진행 상태
								</div>
								<div class="col ms-2">
									<div class="row">
										 <div class="col text-start">
					                        <div class="form-check form-check-inline">
					                            <input class="form-check-input" type="radio" name="1" value="" checked>
					                            <label class="form-check-label" for="inlineRadio1">전체</label>
					                        </div>                                
					                    </div>
					                    <div class="col text-start">
					                        <div class="form-check form-check-inline">
					                            <input class="form-check-input" type="radio" name="1" value="">
					                            <label id="processIng" class="form-check-label" for="inlineRadio2">진행중</label>
					                        </div>
					                    </div>
					                    <div class="col text-start">
					                        <div class="form-check form-check-inline">
					                            <input class="form-check-input" type="radio" name="1" value="" >
					                            <label id="processEnd" class="form-check-label" for="inlineRadio3">선발 완료</label>
					                        </div>
					                    </div>
					                    <div class="col-7"></div>
									</div>
								</div>
							</div>
							<div class="row border-bottom py-2">
								<div class="col-2 text-center align-self-center fw-bold">
									우선선발 여부
								</div>
								<div class="col ms-2">
									<div class="row">
										 <div class="col text-start">
					                        <div class="form-check form-check-inline">
					                            <input class="form-check-input" type="radio" name="2" value="" checked>
					                            <label class="form-check-label" for="inlineRadio1">전체</label>
					                        </div>                                
					                    </div>
					                    <div class="col text-start">
					                        <div class="form-check form-check-inline">
					                            <input class="form-check-input" type="radio" name="2" value="">
					                            <label class="form-check-label" for="inlineRadio2">Y</label>
					                        </div>
					                    </div>
					                    <div class="col text-start">
					                        <div class="form-check form-check-inline">
					                            <input class="form-check-input" type="radio" name="2" value="" >
					                            <label class="form-check-label" for="inlineRadio3">N</label>
					                        </div>
					                    </div>
					                    <div class="col-7"></div>
									</div>
								</div>
							</div>
							
							<div class="row py-2 justify-content-center">
			            		<div class="col-3 d-grid px-3">
			            			<button type="button" class="border-secondary-subtle rounded-0 px-0 fw-bold btn btn-sm btn-primary">
			            				<i class="bi bi-search"></i> 조회하기
			            			</button>
			            		</div>
			            		<div class="col-3 d-grid px-3">
			            			<button type="button" class="border-secondary-subtle rounded-0 px-0 fw-bold btn btn-sm btn-light">
			            				<i class="bi bi-arrow-clockwise"></i> 초기화
			            			</button>
			            		</div>
							</div>			
						</div>
					</div>
				</div>
			</div>
			<!-- 상품목록 -->
			<div class="row mt-4 py-3 justify-content-between">
				<div class="col-6">
					<span id="countApplyList">검색결과 (총 x개)</span>
					
					<button type="button" class="ms-5 px-3 border-secondary-subtle rounded-0 px-0 fw-bold btn btn-sm btn-light">
           				<i class="bi bi-download"></i>
           				<span id="downloadButton">신청 목록 다운로드</span>
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
					      <th scope="col" class="col text-bg-light">학년도/학기</th>
					      <th scope="col" class="col-1 text-bg-light">이름</th>
					      <th scope="col" class="col text-bg-light">학년</th>
					      <th scope="col" class="col-1 text-bg-light">학번</th>
					      <th scope="col" class="col text-bg-light">학과</th>
					      <th scope="col" class="col-3 text-bg-light">주소</th>
					      <th scope="col" class="col-1 text-bg-light">우선선발</th>
					      <th scope="col" class="col text-bg-light">선발여부</th>
					    </tr>
			  </thead>
			  <tbody id="applyDormInfoListBox">
			    <!-- template로 옮김 -->	    
			  </tbody>
			</table>
		</div>
		
		<!-- 입사신청 리스트 -->
		<table id="applyDormInfoTemplate" class="d-none">
		<tr class="applyDormInfoWrapper">
	      <td class="p-0 pt-1 text-center">
		    <div class="form-check m-0 p-0 d-inline-block">
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

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>