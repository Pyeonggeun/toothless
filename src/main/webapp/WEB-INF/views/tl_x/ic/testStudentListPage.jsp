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
	    			
	    			
	    			const studyCategory = document.querySelector("#studyCategory");
	    			studyCategory.innerText = response.data.categoryName;
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
	        			console.log(name);
	        			/* 나중에 제대로 할때 해야함... 자꾸 널떠...
	        			const externalId = studentInfoListWrapper.querySelector(".externalId");
	    				externalId.innerText = e.externalInfoDto.external_id; */
	        			
	        			const gender = testStudentListWrapper.querySelector(".gender");
	        			if(e.lifeStudentDto.gender == "M"){
	        				gender.innerText = "남";	
	        			}else{
	        				gender.innerText = "여";
	        			}
	   					     			
	        			const studentTestingStatus = testStudentListWrapper.querySelector(".studentTestingStatus");
	        			const testScore =  testStudentListWrapper.querySelector(".testScore");
	        			if(e.statusCount == 1){
	        				studentTestingStatus.innerText ='응시완료';
	        				studentTestingStatus.classList.add("text-primary");
	        				
	        				testScore.innerText = e.test_point+"점"
	        				
	        			}else{
	        				studentTestingStatus.innerText ='미응시';
	           				studentTestingStatus.classList.add("text-danger");
	           				
	           				testScore.innerText = "-";
	        			}
	        			 
	        			
	        			testStudentListBox.appendChild(testStudentListWrapper);
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
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="row">
                                <div class="col-4 border text-center align-self-center py-3" style="background-color: rgb(240, 240, 240);">
                                    평가 시간
                                </div>
                                <div id="testTime" class="col-8 text-start border py-3">
                                    
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
                </div>
                <div class="col-1"></div>
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
                    <button class="btn btn-primary py-0" style="font-size: small">학생답안</button>
                </div>
            </div>
		</div>
		
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>