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
     		
     		loadLectureStudentTotalInfoList(open_lecture_key);
     		openLectureInfo(open_lecture_key);
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
     	
      	function loadLectureStudentTotalInfoList(open_lecture_key) {
			
     		const url = "./loadLectureStudentTotalInfoList?open_lecture_key="+open_lecture_key;
			fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			
    			const studentTotalInfoListBox = document.querySelector("#studentTotalInfoListBox");
    			studentTotalInfoListBox.innerHtml ="";
    			
    			if(response.data[0] == null){
    				studentTotalInfoListBox.innerText = "수강신청 된 학생이 존재하지 않습니다.";
    				studentTotalInfoListBox.classList.add("text-center" , "text-secondary");
    			}else{
	    			for(e of response.data){
	    				const studentTotalInfoListWrapper = document.querySelector("#studentTotalInfoListTemplet .studentTotalInfoListWrapper").cloneNode(true);	
	    				
	    				const number = studentTotalInfoListWrapper.querySelector(".number");
	    				number.innerText = e.externalInfoDto.external_id;
	    				
	        			const name = studentTotalInfoListWrapper.querySelector(".name");
	        			name.innerText = e.lifeStudentDto.name;
	        			
	        			const gender = studentTotalInfoListWrapper.querySelector(".gender");
	        			if(e.lifeStudentDto.gender == "M"){
	        				gender.innerText = "남";	
	        			}else{
	        				gender.innerText = "여";
	        			}
	        			
	        			const attendanceScore = studentTotalInfoListWrapper.querySelector(".attendanceScore");
	        			attendanceScore.innerText = e.studentAttendanceAvg+"점";
	        			
	        			const testAvgScore = studentTotalInfoListWrapper.querySelector(".testAvgScore");
	        			testAvgScore.innerText = e.studentTestScoreAvg+"점";
	        			
	        			const totalScore = studentTotalInfoListWrapper.querySelector(".totalScore");
	        			if(e.studentTestScoreAvg == 0){
	        				totalScore.innerText = e.studentAttendanceAvg+"점";
	        			}else{
	        				totalScore.innerText = (e.studentTestScoreAvg+ e.studentAttendanceAvg)/2+"점";	
	        			}
	        			
	        			
	        			const status =studentTotalInfoListWrapper.querySelector(".status");
	        			status.innerText = e.status;
	        			if(e.status == "수료완료"){
	        				status.classList.add("text-primary");
	        			}else if(e.status == "미수료") {
	        				status.classList.add("text-danger");
	        			}
	        			
	        			const goAttendancePageButton = studentTotalInfoListWrapper.querySelector(".goAttendancePageButton");
	        			goAttendancePageButton.setAttribute("onclick", "location.href='./attendanceStudentListPage?open_lecture_key="+open_lecture_key+"'");
	        			
	        			const goTestListPageButton = studentTotalInfoListWrapper.querySelector(".goTestListPageButton");
						goTestListPageButton.setAttribute("onclick", "location.href='./testInfoListPage?open_lecture_key="+open_lecture_key+"'");
	        			
	        			studentTotalInfoListBox.appendChild(studentTotalInfoListWrapper);
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
    			
				const open_date = document.querySelector("#open_date");
				const openDate = new Date(response.data.openLectureDto.open_date);
				open_date.innerText = openDate.getFullYear() +"."+ (openDate.getMonth()+1) + "."+ openDate.getDate();
				
				const close_date = document.querySelector("#close_date");
				const closeDate = new Date(response.data.openLectureDto.close_date);
				close_date.innerText = closeDate.getFullYear() +"."+ (closeDate.getMonth()+1) + "."+ closeDate.getDate();
				
				const max_studentAndCurrentStudent = document.querySelector("#max_studentAndCurrentStudent");
				max_studentAndCurrentStudent.innerText = response.data.lectureStudentCount+"명/"+response.data.openLectureDto.max_student+"명";
				
				const essential_grade = document.querySelector("#essential_grade");
				essential_grade.innerText = response.data.lectureInfoDto.essential_grade+"점";
				
				const essential_attendance = document.querySelector("#essential_attendance");
				essential_attendance.innerText = response.data.lectureInfoDto.essential_attendance+"점";
				
				const totalStudyingHour = document.querySelector("#totalStudyingHour");
				totalStudyingHour.innerText = response.data.lectureInfoDto.total_hour/8+"일 ("+response.data.lectureInfoDto.total_hour+"시간)"
				
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
                        <div class="col ms-3">
                            <div class="row">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-2 fw-bold align-self-center border py-2" style="background-color: rgb(240, 240, 240);">
                                            강의 시작일
                                        </div>
                                        <div id="open_date" class="col-4 text-center align-self-center border text-secondary py-2">
                                            2023.11.18
                                        </div>
                                        <div class="col-2 fw-bold align-self-center border py-2" style="background-color: rgb(240, 240, 240);">
                                            강의 종료일
                                        </div>
                                        <div id="close_date" class="col-4 text-center align-self-center border text-secondary py-2">
                                            2023.12.28
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-2 fw-bold align-self-cente border py-2" style="background-color: rgb(240, 240, 240);">
                                            총 수업일수
                                        </div>
                                        <div id="totalStudyingHour" class="col-4 text-center align-self-center border text-secondary py-2">
                                            30일 (240시간)
                                        </div>
                                        <div class="col-2 fw-bold align-self-center border py-2" style="background-color: rgb(240, 240, 240);">
                                            재적 인원
                                        </div>
                                        <div id="max_studentAndCurrentStudent" class="col-4 text-center align-self-center border text-secondary py-2">
                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-2 fw-bold align-self-center border py-2" style="background-color: rgb(240, 240, 240);">
                                          최소 시험점수  
                                        </div>
                                        <div id="essential_grade" class="col-4 text-center align-self-center border text-secondary py-2">
                                            
                                        </div>
                                        <div class="col-2 fw-bold align-self-center border py-2" style="background-color: rgb(240, 240, 240);">
                                           	최소 출석점수
                                        </div>
                                        <div id="essential_attendance"class="col-4 text-center align-self-center border text-secondary py-2">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">  
                            </div>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col fw-bold fs-5 text-light" style="background-color: #133369;">
                            수강생 현황
                        </div>
                    </div>
                    <div class="row bg-white border border-black py-3 px-3 overflow-y-auto" style="height: 40em;">
                        <div class="col my-0">
                            <div class="row fw-bold text-center" style="background-color: rgb(240, 240, 240);">
                                <div class="col-2 border align-self-center border py-2">
                                    학생번호
                                </div>
                                <div class="col-1 border align-self-center border py-2">
                                    학생명
                                </div>
                                <div class="col border align-self-center border py-2">
                                    성별
                                </div>
                                <div class="col-1 border align-self-center border py-2">
                                    출결점수
                                </div>
                                <div class="col-1 border align-self-center border py-2">
                                    시험점수
                                </div>
                                <div class="col-1 border align-self-center border py-2">
                                    종합점수
                                </div>
                                <div class="col-1 border align-self-center border py-2">
                                    수료 상태
                                </div>
                                <div class="col-4 border align-self-center border py-2">
                                    관리
                                </div>
                            </div>
                            <!-- 반복문 구간 -->
                            <div id="studentTotalInfoListBox" class="col" style="font-size: small;">
                                
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

		<div id="studentTotalInfoListTemplet" class="d-none">
			<div class="row text-center studentTotalInfoListWrapper">
                <div class="col-2 border align-self-center border py-2 number">
                    20220233
                </div>
                <div class="col-1 border align-self-center border py-2 name">
                    조인춘
                </div>
                <div class="col border align-self-center border py-2 gender">
                    성별
                </div>
                <div class="col-1 border align-self-center border py-2 attendanceScore">
                    83점
                </div>
                <div class="col-1 border align-self-center border py-2 testAvgScore">
                    90점
                </div>
                <div class="col-1 border align-self-center border py-2 totalScore">
                    87점
                </div>
                <div class="col-1 border align-self-center border py-2 status">
                    
                </div>
                <div class="col-4 border align-self-center border py-2">
                    <button class="btn btn-outline-primary py-0 goAttendancePageButton" style="font-size: small;">출결현황보기</button>
                    <button class="btn btn-outline-primary py-0 goTestListPageButton" style="font-size: small;">시험현황보기</button>
                </div>
            </div>
		</div>
		
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>