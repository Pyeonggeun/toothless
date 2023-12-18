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
	
	
	// 전역변수 - 교육과정 리스트
	let lectureCategoryList;
	
	function showCategoryList(){
		
		// 교육과정 카테고리 보여줘야함
		fetch("./getLectureCategory")
		.then(response => response.json())
		.then(response => {
				
			// 교육과정 리스트
			lectureCategoryList = response.data.lectureCategoryList;
			
			// sel_one찾기
			const sel_one = document.getElementById("sel_one");
			sel_one.innerHTML = "";
			
			/* 만들기
			<select id="sel_one" class="form-select rounded-0">
			  <option selected>교육과정을 선택하세요.</option>
				  <c:forEach items="${lectureCategoryList}" var="item">
				  	<option value="1">One</option>
				  </c:forEach>
			</select>
			
			*/
			
			//  <option selected>교육과정을 선택하세요.</option> 만들기
			const optionTag = document.createElement("option");
			optionTag.selected = true;
			optionTag.innerText = "교육과정을 선택하세요.";
			sel_one.add(optionTag);
			
			/*  만들기
			<c:forEach items="${lectureCategoryList}" var="item">
			  	<option value="카테고리번호">카테고리명</option>
			</c:forEach>
			*/
			lectureCategoryList.forEach(item => {
		        const optionTag = document.createElement("option");
		        optionTag.value = item.lecture_category_key;
		        optionTag.innerText = item.category_name;
		        sel_one.add(optionTag);
		    });
			    
		});
			
	}
	
	
	// 카테고리에 따른 하위 셀렉트박스
	function selectChild(){ 
		
        let oneSel = document.getElementById("sel_one").value;
        
     	// 카테고리에 따른 하위 수업명들
		fetch("./getLectureListByCategory?lecture_category_key=" + oneSel)
		.then(response => response.json())
		.then(response => {
			
			const lectureListByCategory = response.data.lectureListByCategory;
			
			// 선택된 값에 따라 자식 셀렉트박스 업데이트
	        let childSelect = document.getElementById("sel_two");
	        childSelect.innerHTML = ""; // 자식 셀렉트박스 초기화
	        
	        const optionTag = document.createElement("option");
			optionTag.selected = true;
			optionTag.innerText = "개설할 수업 정보를 선택하세요.";
			childSelect.appendChild(optionTag);
	        
	     	// 자식 셀렉트박스에 옵션 추가
	        lectureListByCategory.forEach(item => {
	            const optionTag = document.createElement("option");
	            optionTag.value = item.lecture_info_key;
	            optionTag.innerText = item.name;
	            childSelect.appendChild(optionTag);
	        });
	        
	        // 첫번째꺼 선택되면 두번째꺼 포커스해서 사용자에게 선택하라는 느낌적인 느낌...
	        childSelect.focus();
			
		});
		
	}
	
	
	// 수업명에 따른 하위 셀렉트박스
	function selectSecondChild(){ 
		
		let oneSel = document.getElementById("sel_one").value;
        console.log(oneSel);
        
     	// 수업명에 따른 강사선택 (== 카테고리에 따른 수업가능한 강사리스트겠지!!!)
		fetch("./getTeacherListByCategory?lecture_category_key=" + oneSel)
		.then(response => response.json())
		.then(response => {
			
			const teacherListByCategory = response.data.teacherListByCategory;
			
			// 선택된 값에 따라 자식 셀렉트박스 업데이트
	        let teacherSelect = document.getElementById("sel_teacher");
	        teacherSelect.innerHTML = ""; // 자식 셀렉트박스 초기화
	        
	        const optionTag = document.createElement("option");
			optionTag.selected = true;
			optionTag.innerText = "담당할 강사를 선택하세요.";
			teacherSelect.appendChild(optionTag);
	        
	     	// 자식 셀렉트박스에 옵션 추가
	        teacherListByCategory.forEach(item => {
	            const optionTag = document.createElement("option");
	            optionTag.value = item.lecturer_key;
	            optionTag.innerText = item.name;
	            teacherSelect.appendChild(optionTag);
	        });
	        
	        // 첫번째꺼 선택되면 두번째꺼 포커스해서 사용자에게 선택하라는 느낌적인 느낌...
	        teacherSelect.focus();
			
		});
     	
     	// ++ 수업명이 선택되면 수업정보(수업시간 / 학점) 자동 업데이트하기
     	let twoSel = document.getElementById("sel_two").value;
        console.log(twoSel);
     	
    	fetch("./getSomeLectureInfo?lecture_info_key=" + twoSel)
		.then(response => response.json())
		.then(response => {
			
			someLectureInfoBySelect = response.data.someLectureInfo;
			document.getElementById("total_hourByLecture").innerText = "총 " + someLectureInfoBySelect.total_hour + "시간";
			document.getElementById("creditBylecture").innerText = someLectureInfoBySelect.credit + "학점";
		
		});
		
	}
	
	let someLectureInfoBySelect;
	
	// 선택된 개강일 날짜로부터 평일개수만 추가하는 코드.... 그렇군
	function addWeekdays(date, days) {
         const resultDate = new Date(date);
         
         let addedDays = 0;
         while (addedDays < days) {
             resultDate.setDate(resultDate.getDate() + 1);
             
             const dayOfWeek = resultDate.getDay();
             if (dayOfWeek !== 0 && dayOfWeek !== 6) {
                 addedDays++;
             }
         }
         return resultDate;
     }
	
	
	function autoEndDate(){ 
		
		// 총수업일자가 아직 안나왔다면 개강일 선택시 강의먼저 선택하라고 ㄱㄱ
        if (!someLectureInfoBySelect || !someLectureInfoBySelect.total_hour) {
	        alert("수업 정보를 먼저 선택하세요.");
	        document.getElementById("open_date").value = "";
	        return;
	    }
		
    	// 개강일의 값 가져오기
        let openDateValue = document.getElementById("open_date").value;

        // 만약 개강일이 선택되지 않았다면 종강일도 비움
        if (!openDateValue) {
            document.getElementById("end_date").value = "";
            return;
        }
        
        
        // 개강일
        let openDate = new Date(openDateValue);
        
        // 총수업시간 / 8 = 수업일수
        let studyDays = (someLectureInfoBySelect.total_hour / 8);

        // 평일만 추가해서 종강일 계산(개강일 포함하려고 -1함)
        let endDate = addWeekdays(openDate, studyDays - 1);

        // 계산된 종강일을 문자열로 변환하여 종강일 입력 필드에 설정... 사람들은 참 똑똑하다!
        document.getElementById("end_date").valueAsDate = endDate;
    
	}
	
	function autoEndDateModal(){ 
		
    	// 개강일의 값 가져오기
        let openDateValue = document.getElementById("open_dateModal").value;

        // 만약 개강일이 선택되지 않았다면 종강일도 비움
        if (!openDateValue) {
            document.getElementById("end_dateModal").value = "";
            return;
        }
        
        
        // 개강일
        let openDate = new Date(openDateValue);
        
        // 총수업시간 / 8 = 수업일수
        let studyDays = (someLectureInfo.total_hour / 8);

        // 평일만 추가해서 종강일 계산(개강일 포함하려고 -1함)
        let endDate = addWeekdays(openDate, studyDays - 1);

        // 계산된 종강일을 문자열로 변환하여 종강일 입력 필드에 설정... 사람들은 참 똑똑하다!
        document.getElementById("end_dateModal").valueAsDate = endDate;
    
	}
	
	
	
	// 교육과정 등록 탭 보여주기
	function registerOpenLecturePage(){
		
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
	
	
	// 정보 등록
	function registerOpenLectureInfo(){

		/*
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
	    */
	    

	    
		// 입력된 값 모으기(body로 간결하게 보내보자) == map이랑 비슷한뎅?
		const inputOpenLectureInfo = new FormData();
		
		// 셀렉트박스/날짜는 그냥 똑같이 넘기면 되지요~
		inputOpenLectureInfo.append("lecture_info_key", document.getElementById("sel_two").value);
		inputOpenLectureInfo.append("lecturer_key", document.getElementById("sel_teacher").value);
		
		// 값 넘기기
		inputOpenLectureInfo.append("max_student", document.getElementById("max_student").value);
		inputOpenLectureInfo.append("start_apply", document.getElementById("start_apply").value);
		inputOpenLectureInfo.append("end_apply", document.getElementById("end_apply").value);
		inputOpenLectureInfo.append("open_date", document.getElementById("open_date").value);
		inputOpenLectureInfo.append("close_date", document.getElementById("end_date").value);
		
		

		
		const url = "./registerOpenLectureProcess";
		
		fetch(url, {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: new URLSearchParams(inputOpenLectureInfo)
		})
		.then(response => response.json())	
		.then(response => {
		    alert("신규 강의가 개설되었습니다.");
		    manageOpenLectureInfoPage();
		    
		});
	}
	

	
	// 조회/수정 탭 보여주기
	function manageOpenLectureInfoPage(){

		// 이 함수가 실행되고나서 리스트를 가져오게해야 정보 등록 후에 그 정보를 들고 올 수 있을듯~ 
		readOpenLectureInfoList();
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
	
	
	// 개설 강의 목록 가져오기
	function readOpenLectureInfoList() {

		fetch("./getAllOpenLectureInfoList")
		.then(response => response.json())
		.then(response => {
			
			const lectureInfoListBox = document.querySelector(".lectureInfoListBox");
			lectureInfoListBox.innerHTML = "";		// 딱 이순간에만 허용한다했던! 초기화 시키고 나서 append해야 중복 배제할거잖아.
			
			// 강사 전체 리스트
			const allTeacherList = response.data.allTeacherList;
			
			// 교육과정 카테고리 리스트(자바/ 파이썬..)
			const lectureCategoryList = response.data.lectureCategoryList;
			
			// 개설 강의 전체 리스트
			const allOpenLectureInfoList = response.data.allOpenLectureInfoList;
			// 전체 리스트 개수
			const countAllOpenLecture = allOpenLectureInfoList.length;
			document.querySelector(".countInfoList").innerText = "검색결과 (총 " + countAllOpenLecture + " 개)";
			

			// 돌아보자!!!
			for(e of allOpenLectureInfoList){
				
				// 반복문 돌면서 계속 양식 복사할거임
				const lectureInfoWrapper = document.querySelector(".lectureInfoWrapper").cloneNode(true);
				
				// innerText로 반복문 돌면서 내용 변경하기
				lectureInfoWrapper.querySelector(".key").innerText = e.openLec.open_lecture_key;
				lectureInfoWrapper.querySelector(".lectureName").innerText = e.lectureInfo.name;
				lectureInfoWrapper.querySelector(".startDate").innerText = formatDate(new Date(e.openLec.open_date));
				lectureInfoWrapper.querySelector(".applyPeriod").innerText = formatDate(new Date(e.openLec.start_apply)) + " ~ " + formatDate(new Date(e.openLec.end_apply));
				
				
				// lectureInfoWrapper.querySelector(".teacherName").innerText = e.openLec.lecturer_key;
				// ++ 강사 key가 1이면 민지.. 2면 티모..
				for(p of allTeacherList){
					
					if(p.lecturer_key == e.openLec.lecturer_key){
						lectureInfoWrapper.querySelector(".teacherName").innerText = p.name;
					}
					
				}
				
				// ++ key가 1이면 자바, 2면 파이썬...해야지...
				for(p of lectureCategoryList){
					
					if(p.lecture_category_key == e.lectureInfo.lecture_category_key){
						lectureInfoWrapper.querySelector(".categoryName").innerText = p.category_name;
					}
					
				}
				
				
				// 다 만들었으면 어디에 붙일래
				lectureInfoListBox.appendChild(lectureInfoWrapper);
				
			}
			
			
		});
		
	}

	// showModal로 key를 넘기기 위해서는 row를 onclick했을 때 그 줄의 key값을 가져와야함. 중간단계 필요!!
	function getSomeKey(event) {
		
	    // ** 이벤트(마우스/키보드..)가 발생한 요소에 대한 정보 가져오기
	    // --> table에서 <tr></tr> 안에서 <td>들이 반복문돌고있음
	    // --> 이벤트가 발생한 곳은 td일거고, 그 중 가장 가까운 tr을 찾으면 그 row전체가 찾아지겠지
	    // --> 사용자가 어디를 클릭해도 그 row를 찾을 수 있겠군!!!!!
	    const clickedRow = event.target.closest("tr");
	
	    const open_lecture_key = clickedRow.querySelector(".key").innerText;
	
	    // showModal에 key넘겨주고, 찐 모달 show함수 호출!
	    showModal(open_lecture_key);
	 }
	
	// ** 모달
	// --> BS에서 모달 골라서 맨~밑에 템플릿처럼 숨겨 놓고옴!
	
	// 1. 모달 보이게하기
    // --> 필요시 여기서 백엔드와 연동함... CSR
    // --> 부트스트랩 모달은 getOrCreateInstance로 select하자..!
    // --> 특정 ID(#writeModal)를 가진 모달 요소를 찾거나 생성한 후에 해당 모달을 화면에 표시하는 거임
    
    
 	let someLectureInfo;
    let someOpenLecInfo;
    
    function showModal(open_lecture_key){
    	
    	// 리스트 들고오고나서 모달띄우면 이전 정보가 있겠지?
        const modal = bootstrap.Modal.getOrCreateInstance("#writeModal");
        modal.show();
    	
    	console.log(open_lecture_key);

    	// 이전 입력 내용 
		fetch("./getSomeOpenLectureInfo?open_lecture_key=" + open_lecture_key)
		.then(response => response.json())
		.then(response => {

			// 특정강의 기본 정보
			someLectureInfo = response.data.someLectureInfo;	
			
			// 특정 개설강의 정보
			someOpenLecInfo = response.data.someOpenLecInfo;	
			
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
			document.getElementById("nameModal").innerText = someLectureInfo.name;
			document.getElementById("totalHourModal").innerText = someLectureInfo.total_hour + "시간";
			document.getElementById("creditModal").innerText = someLectureInfo.credit + "학점";
			document.getElementById("max_studentModal").value = someOpenLecInfo.max_student;
			document.getElementById("start_applyModal").value = formatDate(new Date(someOpenLecInfo.start_apply));
			document.getElementById("end_applyModal").value = formatDate(new Date(someOpenLecInfo.end_apply));
			document.getElementById("open_dateModal").value = formatDate(new Date(someOpenLecInfo.open_date));
			document.getElementById("end_dateModal").value = formatDate(new Date(someOpenLecInfo.close_date));
			
			// **1. innerText & value
			// innerText: 주로 HTML 요소의 텍스트 콘텐츠를 나타내는 속성입니다. 
			// ---> 주로 <div>, <span>, <p> 등의 블록 레벨 또는 인라인 요소에서 텍스트 내용을 가져오거나 설정할 때 사용됩니다.
			// ---> 텍스트를 표시하는 블록 레벨 요소!!
			// value: 주로 입력 요소에서 사용되는 속성으로, 사용자에게 값을 입력하거나 선택하게 할 때 사용됩니다. 
			// ---> 주로 <input>, <textarea>, <select> 등의 폼 요소에서 값에 접근하거나 값을 설정할 때 사용됩니다.
			// ---> 사용자 입력을 받는 폼 요소!!
			
			
			
			// **3. 이전정보 보여주려는게 셀렉트박스로 돼있을 때 - 이전에 선택한 정보를 checked, 다른거 선택도 할 수 있게....
			
			// document.getElementById("sel_teacherModal").value = someOpenLecInfo.lecturer_key;	// select
			
			// 3-1. 이전에 선택한 정보는 checked, 아직강사로 등록안된 아이디들 셀렉트박스 내에 올라가게
			fetch("./getTeacherListByCategory?lecture_category_key=" + someLectureInfo.lecture_category_key)
			.then(response => response.json())
			.then(response => {
				

				// 카테고리별 가능한 강사 리스트
				const teacherListByCategory = response.data.teacherListByCategory;
				
				// 이전에 등록한 lecturer_key
				const previousLecturerKey = someOpenLecInfo.lecturer_key;
			
				// selectBox찾기
			    const selectBox = document.getElementById("sel_teacherModal");
				selectBox.innerHTML = "";

				/*  만들기
				<c:forEach items="${notYetTeacherList}" var="item">
				  	<option value="${item.external_pk}">${item.external_id}</option>
				</c:forEach> 
				*/
				teacherListByCategory.forEach(item => {
			        const optionTag = document.createElement("option");
			        optionTag.value = item.lecturer_key;
			        optionTag.innerText = item.name;

			        // 이전에 등록한 lecturer_key와 같은 값이면 selected 처리
			        if (item.lecturer_key == previousLecturerKey) {
			            optionTag.selected = true;
			        }
			        
			        selectBox.add(optionTag);
			    });
				
			});

			
		
			// 수정 버튼
			const updateBtn = document.querySelector("#updateBtn")
			updateBtn.setAttribute("onclick", "saveBtn("+ someOpenLecInfo.open_lecture_key +")");
			
			// 삭제 버튼
			const deleteBtn = document.querySelector("#deleteBtn")
			deleteBtn.setAttribute("onclick", "deleteBtn("+ someOpenLecInfo.open_lecture_key +")");

		});
    	
    }

    // 2. 모달 내용 저장(수정하기)
    function saveBtn(open_lecture_key){ 
    	console.log("모달에서 수정");
    	console.log(open_lecture_key);
    	
		const inputOpenLectureInfo = new FormData();
		
		// 셀렉트박스/날짜는 그냥 똑같이 넘기면 되지요~
		inputOpenLectureInfo.append("lecturer_key", document.getElementById("sel_teacherModal").value);
		
		// 값 넘기기
		inputOpenLectureInfo.append("max_student", document.getElementById("max_studentModal").value);
		inputOpenLectureInfo.append("start_apply", document.getElementById("start_applyModal").value);
		inputOpenLectureInfo.append("end_apply", document.getElementById("end_applyModal").value);
		inputOpenLectureInfo.append("open_date", document.getElementById("open_dateModal").value);
		inputOpenLectureInfo.append("close_date", document.getElementById("end_dateModal").value);
		

		
		const url = "./updateOpenLectureInfo?open_lecture_key=" + open_lecture_key;
		
		fetch(url, {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: new URLSearchParams(inputOpenLectureInfo)
		})
		.then(response => response.json())	
		.then(response => {
		    alert("정보 수정이 완료되었습니다.");
		    manageOpenLectureInfoPage();
		    bootstrap.Modal.getOrCreateInstance("#writeModal").hide();		// 수정 or 조회 끝났으면 모달 숨기기
		});
        
    }
	

	// 강사정보 삭제
	function deleteBtn(open_lecture_key){
		
		if(confirm("해당 강의의 정보를 삭제하시겠습니까?")){
			
			const url = "./deleteOpenLectureInfo?open_lecture_key="+ open_lecture_key;

			// fetch를 통해 POST 요청 전송
			fetch(url)
			.then(response => response.json())
			.then(response => {
			    alert("정보 삭제가 완료되었습니다.");
			    manageOpenLectureInfoPage();
			    bootstrap.Modal.getOrCreateInstance("#writeModal").hide();		// 삭제 끝났으면 모달 숨기기
			});
		} 
		
		return;	
	}
	
	
	// 제목누르면 강의 기본정보 모달..
	function getSomeKeyModal(event){
		
		
	}
	
	
	
	// 페이지의 DOM이 로드되면 실행될 함수 등록!! 
	//	--> 함수가 실행이 안되면 값을 못 가져오는거...
	window.addEventListener("DOMContentLoaded", () => {
		searchConditionByLectureList();
		registerOpenLecturePage();
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
			강의 관리
		</div>
	</div>
	
	<!-- 카테고리 -->
	<div class="commonTabs">
		<div class="col fw-bold text-center py-2 mb-3">
			<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a id="tab1" class="nav-link text-black" onclick="registerOpenLecturePage()">강의 개설</a>
			  </li>
			  <li class="nav-item">
			    <a id="tab2" class="nav-link text-black" onclick="manageOpenLectureInfoPage()">조회/수정</a>
			  </li>
			  <li class="nav-item">
			    <a id="tab2" class="nav-link text-black">진행상황</a>
			  </li>
			</ul>
		</div>
	</div>
</div>


<!-- 등록 탭 -->
<div id="registerInfoTab" class="d-none">
	<div class="info row">
    	<div class="col">
		<!-- 기숙사명 -->
		<div class="row border rounded-0 p-3 px-5">
			<div class="col">
				<div class="row text-center">
					<div class="col-3"></div>
					<div class="col fw-bold fs-3 my-2">
						신규 강의 개설
					</div>
					<div class="col-3"></div>
				</div>
				
				<!-- 강사 학력정보 -->
				<div class="row mt-2 ms-2">
					<div class="col fw-bold" style="font-size: 0.9em;">
						<i class="bi bi-dot"></i>기본 수업 정보
						<span class="ms-3 text-danger" style="font-size: 0.8em;">*는 필수 입력사항입니다.</span>
					</div>
				</div>
				
				<!-- 정보/양식 -->
				<div class="row border border-dark rounded-0 m-3 mt-1 text-center">
					<div class="col">
						<div class="row border-top border-bottom border-dark  bg-secondary bg-opacity-10">
							<div class="col-2 align-self-center py-2 fw-bold">
								<span class="text-danger" style="font-size: 0.8em;">*</span>수업명
							</div>
							<div id="selectBoxOne" class="col-4 py-2 ps-2 pe-0 border-start border-dark bg-white">
								<select id="sel_one" onchange="selectChild()" class="form-select rounded-0">
								  <option selected>교육과정을 선택하세요.</option>
								</select>
							</div>
							<div id="selectBoxTwo" class="col py-2 ps-0 pe-2 bg-white">
								<select id="sel_two" onchange="selectSecondChild()" class="form-select rounded-0">
								  <option selected>개설할 수업 정보를 선택하세요.</option>
								</select>
							</div>
						</div>
						<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
							<div class="col-2 py-2 fw-bold ">
								총 수업시간
							</div>
							<div id="total_hourByLecture" class="col-4 py-2 text-center border-end border-start border-dark d-grid bg-white">
								<!-- 값 들고오기 -->
							</div>
							<div class="col-2 py-2 fw-bold">
								학  점
							</div>
							<div id="creditBylecture" class="col-4 py-2 text-center bg-white border-start border-dark">
								<!-- 값들고오기 -->
							</div>
						</div>
					</div>
				</div>
				
				<!-- 강사 기본정보 -->
				<div class="row mt-5 ms-2">
					<div class="col fw-bold" style="font-size: 0.9em;">
						<i class="bi bi-dot"></i>강의 개설 정보
						<span class="ms-3 text-danger" style="font-size: 0.8em;">*는 필수 입력사항입니다.</span>
					</div>
				</div>
				
				<!-- 정보/양식 -->
				<div class="row border border-dark rounded-0 m-3 mt-1 text-center">
					<div class="col">
						<div class="row border-top border-bottom border-dark bg-secondary bg-opacity-10">
							<div class="col-2 py-2 fw-bold align-self-center">
								<span class="text-danger" style="font-size: 0.8em;">*</span>담당 강사명
							</div>
							<div id="selectTeacherBox" class="col-4 py-2 bg-white border-start border-end border-dark">
								<select id="sel_teacher" class="form-select rounded-0">
								  <option selected>담당할 강사를 선택하세요.</option>
								</select>
							</div>
							<div class="col-2 py-2  fw-bold align-self-center">
								<span class="text-danger" style="font-size: 0.8em;">*</span>최대 수강인원
							</div>
							<div class="col-4 py-2 d-grid bg-white border-start border-dark">
								<input class="border rounded-0" id="max_student" type="number" placeholder="정수로 입력하세요.">
							</div>
						</div>
						<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
							<div class="col-2 py-2 fw-bold align-self-center">
								<span class="text-danger" style="font-size: 0.8em;">*</span>수강신청 시작일
							</div>
							<div class="col-4 py-2 border-start border-end border-dark d-grid bg-white">
								<input class="border rounded-0 py-2" id="start_apply" type="date">
							</div>
							<div class="col-2 py-2 fw-bold align-self-center">
								<span class="text-danger" style="font-size: 0.8em;">*</span>수강신청 종료일
							</div>
							<div class="col-4 py-2 d-grid bg-white border-start border-dark">
								<input class="border rounded-0 py-2" id="end_apply" type="date">
							</div>
						</div>
						<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
							<div class="col-2 py-2 fw-bold align-self-center">
								<span class="text-danger" style="font-size: 0.8em;">*</span>개강일
							</div>
							<div class="col-4 py-2 border-start border-end border-dark d-grid bg-white">
								<input class="border rounded-0 py-2" onchange="autoEndDate()" id="open_date" type="date">
							</div>
							<div class="col-2 py-2 fw-bold align-self-center">
								종강일 <span style="font-size: 0.8em;">(자동계산)</span>
							</div>
							<div class="col-4 py-2 d-grid bg-white border-start border-dark">
								<input class="border rounded-0 py-2" id="end_date" type="date">
							</div>
						</div>
					</div>
				</div>
				
				<!-- 강사 기본정보 -->
				<div class="row mt-5 ms-2">
					<div class="col fw-bold" style="font-size: 0.9em;">
						<i class="bi bi-dot"></i>강의 추가 정보
					</div>
				</div>
				
				<!-- 정보/양식 -->
				<div class="row border border-dark rounded-0 m-3 mt-1 text-center">
					<div class="col">
						<div class="row border-top border-bottom border-dark bg-secondary bg-opacity-10">
							<div class="col-2 py-2 fw-bold align-self-center">
								수업 시간
							</div>
							<div id="selectTeacherBox" class="col-4 py-2 d-grid bg-white border-start border-end border-dark">
								<input class="border rounded-0 py-1" type="text"></input>
							</div>
							<div class="col-2 py-2 fw-bold align-self-center">
								수강료
							</div>
							<div class="col-4 py-2 d-grid bg-white border-start border-dark">
								<input class="border py-1 rounded-0" type="number" placeholder="정수로 입력하세요."></input>
							</div>
						</div>
						<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
							<div class="col-2 py-2 fw-bold align-self-center">
								수강 장소
							</div>
							<div class="col py-2 border-start border-dark d-grid bg-white">
								<input class="border py-1 rounded-0" type="text"></input>
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
        	<button id="inputButton" onclick="registerOpenLectureInfo()" class="rounded-0 fw-bold btn btn-lg btn-secondary text-white ms-1">정보 등록</button>
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
							진행 상황
						</div>
						<div class="col ms-2">
							<div class="row">
								<div class="col text-start">
									<div class="form-check form-check-inline">
									  <input checked class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
									  <label class="form-check-label" for="inlineRadio1">전체</label>
									</div>
									<div class="ms-3 form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
									  <label class="form-check-label" for="inlineRadio2">진행중</label>
									</div>
									<div class="ms-3 form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
									  <label class="form-check-label" for="inlineRadio3">종강</label>
									</div>
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
           				개설 강의 목록 다운로드
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
			      <th scope="col" class="col text-bg-light">교육과정명</th>
			      <th scope="col" class="col-5 text-bg-light">수업명</th>
			      <th scope="col" class="col text-bg-light">담당 강사</th>
			      <th scope="col" class="col text-bg-light">개강일</th>
			      <th scope="col" class="col text-bg-light">수강신청기간</th>
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
	<tr class="lectureInfoWrapper" onclick="getSomeKey(event)">
      <td class="p-0 px-1 pt-1 text-center">
	    <div class="form-check m-0 p-0 d-inline-block">
	        <input class="form-check-input m-0 p-0" type="checkbox" value="" id="flexCheckDefault">
	        <label class="form-check-label" for="flexCheckDefault">
	        </label>
	    </div>
	  </td>
	  <td class="key">교육과정 번호</td>
	  <td class="categoryName">교육과정명</td>
	  <td class="lectureName">수업명</td>
	  <td class="teacherName">강사</td>
	  <td class="startDate">개강일</td>
	  <td class="applyPeriod">수강신청기간</td>
    </tr>	
</table>

<!-- 모달 - BS복붙해옴 -->
<!-- 다른 요소와의 간섭을 피하기 위해, container 바깥 && 맨밑에 넣어놓기... -->
<div id="writeModal" class="modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 1000px; width: 100%;">
      <div class="modal-content">
        <div class="modal-header py-2" style="background-color: #003399;">
          <h5 class="modal-title fw-bold fs-5 text-white p-0">개설 강의 정보</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body py-2">
        <!-- 기본정보 -->
			<div class="row mt-2 ms-2">
				<div class="col fw-bold" style="font-size: 0.9em;">
					<i class="bi bi-dot"></i>기본 수업 기본정보
					<span class="ms-3 text-primary" style="font-size: 0.8em;">수업명 클릭 시 해당 수업의 전체 정보를 보실 수 있습니다.</span>
				</div>
			</div>
          <!-- 정보/양식 -->
			<div id="modalForInfo" class="row border border-dark rounded-0 m-3 mt-1 text-center">
				<div class="col">
					<div class="row border-top border-bottom border-dark">
						<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							교육과정명
						</div>
						<div id="keyModal" class="col-3 py-2 d-grid border-end border-dark">
							<!-- 정보가져오기 -->
						</div>
						<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							수업명
						</div>
						<div id="nameModal" onclick="getSomeKeyModal(event)" class="col-5 py-2 d-grid text-primary">
							<!-- 정보가져오기 -->
						</div>
					</div>
					<div class="row border-bottom border-dark">
						<div class="col-2 align-self-center py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							학  점
						</div>
						<div id="creditModal" class="col-3 py-2 text-center border-end border-dark">
							<!-- 정보가져오기 -->
						</div>
						<div class="col-2 py-2 border-end border-dark fw-bold bg-secondary bg-opacity-10">
							총 수업시간
						</div>
						<div id="totalHourModal" class="col-5 py-2 d-grid">
							<!-- 정보가져오기 -->
						</div>
					</div>
				</div>
			</div>
		 <!-- 기본정보 끝 -->
		 
		 <!-- 개설 정보 -->
		<div class="row mt-5 ms-2">
			<div class="col fw-bold" style="font-size: 0.9em;">
				<i class="bi bi-dot"></i>강의 개설 정보
				<span class="ms-3 text-danger" style="font-size: 0.8em;">*는 필수 입력사항입니다.</span>
			</div>
		</div>
		
		<!-- 정보/양식 -->
		<div class="row border border-dark rounded-0 m-3 mt-1 text-center">
			<div class="col">
				<div class="row border-top border-bottom border-dark bg-secondary bg-opacity-10">
					<div class="col-2 py-2 fw-bold align-self-center">
						<span class="text-danger" style="font-size: 0.8em;">*</span>담당 강사명
					</div>
					<div id="selectTeacherBox" class="col-4 py-2 bg-white border-start border-end border-dark">
						<select id="sel_teacherModal" class="form-select rounded-0">
						</select>
					</div>
					<div class="col-2 py-2  fw-bold align-self-center">
						<span class="text-danger" style="font-size: 0.8em;">*</span>최대 수강인원
					</div>
					<div class="col-4 py-2 d-grid bg-white border-start border-dark">
						<input class="border rounded-0" id="max_studentModal" type="number" placeholder="정수로 입력하세요.">
					</div>
				</div>
				<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
					<div class="col-2 py-2 fw-bold align-self-center">
						<span class="text-danger" style="font-size: 0.8em;">*</span>수강신청 시작일
					</div>
					<div class="col-4 py-2 border-start border-end border-dark d-grid bg-white">
						<input class="border rounded-0 py-2" id="start_applyModal" type="date">
					</div>
					<div class="col-2 py-2 fw-bold align-self-center">
						<span class="text-danger" style="font-size: 0.8em;">*</span>수강신청 종료일
					</div>
					<div class="col-4 py-2 d-grid bg-white border-start border-dark">
						<input class="border rounded-0 py-2" id="end_applyModal" type="date">
					</div>
				</div>
				<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
					<div class="col-2 py-2 fw-bold align-self-center">
						<span class="text-danger" style="font-size: 0.8em;">*</span>개강일
					</div>
					<div class="col-4 py-2 border-start border-end border-dark d-grid bg-white">
						<input class="border rounded-0 py-2" onchange="autoEndDateModal()" id="open_dateModal" type="date">
					</div>
					<div class="col-2 py-2 fw-bold align-self-center">
						종강일 <span style="font-size: 0.8em;">(자동계산)</span>
					</div>
					<div class="col-4 py-2 d-grid bg-white border-start border-dark">
						<input class="border rounded-0 py-2" id="end_dateModal" type="date">
					</div>
				</div>
			</div>
		</div>
		
		<!-- 추가 정보 -->
		<div class="row mt-5 ms-2">
			<div class="col fw-bold" style="font-size: 0.9em;">
				<i class="bi bi-dot"></i>강의 추가 정보
			</div>
		</div>
		
		<!-- 정보/양식 -->
		<div class="row border border-dark rounded-0 m-3 mt-1 text-center">
			<div class="col">
				<div class="row border-top border-bottom border-dark bg-secondary bg-opacity-10">
					<div class="col-2 py-2 fw-bold align-self-center">
						수업 시간
					</div>
					<div id="selectTeacherBox" class="col-4 py-2 d-grid bg-white border-start border-end border-dark">
						<input class="border rounded-0 py-1" type="text"></input>
					</div>
					<div class="col-2 py-2 fw-bold align-self-center">
						수강료
					</div>
					<div class="col-4 py-2 d-grid bg-white border-start border-dark">
						<input class="border py-1 rounded-0" type="number" placeholder="정수로 입력하세요."></input>
					</div>
				</div>
				<div class="row border-bottom border-dark bg-secondary bg-opacity-10">
					<div class="col-2 py-2 fw-bold align-self-center">
						수강 장소
					</div>
					<div class="col py-2 border-start border-dark d-grid bg-white">
						<input class="border py-1 rounded-0" type="text"></input>
					</div>
				</div>
				
			</div>
		</div>
				
        <div class="modal-footer mx-0 d-flex justify-content-between">
            <button id="deleteBtn" type="button" class="btn btn-danger rounded-0 px-4">삭제하기</button>
            <div>
                <button id="updateBtn" type="button" class="btn btn-primary rounded-0 text-white px-4" style="background-color: #003399;">수정완료</button>
                <button type="button" class="btn btn-secondary rounded-0 px-3" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>

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


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>













