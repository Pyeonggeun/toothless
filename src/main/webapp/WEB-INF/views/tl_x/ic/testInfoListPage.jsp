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
     		
     		lectureTestListInfo(open_lecture_key);
     		
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
	        			testStudentPageButton.setAttribute("onclick", "location.href='../../tl_x/ic/testStudentListPage?lecture_test_key="+e.lecture_test_key);
	        			
	        			lectureTestListBox.appendChild(testListWrapper);
	    			}
    			}
    		});
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
                <div class="col ms-5">
                    <div class="row mt-5">
                        <div class="col fs-4 fw-bold border-bottom border-black border-2">
                            제 2회 java 어쩌구 저쩌구
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col mt-2">
                            <div class="row">
                                <div class="col fw-bold  text-center fs-4 number">
                                    3 건
                                </div>
                            </div>
                            <div class="row">
                                <div class="col fw-bold text-center">
                                   전체시험
                                </div>
                            </div>
                        </div>
                        <div class="col mt-2">
                            <div class="row ">
                                <div class="col fw-bold text-center fs-4 number">
                                    3 건
                                </div>
                            </div>
                            <div class="row">
                                <div class="col fw-bold text-center">
                                   진행중인 시험
                                </div>
                            </div>
                        </div>
                        <div class="col mt-2">
                            <div class="row ">
                                <div class="col fw-bold text-center fs-4 number">
                                    3 건 
                                </div>
                            </div>
                            <div class="row">
                                <div class="col fw-bold text-center">
                                   진행예정 시험
                                </div>
                            </div>
                        </div>
                        <div class="col mt-2">
                            <div class="row ">
                                <div class="col fw-bold text-center fs-4 number">
                                    78.7점
                                </div>
                            </div>
                            <div class="row">
                                <div class="col fw-bold text-center">
                                    전체 평균 점수
                                </div>
                            </div>
                        </div>
                    </div>    
                    <div class="row mt-3">
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
                </div>
                <div class="col-1"></div>
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
		
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>