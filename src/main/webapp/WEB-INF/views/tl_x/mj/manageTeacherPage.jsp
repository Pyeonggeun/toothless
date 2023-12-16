<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%
	// 현재 날짜와 시간을 가져오기
	Date currentDate = new Date();
	
	// 날짜 포맷 지정
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	// 포맷에 맞게 날짜를 문자열로 변환
	String formattedDate = dateFormat.format(currentDate);
%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Insert title here</title>


<script>

	// 날짜 포맷
	function formatDate(date) {
	    var day = date.getDate();
	    var month = date.getMonth() + 1;
	    var year = date.getFullYear();
	
	    // 원하는 형식에 맞게 조합 (여기서는 YYYY-MM-DD 형식)
	    return year + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;
	}
	
	// 숫자를 문자열로 변환하고 한 자리 숫자에 0을 붙임	--> 날짜가 23-08-03 으로 나오게
	function addLeadingZero(number) {
	    return number < 10 ? '0' + number : '' + number;
	}
	
	
	// 복붙 양식
	function commonTemplate(){
		
		// 양식
		const firstRow = document.querySelector(".firstRow");
		const secondRow = document.querySelector(".secondRow");
		
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
	}
	
	
	// 정보 등록
	function registerTeacherInfo(){
		
		// 미입력 필드를 담을 배열
	    const emptyFields = [];

	    // 값이 비어있는지 확인
	    if (!document.getElementById("teacherName").value.trim()) {
	        emptyFields.push("이름을 입력해주세요.");
	    }
	    // ** radio
	    if (!document.querySelector('input[name="gender"]:checked')) {
		    emptyFields.push("성별을 선택해주세요.");
		}
	    if (!document.getElementById("birth").value.trim()) {
	        emptyFields.push("생년월일 입력해주세요.");
	    }
	    if (!document.getElementById("resident_id").value.trim()) {
	        emptyFields.push("주민등록번호를 입력해주세요.");
	    }
	    // ** selectBox
	    if (document.getElementById("external_pk").selectedIndex == 0) {
	        emptyFields.push("외부아이디를 선택해주세요.");
	    }
	    if (!document.getElementById("external_pk").value.trim()) {
	        emptyFields.push("외부아이디를 선택해주세요.");
	    }
	    if (!document.getElementById("address").value.trim()) {
	        emptyFields.push("주소를 입력해주세요.");
	    }
	    if (!document.getElementById("phone").value.trim()) {
	        emptyFields.push("전화번호를 입력해주세요.");
	    }
	    if (!document.getElementById("email").value.trim()) {
	        emptyFields.push("이메일을 입력해주세요.");
	    }
	    // ** checkBox
	    if (!document.querySelectorAll('input[name="lecture_category_key"]:checked').length > 0) {
		    emptyFields.push("강의 가능한 교육과정을 선택해주세요.");
		}
	    if (!document.getElementById("entered_at").value.trim()) {
	        emptyFields.push("입사일을 입력해주세요.");
	    }

	    
	    // 미입력 필드가 있다면 알림 표시
	    if (emptyFields.length > 0) {
		    const missingFieldsMessage = emptyFields[0];
		    alert(missingFieldsMessage);
		    return;
		}
	    

	    
		// 입력된 값 모으기(body로 간결하게 보내보자) == map이랑 비슷한뎅?
		const inputTeacherInfo = new FormData();
		
		
		// **체크박스 값넘기기
		 
	 	// 선택된 체크박스들의 값을 저장할 배열
	 	let selectedCategories = [];
	
	 	// 모든 체크박스를 확인, 선택된 체크박스의 값을 배열에 추가
	 	// --> input이니까 - id가 아니라 name으로 찾기~~ input에는 id를 못넣어요...^^;
	 	document.querySelectorAll('input[name="lecture_category_key"]:checked').forEach(e => selectedCategories.push(e.value));
	
	  	// 선택된 카테고리를 FormData에 추가
	  	selectedCategories.forEach(e => inputTeacherInfo.append("lecture_category_key", e));
		
		
		inputTeacherInfo.append("name", document.getElementById("teacherName").value);
		inputTeacherInfo.append("resident_id", document.getElementById("resident_id").value);
		inputTeacherInfo.append("birth", document.getElementById("birth").value);
		inputTeacherInfo.append("gender", document.querySelector('input[name="gender"]:checked').value);
		inputTeacherInfo.append("address", document.getElementById("address").value);
		inputTeacherInfo.append("phone", document.getElementById("phone").value);
		inputTeacherInfo.append("email", document.getElementById("email").value);
		inputTeacherInfo.append("entered_at", document.getElementById("entered_at").value);
		inputTeacherInfo.append("external_pk", document.getElementById("external_pk").value);		

		
		const url = "./registerTeacherProcess";
		
		fetch(url, {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: new URLSearchParams(inputTeacherInfo)
		})
		.then(response => response.json())	
		.then(response => manageTeacherInfoPage());		// 서버쪽 갔다와서 해야할 일들

	}
	
	
	// 전역변수 - 교육과정 리스트
	let lectureCategoryList;
	
	// 강사 등록 탭 보여주기
	function registerTeacherPage(){
		
		// 외부아이디 selectBox 내용(= 아직강사로 등록안된 아이디들, pk넘기려고)
		fetch("./getRegisterTeacherInfo")
		.then(response => response.json())
		.then(response => {
	
			// ** innerText는 렌더링된 텍스트를 기준으로 동작하며, 숨겨진 요소의 텍스트는 고려하지 않습니다. 
			// ** textContent는 모든 텍스트를 고려하므로 숨겨진 텍스트도 포함합니다.
			
			
			// 1. 아직 강사등록 안된 사람 리스트
			const notYetTeacherList = response.data.notYetTeacherList;
		
			// selectBox찾기
		    const selectBox = document.getElementById("external_pk");
			selectBox.innerHTML = "";
			
			//  <option selected>강사로 등록할 아이디를 선택하세요</option> 만들기
			const optionTag = document.createElement("option");
			optionTag.selected = true;
			optionTag.innerText = "강사로 등록할 아이디를 선택하세요";
			selectBox.add(optionTag);
			
			/*  만들기
			<c:forEach items="${notYetTeacherList}" var="item">
			  	<option value="${item.external_pk}">${item.external_id}</option>
			</c:forEach> 
			*/
			notYetTeacherList.forEach(item => {
		        const optionTag = document.createElement("option");
		        optionTag.value = item.external_pk;
		        optionTag.innerText = item.external_id;
		        selectBox.add(optionTag);
		    });
				
				
				
			// 2. 교육과정 리스트
			lectureCategoryList = response.data.lectureCategoryList;
			
			// checkBox찾기
			const checkBox = document.getElementById("checkBox");
			checkBox.innerHTML = "";
			
			/* 만들기
			<c:forEach items="${lectureCategoryList}" var="item">
				<div class="form-check form-check-inline">													        	
					<input class="form-check-input" type="checkbox" name="lecture_category_key" value="${item.lecture_category_key}">
					<label class="form-check-label">${item.category_name}</label>													            
				</div>
			</c:forEach>
			*/
			
			let count = 0;
			
			lectureCategoryList.forEach(item => {
				const divTag = document.createElement("div");
				divTag.classList.add("form-check", "form-check-inline");
			    
			    const inputTag = document.createElement("input");
			    inputTag.classList.add("form-check-input");
			    inputTag.type = "checkbox";
			    inputTag.name = "lecture_category_key";
			    inputTag.value = item.lecture_category_key;
			    
			    const labelTag = document.createElement("label");
			    labelTag.classList.add("form-check-label");
			    labelTag.innerText = item.category_name;
			    
			    divTag.appendChild(inputTag);
			    divTag.appendChild(labelTag);
			    
			    checkBox.appendChild(divTag);
			    
			    count++;
			    if (count == 9) {
			        checkBox.appendChild(document.createElement("br"));
			        count = 0; 
			    }
			    
			});
			
		});

		// 복붙 양식
		commonTemplate();
		const thirdRow = document.querySelector(".thirdRow");
		thirdRow.innerHTML = "";
		 
		// 탭 전체가져와서 --> 이때 clone을 안하면 다른 탭으로 이동할 때 원본 innerHTML이 삭제됨!!!!! 중요****
		const registerInfoTab = document.getElementById("registerInfoTab").cloneNode(true);
		
		// manageInfoTab의 모든 하위 요소를 가져옴
		const allChildElements = registerInfoTab.querySelectorAll(".info");

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
	
	
	
	// 강사 조회/수정 탭 보여주기
	function manageTeacherInfoPage(){

		// 이 함수가 실행되고나서 리스트를 가져오게해야 정보 등록 후에 그 정보를 들고 올 수 있을듯~ 
		readTeacherInfoList();
		
		// 복붙 양식
		commonTemplate();
		const thirdRow = document.querySelector(".thirdRow");
		thirdRow.innerHTML = "";
		
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
	
	// 검색조건 中 교육과정 checkBox로 반복문돌기
	function searchConditionByLectureList(){
		
		fetch("./getRegisterTeacherInfo")
		.then(response => response.json())
		.then(response => {
	
				// id="lectureCategory" 찾기
				const lectureCategory = document.getElementById("lectureCategory");
				lectureCategory.innerHTML = "";
				
				// 교육과정 리스트
				lectureCategoryList = response.data.lectureCategoryList;
				
				/* 만들기
				<c:forEach items="${lectureCategoryList}" var="item">
					<div class="form-check form-check-inline">													        	
						<input class="form-check-input" type="checkbox" name="lecture_category_key" value="${item.lecture_category_key}">
						<label class="form-check-label">${item.category_name}</label>													            
					</div>
				</c:forEach>
				*/
				
				let count = 0;
				
				lectureCategoryList.forEach(item => {
					const divTag = document.createElement("div");
					divTag.classList.add("form-check", "form-check-inline");
				    
				    const inputTag = document.createElement("input");
				    inputTag.classList.add("form-check-input");
				    inputTag.type = "checkbox";
				    inputTag.name = "lecture_category_key";
				    inputTag.value = item.lecture_category_key;
				    
				    const labelTag = document.createElement("label");
				    labelTag.classList.add("form-check-label");
				    labelTag.innerText = item.category_name;
				    
				    divTag.appendChild(inputTag);
				    divTag.appendChild(labelTag);
				    
				    lectureCategory.appendChild(divTag);
				    
				    count++;
				    if (count == 5) {
				    	lectureCategory.appendChild(document.createElement("br"));
				        count = 0; 
				    }
				    
				});
		});
				
	}
	
	
	// 강사 목록 가져오기
	function readTeacherInfoList() {

		fetch("./getAllTeacherInfoList")
		.then(response => response.json())
		.then(response => {
			
			const teacherInfoListBox = document.querySelector(".teacherInfoListBox");
			teacherInfoListBox.innerHTML = "";		// 딱 이순간에만 허용한다했던! 초기화 시키고 나서 append해야 중복 배제할거잖아.
			
			// 전체 리스트
			const allTeacherInfoList = response.data.allTeacherInfoList;
			// 전체 리스트 개수
			const countAllTeacher = allTeacherInfoList.length;
			document.querySelector(".countInfoList").innerText = "검색결과 (총 " + countAllTeacher + " 개)";
         	
			// 돌아보자!!!
			for(e of allTeacherInfoList){
				
				// 반복문 돌면서 계속 양식 복사할거임
				const teacherInfoWrapper = document.querySelector(".teacherInfoWrapper").cloneNode(true);
				
				// innerText로 반복문 돌면서 내용 변경하기
				teacherInfoWrapper.querySelector(".key").innerText = e.lecturerDto.lecturer_key;
				teacherInfoWrapper.querySelector(".name").innerText = e.lecturerDto.name;
				teacherInfoWrapper.querySelector(".phone").innerText = e.lecturerDto.phone;
				teacherInfoWrapper.querySelector(".email").innerText = e.lecturerDto.email;
				
				// **강사별 가능한 과목 리스트
				const possibleList = e.possibleLectuerList;

				let possibleText = ""; // 누적할 문자열 초기화해야지!!! 안그러면 다른강사꺼에 계속 누적...ㅎㅎ;;;;
				
				for (i of possibleList) {	// 돌면서 문자열에 추가,
					possibleText += i.category_name + ", ";
				}
				
				// 마지막에 추가된 쉼표+공백 제거하기
				possibleText = possibleText.slice(0, -2);
				
				// 붙이기
				teacherInfoWrapper.querySelector(".possible").innerText = possibleText;
		
				// 다 만들었으면 어디에 붙일래
				teacherInfoListBox.appendChild(teacherInfoWrapper);
			
			
			}
			
		});
		
	}
	
	// showModal로 key(=강사키)를 넘기기 위해서는 row를 onclick했을 때 그 줄의 key값을 가져와야함. 중간단계 필요!!
	function getSomeKey(event) {
		
	    // ** 이벤트(마우스/키보드..)가 발생한 요소에 대한 정보 가져오기
	    // --> table에서 <tr></tr> 안에서 <td>들이 반복문돌고있음
	    // --> 이벤트가 발생한 곳은 td일거고, 그 중 가장 가까운 tr을 찾으면 그 row전체가 찾아지겠지
	    // --> 사용자가 어디를 클릭해도 그 row를 찾을 수 있겠군!!!!!
	    const clickedRow = event.target.closest("tr");
	
	    const lecturerKey = clickedRow.querySelector(".key").innerText;
	
	    // showModal에 key넘겨주고, 찐 모달 show함수 호출!
	    showModal(lecturerKey);
	 }
	
	// ** 모달
	// --> BS에서 모달 골라서 맨~밑에 템플릿처럼 숨겨 놓고옴!
	
	// 1. 모달 보이게하기
    // --> 필요시 여기서 백엔드와 연동함... CSR
    // --> 부트스트랩 모달은 getOrCreateInstance로 select하자..!
    // --> 특정 ID(#writeModal)를 가진 모달 요소를 찾거나 생성한 후에 해당 모달을 화면에 표시하는 거임
    
    
    //** fetch밖에서도 사용할 수 있게 전역으로 선언...
    let someTeacherExternalInfo;	
    let someTeacherInfo;	
    
    function showModal(lecturerKey){
    	
    	// 리스트 들고오고나서 모달띄우면 이전 정보가 있겠지?
        const modal = bootstrap.Modal.getOrCreateInstance("#writeModal");
        modal.show();
    	
    	console.log(lecturerKey);

    	// 이전 입력 내용 
		fetch("./getSomeTeacherInfo?lecturer_key=" + lecturerKey)
		.then(response => response.json())
		.then(response => {

			// 특정강사 정보
			someTeacherInfo = response.data.someTeacherInfo;

			// 특정강사 가능 강의 리스트
			const possibleLectuerList = response.data.possibleLectuerList;
			
			// 특정강사 외부회원가입 정보
			someTeacherExternalInfo = response.data.someTeacherExternalInfo;
			
			
			
			// 모달내부 --> 이전에 등록된 정보로 변경하기.
			document.getElementById("nameModal").value = someTeacherInfo.name;
			document.getElementById("resident_idModal").value = someTeacherInfo.resident_id;
			document.getElementById("birthModal").value = formatDate(new Date(someTeacherInfo.birth));
			//document.getElementById("gender").value = someTeacherInfo.gender; --> M/F로만 나오고 라디오에 체크가 안되겠지...
			document.getElementById("addressModal").value = someTeacherInfo.address;
			document.getElementById("phoneModal").value = someTeacherInfo.phone;
			document.getElementById("emailModal").value = someTeacherInfo.email;
			document.getElementById("entered_atModal").value = formatDate(new Date(someTeacherInfo.entered_at));
			
			document.getElementById("register_atModal").innerText = formatDate(new Date(someTeacherInfo.created_at));
			// **1. innerText & value
			// innerText: 주로 HTML 요소의 텍스트 콘텐츠를 나타내는 속성입니다. 
			// ---> 주로 <div>, <span>, <p> 등의 블록 레벨 또는 인라인 요소에서 텍스트 내용을 가져오거나 설정할 때 사용됩니다.
			// ---> 텍스트를 표시하는 블록 레벨 요소!!
			// value: 주로 입력 요소에서 사용되는 속성으로, 사용자에게 값을 입력하거나 선택하게 할 때 사용됩니다. 
			// ---> 주로 <input>, <textarea>, <select> 등의 폼 요소에서 값에 접근하거나 값을 설정할 때 사용됩니다.
			// ---> 사용자 입력을 받는 폼 요소!!
			
			
			// **2. 이전정보 보여주려는게 라디오버튼으로 돼있을 때(ex. gender)
			if (someTeacherInfo.gender == "M") {
				  document.getElementById("radio1Modal").checked = true;
				} else if (someTeacherInfo.gender == "F") {
				  document.getElementById("radio2Modal").checked = true;
				}
			
			
			// **3. 이전정보 보여주려는게 셀렉트박스로 돼있을 때 - 이전에 선택한 정보를 checked, 다른거 선택도 할 수 있게....
	
			// 3-1. 이전에 선택한 정보는 checked, 아직강사로 등록안된 아이디들 셀렉트박스 내에 올라가게
			fetch("./getRegisterTeacherInfo")
			.then(response => response.json())
			.then(response => {
				
				// 아직 강사등록 안된 사람 리스트
				const notYetTeacherList = response.data.notYetTeacherList;
			
				// selectBox찾기
			    const selectBox = document.getElementById("external_pkModal");
				selectBox.innerHTML = "";
				
				//  <option selected>이전에 등록한 외부아이디정보 나오게</option> 만들기
				const optionTag = document.createElement("option");
				optionTag.value = someTeacherExternalInfo.external_pk;
				optionTag.innerText = someTeacherExternalInfo.external_id;
				
				selectBox.add(optionTag);		// 이전에 등록한 외부아이디 정보가 제일먼저 보이게!! 순서중요하당..
				
				/*  만들기
				<c:forEach items="${notYetTeacherList}" var="item">
				  	<option value="${item.external_pk}">${item.external_id}</option>
				</c:forEach> 
				*/
				notYetTeacherList.forEach(item => {
			        const optionTag = document.createElement("option");
			        optionTag.value = item.external_pk;
			        optionTag.innerText = item.external_id;

			        selectBox.add(optionTag);
			    });
				
			});


			// **4. 이전정보 보여주려는게 체크박스로 돼있을 때 - 이전에 선택한 정보를 checked, 다른거 선택도 할 수 있게....
			
			// checkBox찾기
			const checkBoxModal = document.getElementById("checkBoxModal");
			checkBoxModal.innerHTML = "";
			
			/* 만들기
			<c:forEach items="${lectureCategoryList}" var="item">
				<div class="form-check form-check-inline">													        	
					<input class="form-check-input" type="checkbox" name="lecture_category_key" value="${item.lecture_category_key}">
					<label class="form-check-label">${item.category_name}</label>													            
				</div>
			</c:forEach>
			*/
			
			lectureCategoryList.forEach(item => {
				const divTag = document.createElement("div");
				divTag.classList.add("form-check", "form-check-inline");
			    
			    const inputTag = document.createElement("input");
			    inputTag.classList.add("form-check-input");
			    inputTag.type = "checkbox";
			    inputTag.name = "lecture_category_key";
			    inputTag.value = item.lecture_category_key;
			    
			    // +++ 추가코드
			    // --> possibleLectuerList의 lecture_category_key와 현재 반복문돌고있느 아이템의 lecture_category_key 요소가 같다면 체크!!!!
			    possibleLectuerList.forEach(p => {
				   
					if(p.lecture_category_key == item.lecture_category_key){
						inputTag.checked = true;
					}
				   
			    });
    			// ====

			    const labelTag = document.createElement("label");
			    labelTag.classList.add("form-check-label");
			    labelTag.innerText = item.category_name;
			    
			    divTag.appendChild(inputTag);
			    divTag.appendChild(labelTag);
			    
			    checkBoxModal.appendChild(divTag);

			});
			
			// 수정 버튼
			const updateBtn = document.querySelector("#updateBtn")
			updateBtn.setAttribute("onclick", "saveBtn("+ someTeacherInfo.lecturer_key +")");
			
			// 삭제 버튼
			const deleteBtn = document.querySelector("#deleteBtn")
			deleteBtn.setAttribute("onclick", "deleteBtn("+ someTeacherInfo.lecturer_key +")");

		});
    	
    }

    // 2. 모달 내용 저장(수정하기)
    function saveBtn(lecturer_key){ 
    	console.log("모달에서 수정");
    	console.log(lecturer_key);
    	
    	// 입력된 값 모으기(body로 간결하게 보내보자) == map이랑 비슷한뎅?
		const inputTeacherInfo = new FormData();
    	 
	 	// 선택된 체크박스들의 값을 저장할 배열
	 	let selectedCategories = [];
	
	 	// 모든 체크박스를 확인, 선택된 체크박스의 값을 배열에 추가
	 	// --> input이니까 - id가 아니라 name으로 찾기~~ input에는 id를 못넣어요...^^;
	 	document.querySelectorAll('input[name="lecture_category_key"]:checked').forEach(e => selectedCategories.push(e.value));
	
	  	// 선택된 카테고리를 FormData에 추가
	  	selectedCategories.forEach(e => inputTeacherInfo.append("lecture_category_key", e));
		
		inputTeacherInfo.append("name", document.getElementById("nameModal").value);
		inputTeacherInfo.append("resident_id", document.getElementById("resident_idModal").value);
		inputTeacherInfo.append("birth", document.getElementById("birthModal").value);
		inputTeacherInfo.append("gender", document.querySelector('input[name="genderModal"]:checked').value);
		inputTeacherInfo.append("address", document.getElementById("addressModal").value);
		inputTeacherInfo.append("phone", document.getElementById("phoneModal").value);
		inputTeacherInfo.append("email", document.getElementById("emailModal").value);
		inputTeacherInfo.append("entered_at", document.getElementById("entered_atModal").value);
		inputTeacherInfo.append("external_pk", document.getElementById("external_pkModal").value);
		
		
		//const modal = bootstrap.Modal.getOrCreateInstance("#writeModal");
		
		const url = "./updateTeacherInfo?lecturer_key=" + lecturer_key;
		
		fetch(url, {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: new URLSearchParams(inputTeacherInfo)
		})
		.then(response => response.json())	
		.then(response => {
		    alert("정보 수정이 완료되었습니다.");
		    manageTeacherInfoPage();
		    bootstrap.Modal.getOrCreateInstance("#writeModal").hide();		// 수정 or 조회 끝났으면 모달 숨기기
		});
        
    }
	

	// 강사정보 삭제
	function deleteBtn(lecturer_key){
		
		if(confirm("해당 강사의 정보를 삭제하시겠습니까?")){
			
			const url = "./deleteTeacherInfo?lecturer_key="+ lecturer_key;

			// fetch를 통해 POST 요청 전송
			fetch(url)
			.then(response => response.json())
			.then(response => {
			    alert("정보 삭제가 완료되었습니다.");
			    manageTeacherInfoPage();
			    bootstrap.Modal.getOrCreateInstance("#writeModal").hide();		// 삭제 끝났으면 모달 숨기기
			});
		} 
		
		return;	
	}
	
	
	
	
	// 페이지의 DOM이 로드되면 실행될 함수 등록!! 
	//	--> 함수가 실행이 안되면 값을 못 가져오는거...
	window.addEventListener("DOMContentLoaded", () => {
		registerTeacherPage();
		searchConditionByLectureList();
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
			강사 관리
		</div>
	</div>
	
	<!-- 카테고리 -->
	<div class="commonTabs">
		<div class="col fw-bold text-center py-2 mb-3">
			<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a id="tab1" class="nav-link text-black" onclick="registerTeacherPage()">강사 등록</a>
			  </li>
			  <li class="nav-item">
			    <a id="tab2" class="nav-link text-black" onclick="manageTeacherInfoPage()">조회/수정</a>
			  </li>
			</ul>
		</div>
	</div>
</div>


<!-- 강사등록 탭 -->
<div id="registerInfoTab" class="d-none">
	<div class="info row">
    	<div class="col">
		<!-- 기숙사명 -->
		<div class="row border rounded-0 p-3 px-5">
			<div class="col">
				<div class="row text-center">
					<div class="col fw-bold fs-3 my-2">
						강사 채용 등록
					</div>
				</div>
				
				<!-- 강사 기본정보 -->
				<div class="row mt-2 ms-2">
					<div class="col fw-bold" style="font-size: 0.9em;">
						<i class="bi bi-dot"></i>강사 기본정보
						<span class="ms-3 text-danger" style="font-size: 0.8em;">*는 필수 입력사항입니다.</span>
					</div>
				</div>
				
				<!-- 정보/양식 -->
				<div class="row border border-dark rounded-0 m-3 mt-1 text-center">
					<div class="col">
						<div class="row border-top border-bottom border-dark">
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								<span class="text-danger" style="font-size: 0.8em;">*</span>이  름
							</div>
							<div class="col-4 py-2 border-end border-dark">
								<input class="d-grid border rounded-0" id="teacherName" type="text"></input>
							</div>
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								<span class="text-danger" style="font-size: 0.8em;">*</span>성  별
							</div>
							<div class="col-4 py-2 text-start">
								<input type="radio" name="gender" id="radio1" value="M">
								<label for="radio1">남성</label>
								<input class="ms-5" type="radio" name="gender" id="radio2" value="F">
								<label for="radio2">여성</label>
							</div>
						</div>
						<div class="row border-bottom border-dark">
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								<span class="text-danger" style="font-size: 0.8em;">*</span>생년월일
							</div>
							<div class="col-4 py-2 border-end border-dark d-grid">
								<input class="border rounded-0" id="birth" type="date">
							</div>
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								<span class="text-danger" style="font-size: 0.8em;">*</span>주민등록번호
							</div>
							<div class="col-4 py-2 d-grid">
								<input class=" border rounded-0" id="resident_id" type="text"></input>
							</div>
						</div>
						<div class="row border-bottom border-dark">
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								<span class="text-danger" style="font-size: 0.8em;">*</span>외부 아이디
							</div>
							<div class="col py-2 border-dark text-start">
								<select id="external_pk" class="form-select form-select-sm rounded-0">
								 <!-- 셀렉트박스 내부 -->
								</select>
							</div>
						</div>
						<div class="row border-bottom border-dark">
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								<span class="text-danger" style="font-size: 0.8em;">*</span>주  소
							</div>
							<div class="col py-2 border-dark d-grid">
								<input class=" border rounded-0" id="address" type="text"></input>
							</div>
						</div>
						<div class="row border-bottom border-dark">
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								<span class="text-danger" style="font-size: 0.8em;">*</span>전화번호
							</div>
							<div class="col-4 py-2 border-end border-dark d-grid">
								<input class="border rounded-0" id="phone" type="text"></input>
							</div>
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								<span class="text-danger" style="font-size: 0.8em;">*</span>이메일
							</div>
							<div class="col-4 py-2 d-grid">
								<input class="border rounded-0" id="email" type="text"></input>
							</div>
						</div>
						<div class="row border-bottom border-dark">
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								<span class="text-danger" style="font-size: 0.8em;">*</span>교육 과정
							</div>
							<!-- 등록된 카테고리에 따라 체크박스 반복문 필요 -->
							<div id="checkBox" class="col py-2 border-end text-start">
								<!-- 교육과정 리스트 -->
							</div>
						</div>
						<div class="row">
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								<span class="text-danger" style="font-size: 0.8em;">*</span>입사일
							</div>
							<div class="col-4 py-2 border-end border-dark d-grid">
								<input class="border rounded-0" id="entered_at" type="date">
							</div>
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								등록일
							</div>
							<div class="col-4 py-2 text-start">
								<%= formattedDate %>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 강사 학력정보 -->
				<div class="row mt-5 ms-2">
					<div class="col fw-bold" style="font-size: 0.9em;">
						<i class="bi bi-dot"></i>강사 학력정보
					</div>
				</div>
				
				<!-- 정보/양식 -->
				<div class="row border border-dark rounded-0 m-3 mt-1 text-center">
					<div class="col">
						<div class="row border-top border-bottom border-dark">
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								학  교
							</div>
							<div class="col-4 d-grid py-2 border-end border-dark">
								<input class="border rounded-0" type="text"></input>
							</div>
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								학  과
							</div>
							<div class="col-4 d-grid py-2">
								<input class="border rounded-0" type="text"></input>
							</div>
						</div>
						<div class="row">
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								학위번호
							</div>
							<div class="col-4 d-grid py-2 border-end border-dark">
								<input class="border rounded-0" type="text"></input>
							</div>
							<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
								졸업일자
							</div>
							<div class="col-4 d-grid py-2">
								<input class="border rounded-0" type="date">
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>

      </div>
  </div>
			
	<!-- 제출 -->
	<div class="info row mt-3 mb-5">
		<div class="col px-0">
			<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary me-1"> &nbsp;&nbsp; 취소 &nbsp;&nbsp;</button>
			<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary me-1">미리보기</button>
		</div>			
		<div class="col-5"></div>
        <div class="col px-0 text-end">
			<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary">임시 저장</button>
        	<button id="inputButton" onclick="registerTeacherInfo()" class="rounded-0 fw-bold btn btn-lg btn-secondary text-white ms-1">정보 등록</button>
        </div>                    
    </div>
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
							교육 과정
						</div>
						<div class="col ms-2">
							<div class="row">
								<div id="lectureCategory" class="col text-start">
								<!-- 반복문 -->
								</div>
							</div>
						</div>
					</div>
					
					<div class="row py-2 justify-content-center">
	            		<div class="col-3 d-grid px-3">
	            			<button type="button" class="border-secondary-subtle rounded-0 px-0 fw-bold btn btn-sm text-white" style="background-color: #003399;">
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
			<div class="row mt-4 pt-3 pb-2 justify-content-between">
				<div class="col">
					<span class="countInfoList">검색결과 (총 0 개)</span>
					<span style="font-size: 0.8rem" class="fw-light">
						목록 선택 후 상세 페이지에서 수정/삭제 할 수 있습니다.
					</span>
					<button type="button" class="ms-5 px-3 border-secondary-subtle rounded-0 px-0 fw-bold btn btn-sm btn-light">
           				<i class="bi bi-download"></i>
           				강사 목록 다운로드
           			</button>
				</div>
				<div class="col-2 me-1 justify-content-end">
					<select class="form-select mx-1 form-select-sm rounded-0" aria-label="Default select example">
					  <option selected>내림차순</option>
					  <option value="1">오름차순</option>
					</select>
				</div>
			</div>
			
	<!-- 		<div class="row">
				<div class="col text-end" style="font-size: 0.8em;">
					목록을 누르면 상세 페이지에서 수정/삭제를 할 수 있습니다.
				</div>
			</div> -->
			
			<!-- 표 -->
			<table class="table table-bordered p-0 text-center align-middle">
			  <thead>
			    <tr class="align-middle border-bottom border-2">
			      <th scope="col" class="col text-bg-light"></th>
			      <th scope="col" class="col text-bg-light">No.</th>
			      <th scope="col" class="col-2 text-bg-light">이름</th>
			      <th scope="col" class="col-2 text-bg-light">전화번호</th>
			      <th scope="col" class="col-2 text-bg-light">이메일</th>
			      <th scope="col" class="col text-bg-light">강의 가능한 교육과정</th>
			    </tr>
			  </thead>
			  <tbody onclick="getSomeKey(event)" class="teacherInfoListBox" style="cursor: pointer;">
			    <!-- template로 옮김 -->  
			  </tbody>
			</table>
			
		</div>
	</div>

</div>

<!-- 리스트 템플릿 -->
<table id="template" class="d-none">
	<tr class="teacherInfoWrapper">
      <td class="p-0 px-1 pt-1 text-center">
	    <div class="form-check m-0 p-0 d-inline-block">
	        <input class="form-check-input m-0 p-0" type="checkbox" value="" id="flexCheckDefault">
	        <label class="form-check-label" for="flexCheckDefault">
	        </label>
	    </div>
	  </td>
	  <td class="key">강사 번호</td>
	  <td class="name">이름</td>
	  <td class="phone">전화번호</td>
	  <td class="email">이메일</td>
	  <td class="possible text-start">강의 가능한 교육과정</td>
    </tr>	
</table>

<!-- 모달 - BS복붙해옴 -->
<!-- 다른 요소와의 간섭을 피하기 위해, container 바깥 && 맨밑에 넣어놓기... -->
<div id="writeModal" class="modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 600px; width: 100%;">
      <div class="modal-content">
        <div class="modal-header py-2" style="background-color: #003399;">
          <h5 class="modal-title fw-bold fs-5 text-white p-0">강사 정보</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body py-2">
        <!-- 강사 기본정보 -->
			<div class="row mt-2 ms-2">
				<div class="col fw-bold" style="font-size: 0.9em;">
					<i class="bi bi-dot"></i>강사 기본정보
					<span class="ms-3 text-danger" style="font-size: 0.8em;">*는 필수 입력사항입니다.</span>
				</div>
			</div>
          <!-- 정보/양식 -->
			<div id="modalForInfo" class="row border border-dark rounded-0 m-3 mt-1 text-center">
				<div class="col">
					<div class="row border-top border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>이  름
						</div>
						<div class="col py-2">
							<input class="d-grid border rounded-0" id="nameModal" type="text"></input>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>성  별
						</div>
						<div class="col py-2 text-start">
							<input type="radio" name="genderModal" id="radio1Modal" value="M">
							<label for="radio1Modal">남성</label>
							<input class="ms-5" type="radio" name="genderModal" id="radio2Modal" value="F">
							<label for="radio2Modal">여성</label>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>생년월일
						</div>
						<div class="col py-2 d-grid">
							<input class="border rounded-0" id="birthModal" type="date">
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>주민번호
						</div>
						<div class="col py-2 d-grid">
							<input class=" border rounded-0" id="resident_idModal" type="text"></input>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>아이디
						</div>
						<div class="col py-2 d-grid text-start">
							<select id="external_pkModal" class="form-select form-select-sm rounded-0">
							 <!-- 셀렉트박스 내부 -->
							</select>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>주  소
						</div>
						<div class="col py-2 d-grid text-start">
							<input class=" border rounded-0" id="addressModal" type="text"></input>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>전화번호
						</div>
						<div class="col py-2 d-grid">
							<input class="border rounded-0" id="phoneModal" type="text"></input>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>이메일
						</div>
						<div class="col py-2 d-grid">
							<input class="border rounded-0" id="emailModal" type="text"></input>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>교육과정
						</div>
						<!-- 등록된 카테고리에 따라 체크박스 반복문 필요 -->
						<div id="checkBoxModal" class="col py-2 border-end text-start">
							<!-- 교육과정 리스트 -->
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>입사일
						</div>
						<div class="col py-2 d-grid text-start">
							<input class="border rounded-0" id="entered_atModal" type="date">
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							등록일
						</div>
						<div class="col py-2 text-start" id="register_atModal">
							직접입력
						</div>
					</div>
				</div>
			</div> <!-- 강사 기본정보 끝 -->
				
			<!-- 강사 학력정보 -->
			<div class="row mt-5 ms-2">
				<div class="col fw-bold" style="font-size: 0.9em;">
					<i class="bi bi-dot"></i>강사 학력정보
				</div>
			</div>
			
			<!-- 정보/양식 -->
			<div class="row border border-dark rounded-0 m-3 mt-1 text-center">
				<div class="col">
					<div class="row border-top border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							학  교
						</div>
						<div class="col py-2 d-grid text-start">
							<input class="border rounded-0" type="text"></input>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							학  과
						</div>
						<div class="col py-2 d-grid">
							<input class="border rounded-0" type="text"></input>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							학위번호
						</div>
						<div class="col py-2 d-grid text-start">
							<input class="border rounded-0" type="text"></input>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-3 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							졸업일자
						</div>
						<div class="col py-2 d-grid">
							<input class="border rounded-0" type="date">
						</div>
					</div>
					
				</div>
			</div>
				
			
        </div>
        <div class="modal-footer d-flex justify-content-between">
            <button id="deleteBtn" type="button" class="btn btn-danger rounded-0">삭제하기</button>
            <div>
                <button id="updateBtn" type="button" class="btn btn-primary rounded-0 text-white" style="background-color: #003399;">수정완료</button>
                <button type="button" class="btn btn-secondary rounded-0" data-bs-dismiss="modal">닫기</button>
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













