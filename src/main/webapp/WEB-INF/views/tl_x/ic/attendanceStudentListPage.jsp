<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    			testOpenLecturerName = response.data.name;
    		});
			
		}
     	
     
     	let open_lecture_key = null;
     	function getUrlKey() {
     		const urlParams = new URLSearchParams(location.search);
     		const key = urlParams.get("open_lecture_key");
     		open_lecture_key = key;
     		loadAttendanceInfo(open_lecture_key);
     		loadAttendanceStudentList(open_lecture_key);
     		
     		const date= new Date(); 
     		const currentDate =  date.getFullYear()+"-"+(date.getMonth()+1).toString().padStart(2, '0') + "-"+ date.getDate().toString().padStart(2, '0');
     		const attendacneModalDate = document.querySelector("#attendacneModalDate");
     		attendacneModalDate.setAttribute("onclick" ,"showAttendacneModal("+currentDate+")" );
     		

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
     		
     		
		}  
     	let cutlineScore = 0;
     	function loadAttendanceInfo(open_lecture_key) {
			const url = "./loadAttendanceInfo?open_lecture_key="+open_lecture_key;
			fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			//널페이지를 만들자....
    			const openLecutreName = document.querySelector("#openLecutreName"); 
    			openLecutreName.innerText = "제 "+response.data.roundCount+"회 "+response.data.lectureInfoDto.name;
    			
    			const totalStudyingHour = document.querySelector("#totalStudyingHour");
    			const totalStudyingDay = response.data.lectureInfoDto.total_hour/8;
    			totalStudyingHour.innerText = totalStudyingDay+"일 ("+response.data.lectureInfoDto.total_hour+"시간)";
    			
    			const currentStudyingHourAndPercent = document.querySelector("#currentStudyingHourAndPercent");
    			currentStudyingHourAndPercent.innerText = response.data.percent.toFixed(1)+"% ("+response.data.studyingHour+"시간)";
    			
    			const totalAbsenceStudentCount = document.querySelector("#totalAbsenceStudentCount");
    			totalAbsenceStudentCount.innerText = response.data.totalAbsenceCount+"건";
    			
    			const totalLateStudentCount = document.querySelector("#totalLateStudentCount");
    			totalLateStudentCount.innerText = response.data.totalLateCount+"건";
    			
    			const openDate = new Date(response.data.openLectureDto.open_date);
    			const open_day = openDate.getFullYear()+"-"+(openDate.getMonth()+1) + "-"+ openDate.getDate();
    			
    			const open_date = document.querySelector("#open_date");
    			open_date.innerText = open_day;
    			
    			const closeDate = new Date(response.data.openLectureDto.close_date);
    			const close_day = closeDate.getFullYear()+"-"+(closeDate.getMonth()+1) + "-"+ closeDate.getDate();
    			
    			const close_date = document.querySelector("#close_date");
    			close_date.innerText = close_day;
    			
    			const lectureStudentCount = document.querySelector("#lectureStudentCount");
    			lectureStudentCount.innerText = response.data.lectureStudentCount+"명";
    			cutlineScore = response.data.lectureInfoDto.essential_attendance;
    			const cutLine = document.querySelector("#cutLine");
    			cutLine.innerText = cutlineScore+"점";
    			
    		});
		}   
		
      	function loadAttendanceStudentList(open_lecture_key) {
			
     		const url = "./loadAttendanceStudentList?open_lecture_key="+open_lecture_key;
			fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			
    			const attendanceStudentListBox = document.querySelector("#attendanceStudentListBox");
    			attendanceStudentListBox.innerHtml ="";
    			
    			if(response.data[0] == null){
    				attendanceStudentListBox.innerText = "수강신청 된 학생이 존재하지 않습니다.";
    				attendanceStudentListBox.classList.add("text-center" , "text-secondary");
    			}else{
    				let totalAttendanceScoreAVG = 0;
    				let checkOverCutlineCount =0;
	    			for(e of response.data){
	    				const attendanceStudentListWrapper = document.querySelector("#attendanceStudentListTemplet .attendanceStudentListWrapper").cloneNode(true);	
	    				
	    				const number = attendanceStudentListWrapper.querySelector(".number");
	    				number.innerText = e.externalInfoDto.external_id;
	    				
	        			const name = attendanceStudentListWrapper.querySelector(".name");
	        			name.innerText = e.lifeStudentDto.name;
	        			
	        			const gender = attendanceStudentListWrapper.querySelector(".gender");
	        			if(e.lifeStudentDto.gender == "M"){
	        				gender.innerText = "남";	
	        			}else{
	        				gender.innerText = "여";
	        			}
	        			
	        			const lateCount = attendanceStudentListWrapper.querySelector(".lateCount");
	        			lateCount.innerText = e.lateCount +"건";
	        			
	        			const absenceCount = attendanceStudentListWrapper.querySelector(".absenceCount");
	        			absenceCount.innerText = e.absenceCount +"건";	
	        			
	        			const attendanceScore = attendanceStudentListWrapper.querySelector(".attendanceScore");
	        			attendanceScore.innerText = e.studentAttendanceAvg.toFixed(2)+"/100";
	        			console.log(e.cutline);
	        			if(e.studentAttendanceAvg < e.cutline){
	        				attendanceScore.classList.remove("text-secondary");
	        				attendanceScore.classList.add("text-danger");
	        				attendanceScore.innerText = e.studentAttendanceAvg+"/100(점수미달)";
	        				checkOverCutlineCount++;
	        			}
	        			
	        			totalAttendanceScoreAVG += e.studentAttendanceAvg;
	        			
	        			attendanceStudentListBox.appendChild(attendanceStudentListWrapper);
	    			}
	    			const totalAttendacneAVG = document.querySelector("#totalAttendacneAVG");
	    			if(totalAttendacneAVG != 0){
	    				const rouned =  ((totalAttendanceScoreAVG/response.data.length).toFixed(1));
		    			totalAttendacneAVG.innerText = rouned +"점";	
	    			}else{
	    				totalAttendacneAVG.innerText = "0 점";
	    			}
	    			
	    			
	    			
	    			const overCutlineCount = document.querySelector("#overCutlineCount");
	    			overCutlineCount.innerText = checkOverCutlineCount+"건";

    			
    			}
    			
    		});
			
		}
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
    				
    				console.log(optionBox);
    				
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
    			lectureModalName.innerText = "제 "+response.data.roundCount+"회 "+response.data.lectureInfoDto.name;
    			
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
				selectDate.value = currentDate.getFullYear()+"-"+(currentDate.getMonth()+1).toString().padStart(2, '0') + "-"+ currentDate.getDate().toString().padStart(2, '0');	
				
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
            loadAttendanceInfo(open_lecture_key);
            loadAttendanceStudentList(open_lecture_key)
            	
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
			getUrlKey();
			getMyInfo();
        });
     
        </script>
        
        <style>
             @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;800&family=Roboto+Mono:wght@700&display=swap');
            .body{
                font-family: 'Noto Sans KR', sans-serif;
                font-family: 'Roboto Mono', monospace;
            }

            .text-main{
                color: rgb(0, 0, 255);
            }
            .fs-s{
                font-size: small;
                font-size: 15px;
            }
            .fs-xs{
                font-size: x-small;
            }
            .bg-gray{
                background-color: rgb(241, 240, 237);
            }
            .border-main{
                border-color: #133369;
            }

        </style>

    </head>
    <body>
        <div class="container-fluid">
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
               <div class="col-2" style="background-color: #133369;">
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
						      		<div class="col ms-3">
						      			만족도 조사
						      		</div>
						      	</div>
						      	<div class="row">
						      		<div class="col ms-3 mt-2">
						      			후기
						      		</div>
						      	</div>
						      </div>
						    </div>
						  </div>
						</div>
                    </div>
                </div>
                <div class="col ms-5 mt-5">
                    <div class="row">
                        <div id="openLecutreName"class="col fs-4 fw-bold border-bottom border-black border-2">
                            
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-4 border border-2">
                            <div class="row mt-1">
                                <div class="col fw-bold">
                                    <i class="bi bi-calendar-week"></i> 기간별 검색
                                </div>
                            </div>
                            <div class="row mt-1 pb-2">
                                <div class="col">
                                    <input id="start_day" class="form-control pe-0" type="date">
                                </div>
                                <div class="col-1 px-0 text-center fs-5 align-self-center">-</div>
                                <div class="col">
                                    <input id="end_day" class="form-control ps-0" type="date">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-1 fw-bold py-0 mt-2">
                                    <i class="bi bi-search"></i>
                                </div>
                                <div class="col px-0 py-0">
                                    <input class="form-control d-grid" type="text" placeholder="검색할 학생명을 입력하세요.">
                                </div>
                            </div>
                        </div>
                        <div class="col ms-3">
                            <div class="row">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-2 fw-bold align-self-center border py-2" style="background-color: rgb(240, 240, 240);">
                                            강의 시작일
                                        </div>
                                        <div id="open_date" class="col-4 text-center align-self-center border text-secondary py-2">
                                            
                                        </div>
                                        <div class="col-2 fw-bold align-self-center border py-2" style="background-color: rgb(240, 240, 240);">
                                            강의 종료일
                                        </div>
                                        <div id="close_date" class="col-4 text-center align-self-center border text-secondary py-2">
                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-2 fw-bold align-self-cente border py-2" style="background-color: rgb(240, 240, 240);">
                                            총 수업일수
                                        </div>
                                        <div id="totalStudyingHour" class="col-4 text-center align-self-center border text-secondary py-2">
                                            
                                        </div>
                                        <div class="col-2 fw-bold align-self-center border py-2" style="background-color: rgb(240, 240, 240);">
                                            진행도
                                        </div>
                                        <div id="currentStudyingHourAndPercent" class="col-4 text-center align-self-center border text-secondary py-2">
                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-2 fw-bold align-self-center border py-2" style="background-color: rgb(240, 240, 240);">
                                            총 재적인원
                                        </div>
                                        <div id="lectureStudentCount" class="col-4 text-center align-self-center border text-secondary py-2">
                                            
                                        </div>
                                        <div class="col-2 fw-bold align-self-center border py-2" style="background-color: rgb(240, 240, 240);">
                                           	최소 출석점수
                                        </div>
                                        <div id="cutLine"class="col-4 text-center align-self-center border text-secondary py-2">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">  
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    	<div class="col">
                    		<div class="row mt-2">
                        		<div class="col mt-2">
	                            	<div class="row">
	                                	<div id="totalLateStudentCount" class="col fw-bold  text-center fs-4 number">
	                                    	
	                                	</div>
	                            	</div>
		                            <div class="row">
		                                <div class="col fw-bold text-center">
		                                  	지각
		                                </div>
		                            </div>
		                        </div>
		                        <div class="col mt-2">
		                            <div class="row ">
		                                <div id="totalAbsenceStudentCount" class="col fw-bold text-center fs-4 number">
		                                    
		                                </div>
		                            </div>
		                            <div class="row">
		                                <div class="col fw-bold text-center">
		                                   결석
		                                </div>
		                            </div>
		                        </div>
		                        <div class="col mt-2">
		                            <div class="row ">
		                                <div id="overCutlineCount" class="col fw-bold text-center fs-4 number">
		                                    
		                                </div>
		                            </div>
		                            <div class="row">
		                                <div class="col fw-bold text-center">
		                                  	출결점수 미달
		                                </div>
		                            </div>
		                        </div>
		                        <div class="col mt-2">
		                            <div class="row ">
		                                <div id="totalAttendacneAVG" class="col fw-bold text-center fs-4 number">
		                                    
		                                </div>
		                            </div>
		                            <div class="row">
		                                <div class="col fw-bold text-center">
		                                   평균 출석 점수
		                                </div>
		                            </div>
		                        </div>
		                     </div>
                    	</div>
                    </div>
                    <div class="row">
                    	<div class="col text-end pb-0">
                    		<button id="attendacneModalDate" onclick="showAttendacneModal()" class="btn btn-primary  py-1 mt-4" style="font-size: small">날짜별 강의 일지</button>
                    	</div>
                    </div>
                    <div class="row mt-2">
                        <div class="col fw-bold fs-5 text-light" style="background-color: #133369;">
                            전체 출석률
                        </div>
                    </div>
                    <div class="row bg-white border border-black pt-3 px-3 overflow-y-auto pb-5" style="height: 40em;">
                        <div class="col my-0">
                            <div class="row fw-bold text-center" style="background-color: rgb(240, 240, 240);">
                                <div class="col-2 border align-self-center border py-2">
                                    학생번호
                                </div>
                                <div class="col-2 border align-self-center border py-2">
                                    학생명
                                </div>
                                <div class="col-1 border align-self-center border py-2">
                                    성별
                                </div>
                                <div class="col-1 border align-self-center border py-2">
                                    지각
                                </div>
                                <div class="col-1 border align-self-center border py-2">
                                    결석
                                </div>
                                <div class="col border align-self-center border py-2">
                                    출석점수
                                </div>
                                <div class="col-3 border align-self-center border py-2">
                                    관리
                                </div>
                            </div>
                            <!-- 반복문 구간 -->
                            <div id="attendanceStudentListBox" class="col">
                                
                            </div>
                        </div>
                    </div>
                    <div class="row py-5"></div>
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

		<div id="attendanceStudentListTemplet" class="d-none">
			<div class="row text-center attendanceStudentListWrapper">
                <div class="col-2 border align-self-center border py-2 number">
                    
                </div>
                <div class="col-2 border align-self-center border py-2 name">
                    
                </div>
                <div class="col-1 border align-self-center border py-2 gender">
                    
                </div>
                <div class="col-1 border align-self-center border py-2 lateCount">
                    
                </div>
                <div class="col-1 border align-self-center border py-2 absenceCount">
                    
                </div>
                <div class="col border align-self-center border py-2 text-secondary attendanceScore" style="font-size: small">
                    
                </div>
                <div class="col-3 border align-self-center border py-2">
                    <button class="btn btn-primary py-0" style="font-size: small">상세보기</button>
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
		
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>