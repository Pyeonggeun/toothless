<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
     	
     	<script>
     	
     	
     	let lecturer_key = null;
     	function getMyInfo() {
     		const url = "./getMyInfo?external_pk="+${sessionExternalInfo.external_pk};
     		fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			
    			const lecturerNmae = document.querySelector("#lecturerNmae");
    			lecturerNmae.innerText = response.data.name;
    			const openLecturerName = document.querySelector("#openLecturerName");
    			openLecturerName.innerText = response.data.name;
    			
    		});
			
		}
     	
     	let open_lecture_key = null;
     	function loadMainPageInfo() {
     		const urlParams = new URLSearchParams(location.search);
     		const key = urlParams.get("open_lecture_key");
     		open_lecture_key = key;
     		openLectureInfo(open_lecture_key);
     		loadAttendanceStatusList(open_lecture_key);
     		getStudyingInfo(open_lecture_key);
     		loadStudentInfo(open_lecture_key);
     		lectureTestListInfo(open_lecture_key);
     		
     		const goTestInfoListPage = document.querySelector("#goTestInfoListPage");
     		goTestInfoListPage.setAttribute("href", "./testInfoListPage?open_lecture_key="+open_lecture_key);
     		
     		const absenceManagementPage = document.querySelector("#absenceManagementPage");
     		absenceManagementPage.setAttribute("href", "./attendanceStudentListPage?open_lecture_key="+open_lecture_key);
     		
			const goStudentTotalListPage = document.querySelector("#goStudentTotalListPage");
			goStudentTotalListPage.setAttribute("href", "./lectureStudentInfoListPage?open_lecture_key="+open_lecture_key);
     		
			
			
			const goLectureManagementPage = document.querySelector("#goLectureManagementPage");
     		goLectureManagementPage.setAttribute("onclick" ,"location.href='./lectureManagementPage?open_lecture_key="+open_lecture_key+"'");
     		const goStudentListPage = document.querySelector("#goStudentListPage");
     		goStudentListPage.setAttribute("onclick" ,"location.href='./lectureStudentInfoListPage?open_lecture_key="+open_lecture_key+"'");
     		const goAttendancePage = document.querySelector("#goAttendancePage");
     		goAttendancePage.setAttribute("onclick" ,"location.href='./attendanceStudentListPage?open_lecture_key="+open_lecture_key+"'");
     		const goTestInfoPage = document.querySelectorAll(".goTestInfoPage");
     		for(e of goTestInfoPage ){
     			e.setAttribute("onclick" ,"location.href='./testInfoListPage?open_lecture_key="+open_lecture_key+"'");	
     		}
     		const reviewPage = document.querySelectorAll(".reviewPage");
     		for(e of reviewPage ){
     			e.setAttribute("onclick" ,"location.href='./lectureReviewPage?open_lecture_key="+open_lecture_key+"'");	
     		}
			
			
     	}
     	function loadStudentInfo(open_lecture_key) {
			const url = "./lectureStudentList?open_lecture_key="+open_lecture_key;
			fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			
    			const studentInfoListBox = document.querySelector("#studentInfoListBox");
    			studentInfoListBox.innerHtml ="";
    			if(response.data[0] == null){
    				studentInfoListBox.innerText = "수강신청 된 학생이 존재하지 않습니다.";
    				studentInfoListBox.classList.add("text-center" , "text-secondary");
    			}else{
    			
	    			for(e of response.data){
	    				
	    				const studentInfoListWrapper = document.querySelector("#studentInfoListTemplete .studentInfoListWrapper").cloneNode(true);	
	        			
	        			const name = studentInfoListWrapper.querySelector(".name");
	        			name.innerText = e.lifeStudentDto.name;
	        			
	        			
	        			const externalId = studentInfoListWrapper.querySelector(".externalId");
	    				externalId.innerText = e.externalInfoDto.external_id;
	        			
	        			const gender = studentInfoListWrapper.querySelector(".gender");
	        			if(e.lifeStudentDto.gender == "M"){
	        				gender.innerText = "남";	
	        			}else{
	        				gender.innerText = "여";
	        			}
	        			
	        			const lateCount = studentInfoListWrapper.querySelector(".lateCount");
	        			lateCount.innerText = e.lateCount+"건";
	        			
	        			const absenceCount = studentInfoListWrapper.querySelector(".absenceCount");
	        			absenceCount.innerText = e.absenceCount+"건";
	        			
	        			const goStudentListPage = studentInfoListWrapper.querySelector(".goStudentListPage");
	        			goStudentListPage.setAttribute("onclick" , "location.href='./lectureStudentInfoListPage?open_lecture_key="+e.open_lecture_key+"'");
	        			
	        			studentInfoListBox.appendChild(studentInfoListWrapper);
	    			}
    			
    			}
    			
    		});
			
		}
     	function getStudyingInfo(open_lecture_key) {
			const url = "./getTotalStudyingInfo?open_lecture_key="+open_lecture_key;
			fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			
    			const studyingHourInfo = document.querySelector("#studyingHourInfo");
    			if(response.data.studyingHour == null){
    				studyingHourInfo.innerText = response.data.totalHour+"시간 중 0시간";
    			}else{
    				studyingHourInfo.innerText = response.data.totalHour+"시간 중 "+response.data.studyingHour+"시간";	
    			}
    			const percent = document.querySelector("#percent");
    			const chartPercent = document.querySelector("#chartPercent");
    			if(response.data.percent ==null){
    				percent.innerText = "0% 진행";
    			}else{
    				const rouned =  ((response.data.percent).toFixed(1));
        			percent.innerText = rouned+"% 진행";	
        			chartPercent.setAttribute("style","background: conic-gradient(#3d1cb5 "+response.data.percent+"%, #d1cecb 0% 100%);")
    			}
    			const nullAttendanceCount = document.querySelector("#nullAttendanceCount");
    			if(response.data.nullAttendanceBookCount == null){
    				nullAttendanceCount.innerText = "0 건";	
    			}else{
    				nullAttendanceCount.innerText = response.data.nullAttendanceBookCount+" 건";
    			}
    		});
		}
     	
     	function openLectureInfo(open_lecture_key){
     		const url = "./loadOpenLectureInfo?open_lecture_key="+open_lecture_key;
     		fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			
    			const number = document.querySelector("#number");
    			number.innerText = response.data.openLectureDto.open_lecture_key;
    			
    			const lectureName = document.querySelector("#lectureName");
    			lectureName.innerText = response.data.lectureInfoDto.name;
    			
    			const roundCount = document.querySelector("#roundCount");
    			roundCount.innerText = response.data.roundCount;
    			
				
				const open_date = document.querySelector("#open_date");
				const openDate = new Date(response.data.openLectureDto.open_date);
				open_date.innerText = openDate.getFullYear() +"."+ (openDate.getMonth()+1) + "."+ openDate.getDate();
				
				const close_date = document.querySelector("#close_date");
				const closeDate = new Date(response.data.openLectureDto.close_date);
				close_date.innerText = closeDate.getFullYear() +"."+ (closeDate.getMonth()+1) + "."+ closeDate.getDate();
				
				const lectureStatus = document.querySelector("#lectureStatus");
				
				const currentDate = new Date();
			
				if(currentDate < openDate){
					lectureStatus.innerText = '모집중';
					lectureStatus.classList.add("text-danger");
				}else if(currentDate >= openDate && currentDate <= closeDate){
					lectureStatus.innerText = '진행중';
					lectureStatus.classList.add("text-primary");
				}else if(currentDate > closeDate){
					lectureStatus.innerText = '종료';
					lectureStatus.classList.add("text-secondary");
				}
				
				const max_studentAndCurrentStudent = document.querySelector("#max_studentAndCurrentStudent");
				max_studentAndCurrentStudent.innerText = response.data.lectureStudentCount+"/"+response.data.openLectureDto.max_student
				
				
    		});
     	}
     	
     	function loadAttendanceStatusList(open_lecture_key) {
			const url = "./getAttendanceInfoList?open_lecture_key="+open_lecture_key;
			fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			const attendanceStatusListBox = document.querySelector("#attendanceStatusListBox");
    			attendanceStatusListBox.innerHtml = "";
    			if(response.data[0] ==null){
    				attendanceStatusListBox.innerText = "작성 가능한 강의 일지가 없습니다.";
    				attendanceStatusListBox.classList.add("text-center" , "text-secondary");
    			}else{
	    			for(e of response.data){
	    				
	    				const attendanceStatusWrapper = document.querySelector("#attendanceStatusTemplete .attendanceStatusWrapper").cloneNode(true);
	    			
	    				const targetDate = attendanceStatusWrapper.querySelector(".targetDate");
	    				const resultDate = new Date(e.date);
	    				
	    				const day = resultDate.getFullYear()+"."+(resultDate.getMonth()+1)+"."+resultDate.getDate();
	    				targetDate.innerText = day;
	    			
	    				const absenceCount = attendanceStatusWrapper.querySelector(".absenceCount");
	    				const lateCount = attendanceStatusWrapper.querySelector(".lateCount");
	    				
	    				const maxCount = attendanceStatusWrapper.querySelector(".maxCount");
	    				
	    				const thisDate = new Date(e.date);
	    				const date_created = thisDate.getFullYear()+"-"+(thisDate.getMonth()+1)+"-"+thisDate.getDate();
	    				const millis = Date.parse(date_created);
	    				
	    			
	    				
	    				const writeStudyLog= attendanceStatusWrapper.querySelector(".writeStudyLog");
	    				if(e.attendanceBookDto == null){
	    					
	    					writeStudyLog.innerText = '일지작성';
	    					writeStudyLog.classList.add("btn-primary");
	    					writeStudyLog.setAttribute("onclick","showAttendacneModal("+millis+")");
	    				
	    					absenceCount.innerText = "-";
	    					lateCount.innerText = "-";
	    					
	    				}else {
	    					writeStudyLog.innerText = '상세보기';
	    					writeStudyLog.classList.add("btn-outline-secondary");
	    					writeStudyLog.setAttribute("onclick","showAttendacneModal("+millis+")");
	    					
	    					absenceCount.innerText = e.absenceStudentCount;
	    					lateCount.innerText = e.lateStudentCount;
	    				}

    				attendanceStatusListBox.appendChild(attendanceStatusWrapper);
    				}
    			}
    		});
			
		}
     	function lectureTestListInfo(open_lecture_key) {
     		lectureTestListBox.innerHtml = "";
     		const url = "./getLectureTestList?open_lecture_key="+open_lecture_key;
     		fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			const lectureTestListBox = document.querySelector("#lectureTestListBox");
    			
    			if(response.data[0] == null){
    				lectureTestListBox.innerText = "등록되어있는 시험이 존재하지 않습니다.";
    				lectureTestListBox.classList.add("text-center" , "text-secondary");
    			}else{
    				lectureTestListBox.classList.remove("text-center" , "text-secondary");
    			
	    			for(e of response.data){
	    					
	        			const testListWrapper = document.querySelector("#lecutreTestListTemplete .testListWrapper").cloneNode(true);
	
	        			const testNumber = testListWrapper.querySelector(".testNumber");
	        			testNumber.innerText = e.lectureTestDto.lecture_test_key;
	        			
	        			const testName = testListWrapper.querySelector(".testName"); 
	        			testName.innerText = e.lectureTestDto.test_name;
	        			
	        			
	        			const openDate = new Date(e.lectureTestDto.open_test_day);
	         			const open_test_day = openDate.getFullYear()+"-"+(openDate.getMonth()+1) + "-"+ openDate.getDate();
	        			
	         			const open_date = testListWrapper.querySelector(".open_date");
	        			open_date.innerText = open_test_day;
	        			
	        			const closeDate = new Date(e.lectureTestDto.close_test_day);
	         			const close_test_day = closeDate.getFullYear()+"-"+(closeDate.getMonth()+1) + "-"+ closeDate.getDate();
	        			
	        			const close_date = testListWrapper.querySelector(".close_date");
	        			close_date.innerText = close_test_day;
	        			
	        			const maxStudentAndTotalStudent = testListWrapper.querySelector(".maxStudentAndTotalStudent");
	        			maxStudentAndTotalStudent.innerText = e.testingStudentCount+"/"+e.lectureStudentCount
	        			
	        			const testListPageButton = testListWrapper.querySelector(".testListPageButton");
	        			testListPageButton.setAttribute("onclick","location.href='./testStudentListPage?lecture_test_key="+e.lectureTestDto.lecture_test_key+"'");
	        			
	        			lectureTestListBox.appendChild(testListWrapper);
	    			}
    			}
    		});
		}
     	
     	
     	
     	// 시험등록 모달
     	function showTestWriteModal() {
     		const modal = bootstrap.Modal.getOrCreateInstance("#testWriteModal");
     		loadWriteTestInfo();
			modal.show();
     	}
     	function hideTestWriteModal() {
     		const modal = bootstrap.Modal.getOrCreateInstance("#testWriteModal");
     		const test_name = document.querySelector("#test_name");
     		test_name.value ="";
     		const open_test_day = document.querySelector("#open_test_day");
     		open_test_day.value ="";
     		const close_test_day = document.querySelector("#close_test_day");
     		close_test_day.value ="";
     		const testQuestionListBox = document.querySelector("#testQuestionListBox");
     		testQuestionListBox.innerHTML ="";
     		modal.hide();
		}
     	
     	
		function loadWriteTestInfo(){
			const url = "./loadOpenLectureInfo?open_lecture_key="+open_lecture_key;
     		fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			const testModalLectureName = document.querySelector("#testModalLectureName");
    			testModalLectureName.innerText = "제 "+response.data.roundCount+"회 "+response.data.lectureInfoDto.name+" 시험출제";
    		
    			const studyCategory = document.querySelector("#studyCategory");
    			studyCategory.innerText = response.data.categoryName;
    			
    			const testOpenLecturerName = document.querySelector("#testOpenLecturerName");
    			testOpenLecturerName.innerText = response.data.lifeLecturerDto.name;
    			
    		});
     		
     	}
     	let questionCount = 0;
     	function appendTestQuestionTemplete(){
     		const testQuestionWrapper = document.querySelector("#testQuestionTemplete .testQuestionWrapper").cloneNode(true);
     		const testQuestionListBox = document.querySelector("#testQuestionListBox");
     		questionCount++;
     		
     		const questionNumber = testQuestionWrapper.querySelector(".questionNumber");
     		questionNumber.innerText = questionCount;
     		
     		testQuestionListBox.appendChild(testQuestionWrapper);
     		
     	}
     	
     	function insertTestInfo(){
     		// 빈칸있거나, (다른곳에서는 체크 두번안되게 체크 확인하는 기능만들어야함.), 배점이 100점이 아닐시 알람뜨게해야함.
     		const test_name = document.querySelector("#test_name").value;
     		const open_test_day = document.querySelector("#open_test_day").value;
     		const close_test_day = document.querySelector("#close_test_day").value;
     		
     		const url = "./insertLectureTestAndGetTestPk";
     		fetch(url, {
     			method: "post",
     			headers: {
     				"Content-Type": "application/x-www-form-urlencoded"
     			},
     			body:"open_lecture_key="+open_lecture_key+"&test_name="+test_name
     				+"&open_test_day="+open_test_day+"&close_test_day="+close_test_day
     		})
     		.then(response => response.json())
    		.then((response) => {
    			
    			insertTestQuestion(response.data);
    			
    		});
     		
     	}
     	
     	
     	function insertTestQuestion(lecture_test_key) {
     	    const testQuestionWrapperList = document.querySelectorAll("#testQuestionListBox .testQuestionWrapper");

     	    for (const testQuestionWrapper of testQuestionWrapperList) {
     	        const question_number = testQuestionWrapper.querySelector(".questionNumber").innerText;
     	        const question = testQuestionWrapper.querySelector(".question").value;
     	        const test_point = testQuestionWrapper.querySelector(".test_point").value;

     	        const url = "./insertTestQuestionAndGetQuestionPk";
     	        fetch(url, {
     	            method: "post",
     	            headers: {
     	                "Content-Type": "application/x-www-form-urlencoded"
     	            },
     	            body: "lecture_test_key=" + lecture_test_key + "&question=" + question + "&test_point=" + test_point + "&question_number=" + question_number
     	        })
     	        .then(response => response.json())
     	        .then((response) => {
     	            const test_question_key = response.data;

     	            const choiceList = testQuestionWrapper.querySelectorAll(".choiceBox");
     	            for (const choiceBox of choiceList) {
     	                let answer = "false";
     	                const choice = choiceBox.querySelector(".choice").value;
     	                const answerCheckBox = choiceBox.querySelector(".answerCheckBox");

     	                if (answerCheckBox.checked == true) {
     	                    answer = "true";
     	                }

     	                const choiceUrl = "./insertQuestionChoice";
     	                fetch(choiceUrl, {
     	                    method: "post",
     	                    headers: {
     	                        "Content-Type": "application/x-www-form-urlencoded"
     	                    },
     	                    body: "test_question_key=" + test_question_key + "&choice=" + choice + "&answer=" + answer
     	                });
     	            }

     	            hideTestWriteModal();
     	            const lectureTestListBox = document.querySelector("#lectureTestListBox");
     	           lectureTestListBox.innerHTML ="";
     	            lectureTestListInfo(open_lecture_key);
     	        });
     	    }
     	}
     	function checkTestResult(target){
     		
     		const testQuestionWrapper = target.closest(".testQuestionWrapper");
     		const answerCheckBoxList = testQuestionWrapper.querySelectorAll(".answerCheckBox");
     		for(answerCheckBox of answerCheckBoxList){
   				
   				answerCheckBox.checked = false;
     		}
     		target.checked = true;
     	}
     	
     	
     	// 출석관련 모달
     	function showAttendacneModal(date){
     		const modal =  bootstrap.Modal.getOrCreateInstance("#attendanceModal");
     		
 			const thisDate = new Date(date);
 			
 			const datefrm = thisDate.getFullYear()+"-"+(thisDate.getMonth()+1).toString().padStart(2, '0') + "-"+ thisDate.getDate().toString().padStart(2, '0');
			const selectDate = document.getElementById("selectDate");
			selectDate.value = datefrm;
			
 			openModalLectureInfo();
 			
     		checkAttendanceBook(datefrm);
     		
     		loadNoAttendanceBookList();
     		
     		modal.show();
     	}
     	function changeDay(){
     		const selectDate = document.querySelector("#selectDate");
     		
     		const noAttendanceDayListBox = document.querySelector("#noAttendanceDayListBox");
     		const targetDay = noAttendanceDayListBox.value;
			selectDate.value = targetDay;
			
			checkAttendanceBook(targetDay);
     		
     	}
     	
     	function loadNoAttendanceBookList() {
			const url = "./getNoAttendanceBookDateList?open_lecture_key="+open_lecture_key;
			fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			const noAttendanceDayListBox = document.querySelector("#noAttendanceDayListBox");
    			
    			for(e of response.data){
    				const optionBox = document.createElement("option");
    				optionBox.setAttribute("value", e);
    				
    				optionBox.innerText = e;
    				
    				
    				
    				noAttendanceDayListBox.appendChild(optionBox);
    			}
    			
    		});
		}
     	
     	
     	function openModalLectureInfo(){
     		const url = "./loadOpenLectureInfo?open_lecture_key="+open_lecture_key;
     		fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			const lectureModalName = document.querySelector("#lectureModalName");
    			lectureName.innerText = "제 "+response.data.roundCount+"회 "+response.data.lectureInfoDto.name;
    			
				const selectDate = document.querySelector("#selectDate");
				
				const open_date = new Date(response.data.openLectureDto.open_date);
				selectDate.setAttribute("min", open_date.getFullYear()+"-"+(open_date.getMonth()+1).toString().padStart(2, '0') + "-"+ open_date.getDate().toString().padStart(2, '0'));
				
				const close_date = new Date(response.data.openLectureDto.close_date);
				const currentDate = new Date();
				
				if(currentDate <= close_date){
					selectDate.setAttribute("max", currentDate.getFullYear()+"-"+(currentDate.getMonth()+1).toString().padStart(2, '0') + "-"+ currentDate.getDate().toString().padStart(2, '0'));
				}else{
					selectDate.setAttribute("max", close_date.getFullYear()+"-"+(close_date.getMonth()+1).toString().padStart(2, '0') + "-"+ close_date.getDate().toString().padStart(2, '0'));
				}
				
				
				const lectureStudentCount = document.querySelector("#lectureStudentCount");
				lectureStudentCount.innerText = response.data.lectureStudentCount+"명";
		
    		});
     	}
     	
		function checkAttendanceBook(date_created) {	
			
			const url = "./checkAttendanceBookLoad?date_created="+date_created;
     		fetch(url)
     		.then(response => response.json())
    		.then((response) => {
				
    			if(response.data.attendanceBookDto == null){
    				
    				const absenceStudentCheckBoxList = document.querySelector("#absenceStudentCheckBoxList");
    				absenceStudentCheckBoxList.innerHTML = "";
    				const lateStudentCheckBoxList = document.querySelector("#lateStudentCheckBoxList");
    				lateStudentCheckBoxList.innerHTML = "";
    				
    				const study_log = document.querySelector("#study_log");
    				study_log.value = "";
    				study_log.removeAttribute("disabled");
    				const late_student = document.querySelector("#late_student");
        			late_student.innerText = "0 명";
        			const absence_student = document.querySelector("#absence_student");
        			absence_student.innerText = "0 명";
    				
    				
    				const insertButton = document.querySelector("#insertButton");
    				insertButton.classList.remove("disable", "btn-outline-secondary");
    				insertButton.classList.add("btn-primary");
    				insertButton.innerText = "저장하기";
    				
    				 
    				
    			
    				studentAttendanceWrite(open_lecture_key);
    				
    				
    			}
    			if(response.data.attendanceBookDto != null){
    				
    				const absenceStudentCheckBoxList = document.querySelector("#absenceStudentCheckBoxList");
    				absenceStudentCheckBoxList.innerHTML = "";
    				const lateStudentCheckBoxList = document.querySelector("#lateStudentCheckBoxList");
    				lateStudentCheckBoxList.innerHTML = "";
    				
    				const study_log = document.querySelector("#study_log");
    				study_log.setAttribute("disabled", true);
    				study_log.value = response.data.attendanceBookDto.study_log;
    				
    				const insertButton = document.querySelector("#insertButton");
    				insertButton.classList.add("disable", "btn-outline-secondary");
    				insertButton.classList.remove("btn-primary");
    				insertButton.innerText = "상세보기";
    				
    				loadStudentAttendaceStatus(response.data.attendanceBookDto.attendance_book_key);
    			}
    			const noAttendanceDayListBox = document.querySelector("#noAttendanceDayListBox");
         		noAttendanceDayListBox.innerHTML ="";
         		
         		const optionBox = document.createElement("option");
         		optionBox.setAttribute("id", "default");
         		optionBox.setAttribute("selected", true);
         		optionBox.innerText = "날짜를 선택해주세요";
         		
         		noAttendanceDayListBox.appendChild(optionBox);
         		loadNoAttendanceBookList();
    			
    		});
     		
		}
		function loadStudentAttendaceStatus(attendance_book_key){
     		const url = "lectureAttendanceStatus?attendance_book_key="+attendance_book_key;
     		
     		fetch(url)
     		.then(response => response.json())
    		.then((response) => {
    			let lateStudentCount = 0;
    			let absenceStudentCount = 0;
    			for(e of response.data){
    				const absenceStudentCheckBoxList = document.querySelector("#absenceStudentCheckBoxList");
    				const lateStudentCheckBoxList = document.querySelector("#lateStudentCheckBoxList");
    				
    				const late_lecture_student_key = document.createElement("input");
    				late_lecture_student_key.setAttribute("type", "hidden");
    				late_lecture_student_key.setAttribute("value" ,e.lectureStudentDto.lecture_student_key);
    				late_lecture_student_key.classList.add("lecture_student_key");
    				
    				const lateInput = document.createElement("input");
    				lateInput.setAttribute("type", "checkbox");
    				lateInput.setAttribute("disabled", true);
    				if(e.attendanceStatusDto.status == '지각'){
    					lateStudentCount++;
    					lateInput.checked = true;
    				}
    				lateInput.setAttribute("type", "checkbox");
    				lateInput.setAttribute("value", e.lectureStudentDto.lecture_student_key);
    				lateInput.setAttribute("onclick", "lateCheck(this)");
    				lateInput.classList.add("checkLateStudent");
    				
    				const lateCol = document.createElement("div");
    				lateCol.classList.add("col", "student");
    				lateCol.innerText = e.lifeStudentDto.name;
    				lateCol.appendChild(lateInput);
    				lateCol.appendChild(late_lecture_student_key);
    				
    				const absence_lecture_student_key = document.createElement("input");
    				absence_lecture_student_key.setAttribute("type", "hidden");
    				absence_lecture_student_key.setAttribute("value" ,e.lectureStudentDto.lecture_student_key);
    				absence_lecture_student_key.classList.add("lecture_student_key");
    				
    				const absenceInput = document.createElement("input");
    				absenceInput.setAttribute("type", "checkbox");
    				absenceInput.setAttribute("disabled", true);
    				if(e.attendanceStatusDto.status == '결석'){
    					absenceStudentCount++;
    					absenceInput.checked = true;
    				}
    				absenceInput.setAttribute("value", e.lectureStudentDto.lecture_student_key);
    				absenceInput.setAttribute("onclick", "absenceCheck(this)");
    				absenceInput.classList.add("checkAbsenceStudent");
    				
    				const absenceCol = document.createElement("div");
    				absenceCol.classList.add("col", "student");
    				absenceCol.innerText = e.lifeStudentDto.name;
    				absenceCol.appendChild(absenceInput);
    				absenceCol.appendChild(absence_lecture_student_key);
    				
    				
    	 			lateStudentCheckBoxList.appendChild(lateCol);
    				absenceStudentCheckBoxList.appendChild(absenceCol);
    			}
    			const late_student = document.querySelector("#late_student");
    			late_student.innerText = lateStudentCount+"명";
    			const absence_student = document.querySelector("#absence_student");
    			absence_student.innerText = absenceStudentCount+"명";
	
    		});
     	}
     	
     	function studentAttendanceWrite(open_lecture_key) {
			
     		const url = "lectureStudentList?open_lecture_key="+open_lecture_key;
        	fetch(url)
    		.then(response => response.json())
    		.then((response) => {
	
    			for(e of response.data){
    				
    				const absenceStudentCheckBoxList = document.querySelector("#absenceStudentCheckBoxList");
    				const lateStudentCheckBoxList = document.querySelector("#lateStudentCheckBoxList");
    				
    				const late_lecture_student_key = document.createElement("input");
    				late_lecture_student_key.setAttribute("type", "hidden");
    				late_lecture_student_key.setAttribute("value" ,e.lectureStudentDto.lecture_student_key);
    				late_lecture_student_key.classList.add("lecture_student_key");
    				
    				const lateInput = document.createElement("input");
    				lateInput.setAttribute("type", "checkbox");
    				lateInput.setAttribute("value", e.lectureStudentDto.lecture_student_key);
    				lateInput.setAttribute("onclick", "lateCheck(this)");
    				lateInput.classList.add("checkLateStudent");
    				
    				const lateCol = document.createElement("div");
    				lateCol.classList.add("col", "student");
    				lateCol.innerText = e.lifeStudentDto.name;
    				lateCol.appendChild(lateInput);
    				lateCol.appendChild(late_lecture_student_key);
    				
    				const absence_lecture_student_key = document.createElement("input");
    				absence_lecture_student_key.setAttribute("type", "hidden");
    				absence_lecture_student_key.setAttribute("value" ,e.lectureStudentDto.lecture_student_key);
    				absence_lecture_student_key.classList.add("lecture_student_key");
    				
    				const absenceInput = document.createElement("input");
    				absenceInput.setAttribute("type", "checkbox");
    				absenceInput.setAttribute("value", e.lectureStudentDto.lecture_student_key);
    				absenceInput.setAttribute("onclick", "absenceCheck(this)");
    				absenceInput.classList.add("checkAbsenceStudent");
    				
    				const absenceCol = document.createElement("div");
    				absenceCol.classList.add("col", "student");
    				absenceCol.innerText = e.lifeStudentDto.name;
    				absenceCol.appendChild(absenceInput);
    				absenceCol.appendChild(absence_lecture_student_key);
    				
    				
    	 			lateStudentCheckBoxList.appendChild(lateCol);
    				absenceStudentCheckBoxList.appendChild(absenceCol);
    				 
    		 	} 
    		
    		});
        		
		}
     
     	
     	function insertAttendanceBook(){
     		
        	
        	const selectDate =document.querySelector("#selectDate").value;
     		const study_log = document.querySelector("#study_log");
     		const url = "./insertAttendanceBookProcess";
     		
     		fetch(url, {
     			method: "post",
     			headers: {
     				"Content-Type": "application/x-www-form-urlencoded"
     			},
     			body:"open_lecture_key="+open_lecture_key+"&date_created="+selectDate
     	            +"&study_log="+study_log.value
     		})
     		.then(response => response.json())
    		.then((response) => {
    			insertAttendanceStatus(response.data);
    			
    		})
     		;
     	}     	
     	
     	function insertAttendanceStatus(attendance_book_key) {
     		
     		const url = "./insertAttendanceStatusProcess";
     		
     		var checkLateStudent = document.getElementsByClassName('checkLateStudent');
            for (var i = 0; i < checkLateStudent.length; i++) {
            	let status = '출석';
            	if(checkLateStudent[i].checked == true){
            		status = '지각';
            		
             		fetch(url, {
             			method: "post",
             			headers: {
             				"Content-Type": "application/x-www-form-urlencoded"
             			},
             			body:"attendance_book_key="+attendance_book_key+"&lecture_student_key="+checkLateStudent[i].value
             	            +"&status="+status
             		});
             	    
            	}
            }
            var checkAbsenceStudent = document.getElementsByClassName('checkAbsenceStudent');
            for (var i = 0; i < checkAbsenceStudent.length; i++) {
            	let status = '출석';
            	if(checkAbsenceStudent[i].checked == true){
            		status = '결석';
             		
             		fetch(url, {
             			method: "post",
             			headers: {
             				"Content-Type": "application/x-www-form-urlencoded"
             			},
             			body:"attendance_book_key="+attendance_book_key+"&lecture_student_key="+checkLateStudent[i].value
         	           		 +"&status="+status
             		});
             	    
            	}
            }
            for (var i = 0; i < checkAbsenceStudent.length; i++) {
            	if(checkAbsenceStudent[i].checked == false && checkLateStudent[i].checked == false){
            		status = '출석';
             		
             		fetch(url, {
             			method: "post",
             			headers: {
             				"Content-Type": "application/x-www-form-urlencoded"
             			},
             			body:"attendance_book_key="+attendance_book_key+"&lecture_student_key="+checkLateStudent[i].value
    	           			 +"&status="+status
    	           			 
             		});
             	    
            	}
            }
            hideAttendanceModal();
            reloadListBox();
            loadAttendanceStatusList(open_lecture_key);
            getStudyingInfo(open_lecture_key);
            loadStudentInfo(open_lecture_key);
            	
		}
     	function reloadListBox() {
     		const attendanceStatusListBox = document.querySelector("#attendanceStatusListBox");
     		attendanceStatusListBox.innerHTML ="";
     		const studentInfoListBox = document.querySelector("#studentInfoListBox");
     		studentInfoListBox.innerHTML = "";
		}
     	
     	function lateCheck(target) {
     		const targetValue = target.value;
     		 var checkAbsenceStudent = document.getElementsByClassName('checkAbsenceStudent');
     		  for (var i = 0; i < checkAbsenceStudent.length; i++) {
     			 if(targetValue == checkAbsenceStudent[i].value && checkAbsenceStudent[i].checked ==true ){
     				target.checked = true;
     				checkAbsenceStudent[i].checked = false;
     			 }
     		  }
		}
     	function absenceCheck(target) {
     		const targetValue = target.value;
    		 var checkLateStudent = document.getElementsByClassName('checkLateStudent');
    		  for (var i = 0; i < checkLateStudent.length; i++) {
    			 if(targetValue == checkLateStudent[i].value && checkLateStudent[i].checked ==true ){
    				target.checked = true;
    				checkLateStudent[i].checked = false;
    			 }
    		  }
		}
     	
     	
     	
     	
     	
     	
     	function hideAttendanceModal() {
     		const modal =  bootstrap.Modal.getOrCreateInstance("#attendanceModal");
     		reloadAttendanceModal();
     		
            modal.hide();
		}
     	function reloadAttendanceModal() {
     		const absenceStudentCheckBoxList = document.querySelector("#absenceStudentCheckBoxList");
     		absenceStudentCheckBoxList.innerHTML = "";
     		
     		const lateStudentCheckBoxList = document.querySelector("#lateStudentCheckBoxList");
     		lateStudentCheckBoxList.innerHTML = "";
     		
     		const study_log = document.querySelector("#study_log");
     		study_log.value = "";
     		
     		const noAttendanceDayListBox = document.querySelector("#noAttendanceDayListBox");
     		noAttendanceDayListBox.innerHTML ="";
     		
     		const optionBox = document.createElement("option");
     		optionBox.setAttribute("id", "default");
     		optionBox.setAttribute("selected", true);
     		optionBox.innerText = "날짜를 선택해주세요";
     		
     		noAttendanceDayListBox.appendChild(optionBox);
		}
     	
     	
     	window.addEventListener("DOMContentLoaded", () =>{
     		loadMainPageInfo();
     		getMyInfo();
        });
     	
     	</script>
     	<style>
            .chart {
                position: relative;
                width: 70px;
                height: 70px;
                border-radius: 50%;
                transition: 0.3s;
                background:lightgray;
                display:inline-block;
            }

            .chart:after{
                content:'';
                background: #fff;
                position: absolute;
                top:50%; left:50%;
                width:50px; height: 50px;
                border-radius: 50%;
                transform: translate(-50%, -50%);
            }
            .chart-bar{
                width: inherit;
                height: inherit;
                border-radius: 50%;
            }
        </style>
     	
    </head>
    <body>
        <div class="container-fluid" style="background-color:  rgb(240, 240, 240); height: 100%">
             <div onclick="location.href='./mainPage'" class="row pb-1 mt-2" style="cursor: pointer;">
                <div class="col-1 text-end">
                    <img src="../../resources/img/another/logo_black.png" alt="" style="height: 3em;">
                </div>
                <div class="col fw-bold fs-4 test-start mt-1 ps-0">
                    MK대학교 평생교육센터
                </div>
            </div>
            <div class="row text-light" style="background-color: #133369;">
           		<div class="col-9"></div>
            	<div id="lecturerNmae" class="col mt-1 text-end pe-0" style="font-size: small">
            		
            	</div>
            	<div class="col mt-2" style="font-size: x-small;">
            		(강사)님.
            	</div>
            	<div class="col mt-1 text-start" style="font-size: small">
            		<a class="navbar-brand" href="../../another/external/loginPage">로그아웃</a>
            	</div>
            </div>
            
            <div class="row">
               <div class="col-2 me-5" style="background-color: #133369;" >
                    <div class="row mt-3">
                    	<div onclick="location.href='./mainPage'" class="col text-light fs-5 my-3" style="cursor: pointer;">
                    		<i class="bi bi-house ms-1 me-3"></i> 메인페이지
                    	</div>
                        <div class="accordion accordion-flush px-0">
						  <div class="accordion-item">
						      <a class="accordion-button collapsed text-light navbar-brand fs-5"type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" style="background-color: #133369;">
						        <i class="bi bi-journal-bookmark me-3"></i> 강의 관리
						      </a>
						    <div id="flush-collapseOne" class="accordion-collapse collapse">
						      <div class="accordion-body text-light"  style="background-color: #133369;">
						      	<div class="row">
						      		<div id="goLectureManagementPage" class="col ms-3" style="cursor: pointer;">
						      			강의 상세
						      		</div>
						      	</div>
						      	<div class="row">
						      		<div onclick="location.href='./mainPage'" class="col ms-3 mt-2"style="cursor: pointer;">
						      			전체 강의
						      		</div>
						      	</div>
						      </div>
						    </div>
						  </div>
						</div>
                    </div>
                    <div class="row">
                        <div class="accordion accordion-flush px-0">
						  <div class="accordion-item">
						      <a class="accordion-button button-white collapsed text-light navbar-brand fs-5" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" style="background-color: #133369;">
						        <i class="bi bi-book me-3"></i> 학적부
						      </a>
						    <div id="flush-collapseTwo" class="accordion-collapse collapse">
						      <div class="accordion-body text-light"  style="background-color: #133369;">
						      	<div class="row">
						      		<div id="goStudentListPage" class="col ms-3" style="cursor: pointer;">
						      			수강생 관리
						      		</div>
						      	</div>
						      	<div class="row">
						      		<div id="goAttendancePage" class="col ms-3 mt-2" style="cursor: pointer;">
						      			출석 관리
						      		</div>
						      	</div>
						      </div>
						    </div>
						  </div>
						</div>
                    </div>
                    <div class="row">
                        <div class="accordion accordion-flush px-0">
						  <div class="accordion-item">
						      <a class="accordion-button collapsed text-light navbar-brand fs-5" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" style="background-color: #133369;">
                                <i class="bi bi-card-checklist me-3"></i> 시험 관리
						      </a>
						    <div id="flush-collapseThree" class="accordion-collapse collapse">
						      <div class="accordion-body text-light"  style="background-color: #133369;">
						      	<div class="row">
						      		<div  class="col ms-3 goTestInfoPage" style="cursor: pointer;">
						      			시험출제
						      		</div>
						      	</div>
						      	<div class="row">
						      		<div class="col ms-3 mt-2 goTestInfoPage" style="cursor: pointer;">
						      			시험/평가
						      		</div>
						      	</div>
						      </div>
						    </div>
						  </div>
						</div>
                    </div>
                    <div class="row">
                        <div class="accordion accordion-flush px-0">
						  <div class="accordion-item">
						      <a class="accordion-button collapsed text-light navbar-brand fs-5" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" style="background-color: #133369;">
                                <i class="bi bi-pencil me-3 "></i> 수강생 후기                                
						      </a>
						    <div id="flush-collapseFour" class="accordion-collapse collapse">
						      <div class="accordion-body text-light"  style="background-color: #133369;">
						      	<div class="row">
						      		<div class="col ms-3 reviewPage" style="cursor: pointer;">
						      			만족도 조사
						      		</div>
						      	</div>
						      	<div class="row">
						      		<div class="col ms-3 mt-2 reviewPage" style="cursor: pointer;">
						      			후기
						      		</div>
						      	</div>
						      </div>
						    </div>
						  </div>
						</div>
                    </div>
                </div>
                <div class="col mt-5">
                    <div class="row">
                        <div class="col">
                            home > 강의 진행 현황 > 강의 관리
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col fw-bold fs-5 text-light" style="background-color: #133369;">
                            강의 관리 
                        </div>
                    </div>
                    <div class="row bg-white border border-black pt-3 px-3">
                        <div class="col">
                            <div class="row fw-bold text-center" style="background-color: rgb(240, 240, 240);">
                                <div class="col-1 border align-self-center">
                                    번호
                                </div>
                                <div class="col-4 border align-self-center">
                                    과정명
                                </div>
                                <div class="col-1 border align-self-center">
                                    회차
                                </div>
                                <div class="col-1 border align-self-center">
                                    담당강사
                                </div>
                                <div class="col-1 border align-self-center">
                                    개강일
                                </div>
                                <div class="col-1 border align-self-center">
                                    종료일
                                </div>
                                <div class="col-1 border align-self-center">
                                    수강인원
                                </div>	
                                <div class="col-2 border align-self-center">
                                    과정 진행 상태 
                                </div>
                            </div>
                            <div class="row text-center align-self-center">
                                <div id="number" class="col-1 py-3 border align-self-center">
                                    
                                </div>
                                <div id="lectureName" class="col-4 py-3 border align-self-center ">
                                    
                                </div>
                                <div id="roundCount" class="col-1 py-3 border align-self-center">
                                    
                                </div>
                                <div id="openLecturerName" class="col-1 py-3 border align-self-center ">
                                    
                                </div>
                                <div id="open_date" class="col-1 py-3 border align-self-center">
                                    
                                </div>
                                <div id="close_date" class="col-1 py-3 border align-self-center ">
                                    
                                </div>
                                <div id="max_studentAndCurrentStudent" class="col-1 py-3 border align-self-center ">
                                    
                                </div>
                                <div id="lectureStatus"class="col-2 py-3 border align-self-center">
                                    
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <div class="row">
                                        <div class="col fw-bold border-bottom border-black">
                                            강의 진행 상황
                                        </div>
                                    </div>
                                    <div class="row my-3">
                                        <div class="col-1"></div>
                                        <div class="col-1 px-0 text-center">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="chart">
                                                        <div id="chartPercent" class="chart-bar" ></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <div class="row">
                                                <div id="studyingHourInfo" class="col text-start">
                                                    70시간 중 38시간
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div id="percent" class="col fs-4 fw-bold">
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-4  text-end fw-bold mt-3">
                                                    시험
                                                </div>
                                                <div class="col fs-3 fw-bold mt-2">
                                                    0건
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="row">
                                                <div class="col text-end fw-bold  mt-3">
                                                    고충/건의사항
                                                </div>
                                                <div class="col fs-3 fw-bold mt-2">
                                                    0건
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="row">
                                                <div  class="col text-end fw-bold  mt-3">
                                                    훈련일지 미작성
                                                </div>
                                                <div id="nullAttendanceCount" class="col fs-3 fw-bold mt-2">
                                                   
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>
                     <div class="row mt-5">
                        <div class="col-4 border-black border bg-white">
                            <div class="row text-light" style="background-color: #133369;">
                                <div class="col fw-bold fs-5 pe-0">
                                    훈련일지 관리 
                                </div>
                                <div class="col text-end mt-1">
                                    <a id="absenceManagementPage" class="navbar-brand" href="#" style="font-size: small;">더보기+</a>
                                </div>
                            </div>
                            <div class="row bg-white overflow-y-auto" style="height: 12em;">
                                <div class="col border mx-3 my-3">
                                    <div class="row text-center  fw-bold" style="background-color: rgb(240, 240, 240)">
                                        <div class="col-4 border align-self-center">
                                            날짜
                                        </div>
                                        <div class="col border align-self-center">
                                            지각
                                        </div>
                                        <div class="col border align-self-center">
                                            결석
                                        </div>
                                        <div class="col-4 border align-self-center">
                                            관리
                                        </div>
                                    </div>
                                    <div class="row">
                                    	<div id="attendanceStatusListBox" class="col">
                                    		
                                    	</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col border-black border bg-white ms-5">
                            <div class="row text-light" style="background-color: #133369;">
                                <div class="col fw-bold fs-5 pe-0">
                                    수강생 관리
                                </div>
                                <div class="col text-end mt-1">
                                    <a id="goStudentTotalListPage"class="navbar-brand" href="#" style="font-size: small;">더보기+</a>
                                </div>
                            </div>
                            <div class="row bg-white overflow-y-auto" style="height: 12em;">
                                <div class="col border mx-3 my-3 ">
                                    <div class="row text-center fw-bold" style="background-color: rgb(240, 240, 240);">
                                        <div class="col-3 border align-self-center">
                                            등록번호
                                        </div>
                                        <div class="col border align-self-center">
                                            이름
                                        </div>
                                        <div class="col border align-self-center">
                                            성별
                                        </div>
                                        <div class="col border align-self-center">
                                            지각
                                        </div>
                                        <div class="col border align-self-center">
                                            결석
                                        </div>                                        
                                        <div class="col-3 align-self-center">
                                            관리
                                        </div>
                                    </div>
                                    <div class="row text-center">
                                    	<div id="studentInfoListBox" class="col">
                                    	
                                    	</div>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-5" style="background-color: #133369;">
                        <div class="col fw-bold fs-5 text-light">
                            시험 출제 관리
                        </div>
                        <div class="col text-light text-end mt-1">
                        	<a id="goTestInfoListPage" class="navbar-brand" style="font-size: small;">더보기+</a>
                        </div>
                    </div>
                    <div class="row bg-white border border-black py-3 px-3">
                        <div class="col my-0">
                            <div class="row fw-bold text-center" style="background-color: rgb(240, 240, 240);">
                                <div class="col-1 border align-self-center border py-2">
                                    시험번호
                                </div>
                                <div class="col-4 border align-self-center border py-2">
                                    시험명
                                </div>
                                <div class="col border align-self-center border py-2">
                                    등록일
                                </div>
                                <div class="col border align-self-center border py-2">
                                    종료일
                                </div>
                                <div class="col border align-self-center border py-2">
                                    응시인원
                                </div>
                                <div class="col border align-self-center border py-2">
                                    관리
                                </div>
                            </div>
                            <div class="row overflow-y-auto" style="height: 12em;">
                            	<div id="lectureTestListBox" class="col">
                            	
                            	</div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-2 ">
                        <div class="col text-end pe-0 pb-5">
                            <button onclick="showTestWriteModal()" class="btn btn-primary">시험출제하기</button>
                        </div>
                    </div>
                    <div class="row pb-5"></div>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row ps-3 py-5 text-light" style="font-size: small; background-color: #133369   ;">
            	<div class="col-7">
            		<div class="row">
            			<div class="col-1">
            				<img src="../../resources/img/another/logo_white.png" alt="" style="height: 5em;">
            			</div>
                        <div class="col fw-bold fs-3 align-self-center">
                            MK University
                        </div>
            		</div>
            		<div class="row mt-2">
            			<div class="col">
            				주소: (06134) 서울특별시 강남구 테헤란로7길 7 에스코빌딩 6~7층 
            			</div>
            		</div>
            		<div class="row mt-2">
            			<div class="col">
            			    평생교육원 센터 : 1541-1541 e-mail: se001@naver.com
            			</div>
            		</div>
                    <div class="row mt-2">
            			<div class="col">
            				Copyright 2023 Seoul National University All Rights Reserved.
            			</div>
            		</div>
            	</div>
            	<div class="col ">
            		<div class="row">
            			<div class="col mt-1 fw-bold fs-6">
            				POLICY
            			</div>
            		</div>
            		<div class="row mt-3">
            			<div class="col">
            				이용약관
            			</div>
            		</div>
            		<div class="row mt-2">
            			<div class="col">
            				개인정보처리방침
            			</div>
            		</div>
            		<div class="row mt-2">
            			<div class="col">
            				정보공시
            			</div>
            		</div>
            		<div class="row mt-2">
            			<div class="col">
            				행정센터
            			</div>
            		</div>
            		<div class="row mt-2">
            			<div class="col">
            				이메일 무단수집 거부
            			</div>
            		</div>
            	</div>
            	<div class="col">
            		<div class="row mt-1">
            			<div class="col fw-bold fs-6">
            				학사 문의
            			</div>
            		</div>
            		<div class="row mt-3">
            			<div class="col">
            				MON - FRI | 09:00 - 17:00
            			</div>
            		</div>
            		<div class="row mt-2">
            			<div class="col">
            				LUNCH | 12:30 - 13:30
            			</div>
            		</div>
            		<div class="row mt-2">
            			<div class="col">
            				HOLLYDAY OFF
            			</div>
            		</div>
            	</div>
            	<div class="col">
            		<div class="row">
            			<div class="col mt-1 fw-bold fs-6">
            				SNS SERVICE
            			</div>
            		</div>
            		<div class="row mt-3">
            			<div class="col-1 fs-4 me-1">
            				<i class="bi bi-twitter"></i> 
            			</div>
            			<div class="col-1 fs-4 me-1">
            				<i class="bi bi-facebook"></i> 
            			</div>
            			<div class="col-1 fs-4">
            				<i class="bi bi-instagram"></i>
            			</div>
            			
            		</div>
            	</div>
            </div>
        </div>
        
        <div id="attendanceStatusTemplete" class="d-none">
	        <div class="row attendanceStatusWrapper text-center">
	        	<div class="col-4 align-self-center border py-2 targetDate">
	                
	            </div>
	            <div class="col align-self-center border py-2 lateCount">
	                
	            </div>
	            <div class="col align-self-center border py-2 absenceCount">
	                
	            </div>
	            <div class="col-4 border py-2">
	                <button class="btn  py-0 mt-1 writeStudyLog" style="font-size: small;"></button>
	            </div>
	        </div>
        </div>
        
         <div id="studentInfoListTemplete" class="d-none">
	         <div class="row studentInfoListWrapper">
		         <div class="col-3 align-self-center border py-2 externalId">
		             
		         </div>
		         <div class="col align-self-center border py-2 name">
		             
		         </div>
		         <div class="col align-self-center border py-2 gender">
		             
		         </div>
		         <div class="col align-self-center border py-2 lateCount">
		             
		         </div>
		         <div class="col align-self-center border py-2 absenceCount">
		             
		         </div>
		         <div class="col-3 border">
		             <button  class="btn btn-outline-secondary py-0 mt-2 goStudentListPage" style="font-size: small;">상세보기</button>
		         </div>
	        </div>
		</div>
		
 		<!--훈련일지 상세 모달 -->
       <div id="attendanceModal" class="modal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl">
            <div class="modal-content">
              <div class="modal-header py-2" style="background-color: #133369;">
                    <div class="row">
                        <div id="lectureModalName"class="col text-light">
                            
                        </div>
                    </div>
                    <button onclick="hideAttendanceModal()" type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col">
                        <div class="row">
                            <div class="col-4 border text-center align-self-center fw-bold py-3" style="background-color: rgb(240, 240, 240);">
                                미작성 일지
                            </div>
                            <div class="col-8 text-start border py-2">
                                <select id="noAttendanceDayListBox" class="form-select" onchange="changeDay()" aria-label="Default select example">
                                    <option id="default" selected>날짜를 선택해주세요</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="col-4 border text-center align-self-center fw-bold py-3" style="background-color: rgb(240, 240, 240);">
                                날짜 선택                              
                            </div>
                            <div class="col-8 text-start border py-2">
                                <input onchange="checkAttendanceBook(this.value)" id="selectDate" class="form-control px-1" type="date">
                            </div>
                        </div>
                    </div>
                    <div class="col-1"></div>
                </div> 
                <div class="row mt-3">
                    <div class="col-1"></div>
                    <div class="col border mx-2">
                        <div class="row">
                            <div class="col fw-bold">
                            재적 :
                            </div>
                            <div id="lectureStudentCount" class="col">
                            
                            </div>
                        </div>
                    </div>
                    <div class="col border mx-2">
                        <div class="row">
                            <div class="col fw-bold">
                                결석 :
                            </div>
                            <div id="absence_student" class="col">
                            
                            </div>
                        </div>
                    </div>
                    <div class="col border mx-2">
                        <div class="row">
                            <div class="col fw-bold">
                                지각 :
                            </div>
                            <div id="late_student" class="col">
                            
                            </div>
                        </div>
                    </div>
                    <div class="col-6"></div>
                </div> 
                    
                <div class="row mt-3" style="background-color: rgb(240, 240, 240);">
                <div class="col-1"></div>
                <div class="col fs-5 fw-bold">
                    강의 일지
                </div>
                <div class="col-8 text-danger text-end mt-3" style="font-size: small">
                        *출석 현황은 직접기입하지 않고 결석자, 지각자를 체크하시면 자동으로 기입됩니다.
                    </div>
                <div class="col-1"></div>
                </div>
                <div class="row mt-3 pb-5">
                    <div class="col-1"></div>
                    <div class="col border border-black">
                        <div class="row" style="height: 15em;">
                            <div class="col">
                            <textarea  id="study_log" class="form-control d-grid" style="height: 15em;"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row">
                    <div class="col-1" ></div>
                    <div class="col-3 border  py-4 text-center" style="background-color: rgb(240, 240, 240);">        
                        <div class="row">
                            <div class="col align-self-center fw-bold">
                                결석 현황
                            </div>
                        </div>
                    </div>
                    <div class="col py-4 border">
                        <div id="absenceStudentCheckBoxList" class="row row-cols-6">

                        </div>
                    </div>
                    <div class="col-1"></div>
                </div>
                <div class="row mt-3">
                    <div class="col-1" ></div>
                    <div class="col-3 border py-4 text-center" style="background-color: rgb(240, 240, 240);">        
                        <div class="row">
                            <div class="col align-self-center fw-bold">
                                지각 현황
                            </div>
                        </div>
                    </div>
                    <div class="col border py-4">
                        <div id="lateStudentCheckBoxList" class="row row-cols-6">
                        
                        </div>
                    </div>
                    <div class="col-1"></div>
                </div>
            
            </div>
            <div class="modal-footer">
                <button onclick="hideAttendanceModal()" type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button id="insertButton" onclick="insertAttendanceBook()" type="button" class="btn btn-primary">등록하기</button>
            </div>
        </div> 
     </div>
     </div>   
 		
		<!--시험내용 등록 모달 -->
		 <div id="testWriteModal" class="modal" tabindex="-1">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl">
              <div class="modal-content">
                <div class="modal-header py-2" style="background-color: #133369;">
                 <div class="row">
                    <div id="testModalLectureName"class="col text-light">
                       
                    </div>
                 </div>
                  <button onclick="hideTestWriteModal()" type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col">
                       <div class="row">
                           <div class="col-2 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                시험명
                           </div>
                           <div class="col text-start border py-1 align-self-center">
                            <input id="test_name" class="form-control form-control-sm align-self-center px-0" type="text" placeholder="시험명을 입력해주세요.">
                           </div>
                       </div>
                    </div>
                    <div class="col-1"></div>
                 </div>
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col">
                        <div class="row">
                            <div class="col-4 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                평가 시작일
                            </div>
                            <div class="col-8 text-start border py-2">
                                <input id="open_test_day" class="form-control px-1" type="date">
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="col-4 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                평가 종료일
                            </div>
                            <div class="col-8 text-start border py-2">
                                <input id="close_test_day" class="form-control px-1" type="date">
                            </div>
                        </div>
                    </div>
                    <div class="col-1"></div>
               </div>
               <div class="row ">
                    <div class="col-1"></div>
                    <div class="col">
                        <div class="row">
                            <div class="col-4 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                평가 내용(카테고리)
                            </div>
                            <div id="studyCategory" class="col-8 text-start border py-3">
                                
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="col-4 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                훈련교사
                            </div>
                            <div id="testOpenLecturerName" class="col-8 text-start border py-3">
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-1"></div>
              </div>
              <div class="row">
                    <div class="col-1"></div>
                    <div class="col">
                        <div class="row">
                            <div class="col-4 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                능력단위 요소
                            </div>
                            <div class="col-8 text-start border py-3">
                                데이터베이스 기초, 프로그램 언어 기초
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="col-4 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                평가 시간
                            </div>
                            <div class="col-8 text-start border py-3">
                                60분
                            </div>
                        </div>
                    </div>
                    <div class="col-1"></div>
              </div>
              <div class="row">
                 <div class="col-1"></div>
                 <div class="col">
                    <div class="row">
                        <div class="col-2 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                            성취 수준
                        </div>
                        <div class="col text-start border py-1">
                            <div class="row">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-1"></div>
                                        <div class="col border text-center align-self-center" style="background-color: rgb(240, 240, 240);">
                                            수준
                                        </div>
                                        <div class="col border text-center align-self-center" style="background-color: rgb(240, 240, 240);">
                                            5수준
                                        </div>
                                        <div class="col border text-center align-self-center" style="background-color: rgb(240, 240, 240);">
                                            4수준
                                        </div>
                                        <div class="col border text-center align-self-center" style="background-color: rgb(240, 240, 240);">
                                            3수준
                                        </div>
                                        <div class="col border text-center align-self-center" style="background-color: rgb(240, 240, 240);">
                                           2수준
                                        </div>
                                        <div class="col border text-center align-self-center" style="background-color: rgb(240, 240, 240);">
                                           1수준
                                        </div>
                                        <div class="col-1"></div>
                                    </div>
                                    <div class="row" style="font-size: small;">
                                        <div class="col-1"></div>
                                        <div class="col border text-center align-self-center" >
                                            점수구간
                                        </div>
                                        <div class="col border text-center align-self-center" >
                                            90점 이상
                                        </div>
                                        <div class="col border text-center align-self-center">
                                            80~89점
                                        </div>
                                        <div class="col border text-center align-self-center">
                                            70~79점
                                        </div>
                                        <div class="col border text-center align-self-center">
                                            60~69점
                                        </div>
                                        <div class="col border text-center align-self-center">
                                           60점 미만
                                        </div>
                                        <div class="col-1"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>
                 <div class="col-1"></div>
              </div>
              <div class="row text-center fw-bold mt-4" style="background-color: rgb(240, 240, 240);">
                 <div class="col">
                    평가 내용 출제
                 </div>
              </div>
              <div class="row">
                    <div class="col-1"></div>
                    <div id="testQuestionListBox" class="col">
                       
                    </div>
                    <div class="col-1"></div>
              </div>
            </div>
              <div class="row">
                <div class="col-4"></div>
                <div class="col text-center d-grid py-0 my-5">
                    <Button onclick="appendTestQuestionTemplete()" class="btn btn-outline-primary border border-black py-0">+</Button>
                </div>
                <div class="col-4"></div>
              </div>

              <div class="modal-footer">
                  <button onclick="hideTestWriteModal()" type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button id="insertButton" onclick="insertTestInfo()" type="button" class="btn btn-primary">등록하기</button>
                </div>
              </div>
          </div>
      </div>
		
		
	
	 <div id="testQuestionTemplete" class="d-none">
	 	<div class="row border border-2 mt-4 testQuestionWrapper" style="border-color: #133369;">
             <div class="col">
                 <div class="row my-2">
                     <div class="col-1 fw-bold text-center align-self-center questionNumber">
                      
                     </div>
                     <div class="col-8">
                         <input class="form-control form-control-sm align-self-center px-0 question" type="text" placeholder="문항을 입력해주세요">
                     </div> 
                     <div class="col-1 px-0 fw-bold text-center align-self-center">
                         배점
                     </div> 
                     <div class="col-1 px-0 text-start align-self-center">
                         <input class="form-control form-control-sm test_point" type="number" value="0">
                     </div>                                 
                 </div>
                 <div class="row border-bottom border-2" style="border-color: #133369;">
                     <div class="col">
                         <div class="row my-3 choiceBox">
                             <div class="col-1 align-self-center text-end">
                                 <input onclick="checkTestResult(this)" class="form-check-input border-black px-0 answerCheckBox" type="checkbox">
                             </div>
                             <div class="col-8">
                                 <input class="form-control form-control-sm align-self-center px-0 choice" type="text" placeholder="1번 보기를 입력해주세요.">
                             </div> 
                             <div class="col-2"></div>
                         </div>
                         <div class="row my-3 choiceBox">
                             <div class="col-1 align-self-center text-end">
                                 <input onclick="checkTestResult(this)" class="form-check-input border-black px-0 answerCheckBox" type="checkbox">
                             </div>
                             <div class="col-8">
                                 <input class="form-control form-control-sm align-self-center px-0 choice" type="text"placeholder="2번 보기를 입력해주세요.">
                             </div> 
                             <div class="col-2"></div>
                         </div>
                         <div class="row my-3 choiceBox">
                             <div class="col-1 align-self-center text-end">
                                 <input onclick="checkTestResult(this)" class="form-check-input border-black px-0 answerCheckBox" type="checkbox">
                             </div>
                             <div class="col-8">
                                 <input class="form-control form-control-sm align-self-center px-0 choice" type="text" placeholder="3번 보기를 입력해주세요.">
                             </div> 
                             <div class="col-2"></div>
                         </div>
                         <div class="row my-3 choiceBox">
                             <div class="col-1 align-self-center text-end">
                                 <input onclick="checkTestResult(this)" class="form-check-input border-black px-0 answerCheckBox" type="checkbox">
                             </div>
                             <div class="col-8">
                                 <input class="form-control form-control-sm align-self-center px-0 choice" type="text" placeholder="4번 보기를 입력해주세요.">
                             </div> 
                             <div class="col-2"></div>
                         </div>
                     </div>
                 </div>                          
             </div> 
         </div>
	 </div>
	 
	 <div id="lecutreTestListTemplete" class="d-none">
		  <div class="row text-center testListWrapper">
	          <div class="col-1 border align-self-center border py-2 testNumber">
	              
	          </div>
	          <div class="col-4 border align-self-center border py-2 testName">
	              
	          </div>
	          <div class="col border align-self-center border py-2 open_date">
	              
	          </div>
	          <div class="col border align-self-center border py-2 close_date">
	              
	          </div>
	          <div class="col border align-self-center border py-2 my-0 maxStudentAndTotalStudent">
	              
	          </div>
          	  <div class="col border align-self-center py-2">
            	  <button class="btn btn-outline-secondary py-0 testListPageButton">상세보기</button>
        	  </div>
    	  </div>
     </div>
		
		
		
		
		
		

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>