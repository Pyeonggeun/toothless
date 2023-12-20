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
     		
     		
		}  
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
    			currentStudyingHourAndPercent.innerText = response.data.percent+"% ("+response.data.studyingHour+"시간)";
    			
    			const totalAbsenceStudentCount = document.querySelector("#totalAbsenceStudentCount");
    			totalAbsenceStudentCount.innerText = response.data.totalAbsenceCount;
    			
    			const totalLateStudentCount = document.querySelector("#totalLateStudentCount");
    			totalLateStudentCount.innerText = response.data.totalLateCount;
    			
    			const openDate = new Date(response.data.openLectureDto.open_date);
    			const open_day = openDate.getFullYear()+"-"+(openDate.getMonth()+1) + "-"+ openDate.getDate();
    			
    			const open_date = document.querySelector("#open_date");
    			open_date.innerText = open_day;
    			
    			const closeDate = new Date(response.data.openLectureDto.close_date);
    			const close_day = closeDate.getFullYear()+"-"+(closeDate.getMonth()+1) + "-"+ closeDate.getDate();
    			
    			const close_date = document.querySelector("#open_date");
    			close_date.innerText = close_day;
    			
    			const lectureStudentCount = document.querySelector("#lectureStudentCount");
    			lectureStudentCount.innerText = response.data.lectureStudentCount;
     			
    			const cutLine = document.querySelector("#cutLine");
    			cutLine.innerText = response.data.lectureInfoDto.essential_attendance+"점";
    			
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
	        			lateCount.innerText = e.lateCount;
	        			
	        			const absenceCount = attendanceStudentListWrapper.querySelector(".absenceCount");
	        			absenceCount.innerText = e.absenceCount;	
	        			
	        			const absenceScore = attendanceStudentListWrapper.querySelector(".absenceScore");
	        			absenceScore.innerText = e.studentAttendanceAvg;
	        			
	        			
	        			attendanceStudentListBox.appendChild(attendanceStudentListWrapper);
	    			}
    			
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

        </style>

    </head>
    <body>
        <div class="container-fluid">
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
            		<a class="navbar-brand" href="../../another/external/loginPage">로그아웃</a>
            	</div>
            </div>
            <div class="row">
                <div class="col-2" style="background-color: #133369;">
                    <div class="row">
                        <div class="accordion accordion-flush px-0">
						  <div class="accordion-item">
						      <a class="accordion-button collapsed text-light navbar-brand fs-5"type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" style="background-color: #133369;">
						        <i class="bi bi-book me-3"></i> 학적부
						      </a>
						    <div id="flush-collapseOne" class="accordion-collapse collapse">
						      <div class="accordion-body text-light"  style="background-color: #133369;">
						      	<div class="row">
						      		<div class="col ms-3">
						      			수강생 관리
						      		</div>
						      	</div>
						      	<div class="row">
						      		<div class="col ms-3 mt-2">
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
						      <a class="accordion-button button-white collapsed text-light navbar-brand fs-5" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" style="background-color: #133369;">
						        <i class="bi bi-journal-bookmark me-3"></i> 강의 관리
						      </a>
						    <div id="flush-collapseTwo" class="accordion-collapse collapse">
						      <div class="accordion-body text-light"  style="background-color: #133369;">
						      	<div class="row">
						      		<div class="col ms-3">
						      			과정자료
						      		</div>
						      	</div>
						      	<div class="row">
						      		<div class="col ms-3 mt-2">
						      			과정질문
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
						      		<div class="col ms-3">
						      			시험출제
						      		</div>
						      	</div>
						      	<div class="row">
						      		<div class="col ms-3 mt-2">
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
                    <div class="row mt-5">
                        <div class="col">
                            <div class="row mt-5 border-top border-white text-light">
                                <div class="col mt-5">
                                    어쩌구 저쩌구
                                </div>
                            </div>
                            <div class="row mt-2 text-light">
                                <div class="col">
                                    어쩌구 저쩌구
                                </div>
                            </div>
                            <div class="row mt-2 text-light">
                                <div class="col">
                                    어쩌구 저쩌구
                                </div>
                            </div>
                            <div class="row mt-4 text-light">
                                <div class="col">
                                    어쩌구 저쩌구
                                </div>
                            </div>
                            <div class="row mt-2 text-light">
                                <div class="col">
                                    어쩌구 저쩌구
                                </div>
                            </div>
                            <div class="row mt-2 text-light">
                                <div class="col">
                                    어쩌구 저쩌구
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col ms-5 mt-5">
                    <div class="row">
                        <div id="openLecutreName"class="col fs-4 fw-bold border-bottom border-black border-2">
                            제 2회 자바 어저구 저쩌구
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
                                            진행도
                                        </div>
                                        <div id="currentStudyingHourAndPercent" class="col-4 text-center align-self-center border text-secondary py-2">
                                            33.3% (80시간)
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-2 fw-bold align-self-center border py-2" style="background-color: rgb(240, 240, 240);">
                                            총 재적인원
                                        </div>
                                        <div id="lectureStudentCount" class="col-4 text-center align-self-center border text-secondary py-2">
                                            30명
                                        </div>
                                        <div class="col-2 fw-bold align-self-center border py-2" style="background-color: rgb(240, 240, 240);">
                                           	최소 출석점수
                                        </div>
                                        <div id="cutLine"class="col-4 text-center align-self-center border text-secondary py-2">
                                            80점
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
	                                	<div class="col fw-bold  text-center fs-4 number">
	                                    	3 건
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
		                                    3 건
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
		                                <div id="totalLateStudentCount" class="col fw-bold text-center fs-4 number">
		                                    3 건 
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
		                                <div id="percent" class="col fw-bold text-center fs-4 number">
		                                    78.7점
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
                    <div class="row mt-5">
                        <div class="col fw-bold fs-5 text-light" style="background-color: #133369;">
                            전체 출석률
                        </div>
                    </div>
                    <div class="row bg-white border border-black py-3 px-3" style="height: 40em;">
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
                                    지각
                                </div>
                                <div class="col-1 border align-self-center border py-2">
                                    결석
                                </div>
                                <div class="col-1 border align-self-center border py-2">
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
                </div>
                <div class="col-1"></div>
            </div>
        </div>

		<div id="attendanceStudentListTemplet" class="d-none">
			<div class="row text-center attendanceStudentListWrapper">
                <div class="col-2 border align-self-center border py-2 number">
                    20220233
                </div>
                <div class="col-2 border align-self-center border py-2 name">
                    조인춘
                </div>
                <div class="col-1 border align-self-center border py-2 gender">
                    남
                </div>
                <div class="col border align-self-center border py-2 lateCount">
                    3 건
                </div>
                <div class="col-1 border align-self-center border py-2 absenceCount">
                    8 건
                </div>
                <div class="col-1 border align-self-center border py-2 absenceScore">
                    93.3점
                </div>
                <div class="col-3 border align-self-center border py-2">
                    <button class="btn btn-primary py-0">상세보기</button>
                </div>
            </div>
		</div>
		
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>