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
	function registerLectureInfo(){

		// 미입력 필드를 담을 배열
	    const emptyFields = [];

	    // 값이 비어있는지 확인
	    
	    // ** radio - 교육과정정보
	    if (!document.querySelector('input[name="lecture_category_key"]:checked')) {
		    emptyFields.push("교육과정명을 선택해주세요.");
		}
	    
	    // 수업정보
	    if (!document.getElementById("lectureName").value.trim()) {
	        emptyFields.push("수업명을 입력해주세요.");
	    }
	    if (!document.getElementById("total_hour").value.trim()) {
	        emptyFields.push("총 수업시간을 입력해주세요.");
	    }
	    if (!document.querySelector('input[name="credit"]:checked')) {
	        emptyFields.push("학점을 입력해주세요.");
	    }
	    if (!document.getElementById("essential_attendance").value.trim()) {
	        emptyFields.push("출석 수료조건을 입력해주세요.");
	    }
	    if (!document.getElementById("essential_grade").value.trim()) {
	        emptyFields.push("성적 수료조건을 입력해주세요.");
	    }
	    if (!document.getElementById("study_target").value.trim()) {
	        emptyFields.push("교육대상을 입력해주세요.");
	    }
	    if (!document.getElementById("need_knowledge").value.trim()) {
	        emptyFields.push("선수지식을 입력해주세요.");
	    }
	    if (!document.getElementById("study_goal").value.trim()) {
	        emptyFields.push("교육목표를 입력해주세요.");
	    }
	    if (!document.getElementById("study_content").value.trim()) {
	        emptyFields.push("교육내용을 입력해주세요.");
	    }

	    
	    // 미입력 필드가 있다면 알림 표시
	    if (emptyFields.length > 0) {
		    const missingFieldsMessage = emptyFields[0];
		    alert(missingFieldsMessage);
		    return;
		}
	    
	    
	    

		// 입력된 값 모으기(body로 간결하게 보내보자) == map이랑 비슷한뎅?
		const inputLectureInfo = new FormData();
		
	    inputLectureInfo.append("lecture_category_key", document.querySelector('input[name="lecture_category_key"]:checked').value);
	    inputLectureInfo.append("credit", document.querySelector('input[name="credit"]:checked').value); 
		
	    inputLectureInfo.append("name", document.getElementById("lectureName").value);
	    inputLectureInfo.append("total_hour", document.getElementById("total_hour").value);
	    inputLectureInfo.append("essential_attendance", document.getElementById("essential_attendance").value);
	    inputLectureInfo.append("essential_grade", document.getElementById("essential_grade").value);
	    inputLectureInfo.append("study_target", document.getElementById("study_target").value);
	    inputLectureInfo.append("need_knowledge", document.getElementById("need_knowledge").value);
	    inputLectureInfo.append("study_goal", document.getElementById("study_goal").value);		
	    inputLectureInfo.append("study_content", document.getElementById("study_content").value);		

		
		const url = "./registerLectureProcess";
		
		fetch(url, {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: new URLSearchParams(inputLectureInfo)
		})
		.then(response => response.json())	
		.then(response => {
		    alert("정보 등록이 완료되었습니다.");
		    manageLectureInfoPage();
		});

	}
	
	
	// 전역변수 - 교육과정 리스트
	let lectureCategoryList;
	
	function showCategoryList(){
		
		// 교육과정 카테고리 보여줘야함
		fetch("./getLectureCategory")
		.then(response => response.json())
		.then(response => {
				
			// 교육과정 리스트
			lectureCategoryList = response.data.lectureCategoryList;
			
			// categoryBox찾기
			const categoryBox = document.getElementById("categoryBox");
			categoryBox.innerHTML = "";
			
			/* 만들기
			<c:forEach items="${lectureCategoryList}" var="item">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="lecture_category_key" value="lecture_category_key">
				  <label class="form-check-label">"category_name"</label>
				</div>
			</c:forEach>
			*/
			
			let count = 0;
			
			lectureCategoryList.forEach(item => {
				const divTag = document.createElement("div");
				divTag.classList.add("form-check", "form-check-inline");
			    
			    const inputTag = document.createElement("input");
			    inputTag.classList.add("form-check-input");
			    inputTag.type = "radio";
			    inputTag.name = "lecture_category_key";
			    inputTag.value = item.lecture_category_key;
			    
			    const labelTag = document.createElement("label");
			    labelTag.classList.add("form-check-label");
			    labelTag.innerText = item.category_name;
			    
			    divTag.appendChild(inputTag);
			    divTag.appendChild(labelTag);
			    
			    categoryBox.appendChild(divTag);
			    
			    count++;
			    if (count == 9) {
			    	categoryBox.appendChild(document.createElement("br"));
			        count = 0; 
			    }
			    
			});
			
		});
	}
	
	
	// 교육과정 등록 탭 보여주기
	function registerLecturePage(){
		
		showCategoryList();

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
	
	// 교육과정 목록 관리(추가/삭제 등등..)
	function manageLectureList(){
		
		// 교육과정 카테고리 보여줘야함
		fetch("./getLectureCategory")
		.then(response => response.json())
		.then(response => {
				
			// 교육과정 리스트
			const categoryList = response.data.lectureCategoryList;
			
		 
			// 이전내용 초기화
			document.getElementById("newLectureName").value = "";
			document.getElementById("categoryTemplateWrapper").innerHTML = "";
			
			const categoryListWrapper = document.querySelector("#categoryListWrapper");
	
		    for(const e of categoryList){
		    	
		    	// 템플릿복사
		    	const categoryTemplate = document.querySelector(".categoryTemplate").cloneNode(true);
		    	
		    	// 보여줄 정보넣고
		        categoryTemplate.querySelector("#categoryNum").innerText = e.lecture_category_key;
		        categoryTemplate.querySelector("#categoryName").innerText = e.category_name;
	
		     	// 삭제 버튼에 onclick추가
		        categoryTemplate.querySelector("#deleteCategoryBtn").addEventListener("click", function() {
		            removeCategory(e.lecture_category_key);
		        });
	
		        // 리스트에 추가
		        categoryTemplateWrapper.appendChild(categoryTemplate);
		    	
		    }
		    
		});
		
	     
			
		const modal = bootstrap.Modal.getOrCreateInstance("#manageLectureModal");
	    modal.show();
	 
	}

	
	// 교육과정 추가
	function addCategory(){
		
		const emptyFields = [];
		
	    if (!document.getElementById("newLectureName").value.trim()) {
	        emptyFields.push("교육과정명을 입력해주세요.");
	    }
		if (emptyFields.length > 0) {
		    const missingFieldsMessage = emptyFields[0];
		    alert(missingFieldsMessage);
		    return;
		}

		const inputCatagoryInfo = new FormData();
		inputCatagoryInfo.append("category_name", document.getElementById("newLectureName").value);
		
	    const url = "./insertCategoryProcess";
		
		fetch(url, {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: new URLSearchParams(inputCatagoryInfo)
		})
		.then(response => response.json())
		.then(response => {
		    alert("신규 교육과정명(" + document.getElementById("newLectureName").value +")이 등록되었습니다.");
		    showCategoryList();
		    manageLectureList();
		    
		});
	}
	
	// 교육과정 삭제
	function removeCategory(lecture_category_key){
		
		if(confirm("해당 교육과정명을 삭제하시겠습니까?\n관련 수업정보도 전부 삭제됩니다.")){
			
			const url = "./deleteCategoryProcess?lecture_category_key="+ lecture_category_key;

			// fetch를 통해 POST 요청 전송
			fetch(url)
			.then(response => response.json())
			.then(response => {
			    alert("정보 삭제가 완료되었습니다.");
			    showCategoryList();
			    manageLectureList();
			});
		} 
		
		return;	
	}
	
	
	// 교육과정 조회/수정 탭 보여주기
	function manageLectureInfoPage(){

		// 이 함수가 실행되고나서 리스트를 가져오게해야 정보 등록 후에 그 정보를 들고 올 수 있을듯~ 
		readLectureInfoList();
		searchConditionByLectureList();
		
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
				    if (count == 9) {
				    	lectureCategory.appendChild(document.createElement("br"));
				        count = 0; 
				    }
				    
				});
		});
				
	}
	
	
	// 강의 목록 가져오기
	function readLectureInfoList() {

		fetch("./getAllLectureInfoList")
		.then(response => response.json())
		.then(response => {
			
			const lectureInfoListBox = document.querySelector(".lectureInfoListBox");
			lectureInfoListBox.innerHTML = "";		// 딱 이순간에만 허용한다했던! 초기화 시키고 나서 append해야 중복 배제할거잖아.
			
			// 전체 리스트
			const allLectureInfoList = response.data.getAllLectureInfoList;
			// 전체 리스트 개수
			const countAllLecture = allLectureInfoList.length;
			document.querySelector(".countInfoList").innerText = "검색결과 (총 " + countAllLecture + " 개)";
			
			// 교육과정 카테고리 리스트(자바/ 파이썬..)
			const lectureCategoryList = response.data.lectureCategoryList;
         	
			
			
			// 돌아보자!!!
			for(e of allLectureInfoList){
				
				// 반복문 돌면서 계속 양식 복사할거임
				const lectureInfoWrapper = document.querySelector(".lectureInfoWrapper").cloneNode(true);
				
				// innerText로 반복문 돌면서 내용 변경하기
				lectureInfoWrapper.querySelector(".key").innerText = e.lectureDto.lecture_info_key;
				lectureInfoWrapper.querySelector(".lectureName").innerText = e.lectureDto.name;
				lectureInfoWrapper.querySelector(".total_hour").innerText = e.lectureDto.total_hour + "시간";
				lectureInfoWrapper.querySelector(".credit").innerText = e.lectureDto.credit;
				lectureInfoWrapper.querySelector(".essential_attendance").innerText = e.lectureDto.essential_attendance + "시간 미만";
				lectureInfoWrapper.querySelector(".essential_grade").innerText = e.lectureDto.essential_grade + "점 이상";
				
				
				// ++ key가 1이면 자바, 2면 파이썬...해야지...
				for(p of lectureCategoryList){
					
					if(p.lecture_category_key == e.lectureDto.lecture_category_key){
						lectureInfoWrapper.querySelector(".lecture_category_key").innerText = p.category_name;
					}
					
				}
				
				
				// 다 만들었으면 어디에 붙일래
				lectureInfoListBox.appendChild(lectureInfoWrapper);
				
				
				
				// +++ 강의별 수강신청 조건개수
				const countCondition = e.countCondition;
				console.log(countCondition);
				
				/* 버튼 만들기
				<button onclick="getThisRowKey(event)" type="button" class="btn mx-2 rounded-0 text-white" style="background-color: #003399">
			  		등록하기
			  	</button>
				*/
				
			    // 기존 버튼 삭제
			    const btnWrapper = lectureInfoWrapper.querySelector(".condition_key");
				btnWrapper.innerHTML = "";
				
				const buttonTag = document.createElement("button");
				buttonTag.type = "button";
				buttonTag.addEventListener("click", getThisRowKey);
		        buttonTag.classList.add("btn", "mx-2", "rounded-0", "text-white");
				
			  	if (countCondition > 0) {
			        buttonTag.innerText = "수정하기";
			        buttonTag.style.backgroundColor = "#6A7FAD";
			    } else {
			        buttonTag.innerText = "등록하기";
			        buttonTag.style.backgroundColor = "#003399";
			    }
			  	
				btnWrapper.appendChild(buttonTag);
				
			}
			
			
		});
		
	}
	
	
	// 수강조건 넣기(버튼클릭)
	function getThisRowKey(event) {
		
	    // ** 이벤트(마우스/키보드..)가 발생한 요소에 대한 정보 가져오기
	    const clickedRow = event.target.closest("tr");
	
	    const lectureKey = clickedRow.querySelector(".key").innerText;
	
	    // showModal에 key넘겨주고, 찐 모달 show함수 호출!
	    showInsertConditionModal(lectureKey);
	 }
	
	
	// fetch밖에서도 쓰고싶은 전역변수
	let conditionListByLectureKey;
	
	function showInsertConditionModal(lectureKey){
    	
        const modal = bootstrap.Modal.getOrCreateInstance("#insertConditionModal");
        modal.show();
  

    	// 이전 입력 내용 
		fetch("./getSomeLectureInfo?lecture_info_key=" + lectureKey)
		.then(response => response.json())
		.then(response => {

			// 특정강의 정보
			someLectureInfo = response.data.someLectureInfo;		
			
			// ++ 강의별 수강신청 조건 리스트
			conditionListByLectureKey = response.data.conditionListByLectureKey;
			
			// 모달내부 --> 이전에 등록된 정보로 변경하기.
			document.getElementById("getLectureName").innerText = someLectureInfo.name;
			
			// 교육과정 카테고리 리스트(자바/ 파이썬..)
			const lectureCategoryList = response.data.lectureCategoryList;
			
			// ++ key가 1이면 자바, 2면 파이썬...해야지...
			for(p of lectureCategoryList){
				
				if(p.lecture_category_key == someLectureInfo.lecture_category_key){
					document.getElementById("getLectureCategory").innerText = p.category_name;
				}
				
			}
			
			
			// 선택해야할 강의 리스트 - 전체 강의 리스트 들고옴..
			allLectureList = response.data.allLectureList;
			
			// **이전정보 보여주려는게 체크박스로 돼있을 때 - 이전에 선택한 정보를 checked, 다른거 선택도 할 수 있게....
			
			// checkBox찾기
			const conditionCheckBox = document.getElementById("conditionCheckBox");
			conditionCheckBox.innerHTML = "";

			/* 만들기
			<c:forEach items="${lectureCategoryList}" var="item">
				<div class="form-check form-check-inline">													        	
					<input class="form-check-input" type="checkbox" name="lecture_category_key" value="${item.lecture_category_key}">
					<label class="form-check-label">${item.category_name}</label>													            
				</div>
			</c:forEach>
			*/
			
			allLectureList.forEach(item => {
				
				const divTag = document.createElement("div");
				divTag.classList.add("form-check", "form-check-inline");
			    
			    const inputTag = document.createElement("input");
			    inputTag.classList.add("form-check-input");
			    inputTag.type = "checkbox";
			    inputTag.name = "condition_lecture_key";
			    inputTag.value = item.lecture_info_key;
			    
			    // +++ 추가코드
			    // --> conditionListByLectureKey의 condition_lecture_key와 현재 반복문돌고있느 아이템의 lecture_info_key 요소가 같다면 체크!!!!
		     	conditionListByLectureKey.forEach(p => {
				   
					if(p.condition_lecture_key == item.lecture_info_key){
						inputTag.checked = true;
					}
				   
			    });

			    
    			// ====

			    const labelTag = document.createElement("label");
			    labelTag.classList.add("form-check-label");
			    labelTag.innerText = item.name;
			    
			    divTag.appendChild(inputTag);
			    divTag.appendChild(labelTag);
			    
			    conditionCheckBox.appendChild(divTag);

			});
			
			// 수정 버튼
			const updateConditionBtn = document.querySelector("#updateConditionBtn")
			updateConditionBtn.setAttribute("onclick", "saveConditionBtn("+ lectureKey +")");
			
			// 삭제 버튼
			const deleteConditionBtn = document.querySelector("#deleteConditionBtn")
			deleteConditionBtn.setAttribute("onclick", "deleteConditionBtn("+ lectureKey +")");

		});
    	
    }
	
    // 수강조건 모달 내용 저장(수정하기)
    // --> 체크박스 수정하게되면 lecture_info_key로 조건리스트 뽑아서 전체 삭제하고,
    // --> 다시 lecture_info_key별로 condition_lecture_key 인서트하는게 편하다!
    function saveConditionBtn(lectureKey){ 
    	console.log("모달에서 수정");
    	console.log(lectureKey);
    	
    	// 입력된 값 모으기(body로 간결하게 보내보자) == map이랑 비슷한뎅?
		const inputConditionInfo = new FormData();
    	 
	 	// 선택된 체크박스들의 값을 저장할 배열
	 	let selectedConditions = [];
	
	 	// 모든 체크박스를 확인, 선택된 체크박스의 값을 배열에 추가
	 	// --> input이니까 - id가 아니라 name으로 찾기~~ input에는 id를 못넣어요...^^;
	 	document.querySelectorAll('input[name="condition_lecture_key"]:checked').forEach(e => selectedConditions.push(e.value));
	
	  	// 선택된 카테고리를 FormData에 추가
	  	selectedConditions.forEach(e => inputConditionInfo.append("condition_lecture_key", e));
		
		
		const url = "./updateConditionInfo?lecture_info_key=" + lectureKey;
		
		fetch(url, {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: new URLSearchParams(inputConditionInfo)
		})
		.then(response => response.json())	
		.then(response => {
		    alert("정보 수정이 완료되었습니다.");
		    manageLectureInfoPage();
		    bootstrap.Modal.getOrCreateInstance("#insertConditionModal").hide();		// 수정 or 조회 끝났으면 모달 숨기기
		});
        
    }
    
	// 강의정보 삭제
	function deleteConditionBtn(lectureKey){
		
		if(confirm("해당 강의의 정보를 삭제하시겠습니까?")){
			
			const url = "./deleteLectureInfo?lecture_info_key="+ lectureKey;

			// fetch를 통해 POST 요청 전송
			fetch(url)
			.then(response => response.json())
			.then(response => {
			    alert("정보 삭제가 완료되었습니다.");
			    manageLectureInfoPage();
			    bootstrap.Modal.getOrCreateInstance("#insertConditionModal").hide();		// 삭제 끝났으면 모달 숨기기
			});
		} 
		
		return;	
	}
    
    
	
	
	// showModal로 key를 넘기기 위해서는 row를 onclick했을 때 그 줄의 key값을 가져와야함. 중간단계 필요!!
	function getSomeKey(event) {
		
	    // ** 이벤트(마우스/키보드..)가 발생한 요소에 대한 정보 가져오기
	    // --> table에서 <tr></tr> 안에서 <td>들이 반복문돌고있음
	    // --> 이벤트가 발생한 곳은 td일거고, 그 중 가장 가까운 tr을 찾으면 그 row전체가 찾아지겠지
	    // --> 사용자가 어디를 클릭해도 그 row를 찾을 수 있겠군!!!!!
	    const clickedRow = event.target.closest("tr");
	
	    const lectureKey = clickedRow.querySelector(".key").innerText;
	
	    // showModal에 key넘겨주고, 찐 모달 show함수 호출!
	    showModal(lectureKey);
	 }
	
	// ** 모달
	// --> BS에서 모달 골라서 맨~밑에 템플릿처럼 숨겨 놓고옴!
	
	// 1. 모달 보이게하기
    // --> 필요시 여기서 백엔드와 연동함... CSR
    // --> 부트스트랩 모달은 getOrCreateInstance로 select하자..!
    // --> 특정 ID(#writeModal)를 가진 모달 요소를 찾거나 생성한 후에 해당 모달을 화면에 표시하는 거임
    
    
    //** fetch밖에서도 사용할 수 있게 전역으로 선언...	
    let someLectureInfo;	
    
    function showModal(lectureKey){
    	
    	// 리스트 들고오고나서 모달띄우면 이전 정보가 있겠지?
        const modal = bootstrap.Modal.getOrCreateInstance("#writeModal");
        modal.show();
    	
    	console.log(lectureKey);

    	// 이전 입력 내용 
		fetch("./getSomeLectureInfo?lecture_info_key=" + lectureKey)
		.then(response => response.json())
		.then(response => {

			// 특정강의 정보
			someLectureInfo = response.data.someLectureInfo;		
			
			// 교육과정 카테고리 리스트(자바/ 파이썬..)
			const lectureCategoryList = response.data.lectureCategoryList;

			// ++ key가 1이면 자바, 2면 파이썬...해야지...
			for(p of lectureCategoryList){
				
				if(p.lecture_category_key == someLectureInfo.lecture_category_key){
					document.getElementById("keyModal").innerText = p.category_name;
					document.getElementById("keyModal").value = p.lecture_category_key;
					
				}
				
			}
			
			// 모달내부 --> 이전에 등록된 정보로 변경하기.
			document.getElementById("nameModal").value = someLectureInfo.name;
			document.getElementById("total_hourModal").value = someLectureInfo.total_hour;
			document.getElementById("essential_attendanceModal").value = someLectureInfo.essential_attendance;
			document.getElementById("essential_gradeModal").value = someLectureInfo.essential_grade;
			document.getElementById("study_targetModal").value = someLectureInfo.study_target;
			document.getElementById("need_knowledgeModal").value = someLectureInfo.need_knowledge;
			document.getElementById("study_goalModal").value = someLectureInfo.study_goal;
			document.getElementById("study_contentModal").value = someLectureInfo.study_content;
			
			// **1. innerText & value
			// innerText: 주로 HTML 요소의 텍스트 콘텐츠를 나타내는 속성입니다. 
			// ---> 주로 <div>, <span>, <p> 등의 블록 레벨 또는 인라인 요소에서 텍스트 내용을 가져오거나 설정할 때 사용됩니다.
			// ---> 텍스트를 표시하는 블록 레벨 요소!!
			// value: 주로 입력 요소에서 사용되는 속성으로, 사용자에게 값을 입력하거나 선택하게 할 때 사용됩니다. 
			// ---> 주로 <input>, <textarea>, <select> 등의 폼 요소에서 값에 접근하거나 값을 설정할 때 사용됩니다.
			// ---> 사용자 입력을 받는 폼 요소!!
			
			// **2. 이전정보 보여주려는게 라디오버튼으로 돼있을 때(ex. gender)
			if (someLectureInfo.credit == "2") {
				  document.getElementById("radio1Modal").checked = true;
				} else if (someLectureInfo.credit == "3") {
				  document.getElementById("radio2Modal").checked = true;
				}
			
		
			// 수정 버튼
			const updateBtn = document.querySelector("#updateBtn")
			updateBtn.setAttribute("onclick", "saveBtn("+ someLectureInfo.lecture_info_key +")");
			
			// 삭제 버튼
			const deleteBtn = document.querySelector("#deleteBtn")
			deleteBtn.setAttribute("onclick", "deleteBtn("+ someLectureInfo.lecture_info_key +")");

		});
    	
    }

    // 2. 모달 내용 저장(수정하기)
    function saveBtn(lecture_info_key){ 
    	console.log("모달에서 수정");
    	console.log(lecture_info_key);
    	
    	// 입력된 값 모으기(body로 간결하게 보내보자) == map이랑 비슷한뎅?
		const inputLectureInfo = new FormData();
		
		inputLectureInfo.append("lecture_category_key", document.getElementById("keyModal").value);
		inputLectureInfo.append("name", document.getElementById("nameModal").value);
		inputLectureInfo.append("total_hour", document.getElementById("total_hourModal").value);
		inputLectureInfo.append("credit", document.querySelector('input[name="creditModal"]:checked').value); 
		inputLectureInfo.append("essential_attendance", document.getElementById("essential_attendanceModal").value);
		inputLectureInfo.append("essential_grade", document.getElementById("essential_gradeModal").value);
		inputLectureInfo.append("study_target", document.getElementById("study_targetModal").value);
		inputLectureInfo.append("need_knowledge", document.getElementById("need_knowledgeModal").value);
		inputLectureInfo.append("study_goal", document.getElementById("study_goalModal").value);
		inputLectureInfo.append("study_content", document.getElementById("study_contentModal").value);
		
		console.log(inputLectureInfo.name);
		
		
		const url = "./updateLectureInfo?lecture_info_key=" + lecture_info_key;
		
		fetch(url, {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: new URLSearchParams(inputLectureInfo)
		})
		.then(response => response.json())	
		.then(response => {
		    alert("정보 수정이 완료되었습니다.");
		    manageLectureInfoPage();
		    bootstrap.Modal.getOrCreateInstance("#writeModal").hide();		// 수정 or 조회 끝났으면 모달 숨기기
		});
        
    }
	

	// 강사정보 삭제
	function deleteBtn(lecture_info_key){
		
		if(confirm("해당 강의의 정보를 삭제하시겠습니까?")){
			
			const url = "./deleteLectureInfo?lecture_info_key="+ lecture_info_key;

			// fetch를 통해 POST 요청 전송
			fetch(url)
			.then(response => response.json())
			.then(response => {
			    alert("정보 삭제가 완료되었습니다.");
			    manageLectureInfoPage();
			    bootstrap.Modal.getOrCreateInstance("#writeModal").hide();		// 삭제 끝났으면 모달 숨기기
			});
		} 
		
		return;	
	}
	
	
	
	
	// 페이지의 DOM이 로드되면 실행될 함수 등록!! 
	//	--> 함수가 실행이 안되면 값을 못 가져오는거...
	window.addEventListener("DOMContentLoaded", () => {
		searchConditionByLectureList();
		manageLectureInfoPage();
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
			교육과정 관리
		</div>
	</div>
	
	<!-- 카테고리 -->
	<div class="commonTabs">
		<div class="col fw-bold text-center py-2 mb-3">
			<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a id="tab1" class="nav-link text-black" onclick="registerLecturePage()">과정 등록</a>
			  </li>
			  <li class="nav-item">
			    <a id="tab2" class="nav-link text-black" onclick="manageLectureInfoPage()">조회/수정</a>
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
					<div class="col-3"></div>
					<div class="col fw-bold fs-3 my-2">
						교육과정 등록
					</div>
					<div class="col-3 text-end me-3">
						<button onclick="manageLectureList()" type="button" class="btn my-2 px-3 rounded-0 text-white" style="background-color: #003399">
						교육과정 목록 관리
						</button>
					</div>
				</div>
				
				<!-- 강사 학력정보 -->
				<div class="row mt-2 ms-2">
					<div class="col fw-bold" style="font-size: 0.9em;">
						<i class="bi bi-dot"></i>교육과정 정보
						<span class="ms-3 text-danger" style="font-size: 0.8em;">*는 필수 입력사항입니다.</span>
					</div>
				</div>
				
				<!-- 정보/양식 -->
				<div class="row border border-dark rounded-0 m-3 mt-1 text-center">
					<div class="col">
						<div class="row border-top border-bottom border-dark  bg-secondary bg-opacity-10">
							<div class="col-2 align-self-center py-2 fw-bold">
								<span class="text-danger" style="font-size: 0.8em;">*</span>교육과정명
							</div>
							<div id="categoryBox" class="col py-2 text-start border-start border-dark bg-white">
								<!-- 수업 카테고리에서 끌고오기, value에 lecture_category_key를 넣을 수 있을까?-->
							</div>
						</div>
					</div>
				</div>
				
				<!-- 강사 기본정보 -->
				<div class="row mt-5 ms-2">
					<div class="col fw-bold" style="font-size: 0.9em;">
						<i class="bi bi-dot"></i>기본 수업 정보
						<span class="ms-3 text-danger" style="font-size: 0.8em;">*는 필수 입력사항입니다.</span>
					</div>
				</div>
				
				<!-- 정보/양식 -->
				<div class="row border border-dark rounded-0 m-3 mt-1 text-center">
					<div class="col">
						<div class="row border-top border-bottom border-dark bg-secondary bg-opacity-10">
							<div class="col-2 py-2 fw-bold ">
								<span class="text-danger" style="font-size: 0.8em;">*</span>수업명
							</div>
							<div class="col py-2 d-grid border-start border-dark bg-white">
								<input class="d-grid border rounded-0" id="lectureName" type="text"></input>
							</div>
						</div>
						<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
							<div class="col-2 py-2 border-dark fw-bold ">
								<span class="text-danger" style="font-size: 0.8em;">*</span>총 수업시간
							</div>
							<div class="col-4 py-2 border-end border-start border-dark d-grid bg-white">
								<input class="border rounded-0" id="total_hour" type="number" placeholder="8의 배수로 입력하세요.">
							</div>
							<div class="col-2 py-2 border-end border-dark fw-bold">
								<span class="text-danger" style="font-size: 0.8em;">*</span>학  점
							</div>
							<div class="col-4 py-2 text-start bg-white">
								<input type="radio" name="credit" id="radio1" value="2">
								<label for="radio1">2학점</label>
								<input class="ms-5" type="radio" name="credit" id="radio2" value="3">
								<label for="radio2">3학점</label>
							</div>
						</div>
						<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
							<div class="col-2 py-2 border-dark">
								<span class="text-danger" style="font-size: 0.8em;">*</span>
								<span class="fw-bold">출석</span>
								<span style="font-size: 0.8em">(수료조건)</span>
							</div>
							<div class="col-4 py-2 border-end border-start border-dark d-grid bg-white">
								<input class="border rounded-0" id="essential_attendance" type="number" placeholder="정수로 입력하세요.">
							</div>
							<div class="col-2 py-2 border-end border-dark fw-bold">
								<span class="text-danger" style="font-size: 0.8em;">*</span>
								<span class="fw-bold">성적</span>
								<span style="font-size: 0.8em">(수료조건)</span></div>
							<div class="col-4 py-2 d-grid bg-white">
								<input class="border rounded-0" id="essential_grade" type="number" placeholder="정수로 입력하세요.">
							</div>
						</div>
						<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
							<div class="col-2 align-self-center py-2 fw-bold">
								<span class="text-danger" style="font-size: 0.8em;">*</span>교육 대상
							</div>
							<div class="col py-2 border-start border-dark text-start bg-white">
								<textarea rows="2" class="w-100 border rounded-0" id="study_target"></textarea>
							</div>
						</div>
						<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
							<div class="col-2 align-self-center py-2 fw-bold">
								<span class="text-danger" style="font-size: 0.8em;">*</span>선수 지식
							</div>
							<div class="col py-2 border-start border-dark text-start bg-white">
								<textarea rows="2" class="w-100 border rounded-0" id="need_knowledge"></textarea>
							</div>
						</div>
						<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
							<div class="col-2 align-self-center py-2 fw-bold">
								<span class="text-danger" style="font-size: 0.8em;">*</span>교육 목표
							</div>
							<div class="col py-2 border-start border-dark text-start bg-white">
								<textarea rows="5" class="w-100 border rounded-0" id="study_goal"></textarea>
							</div>
						</div>
						<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
							<div class="col-2 align-self-center py-2 fw-bold">
								<span class="text-danger" style="font-size: 0.8em;">*</span>교육 내용
							</div>
							<div class="col py-2 border-start border-dark text-start bg-white">
								<textarea rows="15" class="w-100 border rounded-0" id="study_content"></textarea>
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
        	<button id="inputButton" onclick="registerLectureInfo()" class="rounded-0 fw-bold btn btn-lg btn-secondary text-white ms-1">정보 등록</button>
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
           				강의 목록 다운로드
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
			      <th scope="col" class="col text-bg-light">No.</th>
			      <th scope="col" class="col-2 text-bg-light">교육과정명</th>
			      <th scope="col" class="col-4 text-bg-light">수업명</th>
			      <th scope="col" class="col text-bg-light">총 수업시간</th>
			      <th scope="col" class="col text-bg-light">학점</th>
			      <th scope="col" class="col text-bg-light">출석조건</th>
			      <th scope="col" class="col text-bg-light">성적조건</th>
			      <th scope="col" class="col text-bg-light">수강조건</th>
			    </tr>
			  </thead>
			  <tbody class="lectureInfoListBox" style="cursor: pointer;">
			    <!-- template로 옮김 -->  
			  </tbody>
			</table>
			
		</div>
	</div>

</div>

<!-- 리스트 템플릿 -->
<table id="template" class="d-none">
	<tr class="lectureInfoWrapper">
      <td onclick="getSomeKey(event)" class="p-0 px-1 pt-1 text-center">
	    <div class="form-check m-0 p-0 d-inline-block">
	        <input class="form-check-input m-0 p-0" type="checkbox" value="" id="flexCheckDefault">
	        <label class="form-check-label" for="flexCheckDefault">
	        </label>
	    </div>
	  </td>
	  <td onclick="getSomeKey(event)" class="key">교육과정 번호</td>
	  <td onclick="getSomeKey(event)" class="lecture_category_key">교육과정명</td>
	  <td onclick="getSomeKey(event)" class="lectureName">수업명</td>
	  <td onclick="getSomeKey(event)" class="total_hour">총 수업시간</td>
	  <td onclick="getSomeKey(event)" class="credit">학점</td>
	  <td onclick="getSomeKey(event)" class="essential_attendance">출석조건</td>
	  <td onclick="getSomeKey(event)" class="essential_grade">성적조건</td>
	  <td class="condition_key d-grid" style="cursor: pointer;">
	  	<button onclick="getThisRowKey(event)" type="button" class="conditionBtn btn mx-2 rounded-0 text-white" style="background-color: #003399">
	  		등록하기
	  	</button>
	  </td>
    </tr>	
</table>

<!-- 모달 - BS복붙해옴 -->
<!-- 다른 요소와의 간섭을 피하기 위해, container 바깥 && 맨밑에 넣어놓기... -->
<div id="writeModal" class="modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 1500px; width: 100%;">
      <div class="modal-content">
        <div class="modal-header py-2" style="background-color: #003399;">
          <h5 class="modal-title fw-bold fs-5 text-white p-0">강의 정보</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body py-2">
        <!-- 강사 기본정보 -->
			<div class="row mt-2 ms-2">
				<div class="col fw-bold" style="font-size: 0.9em;">
					<i class="bi bi-dot"></i>강의 기본정보
					<span class="ms-3 text-danger" style="font-size: 0.8em;">*는 필수 입력사항입니다.</span>
				</div>
			</div>
          <!-- 정보/양식 -->
			<div id="modalForInfo" class="row border border-dark rounded-0 m-3 mt-1 text-center">
				<div class="col">
					<div class="row border-top border-bottom border-dark">
						<div class="col-1 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							교육과정명
						</div>
						<div id="keyModal" class="col py-2 d-grid border-end border-dark">
						</div>
						<div class="col-1 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>수업명
						</div>
						<div class="col py-2 d-grid border-end border-dark">
							<input class="border rounded-0" id="nameModal" type="text"></input>
						</div>
						<div class="col-1 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>총 수업시간
						</div>
						<div class="col py-2 d-grid">
							<input class="border rounded-0" id="total_hourModal" type="number"></input>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-1 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>학  점
						</div>
						<div class="col py-2 text-start border-end border-dark">
							<input type="radio" name="creditModal" id="radio1Modal" value="2">
							<label for="radio1Modal">2학점</label>
							<input class="ms-5" type="radio" name="creditModal" id="radio2Modal" value="3">
							<label for="radio2Modal">3학점</label>
						</div>
						<div class="col-1 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>출석조건
						</div>
						<div class="col py-2 d-grid border-end border-dark">
							<input class="border rounded-0" id="essential_attendanceModal" type="number"></input>
						</div>
						<div class="col-1 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>성적조건
						</div>
						<div class="col py-2 d-grid">
							<input class="border rounded-0" id="essential_gradeModal" type="number"></input>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-1 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>교육대상
						</div>
						<div class="col py-2 d-grid">
							<textarea rows="2" class="w-100 border rounded-0" id="study_targetModal"></textarea>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-1 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>선수지식
						</div>
						<div class="col py-2 d-grid">
							<textarea rows="3" class="w-100 border rounded-0" id="need_knowledgeModal"></textarea>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-1 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>교육목표
						</div>
						<div class="col py-2 d-grid">
							<textarea rows="6" class="w-100 border rounded-0" id="study_goalModal"></textarea>
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-1 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							<span class="text-danger" style="font-size: 0.8em;">*</span>교육내용
						</div>
						<div class="col py-2 d-grid">
							<textarea rows="15" class="w-100 border rounded-0" id="study_contentModal"></textarea>
						</div>
					</div>
				</div>
			</div>
		 <!-- 강사 기본정보 끝 -->
        </div>
        <div class="modal-footer mx-3 d-flex justify-content-between">
            <button id="deleteBtn" type="button" class="btn btn-danger rounded-0 px-4">삭제하기</button>
            <div>
                <button id="updateBtn" type="button" class="btn btn-primary rounded-0 text-white px-4" style="background-color: #003399;">수정완료</button>
                <button type="button" class="btn btn-secondary rounded-0 px-3" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
      </div>
    </div>
</div>

<!-- 수강신청조건 입력/수정 -->
<div id="insertConditionModal" class="modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 850px; width: 100%;">
      <div class="modal-content">
        <div class="modal-header py-2" style="background-color: #003399;">
          <h5 class="modal-title fw-bold fs-5 text-white p-0">수강신청 조건</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body py-2">
        <!-- 강사 기본정보 -->
			<div class="row mt-2 ms-2">
				<div class="col fw-bold" style="font-size: 0.9em;">
					<i class="bi bi-dot"></i>조건 조회/수정
					<span class="ms-3 text-danger" style="font-size: 0.8em;">*는 필수 입력사항입니다.</span>
				</div>
			</div>
          <!-- 정보/양식 -->
			<div id="modalForInsertCondition" class="row border border-dark rounded-0 m-3 mt-1 text-center">
				<div class="col">
					<div class="row border-top border-bottom border-dark">
						<div class="col-2 py-2 fw-bold bg-secondary bg-opacity-10">
							교육과정명
						</div>
						<div id="getLectureCategory" class="col-3 py-2 d-grid border-start border-end border-dark bg-white">
							<!-- 정보들고오기 -->
						</div>
						<div class="col-2 py-2 fw-bold border-end border-dark bg-secondary bg-opacity-10">
							수업명
						</div>
						<div id="getLectureName" class="col py-2 d-grid">
							<!-- 정보들고오기 -->
						</div>
					</div>
					<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
						<div class="col-2 align-self-center py-2 border-dark fw-bold">
							<span class="text-danger" style="font-size: 0.8em;">*</span>수강조건
						</div>
						<div class="col py-2 text-start border-start border-dark bg-white">
							<!-- 등록된 카테고리에 따라 체크박스 반복문 필요 -->
							<div id="conditionCheckBox" class="col py-2 text-start">
								<!-- 강의 리스트 -->
							</div>
						</div>
					</div>
					
				</div>
			</div>
		 <!-- 강사 기본정보 끝 -->
        </div>
        <div class="modal-footer mx-3 d-flex justify-content-between">
            <button id="deleteConditionBtn" type="button" class="btn btn-danger rounded-0 px-4">삭제하기</button>
            <div>
                <button id="updateConditionBtn" type="button" class="btn btn-primary rounded-0 text-white px-4" style="background-color: #003399;">수정완료</button>
                <button type="button" class="btn btn-secondary rounded-0 px-3" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
      </div>
    </div>
</div>

<!-- 신규교육과정 등록버튼 -->
<div id="manageLectureModal" class="modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 700px; width: 100%;">
      <div class="modal-content">
        <div class="modal-header py-2" style="background-color: #003399;">
          <h5 class="modal-title fw-bold fs-5 text-white p-0">교육과정 목록 관리</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body py-2">
        	<!-- 등록 -->
			<div class="row mt-2 ms-2">
				<div class="col fw-bold" style="font-size: 0.9em;">
					<i class="bi bi-dot"></i>신규 교육과정 등록
					<span class="ms-3 text-danger" style="font-size: 0.8em;">*는 필수 입력사항입니다.</span>
				</div>
			</div>
          <!-- 정보/양식 -->
			<div class="row border rounded-0 m-3 mt-1 text-center">
				<div class="col">
					<div class="row align-self-center border-top border-bottom border-dark bg-secondary bg-opacity-10">
						<div class="col-2 align-self-center py-2 border-dark fw-bold" style="font-size: 0.9em;">
							<span class="text-danger" style="font-size: 0.8em;">*</span>교육과정명
						</div>
						<div class="col-8 py-2 text-start border-start border-dark bg-white d-grid">
							<input class="border rounded-0" id="newLectureName" type="text"></input>
						</div>
						<div class="col py-2 text-start bg-white d-grid">
							<button onclick="addCategory()" type="button" class="btn rounded-0 text-white px-3" 
							style="background-color: #003399;">등록</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 관리 -->
			<div class="row mt-5 ms-2">
				<div class="col fw-bold" style="font-size: 0.9em;">
					<i class="bi bi-dot"></i>교육과정 목록
					<span class="ms-3 text-danger" style="font-size: 0.8em;">*는 필수 입력사항입니다.</span>
				</div>
			</div>
          <!-- 정보/양식 -->
			<div class="row border rounded-0 m-3 mt-1 text-center">
				<div class="col">
					<div class="row border-top border-bottom border-dark bg-secondary bg-opacity-10">
						<div class="col-1 align-self-center py-2 border-dark fw-bold">
							NO.
						</div>
						<div class="col-9 py-2 text-center border-start border-dark">
							<span class="text-danger" style="font-size: 0.8em;">*</span>교육과정명
						</div>
					</div>
					<!-- 템플릿 돌곳 -->
					<div id="categoryTemplateWrapper">
					
					</div>
					
					<!-- 숨겨둔템플릿 -->
					<div id="categoryListWrapper" class="d-none">
						<div class="row categoryTemplate border-bottom border-dark text-center">
							<div id="categoryNum" class="col-1 align-self-center py-2 border-dark fw-bold">
								
							</div>
							<div id="categoryName" class="col-9 py-2 border-start border-dark">
								
							</div>
							<div class="col py-2 d-grid">
								<button id="deleteCategoryBtn" type="button" class="btn btn-sm btn-danger rounded-0 text-white px-3">삭제</button>
							</div>
						</div>
					</div>
				</div>
			</div>
        </div>
        <div class="modal-footer mx-3 d-flex justify-content-end">
            <div>
            	<button type="button" class="btn btn-secondary rounded-0 px-3" data-bs-dismiss="modal">닫기</button>
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













