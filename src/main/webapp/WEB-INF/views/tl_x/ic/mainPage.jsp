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
    			lecturer_key = response.data.lecturer_key;
    			loadMyOpenLectureList(lecturer_key);
    			const lecturerNmae = document.querySelector("#lecturerNmae");
    			lecturerNmae.innerText = response.data.name;
    			
    			
    		});
			
		}
     	function getOpenLecutreDto() {
     		sessionStorage.setItem()
     		
		}
     	function lectureManagementPageMove(open_lecture_key) {
     	   location.href = "lectureManagementPage?open_lecture_key="+open_lecture_key;
		}
     	
     	
     	function loadMyOpenLectureList(lecturer_key) {
     		
     		const url = "./loadMylecture?lecturer_key="+lecturer_key;
     		fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			
    			for(e of response.data){
    				const openLectureWrapper = document.querySelector("#openLectureTemplete .openLecutreWrapper").cloneNode(true);
    				
    				const openLectureListBox = document.querySelector("#openLectureListBox");
    				
    				const open_lecture_key = openLectureWrapper.querySelector(".open_lecture_key");
    				open_lecture_key.innerText = e.openLectureDto.open_lecture_key;
    				
    				const name = openLectureWrapper.querySelector(".name");
    				name.innerText ="";
    				const nameAtag = document.createElement("a");
    				nameAtag.setAttribute("href", "./lectureManagementPage?open_lecture_key="+e.openLectureDto.open_lecture_key);
    				
    				nameAtag.classList.add("navbar-brand");
    				
    				nameAtag.innerText = e.lectureInfoDto.name;
    				name.appendChild(nameAtag);

					
					const roundCount = openLectureWrapper.querySelector(".roundCount");
					roundCount.innerText = e.roundCount;
					
					const lecturerName = openLectureWrapper.querySelector(".lecturerName");
					lecturerName.innerText =  e.lifeLecturerDto.name;
					
					const open_date = openLectureWrapper.querySelector(".open_date");
					const openDate = new Date(e.openLectureDto.open_date);
					open_date.innerText = openDate.getFullYear() +"."+ (openDate.getMonth()+1) + "."+ openDate.getDate();
					
					const close_date = openLectureWrapper.querySelector(".close_date");
					const closeDate = new Date(e.openLectureDto.close_date);
					closeDate.innerText = closeDate.getFullYear() +"."+ (closeDate.getMonth()+1) + "."+ closeDate.getDate();
					
					const max_student = openLectureWrapper.querySelector(".max_student");
					max_student.innerText = e.openLectureDto.max_student;
					
					const moveManagementPage = openLectureWrapper.querySelector(".moveManagementPage");
					moveManagementPage.setAttribute("onclick", "lectureManagementPageMove("+e.openLectureDto.open_lecture_key+")");

					openLectureListBox.appendChild(openLectureWrapper);
    			}
    			
    		});
     		
     		
		}
     	function showLectureStudentListModal(open_lecture_key) {
     		const modal = bootstrap.Modal.getOrCreateInstance("#lectureStudentList");
        	const url = "./lectureStudentList?open_lecture_key="+open_lecture_key;
        	fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			for(e of response.data){
    				
    				const openLectureWrapper = document.querySelector("#lectureStudentListTemplete .lectureStudentWrapper").cloneNode(true);
    				
    				const lectureStudentListBox =document.querySelector(".lectureStudentListBox");
    				
    				const name = openLectureWrapper.querySelector(".name");
    				name.innerText = e.lifeStudentDto.name;
    				
    				lectureStudentListBox.appendChild(openLectureWrapper);
    				
    			}
    			
    			modal.show();	
    			
    		});	
		}
     	function showAttendacneModal(openLectureKey){
     		const modal =  bootstrap.Modal.getOrCreateInstance("#attendanceModal");
     		document.getElementById('date_created').value = new Date().toISOString().substring(0, 10);
 			const date_created = document.getElementById('date_created').value;
     		console.log(date_created);
 			
     		const open_lecture_key = document.querySelector("#open_lecture_key");
			
			open_lecture_key.setAttribute("value" , openLectureKey);
     		console.log(date_created);
			openLectureInfo(openLectureKey);
     		checkAttendanceBook(date_created);
     		
     		modal.show();
     	}
     	
     	function openLectureInfo(open_lecture_key){
     		const url = "./loadOpenLectureInfo?open_lecture_key="+open_lecture_key;
     		fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			const lectureName = document.querySelector("#lectureName");
    			lectureName.innerText = "제 "+response.data.roundCount+"회 "+response.data.lectureInfoDto.name;
    			
				const date_created = document.querySelector("#date_created");
				
				const open_date = new Date(response.data.openLectureDto.open_date);
				
				date_created.setAttribute("min", open_date.getFullYear()+"-"+(open_date.getMonth()+1) + "-"+ open_date.getDate());
				const currentDate = new Date();
				date_created.setAttribute("max", currentDate.getFullYear()+"-"+(currentDate.getMonth()+1) + "-"+ currentDate.getDate());
				
				const max_student = document.querySelector("#max_student");
				max_student.innerText = response.data.openLectureDto.max_student+"명";
				
				const lectureStudentCount = document.querySelector("#lectureStudentCount");
				lectureStudentCount.innerText = response.data.lectureStudentCount+"명";
				
    			
    			
    		});
     	}
     	
     	function hideAttendanceModal() {
     		const modal =  bootstrap.Modal.getOrCreateInstance("#attendanceModal");
     		const absenceStudentCheckBoxList = document.querySelector("#absenceStudentCheckBoxList");
     		absenceStudentCheckBoxList.innerHTML = "";
     		
     		const lateStudentCheckBoxList = document.querySelector("#lateStudentCheckBoxList");
     		lateStudentCheckBoxList.innerHTML = "";
     		
     		const study_log = document.querySelector("#study_log");
     		study_log.value = "";
     		
            modal.hide();
		}
     	
     	function checkAttendanceBook(date_created) {	
			
     		const openLectureKey = document.querySelector("#open_lecture_key");
			const open_lecture_key = openLectureKey.getAttribute("value");
			console.log(open_lecture_key);
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
    				study_log.value = response.data.attendanceBookDto.study_log;
    				
    				const insertButton = document.querySelector("#insertButton");
    				insertButton.classList.add("disable", "btn-outline-secondary");
    				insertButton.classList.remove("btn-primary");
    				insertButton.innerText = "상세보기";
    				
    			
    				
    				
    				loadStudentAttendaceStatus(response.data.attendanceBookDto.attendance_book_key);
    			}
    				
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
     		const open_lecture_key = document.querySelector("#open_lecture_key");
        	const open_lecture_key_value = open_lecture_key.getAttribute("value");
        	const date_created =document.querySelector("#date_created");
     		const study_log = document.querySelector("#study_log");
     		const url = "./insertAttendanceBookProcess";
     		
     		fetch(url, {
     			method: "post",
     			headers: {
     				"Content-Type": "application/x-www-form-urlencoded"
     			},
     			body:"open_lecture_key="+open_lecture_key_value+"&date_created="+date_created.value
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
     	
     	
     	
     	window.addEventListener("DOMContentLoaded", () =>{
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
            <div class="row pb-1 mt-2">
                <div class="col-1 text-end">
                    <img src="../imgForAcademy/logo_black.png" alt="" style="height: 3em;">
                </div>
                <div class="col fw-bold fs-4 test-start mt-1 ps-0">
                    MK대학교 평생교육센터
                </div>
            </div>
            <div class="row text-light" style="background-color: #133369;">
           		<div class="col-9"></div>
            	<div id="lecturerNmae" class="col text-end pe-0">
            		
            	</div>
            	<div class="col mt-1" style="font-size: small">
            		님
            	</div>
            	<div class="col-1 mt-1 text-end" style="font-size: small;">
            		마이페이지
            	</div>
            	<div class="col mt-1" style="font-size: small">
            		<a class="" href="../../another/external/loginPage">로그아웃</a>
            	</div>
            </div>
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col">
                    <div class="row border-bottom border-2 border-primary">
                        <div class="col fw-bold fs-3 mt-1">강의 진행 현황</div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col mt-2">
                    <div class="row">
                        <div class="col fw-bold  text-center number" style="font-size: xx-large;">
                            3
                        </div>
                    </div>
                    <div class="row">
                        <div class="col fw-bold text-center">
                           진행중인 강의
                        </div>
                    </div>
                </div>
                <div class="col mt-2">
                    <div class="row ">
                        <div class="col fw-bold text-center number" style="font-size: xx-large;">
                            5
                        </div>
                    </div>
                    <div class="row">
                        <div class="col fw-bold text-center">
                           진행완료 강의
                        </div>
                    </div>
                </div>
                <div class="col mt-2">
                    <div class="row">
                        <div class="col-3 fw-bold text-center">
                            <div class="chart">
                              	<div id="chartPercent" class="chart-bar" style="background: conic-gradient(#1273ce 94%, #d1cecb 0% 100%);"></div>
                            </div>
                        </div>
                        <div class="col mt-2">
                        	<div class="row">
                            	<div class="col fw-bold text-start">
                         	  		전체 학생중 만족도 평균
                        		</div>
                            </div>
                            <div class="row">
                            	<div class="col fw-bold text-start">
                         	  		4.7점
                        		</div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col mt-2">
                    <div class="row">
                        <div class="col-3 fw-bold text-center">
                            <div class="chart">
                              	<div id="chartPercent" class="chart-bar" style="background: conic-gradient(#3d1cb5 92.3%, #d1cecb 0% 100%);"></div>
                            </div>
                        </div>
                        <div class="col mt-2">
                        	<div class="row">
                            	<div class="col fw-bold text-start"	>
                         	  		전체 학생중 92.3% 학생
                        		</div>
                            </div>
                            <div class="row">
                            	<div class="col fw-bold text-start">
                         	  		수료 완료
                        		</div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-1 mt-2 border-start border-black text-secondary fs-5 text-center number">
                    <div class="row ">
                        <div class="col ">
                             
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col">
                            
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col">
                            
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            
            
            
            <div class="row">
            	<div class="col-1"></div>
                <div class="col mt-5">
                    <div class="row">
                        <div class="col">
                            home > 강의 진행 현황
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col fw-bold fs-3 text-light" style="background-color: #133369;">
                            강의 진행 현황
                        </div>
                    </div>
                    <div class="row bg-white border border-black pt-3 px-3 overflow-y-auto" style="height: 20em">
                        <div class="col">
                            <div class="row fw-bold text-center" style="background-color: rgb(240, 240, 240);">
                                <div class="col-1 border align-self-center">
                                    번호
                                </div>
                                <div class="col-3 border align-self-center">
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
                                    모집인원
                                </div>
                                <div class="col-3 border align-self-center">
                                    관리
                                </div>
                            </div>
                            <!-- 반복문 구간-->
                            <div class="row">       
		                         <div id="openLectureListBox" class="col">
		                         
		                         
		                         </div>
 							</div>
                         </div> 
                     </div>     
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row">
            	<div class="col-1"></div>
                <div class="col mt-5">
                    <div class="row mt-2">
                        <div class="col fw-bold fs-3 text-light" style="background-color: #133369;">
                            신규 개설 강의
                        </div>
                    </div>
                    <div class="row bg-white border border-black pt-3 px-3 overflow-y-auto" style="height: 12em">
                        <div class="col">
                            <div class="row fw-bold text-center" style="background-color: rgb(240, 240, 240);">
                                <div class="col-1 border align-self-center">
                                    번호
                                </div>
                                <div class="col-3 border align-self-center">
                                    과정명
                                </div>
                                <div class="col-1 border align-self-center">
                                    회차
                                </div>
                                <div class="col-1 border align-self-center">
                                    개강 예정일
                                </div>
                                <div class="col-1 border align-self-center">
                                    종강 예정일
                                </div>
                                <div class="col-1 border align-self-center">
                                    모집 예정 인원
                                </div>
                                <div class="col-1 border align-self-center">
                                    수강 신청 인원
                                </div>
                                <div class="col-3 border align-self-center">
                                    관리
                                </div>
                            </div>
                            <!-- 반복문 구간-->
                            <div class="row">       
		                         <div id="" class="col">
		                         	<div class="row  text-center">
                                <div class="col-1 border align-self-center">
                                    28
                                </div>
                                <div class="col-3 border align-self-center">
                                   	데이터베이스 이해와 활용
                                </div>
                                <div class="col-1 border align-self-center">
                                    2회차
                                </div>
                                <div class="col-1 border align-self-center">
                                    2024.02.27
                                </div>
                                <div class="col-1 border align-self-center">
                                    2024.08.17
                                </div>
                                <div class="col-1 border align-self-center">
                                   	40명
                                </div>
                                <div class="col-1 border align-self-center">
                                    0명
                                </div>
                                <div class="col-3 border align-self-center">
                                    <button class="btn btn-primary">상세정보</button>
                                </div>
                            </div>
		                         
		                         </div>
 							</div>
                         </div> 
                     </div>     
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row">
            	<div class="col">
            		
            	</div>
            </div>
            
		<pre>
		
		
		
		
		
		
		
		
		
		
		
		
		
		</pre>





        </div>
        
        
        <div id ="openLectureTemplete" class="d-none">
	        <div class="openLecutreWrapper row text-center align-self-center">
	           <div class="col-1 py-3 border align-self-center open_lecture_key">
	               6
	           </div>
	           <div class="col-3 py-3 border align-self-center name">
	               데이터 융합 자바 응용소프트웨어 개발자
	           </div>
	           <div class="col-1 py-3 border align-self-center roundCount">
	               1
	           </div>
	           <div class="col-1 py-3 border align-self-center lecturerName">
	               이민규
	           </div>
	           <div class="col-1 py-3 border align-self-center open_date">
	               2023.08.16
	           </div>
	           <div class="col-1 py-3 border align-self-center close_date">
	               2024.02.27
	           </div>
	           <div class="col-1 py-3 border align-self-center max_student">
	               30
	           </div>
	           <div class="col-3 py-3 border align-self-center">
	               <button class="btn btn-primary moveManagementPage py-0">
	                   상세관리
	               </button>
	           </div>
	       </div>
		</div>
		
		
		
		<div id="lectureStudentList"class="modal" tabindex="-1">
		  <div class="modal-dialog">
		    <div class="modal-content" style="width: 50em; height: 40em">
		      <div class="modal-header py-2" style="background-color: #133369">
		       <div class="row">
			   		<div class="col text-light">
			   			수강생 현황
			   		</div>
			   </div>
		        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<div class="row">
		      		<div class="col">
		      			번호
		      		</div>
		      		<div class="col">
		      			이름
		      		</div>
		      		<div class="col">
		      			생년월일
		      		</div>
		      		<div class="col">
		      			시험 점수
		      		</div>
		      	</div>
		      	<div class="row">
		      		<div class="col lectureStudentListBox">
		      			
		      		</div>
		      	</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
		
		<div id="lectureStudentListTemplete" class="d-none">
			<div class="row lectureStudentWrapper">
	      		<div class="col studentNumber">
	      			1
	      		</div>
	      		<div class="col name">
	      			이름
	      		</div>
	      		<div class="col absenceStatus">
	      			출석현황
	      		</div>
	      		<div class="col ">
	      			시험 점수
	      		</div>
		      </div>
		</div>
		
		
		
		<div id="attendanceModal" class="modal" tabindex="-1">
			  <div class="modal-dialog">
			    <div class="modal-content" style="width: 50em;">
			      <div class="modal-header py-2" style="background-color: #133369">
			       <div class="row">
				   		<div id="lectureName"class="col text-light">
				   			강의 명 훈련일지 
				   		</div>
				   </div>
			        <button onclick="hideAttendanceModal()" type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body overflow-y-auto">
			      <div class="row">
			      	<div class="col-8 text-danger" style="font-size: small">
			      		*출석 현황은 직접기입하지 않고 결석자, 지각자를 체크하시면 자동으로 기입됩니다.
			      		<input id="open_lecture_key" type="hidden">
			      	</div>
			      	<div class="col pe-0">
			      		날짜 선택
			      	</div>
			      	<div class="col text-start">
			      		<input onchange="checkAttendanceBook(this.value)" id="date_created" type="date">
			      	</div>
			     </div>
			     <div class="row border border-black">
			  		 <div class="col-1 text-center">
			  			재적:
			  		 </div>
			  		 <div class="col-3">
			  			<div class="row">
			  				<div id="max_student" class="col text-start">
			  					
			  				</div>
			  				<div id="lectureStudentCount" class="col">
			  				</div>
			  			</div>
			  		</div>
			  		<div class="col-1 text-center">
			  			지각:
			  		 </div>
			  		 <div class="col-1">
			  			<div class="row">
			  				<div id="late_student" class="col text-start">
			  					0명
			  				</div>
			  			</div>
			  		</div>
			  		<div class="col-1 text-center">
			  			결석:
			  		 </div>
			  		 <div class="col-1">
			  			<div class="row">
			  				<div id="absence_student" class="col text-start">
			  					0명
			  				</div>
			  			</div>
			  		</div>
				</div>
				<div class="row">
					<div class="col">
						강의 내용
					</div>
				</div>
				<div class="row">
					<div class="col">
						<textarea id="study_log" rows="8" cols="85"></textarea>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-2 border">
						지각 현황
					</div>
					<div class="col">
						<div id="lateStudentCheckBoxList" class="row row-cols-6 border">

						</div>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-2 border">
						결석 현황
					</div>
					<div class="col">
						<div id="absenceStudentCheckBoxList" class="row row-cols-6 border">

						</div>
					</div>
				</div>
			    <div class="modal-footer">
			        <button onclick="hideAttendanceModal()" type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button id="insertButton" onclick="insertAttendanceBook()" type="button" class="btn btn-primary">저장하기</button>
			      </div>
			    </div>
			  </div>
			</div>
		</div>
		
		
		
		
		
		
		
		

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>