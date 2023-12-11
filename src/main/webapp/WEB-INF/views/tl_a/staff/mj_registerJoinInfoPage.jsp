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
	let sessionStaffId = null;
	
	// 세션 정보 가져오기
	function getSessionStaffId(){

		fetch("./getSessionStaffId")		// HTTP 요청
		.then(response => response.json())		// 서버의 응답을 JSON 형식으로 변환
		.then(response => {
			sessionStaffId = response.data.sessionSaffId;		// JSON 형식으로 변환된 응답에서 데이터를 추출하여 sessionInfo 변수에 저장
		});
	}
	
	// 정보 등록
	function registerJoinInfo(){
		
		if(sessionStaffId == null){
			
			if(confirm("로그인 후 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?")){
				
				location.href = "./loginPage"
				// 사용자가 "확인"을 선택했다면, 
				// 현재 페이지를 로그인 페이지로 이동시키기 위해 location.href를 변경
			} 
			
			return;
			// 로그인 페이지로 이동하게 되면 함수를 종료
			// 만약 사용자가 "취소"를 선택했거나 이미 로그인되어 있는 상태라면 함수가 계속 실행됨
			// 여러 이유로 인해 함수 실행이 종료되어야 할 때는 return;을 사용하는 것이 깔끔한 방법!!		
		}
		
		// 입력된 값 모으기(body로 간결하게 보내보자) == map이랑 비슷한뎅?
		const inputJoinInfo = new FormData();
		
		inputJoinInfo.append("title", document.getElementById("title").value);
		inputJoinInfo.append("detail_expln", document.getElementById("detail_expln").value);
		inputJoinInfo.append("apply_start_date", document.getElementById("apply_start_date").value);
		inputJoinInfo.append("apply_end_date", document.getElementById("apply_end_date").value);
		inputJoinInfo.append("selection_amount", document.getElementById("selection_amount").value);
		inputJoinInfo.append("pass_anncm_date", document.getElementById("pass_anncm_date").value);
		inputJoinInfo.append("payment_start_date", document.getElementById("payment_start_date").value);
		inputJoinInfo.append("payment_end_date", document.getElementById("payment_end_date").value);
		inputJoinInfo.append("asgnm_anncm_date", document.getElementById("asgnm_anncm_date").value);
		inputJoinInfo.append("join_dorm_date", document.getElementById("join_dorm_date").value);
		
		
		const url = "./mj_registerInfoProcess";
		
		fetch(url, {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: new URLSearchParams(inputJoinInfo)
			// new URLSearchParams() : FormData 객체를 이 형식으로 변환하여 서버로 전송하기 적절한 형태로 만들어 줌
			// FormData에 "title" 키와 해당 값이 "example"일 때, 변환된 문자열은 "title=example"가 됨!!!
			// new FormData() 안쓸거면 body: "text=" + commentValue + "&article_id=" + articleId 이렇게 해도됨
		})
		.then(response => response.json())		// 응답받는 방식 : json
		.then(response => mj_readRegisterJoinInfoPage());		// 서버쪽 갔다와서 해야할 일들

	}
	

	// 공고 등록 탭 보여주기
	function mj_registerJoinInfoPage(){
		
		// 양식
		const firstRow = document.querySelector(".firstRow");
		const secondRow = document.querySelector(".secondRow");
		const thirdRow = document.querySelector(".thirdRow");
		thirdRow.innerHTML = "";
		
		// 공통 제목/탭 가져오기
		const commonTitle = document.querySelector(".commonTitle");
		const commonTabs = document.querySelector(".commonTabs");
		
		// 양식에 붙여주고
		for (e of commonTitle.children) {
			firstRow.appendChild(e);
		}
		
		for (e of commonTabs.children) {
			secondRow.appendChild(e);
		}
		
		 
		// 탭 전체가져와서 --> 이때 clone을 안하면 다른 탭으로 이동할 때 원본 manageInfoTab의 innerHTML이 삭제됨!!!!! 중요****
		const manageInfoTab = document.getElementById("manageInfoTab").cloneNode(true);
		
		// manageInfoTab의 모든 하위 요소를 가져옴
		const allChildElements = manageInfoTab.querySelectorAll(".info");

		// 그 하위내용(= child들)을 돌면서 tabContent에 추가
		for(e of allChildElements){
			thirdRow.appendChild(e);
		}
		
	
		// 해당 탭만 active되게
		const tab1 = document.getElementById("tab1");
		tab1.classList.add("active");  
		
		const tab2 = document.getElementById("tab2");
		tab2.classList.remove("active");  
		
	}
	
	
	
	// 조회/수정 탭 보여주기
	function mj_readRegisterJoinInfoPage(){
		
		readJoinInfoList();

		// 양식
		const firstRow = document.querySelector(".firstRow");
		const secondRow = document.querySelector(".secondRow");
		const thirdRow = document.querySelector(".thirdRow");
		thirdRow.innerHTML = "";
		
		// 공통 제목/탭 가져오기
		const commonTitle = document.querySelector(".commonTitle");
		const commonTabs = document.querySelector(".commonTabs");
		
		// 양식에 붙여주고
		for (e of commonTitle.children) {
			firstRow.appendChild(e);
		}
		for (e of commonTabs.children) {
			secondRow.appendChild(e);
		}
		
		// 탭 전체가져와서 --> 이때 clone을 안하면 다른 탭으로 이동할 때 원본 manageInfoTab의 innerHTML이 삭제됨!!!!! 중요****
		const readAndUpdateInfoTab = document.getElementById("readAndUpdateInfoTab").cloneNode(true);

		// 그 하위내용(= child들)을 돌면서 tabContent에 추가
		for (e of readAndUpdateInfoTab.children) {
			thirdRow.appendChild(e);
		}
		
		// 해당 탭만 active되게
		const tab1 = document.getElementById("tab1");
		tab1.classList.remove("active");  
		
		const tab2 = document.getElementById("tab2");
		tab2.classList.add("active");  

	}
	
	
	// 공고 목록 가져오기
	function readJoinInfoList() {
		
		const url = "./getRegisterJoinInfo"
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const joinInfoListBox = document.querySelector(".joinInfoListBox");
			joinInfoListBox.innerHTML = "";		// 딱 이순간에만 허용한다했던! 초기화 시키고 나서 append해야 중복 배제할거잖아.
			
			// 입주공고 전체 리스트
            const infoList = response.data.infoList;
			
			// 공고 개수
			const countInfoList = response.data.countInfoList;
			document.querySelector(".countInfoList").innerText = "검색결과 (총 " + countInfoList + " 개)";
			
         	// 학년도/학기 정보 들어있는 map
            const thisSemesterJoinDormInfo = response.data.thisSemesterJoinDormInfo;

         	
			// 돌아보자!!!
			for(e of infoList){
				
				// 반복문 돌면서 계속 양식 복사할거임
				const joinInfoWrapper = document.querySelector(".joinInfoWrapper").cloneNode(true);
				
				// innerText로 반복문 돌면서 내용 변경하기
				// joinInfoWrapper.querySelector(".year").innerText = thisSemesterJoinDormInfo.thisSemesterDto.semester_year;
				//	--> 이렇게 실행하면 <span class="semester">xx학기</span>가 삭제되잖아!!!!!!! 그니까 이거 뒤에 실행이 안되지...
				joinInfoWrapper.querySelector(".year").innerHTML = 
				    thisSemesterJoinDormInfo.thisSemesterDto.semester_year +
				    '<span class="semester">xx학기</span>'; 
				    
				joinInfoWrapper.querySelector(".year .semester").innerText = thisSemesterJoinDormInfo.thisSemesterDto.semester;

				joinInfoWrapper.querySelector(".title").innerText = e.title;
				// ** json에서 날짜는 항상 숫자로 리턴된다.. date api있당!
				let date = new Date(e.apply_end_date);
				joinInfoWrapper.querySelector(".apply_end_date").innerText = date.getFullYear() + "-" + addLeadingZero(date.getMonth()+1) + "-" + addLeadingZero(date.getDate());	
				
				joinInfoWrapper.querySelector(".selection_amount").innerText = e.selection_amount;
				
				date = new Date(e.pass_anncm_date);
				joinInfoWrapper.querySelector(".pass_anncm_date").innerText = date.getFullYear() + "-" + addLeadingZero(date.getMonth()+1) + "-" + addLeadingZero(date.getDate());	
				date = new Date(e.payment_end_date);
				joinInfoWrapper.querySelector(".payment_end_date").innerText = date.getFullYear() + "-" + addLeadingZero(date.getMonth()+1) + "-" + addLeadingZero(date.getDate());	
				date = new Date(e.asgnm_anncm_date);
				joinInfoWrapper.querySelector(".asgnm_anncm_date").innerText = date.getFullYear() + "-" + addLeadingZero(date.getMonth()+1) + "-" + addLeadingZero(date.getDate());	
				date = new Date(e.join_dorm_date);
				joinInfoWrapper.querySelector(".join_dorm_date").innerText = date.getFullYear() + "-" + addLeadingZero(date.getMonth()+1) + "-" + addLeadingZero(date.getDate());	

				// 다 만들었으면 어디에 붙일래
				joinInfoListBox.appendChild(joinInfoWrapper);
			
			}
			
			
		});
		
	}
	
	// 숫자를 문자열로 변환하고 한 자리 숫자에 0을 붙임	--> 23-08-03 으로 나오게
	function addLeadingZero(number) {
	    return number < 10 ? '0' + number : '' + number;
	}
	
	
	
	
	// 페이지의 DOM이 로드되면 실행될 함수 등록!! 
	//	--> 함수가 실행이 안되면 값을 못 가져오는거...
	window.addEventListener("DOMContentLoaded", () => {
		getSessionStaffId();	
		mj_registerJoinInfoPage();
		mj_readRegisterJoinInfoPage
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
		<div class="tabContent col mx-5">
			<div class="firstRow row my-3"></div>
			
			<div class="row mt-2">
				<div class="secondRow col"></div>
			</div>
			
			<div class="row">
				<div class="thirdRow col mx-3"></div>
			</div>
			
		</div> <!-- 우측내용 col 끝 -->
            
        
	</div> <!-- main row 끝 -->
</div>

<!-- 공통 제목/탭 -->
<div class="commons d-none">
	<!-- 카테고리명 -->
	<div class="commonTitle">
		<div class="col fs-4 fw-bold">
			공고 관리
		</div>
	</div>
	
	<!-- 카테고리 -->
	<div class="commonTabs">
		<div class="col fw-bold text-center py-2 mb-3">
			<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a id="tab1" class="nav-link text-black" onclick="mj_registerJoinInfoPage()">공고 등록</a>
			  </li>
			  <li class="nav-item">
			    <a id="tab2" class="nav-link text-black" onclick="mj_readRegisterJoinInfoPage()">조회/수정</a>
			  </li>
			</ul>
		</div>
	</div>
</div>


<!-- 공고등록 탭 -->
<div id="manageInfoTab" class="d-none">
	<!-- 기숙사명 -->
	<div class="info row border rounded p-3">
		<div class="col">
			<div class="row">
				<div class="col fs-5 fw-bold">
					제목
				</div>
			</div>
			<div class="row">
				<div class="col my-2">
					<input class="form-control" id="title" type="text" placeholder="제목을 입력해주세요.">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상세설명 -->
	<div class="info row mt-3 border rounded p-3">
		<div class="col">
			<div class="row">
				<div class="col fs-5 fw-bold">
					상세 내용
				</div>
			</div>
			<div class="row">
				<div class="col my-2">
					<textarea class="form-control" id="detail_expln" placeholder="내용을 입력해주세요."></textarea>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 신청 시작일 -->
	<div class="info row mt-3 border rounded p-3">
		<div class="col">
			<div class="row">
				<div class="col fs-5 fw-bold">
					신청 시작일
				</div>
			</div>
			<div class="row">
				<div class="col my-2">
					<input class="form-control" id="apply_start_date" type="date">
				</div>
			</div>
		</div>
		
		<div class="col">
			<div class="row">
				<div class="col fs-5 fw-bold">
					신청 종료일
				</div>
			</div>
			<div class="row">
				<div class="col my-2">
					<input class="form-control" id="apply_end_date" type="date">
				</div>
			</div>
		</div>
	</div>			
	
	<!-- 선발인원 -->
	<div class="info row mt-3 border rounded p-3">
		<div class="col">
			<div class="row">
				<div class="col fs-5 fw-bold">
					선발 인원
				</div>
			</div>
			<div class="row">
				<div class="col my-2">
					<input class="form-control" id="selection_amount" type="text" placeholder="선발 인원을 정수로 입력해주세요.">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 합격자발표 -->
	<div class="info row mt-3 border rounded p-3">
		<div class="col">
			<div class="row">
				<div class="col fs-5 fw-bold">
					합격자 발표일
				</div>
			</div>
			<div class="row">
				<div class="col my-2">
					<input class="form-control" id="pass_anncm_date" type="date">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 관비납부시작일 -->
	<div class="info row mt-3 border rounded p-3">
		<div class="col">
			<div class="row">
				<div class="col fs-5 fw-bold">
					관비 납부 시작일
				</div>
			</div>
			<div class="row">
				<div class="col my-2">
					<input class="form-control" id="payment_start_date" type="date">
				</div>
			</div>
		</div>
		
		<div class="col">
			<div class="row">
				<div class="col fs-5 fw-bold">
					관비 납부 종료일
				</div>
			</div>
			<div class="row">
				<div class="col my-2">
					<input class="form-control" id="payment_end_date" type="date">
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 배정통보일 -->
	<div class="info row mt-3 border rounded p-3">
		<div class="col">
			<div class="row">
				<div class="col fs-5 fw-bold">
					배정 통보일
				</div>
			</div>
			<div class="row">
				<div class="col my-2">
					<input class="form-control" id="asgnm_anncm_date" type="date">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 입주일 -->
	<div class="info row mt-3 border rounded p-3">
		<div class="col">
			<div class="row">
				<div class="col fs-5 fw-bold">
					입주일
				</div>
			</div>
			<div class="row">
				<div class="col my-2">
					<input class="form-control" id="join_dorm_date" type="date">
				</div>
			</div>
		</div>
	</div>
				
	<!-- 제출 -->
	<div class="info row mt-3 mb-5">
		<div class="col px-0">
			<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary me-1"> &nbsp;&nbsp; 취소 &nbsp;&nbsp;</button>
			<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary me-1">미리보기</button>
			<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary">중간저장</button>
		</div>			
		<div class="col-5"></div>
        <div class="col px-0 text-end">
			<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary">임시 저장</button>
        	<button onclick="registerJoinInfo()" class="rounded-0 fw-bold btn btn-lg btn-secondary text-white ms-1">정보 등록</button>
        </div>                    
    </div>
    <input class="info" type="hidden" name="seller_id" value="${sessionSeller.id }">	
</div>

<!-- 조회/수정 탭 -->
<div id="readAndUpdateInfoTab" class="d-none">

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
			                            <label class="form-check-label" for="inlineRadio2">진행중</label>
			                        </div>
			                    </div>
			                    <div class="col text-start">
			                        <div class="form-check form-check-inline">
			                            <input class="form-check-input" type="radio" name="1" value="" >
			                            <label class="form-check-label" for="inlineRadio3">종료</label>
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
			
			<!-- 상품목록 -->
			<div class="row mt-4 py-3 justify-content-between">
				<div class="col-6">
					<span class="countInfoList">검색결과 (총 x 개)</span>
					<button type="button" class="ms-5 px-3 border-secondary-subtle rounded-0 px-0 fw-bold btn btn-sm btn-light">
           				<i class="bi bi-download"></i>
           				공고 목록 다운로드
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
			      <th scope="col" class="col text-bg-light">제목</th>
			      <th scope="col" class="col text-bg-light">신청 종료일</th>
			      <th scope="col" class="col text-bg-light">선발 인원</th>
			      <th scope="col" class="col text-bg-light">합격자 발표일</th>
			      <th scope="col" class="col text-bg-light">관비 납부 종료일</th>
			      <th scope="col" class="col text-bg-light">배정 통보일</th>
			      <th scope="col" class="col text-bg-light">입주일</th>
			      <th scope="col" class="text-bg-light">수정</th>
			      <th scope="col" class="text-bg-light">삭제</th>
			    </tr>
			  </thead>
			  <tbody class="joinInfoListBox">
			    <!-- template로 옮김 -->  
			  </tbody>
			</table>
			
		</div>
	</div>

</div>

<!-- 입주공고 리스트 템플릿 -->
<table id="template" class="d-none">
	<tr class="joinInfoWrapper">
      <td class="p-0 px-1 pt-1 text-center">
	    <div class="form-check m-0 p-0 d-inline-block">
	        <input class="form-check-input m-0 p-0" type="checkbox" value="" id="flexCheckDefault">
	        <label class="form-check-label" for="flexCheckDefault">
	        </label>
	    </div>
	  </td>
	  <td class="year">xx년도 
	  	<span class="semester">xx학기</span>
	  </td>
	  <td class="title">제목</td>
	  <td class="apply_end_date">날짜</td>
	  <td class="selection_amount">x명</td>
	  <td class="pass_anncm_date">날짜</td>
	  <td class="payment_end_date">날짜</td>
	  <td class="asgnm_anncm_date">날짜 </td>
	  <td class="join_dorm_date">날짜</td>
	  <td>
	  	<button id="update" type="button" class="fw-bold rounded-0 btn btn-secondary btn-sm mb-1">수정</button>
	  </td>
	  <td>
	    <button id="delete" type="button" class="fw-bold rounded-0 btn btn-danger btn-sm mb-1">삭제</button>
	  </td>
    </tr>	
</table>


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>













