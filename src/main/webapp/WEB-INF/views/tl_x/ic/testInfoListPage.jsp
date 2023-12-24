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

    		});
			
		}
     	
     	let open_lecture_key = null;
     	function loadTestListPageInfo() {
     		const urlParams = new URLSearchParams(location.search);
     		const key = urlParams.get("open_lecture_key");
     		open_lecture_key = key;
     		
     		
     		openLectureInfo(open_lecture_key)
     		lectureTestListInfo(open_lecture_key);
     		
     		
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
		function lectureTestListInfo(open_lecture_key) {
			
     		const url = "./getLectureTestList?open_lecture_key="+open_lecture_key;
     		fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			const lectureTestListBox = document.querySelector("#lectureTestListBox");
    			lectureTestListBox.innerHtml = "";
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
	        			maxStudentAndTotalStudent.innerText = e.testingStudentCount+"명/"+e.lectureStudentCount+"명";
	        			
	        			const testStatus = testListWrapper.querySelector(".testStatus");
	        			testStatus.innerText = e.testStatus;
	        			if(e.testStatus == '진행중'){
	        				testStatus.classList.add("text-primary");
	        			}else if(e.testStatus == '진행예정'){
	        				testStatus.classList.add("text-info");
	        			}else if(e.testStatus == '종료'){
	        				testStatus.classList.add("text-danger");
	        			}
	        			
	        			const testStudentPageButton = testListWrapper.querySelector(".testStudentPageButton");
	        			testStudentPageButton.setAttribute("onclick", "location.href='./testStudentListPage?lecture_test_key="+e.lectureTestDto.lecture_test_key+"'");
	        			
	        			lectureTestListBox.appendChild(testListWrapper);
	    			}
    			}
    		});
		}
		function openLectureInfo(open_lecture_key){
     		const url = "./loadOpenLectureInfo?open_lecture_key="+open_lecture_key;
     		fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			
    			const openLecutreName = document.querySelector("#openLecutreName");
    			openLecutreName.innerText = "제 "+response.data.roundCount+"회"+response.data.lectureInfoDto.name;
    			
				
				
    		});
     	}
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

		
		
	
		
		
		window.addEventListener("DOMContentLoaded", () =>{
     		getMyInfo();
     		loadTestListPageInfo();
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
                <div class="col ms-5">
                    <div class="row mt-5">
                        <div id="openLecutreName" class="col fs-4 fw-bold border-bottom border-black border-2">
                           
                        </div>
                    </div>
                    <div class="row">
                    	 <div class="col text-end py-0 mt-2">
                            <button onclick="showTestWriteModal()" class="btn btn-primary" style="font-size: small;">시험출제하기</button>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col fw-bold fs-5 text-light" style="background-color: #133369;">
                            시험
                        </div>
                    </div>
                    <div class="row bg-white border border-black py-3 px-3" style="height: 40em;">
                        <div class="col my-0">
                            <div class="row fw-bold text-center" style="background-color: rgb(240, 240, 240);">
                                <div class="col-1 border align-self-center border py-2">
                                    시험번호
                                </div>
                                <div class="col-3 border align-self-center border py-2">
                                    시험명
                                </div>
                                <div class="col border align-self-center border py-2">
                                    시험시작일
                                </div>
                                <div class="col border align-self-center border py-2">
                                    시험종료일
                                </div>
                                <div class="col-1 border align-self-center border py-2">
                                    응시 인원
                                </div>
                                <div class="col-1 border align-self-center border py-2">
                                    진행 상태
                                </div>
                                <div class="col-3 border align-self-center border py-2">
                                    관리
                                </div>
                            </div>
                            <!-- 반복문 구간 -->
                            <div id="lectureTestListBox" class="col">
                            
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
            				<img src="../../resources/img/another/logo_black.png" alt="" style="height: 3em;">
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

		<div id="lecutreTestListTemplete" class="d-none">
			<div class="row text-center testListWrapper">
	           <div class="col-1 h-auto border align-self-center border py-2 testNumber">
	                e33333
	            </div>
	            <div class="col-3 h-auto border align-self-center border py-2 testName">
	                민규와 함께 춤
	            </div>
	            <div class="col h-auto border align-self-center border py-2 text-secondary open_date" style="font-size: small">
	                2023.12.11
	            </div>
	            <div class="col h-auto border align-self-center border py-2 text-secondary close_date" style="font-size: small">
	                2023.12.11
	            </div>
	            <div class="col-1 h-auto border align-self-center border py-2 maxStudentAndTotalStudent">
	                3/19
	            </div>
	            <div class="col-1 h-auto border align-self-center border py-2 testStatus" style="font-size: small">
	              	종료
	            </div>
	            <div class="col-3 h-auto border align-self-center border py-2">
	                <button class="btn btn-primary py-0 testStudentPageButton" style="font-size: small">상세보기</button>
	            </div>
	        </div>
		</div>
		
		
		
		
		
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
		
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>