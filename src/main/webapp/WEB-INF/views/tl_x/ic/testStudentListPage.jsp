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
    			
    			const testOpenLecturerName = document.querySelector("#testOpenLecturerName");
    			testOpenLecturerName.innerText = response.data.name;
    		});
			
		}
     	
     
     	let lecture_test_key = null;
     	function getUrlKey() {
     		const urlParams = new URLSearchParams(location.search);
     		const key = urlParams.get("lecture_test_key");
     		lecture_test_key = key;
     		loadTestInfo(lecture_test_key);
     		loadTestStudentList(lecture_test_key);
     		
     		
     		
     		
		}  
		function loadTestInfo() {
			const url = "./loadTestInfo?lecture_test_key="+lecture_test_key;
			fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			if(response.data == null){
    				const elementByTest =document.querySelector("#elementByTest");
    				elementByTest.innerText ="";
    				const testTime = document.querySelector("#testTime");
    				testTime.innerText="";
    			}else{
	    			const openLecutreName = document.querySelector("#openLecutreName");
	    			openLecutreName.innerText = response.data.roundCount+"회 "+response.data.lectureInfoDto.name;
	    			
	    			const testName = document.querySelector("#testName");
	    			testName.innerText = response.data.lectureTestDto.test_name;
	    			
	    			const openDate = new Date(response.data.lectureTestDto.open_test_day);
	    			const open_day = openDate.getFullYear()+"-"+(openDate.getMonth()+1) + "-"+ openDate.getDate();
	    			
	    			const open_test_day = document.querySelector("#open_test_day");
	    			open_test_day.innerText = open_day;
	    			
	    			const closeDate = new Date(response.data.lectureTestDto.close_test_day);
	    			const close_day = closeDate.getFullYear()+"-"+(closeDate.getMonth()+1) + "-"+ closeDate.getDate();
	    			
	    			const close_test_day = document.querySelector("#close_test_day");
	    			close_test_day.innerText = close_day;
	    			
	    			const testDate = new Date(response.data.lectureTestDto.close_test_day);
	    			
	    			const testing_day = document.querySelector("#testing_day");
	    			
	    			
	    			const studyCategory = document.querySelector("#studyCategory");
	    			studyCategory.innerText = response.data.categoryName;
    			}
    			const goLectureManagementPage = document.querySelector("#goLectureManagementPage");
         		goLectureManagementPage.setAttribute("onclick" ,"location.href='./lectureManagementPage?open_lecture_key="+response.data.lectureTestDto.open_lecture_key+"'");
         		const goStudentListPage = document.querySelector("#goStudentListPage");
         		goStudentListPage.setAttribute("onclick" ,"location.href='./lectureStudentInfoListPage?open_lecture_key="+response.data.lectureTestDto.open_lecture_key+"'");
         		const goAttendancePage = document.querySelector("#goAttendancePage");
         		goAttendancePage.setAttribute("onclick" ,"location.href='./attendanceStudentListPage?open_lecture_key="+response.data.lectureTestDto.open_lecture_key+"'");
         		const goTestInfoPage = document.querySelectorAll(".goTestInfoPage");
         		for(e of goTestInfoPage ){
         			e.setAttribute("onclick" ,"location.href='./testInfoListPage?open_lecture_key="+response.data.lectureTestDto.open_lecture_key+"'");	
         		}
         		const reviewPage = document.querySelectorAll(".reviewPage");
         		for(e of reviewPage ){
         			e.setAttribute("onclick" ,"location.href='./lectureReviewPage?open_lecture_key="+open_lecture_key+"'");	
         		}
         		
         	
    		});
		}     
		
     	function loadTestStudentList(lecture_test_key) {
			
     		const url = "./loadTestStudentList?lecture_test_key="+lecture_test_key;
			fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    		
    			
    			const testStudentListBox = document.querySelector("#testStudentListBox");
    			testStudentListBox.innerHtml ="";
    			
    			if(response.data[0] == null){
    				testStudentListBox.innerText = "수강신청 된 학생이 존재하지 않습니다.";
    				testStudentListBox.classList.add("text-center" , "text-secondary");
    			}else{
	    			for(e of response.data){
	    				const testStudentListWrapper = document.querySelector("#testStudentListTemplet .testStudentListWrapper").cloneNode(true);	
	        			
	        			const name = testStudentListWrapper.querySelector(".name");
	        			name.innerText = e.lifeStudentDto.name;
	        			
	        			const externalId = testStudentListWrapper.querySelector(".externalId");
	    				externalId.innerText = e.externalInfoDto.external_id;
	        			
	        			const gender = testStudentListWrapper.querySelector(".gender");
	        			if(e.lifeStudentDto.gender == "M"){
	        				gender.innerText = "남";	
	        			}else{
	        				gender.innerText = "여";
	        			}
	   					     			
	        			const studentTestingStatus = testStudentListWrapper.querySelector(".studentTestingStatus");
	        			const testScore =  testStudentListWrapper.querySelector(".testScore");
	        			const showResultButton = testStudentListWrapper.querySelector(".showResultButton");
	        			if(e.statusCount == 1){
	        				studentTestingStatus.innerText ='응시완료';
	        				studentTestingStatus.classList.add("text-primary");
	        				
	        				testScore.innerText = e.test_point.toFixed(1)+"점"
	        				showResultButton.setAttribute("onclick","showStudentTestResultModal("+e.lifeStudentDto.life_student_key+")");
	        				showResultButton.classList.add("btn-primary");
	        				
	        			}else{
	        				studentTestingStatus.innerText ='미응시';
	           				studentTestingStatus.classList.add("text-danger");
	           				
	           				testScore.innerText = "-";
	           				
	           				showResultButton.classList.add("btn-outline-secondary","disable");
	        			}
	        			
	        			
	        			
	        			testStudentListBox.appendChild(testStudentListWrapper);
	    			}
    			
    			}
    			
    		});
			
		}
     	
     	//시험 결과 모달
     	function showStudentTestResultModal(life_student_key) {
     		const modal = bootstrap.Modal.getOrCreateInstance("#studentTestResultModal");
     		loadStudentTestResultList(life_student_key)
     		loadTestinfoForModal(lecture_test_key)
     		testingStudentInfo(lecture_test_key, life_student_key)
			modal.show();
     	}
     	
     	function hideStudentTestResultModal() {
     		const modal = bootstrap.Modal.getOrCreateInstance("#studentTestResultModal");
     		
     		const testResultListBox = document.querySelector("#testResultListBox");
     		testResultListBox.innerHTML = "";
     		
     		const level1 = document.querySelector("#level1");
     		const level1Box = document.querySelector("#level1Box");
     		const level2 = document.querySelector("#level2");
     		const level2Box = document.querySelector("#level2Box");
     		const level3 = document.querySelector("#level3");
     		const level3Box = document.querySelector("#level3Box");
     		const level4 = document.querySelector("#level4");
     		const level4Box = document.querySelector("#level4Box");
     		const level5 = document.querySelector("#level5");
     		const level5Box = document.querySelector("#level5Box");
     		
     		
     		
     		level1.classList.remove("fw-bold");
			level1Box.removeAttribute("style");
			level1Box.classList.remove("text-light");
     		
			level2.classList.remove("fw-bold");
			level2Box.removeAttribute("style");
			level2Box.classList.remove("text-light");
			
			level3.classList.remove("fw-bold");
			level3Box.removeAttribute("style");
			level3Box.classList.remove("text-light");
			
			level4.classList.remove("fw-bold");
			level4Box.removeAttribute("style");
			level4Box.classList.remove("text-light");
			
			level5.classList.remove("fw-bold");
			level5Box.removeAttribute("style");
			level5Box.classList.remove("text-light");
     		
     		modal.hide();
		}
     	function testingStudentInfo(lecture_test_key, life_student_key) {
			const url = "loadTestingStduentInfo?lecture_test_key="+lecture_test_key+"&life_student_key="+life_student_key;
			
			fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			const testing_day = document.querySelector("#testing_day");
    			const testingDate = new Date(response.data.testingDate);
    			const test_day = testingDate.getFullYear()+"-"+(testingDate.getMonth()+1) + "-"+ testingDate.getDate();
    			testing_day.innerText = test_day;
    			
    			const studentName = document.querySelector("#studentName");
    			studentName.innerText = response.data.lifeStudentDto.name;
    		});
			
		}
     	
     	
     	function loadTestinfoForModal(lecture_test_key){
     		
     		const url = "./loadTestInfo?lecture_test_key="+lecture_test_key;
			fetch(url)
    		.then(response => response.json())
    		.then((response) => {
 
    			const testModalLectureName = document.querySelector("#testModalLectureName");
    			testModalLectureName.innerText = response.data.roundCount+"회 "+response.data.lectureInfoDto.name;
    			
    			const modalTestName = document.querySelector("#modalTestName");
    			modalTestName.innerText = response.data.lectureTestDto.test_name;
    			
    			const openDate = new Date(response.data.lectureTestDto.open_test_day);
    			const open_day = openDate.getFullYear()+"-"+(openDate.getMonth()+1) + "-"+ openDate.getDate();
    			
    			const closeDate = new Date(response.data.lectureTestDto.close_test_day);
    			const close_day = closeDate.getFullYear()+"-"+(closeDate.getMonth()+1) + "-"+ closeDate.getDate();
    			
    			const open_close_day = document.querySelector("#open_close_day");
    			open_close_day.innerText = open_day+"-"+close_day;
    			
    			
    			
    			const modalStudyCategory = document.querySelector("#modalStudyCategory");
    			modalStudyCategory.innerText = response.data.categoryName;
    			
    		});
     	}
     	
     	function loadStudentTestResultList(life_student_key){
     		const url = "./loadStudentTestResultListForModal?life_student_key="+life_student_key+"&lecture_test_key="+lecture_test_key;
			fetch(url)
    		.then(response => response.json())
    		.then((response) => {
   				/* const testDate = new Date(response.data[0].qList[0].testResultDto.created_at);
    			const testingDay = testDate.getFullYear()+"-"+(testDate.getMonth()+1) + "-"+ testDate.getDate();
    			const testing_day = document.querySelector("#testing_day");
    			testing_day.innerText = testingDay; */
    			
    			
    			const testResultListBox = document.querySelector("#testResultListBox");
				
    			let test_score = 0;
    			for(e of response.data){
    				const testQuestionWrapper = document.querySelector("#testQuestionTemplete .testQuestionWrapper").cloneNode(true);
    				
    				//문항번호랑 answer or noAnswer css클래스 넣어주기 
    				const CheckAnswerNumber = testQuestionWrapper.querySelector(".CheckAnswerNumber");
    				CheckAnswerNumber.innerText = e.testQuestionDto.question_number;
    				
    				const question = testQuestionWrapper.querySelector(".question");
    				question.innerText = e.testQuestionDto.question;
    				
    				const test_point = testQuestionWrapper.querySelector(".test_point");
    				test_point.innerText = e.testQuestionDto.test_point+"점";
    				
    				const choiceBoxList = testQuestionWrapper.querySelector("#choiceBoxList");
    				for(ee of e.qList){
    					
    					const choiceBoxWrapper =  document.querySelector("#choiceBoxTemplete .choiceBoxWrapper").cloneNode(true);
    					
    					const choice = choiceBoxWrapper.querySelector(".choice");
    					choice.innerText = ee.questionChoiceDto.choice;
    					
    					const answerCheckBox = choiceBoxWrapper.querySelector(".answerCheckBox");
    					if(ee.questionChoiceDto.answer =="true" && ee.testResultDto != null){
   							answerCheckBox.checked = true;	
   							
   							CheckAnswerNumber.classList.add("answer");
   							test_score += e.testQuestionDto.test_point;
    					}else if (ee.questionChoiceDto.answer =="false" && ee.testResultDto != null){
    						CheckAnswerNumber.classList.add("noAnswer");
    						answerCheckBox.checked = true;
    						choice.classList.add("text-danger");
    						
    					}
						if(ee.questionChoiceDto.answer =="true"){
							choice.classList.add("text-primary");
						}
    					choiceBoxList.appendChild(choiceBoxWrapper);
    				}
    				testResultListBox.appendChild(testQuestionWrapper);
   				}const testScore = document.querySelector("#testScore");
   				testScore.innerText = test_score + "점";
    			
   				
   				
   				
   				
   				
   				if(test_score < 60){
   					const level1 = document.querySelector("#level1");
    				level1.classList.add("fw-bold");
    				const level1Box = document.querySelector("#level1Box");
    				level1Box.setAttribute("style", "background-color: #133369");
    				level1Box.classList.add("text-light");
    			}else if(test_score <= 70){
    				const level2 = document.querySelector("#level2");
    				level2.classList.add("fw-bold");
    				const level2Box = document.querySelector("#level2Box");
    				level2Box.setAttribute("style", "background-color: #133369");
    				level2Box.classList.add("text-light");
    			}else if(test_score <= 80){
    				const level3 = document.querySelector("#level3");
    				level3.classList.add("fw-bold");
    				const level3Box = document.querySelector("#level3Box");
    				level3Box.setAttribute("style", "background-color: #133369");
    				level3Box.classList.add("text-light");
    			}else if(test_score <= 90){
    				
    				const level4 = document.querySelector("#level4");
    				level4.classList.add("fw-bold");
    				const level4Box = document.querySelector("#level4Box");
    				level4Box.setAttribute("style", "background-color: #133369");
    				level4Box.classList.add("text-light");
    			}else if(test_score > 90){
    				const level5 = document.querySelector("#level5");
    				level5.classList.add("fw-bold");
    				const level5Box = document.querySelector("#level5Box");
    				level5Box.setAttribute("style", "background-color: #133369");
    				level5Box.classList.add("text-light");
    			}
    		});
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
            .answer{
                background-size: cover;
                position: relative;
                width: 5vh;
                height: 5vh;   
                display: grid;
                z-index: 1;
            }
            .answer::after{
               width: 6vh;
                height: 6vh;
                content: "";
                background-image: url("../../resources/img/tl_x/answer.png");
                background-size: cover;
                position: absolute;
                display: grid;
                top: -5;
                right: 20;
                z-index: -1;
                align-self: center;
                padding-left: 4em;
                
            }
            .noAnswer{
                background-size: cover;
                position: relative;
                width: 5vh;
                height: 5vh;   
                display: grid;
                z-index: 1;
                align-self: center;
            }
            .noAnswer::after{
                width: 6vh;
                height: 6vh;
                content: "";
                background-image: url("../../resources/img/tl_x/noanswer.png");
                background-size: cover;
                position: absolute;
                display: grid;
                top: -5;
                right: 20;
                z-index: -1;
                align-self: center;
                padding-left: 4em;
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
                <div class="col ms-5">
                    <div class="row mt-5">
                        <div id="openLecutreName" class="col text-secondary">
                            
                        </div>
                    </div>
                    <div class="row">
                        <div id="testName"class="col fs-4 fw-bold border-bottom border-black border-2">
                            
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-1"></div>
                        <div class="col">
                            <div class="row">
                                <div class="col-4 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                    평가 시작일
                                </div>
                                <div id="open_test_day" class="col-8 text-start border align-self-center py-3 text-secondary">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col-4 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                    평가 종료일
                                </div>
                                <div id="close_test_day" class="col-8 text-start border align-self-center py-3 text-secondary">
                                    
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
                                <div id="elementByTest" class="col-8 text-start border py-3">
                                    데이터베이스 기초, 프로그램 언어 기초
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col-4 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                    평가 시간
                                </div>
                                <div id="testTime" class="col-8 text-start border py-3">
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


                    <div class="row mt-5">
                        <div class="col fw-bold fs-5 text-light" style="background-color: #133369;">
                            시험응시현황
                        </div>
                    </div>
                    <div class="row bg-white border border-black py-3 px-3 overflow-y-auto" style="height: 40em;">
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
                                <div class="col border align-self-center border py-2">
                                    응시현황
                                </div>
                                <div class="col-1 border align-self-center border py-2">
                                    점수
                                </div>
                                <div class="col-3 border align-self-center border py-2">
                                    관리
                                </div>
                            </div>
                            <!-- 반복문 구간 -->
                            <div id="testStudentListBox" class="col">
                                
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

		<div id="testStudentListTemplet" class="d-none">
			<div class="row text-center testStudentListWrapper">
                <div class="col-2 border align-self-center border py-2 externalId">
                    e2023344
                </div>
                <div class="col-2 border align-self-center border py-2 name">
                    조인춘
                </div>
                <div class="col-1 border align-self-center border py-2 gender">
                    남
                </div>
                <div class="col border align-self-center border py-2 studentTestingStatus" style="font-size: small">
                    응시완료
                </div>
                <div class="col-1 border align-self-center border py-2 testScore" >
                    99점
                </div>
                <div class="col-3 border align-self-center border py-2">
                    <button class="btn py-0 showResultButton" style="font-size: small">학생답안</button>
                </div>
            </div>
		</div>
		
		
		<div id="studentTestResultModal" class="modal" tabindex="-1">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl" >
              <div class="modal-content">
                <div class="modal-header py-2" style="background-color: #133369;">
                 <div class="row">
                    <div id="testModalLectureName"class="col text-light">
                       
                    </div>
                 </div>
                  <button onclick="hideStudentTestResultModal()" type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                <div class="row">
                    <div class="col-1"></div>
                    <div class="col">
                       <div class="row">
                           <div class="col-2 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                시험명
                           </div>
                           <div id="modalTestName" class="col text-start border py-3 align-self-center">
                                
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
                                평가 기간
                            </div>
                            <div id="open_close_day" class="col-8 text-start text-secondary align-self-center border py-3">
                                
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="col-4 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                시험 응시일
                            </div>
                            <div id="testing_day" class="col-8 text-start align-self-center text-secondary border py-3">
                                
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
                            <div id="modalStudyCategory" class="col-8 text-start border py-3">
                                
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="col-4 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                학생명
                            </div>
                            <div id="studentName" class="col-8 text-start border py-3">
                                
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
                                총점
                            </div>
                            <div id="testScore" class="col-8 text-start border py-3">
                                
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
                                        <div id="level5Box" class="col border text-center align-self-center" style="background-color: rgb(240, 240, 240);">
                                            5수준
                                        </div>
                                        <div id="level4Box" class="col border text-center align-self-center" style="background-color: rgb(240, 240, 240);">
                                            4수준
                                        </div>
                                        <div id="level3Box" class="col border text-center align-self-center" style="background-color: rgb(240, 240, 240);">
                                            3수준
                                        </div>
                                        <div id="level2Box" class="col border text-center align-self-center" style="background-color: rgb(240, 240, 240);">
                                           2수준
                                        </div>
                                        <div id="level1Box" class="col border text-center align-self-center" style="background-color: rgb(240, 240, 240);">
                                           1수준
                                        </div>
                                        <div class="col-1"></div>
                                    </div>
                                    <div class="row" style="font-size: small;">
                                        <div class="col-1"></div>
                                        <div class="col border text-center align-self-center" >
                                            점수구간
                                        </div>
                                        <div id="level5" class="col border text-center align-self-center" >
                                            90점 이상
                                        </div>
                                        <div id="level4" class="col border text-center align-self-center">
                                            80~89점
                                        </div>
                                        <div id="level3" class="col border text-center align-self-center">
                                            70~79점
                                        </div>
                                        <div id="level2" class="col border text-center align-self-center">
                                            60~69점
                                        </div>
                                        <div id="level1" class="col border text-center align-self-center">
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
                    평가 내용
                 </div>
              </div>
              <div class="row">
                    <div class="col-1"></div>
                    <div id="testResultListBox" class="col">	
        			
        			</div>
                    <div class="col-1"></div>
              </div>
            </div>
              <div class="modal-footer">
                  <button onclick="hideStudentTestResultModal()" type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
              </div>
          </div>
      </div>
   
      
        <div id="testQuestionTemplete" class="d-none">
            <div class="row border border-2 mt-4 testQuestionWrapper" style="border-color: #133369;">
                <div class="col">
                    <div class="row my-2 ">
                        <div class="col-1 fw-bold text-center align-self-center">
                            <div class="row">
                                <div class="col fw-bold fs-5 pt-2 CheckAnswerNumber">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-8 align-self-center question">
                            
                        </div> 
                        <div class="col-1 px-0 fw-bold text-center align-self-center">
                            배점
                        </div> 
                        <div class="col-1 px-0 text-start align-self-center test_point">
                            
                        </div>                                 
                    </div>
                    <div class="row border-bottom border-2" style="border-color: #133369;">
                        <div id="choiceBoxList" class="col">
                            
                        </div>
                    </div>                          
                </div> 
            </div>
        </div>
        
        <div id="choiceBoxTemplete" class="d-none">
        	<div class="row my-3 choiceBoxWrapper">
               <div class="col-1 align-self-center text-end">
                   <input class="form-check-input border-black px-0 answerCheckBox " type="checkbox" disabled>
               </div>
               <div class="col-8 choice">
                   보기중에 하나지롱 
               </div> 
               <div class="col-2"></div>
           </div>
   		</div>
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>