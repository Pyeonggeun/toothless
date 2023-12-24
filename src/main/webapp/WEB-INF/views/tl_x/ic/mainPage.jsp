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
    			loadMyOpenLecture(lecturer_key);
    			const lecturerNmae = document.querySelector("#lecturerNmae");
    			lecturerNmae.innerText = response.data.name;
    			loadMyExpectedLectureList(lecturer_key);
    			loadMyCloseLectureList(lecturer_key);
    		});
			
		}

     	function lectureManagementPageMove(open_lecture_key) {
     	   location.href = "lectureManagementPage?open_lecture_key="+open_lecture_key;
		}
     	
		function loadMyOpenLecture(lecturer_key) {
     		
     		const url = "./loadMylecture?lecturer_key="+lecturer_key;
     		fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			
   				const do_open_lecture_key = document.querySelector("#do_open_lecture_key");
   				do_open_lecture_key.innerText = response.data.openLectureDto.open_lecture_key;
   				
   				const do_name = document.querySelector("#do_name");
   				do_name.innerText ="";
   				const nameAtag = document.createElement("a");
   				nameAtag.setAttribute("href", "./lectureManagementPage?open_lecture_key="+response.data.openLectureDto.open_lecture_key);
   				
   				nameAtag.classList.add("navbar-brand");
   				
   				nameAtag.innerText = response.data.lectureInfoDto.name;
   				do_name.appendChild(nameAtag);

				
				const do_roundCount = document.querySelector("#do_roundCount");
				do_roundCount.innerText = response.data.roundCount;
				
				const do_lecturerName = document.querySelector("#do_lecturerName");
				do_lecturerName.innerText =  response.data.lifeLecturerDto.name;
				
				const do_open_date = document.querySelector("#do_open_date");
				const openDate = new Date(response.data.openLectureDto.open_date);
				do_open_date.innerText = openDate.getFullYear() +"."+ (openDate.getMonth()+1) + "."+ openDate.getDate();
				
				const do_close_date = document.querySelector("#do_close_date");
				const closeDate = new Date(response.data.openLectureDto.close_date);
				do_close_date.innerText = closeDate.getFullYear() +"."+ (closeDate.getMonth()+1) + "."+ closeDate.getDate();
				
				const do_max_student = document.querySelector("#do_max_student");
				do_max_student.innerText = response.data.openLectureDto.max_student;
				
				const do_moveManagementPage = document.querySelector("#do_moveManagementPage");
				do_moveManagementPage.setAttribute("onclick", "lectureManagementPageMove("+response.data.openLectureDto.open_lecture_key+")");

    			
    			
    		});
     		
     		
		}

     	
     	
     	
     	function loadMyExpectedLectureList(lecturer_key) {
     		
     		const url = "./expectedLectureList?lecturer_key="+lecturer_key;
     		fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			const expectedLecture = document.querySelector("#expectedLecture");
    			expectedLecture.innerText = response.data.length+"건";
    			
    			
    			for(e of response.data){
    				const expectedLecutreWrapper = document.querySelector("#expectedLectureTemplete .expectedLecutreWrapper").cloneNode(true);
    				
    				const expectedLectureListBox = document.querySelector("#expectedLectureListBox");
    				
    				const expected_open_lecture_key = expectedLecutreWrapper.querySelector(".expected_open_lecture_key");
    				expected_open_lecture_key.innerText = e.openLectureDto.open_lecture_key;
    				
    				const expected_name = expectedLecutreWrapper.querySelector(".expected_name");
    				expected_name.innerText ="";
    				const nameAtag = document.createElement("a");
    				nameAtag.setAttribute("href", "./lectureManagementPage?open_lecture_key="+e.openLectureDto.open_lecture_key);
    				
    				nameAtag.classList.add("navbar-brand");
    				
    				nameAtag.innerText = e.lectureInfoDto.name;
    				expected_name.appendChild(nameAtag);

					
					const expected_roundCount = expectedLecutreWrapper.querySelector(".expected_roundCount");
					expected_roundCount.innerText = e.roundCount;
					
					const expected_lecturerName = expectedLecutreWrapper.querySelector(".expected_lecturerName");
					expected_lecturerName.innerText =  e.lifeLecturerDto.name;
					
					const expected_open_date = expectedLecutreWrapper.querySelector(".expected_open_date");
					const openDate = new Date(e.openLectureDto.open_date);
					expected_open_date.innerText = openDate.getFullYear() +"."+ (openDate.getMonth()+1) + "."+ openDate.getDate();
					
					const expected_close_date = expectedLecutreWrapper.querySelector(".expected_close_date");
					const closeDate = new Date(e.openLectureDto.close_date);
					expected_close_date.innerText = closeDate.getFullYear() +"."+ (closeDate.getMonth()+1) + "."+ closeDate.getDate();
					
					const expected_max_student = expectedLecutreWrapper.querySelector(".expected_max_student");
					expected_max_student.innerText = e.openLectureDto.max_student;
					
					const expected_moveManagementPage = expectedLecutreWrapper.querySelector(".expected_moveManagementPage");
					expected_moveManagementPage.setAttribute("onclick", "lectureManagementPageMove("+e.openLectureDto.open_lecture_key+")");

					expectedLectureListBox.appendChild(expectedLecutreWrapper);
    			}
    			
    		});
		}
     	
		function loadMyCloseLectureList(lecturer_key) {
     		
     		const url = "./loadMyCloselectureList?lecturer_key="+lecturer_key;
     		fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			const closeLecture = document.querySelector("#closeLecture");
    			closeLecture.innerText = response.data.length+"건";
    			
    			for(e of response.data){
    				const closeLecutreWrapper = document.querySelector("#closeLectureTemplete .closeLecutreWrapper").cloneNode(true);
    				
    				const closeLectureListBox = document.querySelector("#closeLectureListBox");
    				
    				const open_lecture_key = closeLecutreWrapper.querySelector(".open_lecture_key");
    				open_lecture_key.innerText = e.openLectureDto.open_lecture_key;
    				
    				const name = closeLecutreWrapper.querySelector(".name");
    				name.innerText ="";
    				const nameAtag = document.createElement("a");
    				nameAtag.setAttribute("href", "./lectureManagementPage?open_lecture_key="+e.openLectureDto.open_lecture_key);
    				
    				nameAtag.classList.add("navbar-brand");
    				
    				nameAtag.innerText = e.lectureInfoDto.name;
    				name.appendChild(nameAtag);

					
					const roundCount = closeLecutreWrapper.querySelector(".roundCount");
					roundCount.innerText = e.roundCount;
					
					const lecturerName = closeLecutreWrapper.querySelector(".lecturerName");
					lecturerName.innerText =  e.lifeLecturerDto.name;
					
					const open_date = closeLecutreWrapper.querySelector(".open_date");
					const openDate = new Date(e.openLectureDto.open_date);
					open_date.innerText = openDate.getFullYear() +"."+ (openDate.getMonth()+1) + "."+ openDate.getDate();
					
					const close_date = closeLecutreWrapper.querySelector(".close_date");
					const closeDate = new Date(e.openLectureDto.close_date);
					closeDate.innerText = closeDate.getFullYear() +"."+ (closeDate.getMonth()+1) + "."+ closeDate.getDate();
					
					const max_student = closeLecutreWrapper.querySelector(".max_student");
					max_student.innerText = e.openLectureDto.max_student;
					
					const moveManagementPage = closeLecutreWrapper.querySelector(".moveManagementPage");
					moveManagementPage.setAttribute("onclick", "lectureManagementPageMove("+e.openLectureDto.open_lecture_key+")");

					closeLectureListBox.appendChild(closeLecutreWrapper);
    			}
    			
    		});
     		
     		
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
            <div class="row mt-5">
                <div class="col-1"></div>
                <div class="col">
                    <div class="row border-bottom border-2 border-primary">
                        <div class="col fw-bold fs-3 mt-1">강의 진행 현황</div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
            
            <div class="row mt-5 text-center">
                <div class="col-1"></div>
                <div class="col-2 mt-2">
                    <div class="row">
                        <div id="expectedLecture" class="col fw-bold fs-3  text-center number">
                            3
                        </div>
                    </div>
                    <div class="row">
                        <div class="col fw-bold text-center">
                           진행예정강의
                        </div>
                    </div>
                </div>
                <div class="col-2 mt-2">
                    <div class="row ">
                        <div id="closeLecture" class="col fs-3 fw-bold text-center number">
                            5
                        </div>
                    </div>
                    <div class="row">
                        <div class="col fw-bold text-center">
                           종료 된 강의
                        </div>
                    </div>
                </div>
                <div class="col-3 mt-2">
                    <div class="row">
                        <div class="col mt-2">
                        	<div class="row">
                            	<div class="col fs-3 fw-bold text-center">
                                    4.7점
                        		</div>
                            </div>
                            <div class="row">
                            	<div class="col fw-bold text-center">
                         	  		전체 학생중 만족도 평균
                        		</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-3 mt-2">
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
                <div class="col-1"></div>
            </div>
            
            
            
            <div class="row">
            	<div class="col-1"></div>
                <div class="col mt-5">
                    <div class="row">
                        <div class="col">
                            home > 진행 중인 강의
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col fw-bold fs-3 text-light" style="background-color: #133369;">
                            강의 진행 현황
                        </div>
                    </div>
                    <div class="row bg-white border border-black pt-3 px-3">
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
		                         <div class="col">
                                    <div class="row text-center align-self-center">
                                        <div id="do_open_lecture_key" class="col-1 py-3 border align-self-center">
                                            6
                                        </div>
                                        <div id="do_name" class="col-3 py-3 border align-self-center ">
                                            데이터 융합 자바 응용소프트웨어 개발자
                                        </div>
                                        <div id="do_roundCount" class="col-1 py-3 border align-self-center ">
                                            1
                                        </div>
                                        <div id="do_lecturerName" class="col-1 py-3 border align-self-center ">
                                            이민규
                                        </div>
                                        <div id="do_open_date" class="col-1 py-3 border align-self-center">
                                            2023.08.16
                                        </div>
                                        <div id="do_close_date" class="col-1 py-3 border align-self-center ">
                                            2024.02.27
                                        </div>
                                        <div id="do_max_student" class="col-1 py-3 border align-self-center ">
                                            30
                                        </div>
                                        <div class="col-3 py-3 border align-self-center">
                                            <button id="do_moveManagementPage" class="btn btn-primary  py-0">
                                                상세관리
                                            </button>
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
            	<div class="col-1"></div>
                <div class="col mt-5">
                    <div class="row">
                        <div class="col">
                            home > 진행 예정 강의
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col fw-bold fs-5 text-light" style="background-color: #133369;">
                            수강신청 중 강의
                        </div>
                    </div>
                    <div class="row bg-white border border-black pt-3 px-3 overflow-y-auto">
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
                            <!-- 수강신청중인 강의 리스트  반복문 구간-->
                            <div class="row">       
		                        <div id="expectedLectureListBox" class="col">
                                    
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
                    <div class="row">
                        <div class="col">
                            home > 종료 된 강의
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col fw-bold fs-5 text-light" style="background-color: #133369;">
                            종강 강의
                        </div>
                    </div>
                    <div class="row bg-white border border-black pt-3 px-3 overflow-y-auto">
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
                                <div id="closeLectureListBox" class="col">
                                    
		                         </div>
 							</div>
                         </div> 
                     </div>     
                </div>
                <div class="col-1"></div>
            </div>
             <div class="row ps-3 py-5 mt-5 text-light" style="font-size: small; background-color: #133369   ;">
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
        
        
        <div id ="closeLectureTemplete" class="d-none">
	        <div class="closeLecutreWrapper row text-center align-self-center">
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
	               <button class="btn btn-outline-secondary	 moveManagementPage py-0">
	                   상세보기
	               </button>
	           </div>
	       </div>
		</div>

        <div id ="expectedLectureTemplete" class="d-none">
            <div class="expectedLecutreWrapper row text-center align-self-center">
                <div class="col-1 py-3 border align-self-center expected_open_lecture_key">
                    6
                </div>
                <div class="col-3 py-3 border align-self-center expected_name">
                    데이터 융합 자바 응용소프트웨어 개발자
                </div>
                <div class="col-1 py-3 border align-self-center expected_roundCount">
                    1
                </div>
                <div class="col-1 py-3 border align-self-center expected_lecturerName">
                    이민규
                </div>
                <div class="col-1 py-3 border align-self-center expected_open_date">
                    2023.08.16
                </div>
                <div class="col-1 py-3 border align-self-center expected_close_date">
                    2024.02.27
                </div>
                <div class="col-1 py-3 border align-self-center expected_max_student">
                    30
                </div>
                <div class="col-3 py-3 border align-self-center">
                    <button class="btn btn-outline-primary expected_moveManagementPage py-0">
                        상세보기
                    </button>
                </div>
            </div>
		</div>
		
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>