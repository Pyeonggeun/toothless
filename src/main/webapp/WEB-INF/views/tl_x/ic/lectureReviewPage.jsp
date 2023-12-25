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
     	function loadPageInfo() {
     		const urlParams = new URLSearchParams(location.search);
     		const key = urlParams.get("open_lecture_key");
     		open_lecture_key = key;
     		
     		
     		loadReviewListPage(open_lecture_key);
     		openLectureInfo(open_lecture_key)
     		
     		
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
     	function openLectureInfo(open_lecture_key){
     		const url = "./loadOpenLectureInfo?open_lecture_key="+open_lecture_key;
     		fetch(url)
    		.then(response => response.json())
    		.then((response) => {
    			
    			const openLecutreName = document.querySelector("#openLecutreName");
    			openLecutreName.innerText = "제 "+response.data.roundCount+"회"+response.data.lectureInfoDto.name;
    			
				
				
    		});
     	}
     	
		function loadReviewListPage(open_lecture_key) {
			const url = "./reviewListPage?open_lecture_key="+open_lecture_key;
			fetch(url)
    		.then(response => response.json())
    		.then((response) => {

    			const lectureReviewListBox = document.querySelector("#lectureReviewListBox");
    			if(response.data[0] == null){
    				lectureReviewListBox.innerText = "등록되어있는 후기가 존재하지 않습니다.";
    				lectureReviewListBox.classList.add("text-center" , "text-secondary");
    			}else{
    				
    				for(e of response.data){
    					lectureReviewListBox.classList.remove("text-center" , "text-secondary");
    					const lectureReviewListWrapper = document.querySelector("#lectureReviewListTemplete .lectureReviewListWrapper").cloneNode(true);	
    					
    					const reviewNumber = lectureReviewListWrapper.querySelector(".reviewNumber");
    					reviewNumber.innerText = e.lecture_review_key;
    					const review = lectureReviewListWrapper.querySelector(".review");
    					review.innerText = e.review;
    					const star_count = lectureReviewListWrapper.querySelector(".star_count");
    					star_count.innerText = e.star_count +"점";
    					
    					const created_at = lectureReviewListWrapper.querySelector(".created_at");
    					
    					const createdDate = new Date(e.created_at);
	         			const created_day = createdDate.getFullYear()+"-"+(createdDate.getMonth()+1) + "-"+ createdDate.getDate();
    					
	         			created_at.innerText = created_day;
	         			
	         			lectureReviewListBox.appendChild(lectureReviewListWrapper);
        			}	
    			}
    			
    			
    			
    		});
		}


		
		
	
		
		
		window.addEventListener("DOMContentLoaded", () =>{
     		getMyInfo();
     		loadPageInfo();
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
						      		<div class="col ms-3 reviewPage">
						      			만족도 조사
						      		</div>
						      	</div>
						      	<div class="row">
						      		<div class="col ms-3 mt-2 reviewPage">
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
                    <div class="row mt-1">
                        <div class="col fw-bold fs-5 text-light" style="background-color: #133369;">
                            강의 만족도 평가
                        </div>
                    </div>
                    <div class="row bg-white border border-black py-3 px-3" style="height: 40em;">
                        <div class="col my-0">
                            <div class="row fw-bold text-center" style="background-color: rgb(240, 240, 240);">
                                <div class="col-1 border align-self-center border py-2">
                                    번호
                                </div>
                                <div class="col-8 border align-self-center border py-2">
                                    후기
                                </div>
                                <div class="col border align-self-center border py-2">
                                    별점
                                </div>
                                <div class="col border align-self-center border py-2">
                                    작성일
                                </div>
                            </div>
                            <!-- 반복문 구간 -->
                            <div id="lectureReviewListBox" class="col">
                              
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

		<div id="lectureReviewListTemplete" class="d-none">
            <div class="row text-center lectureReviewListWrapper">
                <div class="col-1 h-auto border align-self-center border py-2 reviewNumber">
                     1
                 </div>
                 <div class="col-8 h-auto border align-self-center border py-2 review">
                     너무 좋았어요~~~
                 </div>
                 <div class="col h-auto border align-self-center border py-2 text-secondary star_count" style="font-size: small">
                     5점
                 </div>
                 <div class="col h-auto border align-self-center border py-2 text-secondary created_at" style="font-size: small">
                     2023.12.11
                 </div>
             </div>
        </div>
		</div>
		
		
		
		
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>