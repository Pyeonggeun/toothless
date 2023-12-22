<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <script src="https://kit.fontawesome.com/fdd6196f61.js" crossorigin="anonymous"></script>

        <style>
            
            @font-face {
                font-family: 'Jal_Onuel';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
                font-weight: normal;
                font-style: normal;
            }

            .mkmk {
                font-family: 'Jal_Onuel';
            }

        </style>
        
        <script>
        	
        	let myPk = null;
        	
			function getTopName() {
	    		
	    		const url = "./getTopName";
	    		
	    		fetch(url)
	    		.then(response => response.json())
	    		.then(response => {
	    			
	    			document.getElementById("topName").innerText = response.data;
	    			
	    		});
	    		
	    	}
        	
        	function getMyPk() {
        		
        		const url = "./getMyPk";
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			myPk = response.data;
        			
        		});
        		
        	}
        	
        	function reloadReceivingLecture() {
        		
        		const url = "./getReceivingLectureList";
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			const receivingLectureBox = document.getElementById("receivingLectureBox");
        			receivingLectureBox.innerHTML = "";
        			
        			for(e of response.data) {
        				
        				const receivingLectureWrapper = document.querySelector("#templete .receivingLectureWrapper").cloneNode(true);
        				
        				receivingLectureWrapper.querySelector(".credit").innerText = e.CREDIT + "학점";
        				receivingLectureWrapper.querySelector(".name").innerText = e.NAME;
        				receivingLectureWrapper.querySelector(".lecturer").innerText = e.LECTURER_NAME;
        				
        				const applyButton = receivingLectureWrapper.querySelector(".applyButton");
        				applyButton.value = e.OPEN_LECTURE_KEY;
        				
        				if(e.isDeadline == true) {
        					
        					applyButton.classList.remove("btn-secondary", "disabled");
        					applyButton.style.backgroundColor = "#7844ae";
        					applyButton.innerText = "수강신청";
        					applyButton.setAttribute("onclick" , "goDetailPage(this)");
        					
        				}else {
        					
        					applyButton.classList.add("btn-secondary", "disabled");
        					applyButton.style.removeProperty("background-color");
        					applyButton.innerText = "마감";
        					applyButton.removeAttribute("onclick");
        					
        				}
        				
        				receivingLectureBox.appendChild(receivingLectureWrapper);
        				
        			}
        			
        		});
        		
        	}
        	
        	function myPageMouseOver() {
        		
        		document.getElementById("myPageIcon").style.color = '#7844ae';
        		document.getElementById("myPageText").style.color = '#000';
        		
        	}
        	
        	function myPageMouseOut() {
        		
        		document.getElementById("myPageIcon").style.color = '#f7a505';
        		document.getElementById("myPageText").style.removeProperty("color");
        		
        	}
        	
        	function applyPageMouseOver() {
        		
        		document.getElementById("applyPageIcon").style.color = '#7844ae';
        		document.getElementById("applyPageText").style.color = '#000';
        		
        	}
        	
			function applyPageMouseOut() {
        		
        		document.getElementById("applyPageIcon").style.color = '#f7a505';
        		document.getElementById("applyPageText").style.removeProperty("color");
        		
        	}

        	
        	function goDetailPage(target) {
        		
        		location.href = "./detailPage?open_lecture_key=" + target.value;
        		
        	}
        	
        	function goMyPage() {
        		
        		if(myPk == null) {
        			location.href = "../../another/student/loginPage";
        			return;
        		}
        		
        		location.href = "./myPage";
        		
        	}
        	
        	function goApplyPage() {
        		
        		if(myPk == null) {
        			location.href = "../../another/student/loginPage";
        			return;
        		}
        		
        		location.href = "./applyPage";
        		
        	}
        	
        	function goMainPage() {
        		
        		location.href = "./mainPage";
        		
        	}
        	
        	function logout() {
        		
        		location.href = "../../another/external/logoutProcess";
        		
        	}
        	
        	window.addEventListener("DOMContentLoaded", () => {
        		
        		getMyPk();
        		getTopName();
        		reloadReceivingLecture();
        		
        	});
        
        </script>

    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <jsp:include page="./top.jsp"></jsp:include>
                    <div class="row">
                        <div class="col px-0">
                            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="../../resources/img/lifeStudent/1.jpg" class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="../../resources/img/lifeStudent/2.jpg" class="d-block w-100" alt="...">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row my-5">
                        <div class="col">
                            <div class="row" style="margin-left: 10.5%; margin-right: 10.5%;">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="row">
                                                <div class="col-4 pe-0 my-auto text-end">
                                                    <span class="rounded-circle px-3 py-2" style="border: solid; color: #7844ae; font-size: 2.5em;"><i class="fa-solid fa-phone-volume"></i></span>
                                                </div>
                                                <div class="col" style="color: #7844ae;">
                                                    <div class="row">
                                                        <div class="col fw-bold" style="font-size: 2.6em; letter-spacing: -0.07em;">
                                                            02-313-1711
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col fw-bold" style="font-size: 0.79em;">
                                                            평일 09:30-18:00 / 점심 12:00-13:00
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col my-auto">
                                            <div class="row">
                                                <div class="col text-secondary">
                                                    <div class="row">
                                                        <div class="col text-end">
                                                            <i class="fa-solid fa-headphones" style="font-size: 4em; color: #f7a505;"></i>
                                                        </div>
                                                        <div class="col my-auto fw-bold ps-1" style="font-size: 1.3em;">
                                                             카톡상담
                                                        </div>
                                                    </div>
                                                </div>
                                                <div onclick="goMyPage()" onmouseover="myPageMouseOver()" onmouseout="myPageMouseOut()" class="col text-secondary" style="cursor: pointer;">
                                                    <div class="row">
                                                        <div class="col text-end">
                                                            <i id="myPageIcon" class="fa-solid fa-scroll" style="font-size: 4em; color: #f7a505;"></i>
                                                        </div>
                                                        <div id="myPageText" class="col my-auto fw-bold ps-1" style="font-size: 1.3em;">
                                                             내강의실
                                                        </div>
                                                    </div>
                                                </div>
                                                <div onclick="goApplyPage()" onmouseover="applyPageMouseOver()" onmouseout="applyPageMouseOut()" class="col text-secondary" style="cursor: pointer;">
                                                    <div class="row">
                                                        <div class="col text-end">
                                                            <i id="applyPageIcon" class="fa-solid fa-display" style="font-size: 4em; color: #f7a505;"></i>
                                                        </div>
                                                        <div id="applyPageText" class="col my-auto fw-bold ps-1" style="font-size: 1.3em;">
                                                             수강신청
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col text-secondary">
                                                    <div class="row">
                                                        <div class="col text-end">
                                                            <i class="fa-solid fa-mobile-screen" style="font-size: 4em; color: #f7a505;"></i>
                                                        </div>
                                                        <div class="col my-auto fw-bold ps-1" style="font-size: 1.3em;">
                                                             모바일
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-5">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-5 rounded-4 border px-4 py-4 me-4">
                                                    <div class="row">
                                                        <div class="col text-black text-opacity-75 fw-semibold" style="font-size: 1.2em;">
                                                            <span style="color: #f7a505;">공지</span>사항
                                                        </div>
                                                        <div class="col text-end text-secondary" style="font-size: 1.1em;">
                                                            <i class="fa-solid fa-plus"></i>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                           
                                                            <div>
                                                                <hr class="border-secondary">
                                                            </div>
                                                            <div class="row">
                                                                <div class="col text-dark-emphasis" style="font-size: 0.95em;">
                                                                    [공지][필독] 2024년도 2월(전기) 학위신청 및 1분기...
                                                                </div>
                                                                <div class="col-3 text-end text-secondary" style="font-size: 0.95em;">
                                                                    2023-12-08
                                                                </div>
                                                            </div>

                                                            <div>
                                                                <hr class="border-secondary">
                                                            </div>
                                                            <div class="row">
                                                                <div class="col text-dark-emphasis" style="font-size: 0.95em;">
                                                                    [공지]12월 신용카드 무이자 및 부분무이자 행사 안내
                                                                </div>
                                                                <div class="col-3 text-end text-secondary" style="font-size: 0.95em;">
                                                                    2023-12-04
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <hr class="border-secondary">
                                                            </div>
                                                            <div class="row">
                                                                <div class="col text-dark-emphasis" style="font-size: 0.95em;">
                                                                    [공지]2024년 1학기 2기수 학습자 모집 및 주요 학사일...
                                                                </div>
                                                                <div class="col-3 text-end text-secondary" style="font-size: 0.95em;">
                                                                    2023-11-30
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <hr class="border-secondary">
                                                            </div>
                                                            <div class="row">
                                                                <div class="col text-dark-emphasis" style="font-size: 0.95em;">
                                                                    [공지]연말정산용 교육비납입증명서 발급 안내
                                                                </div>
                                                                <div class="col-3 text-end text-secondary" style="font-size: 0.95em;">
                                                                    2023-01-10
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <hr class="border-secondary">
                                                            </div>
                                                            <div class="row">
                                                                <div class="col text-dark-emphasis" style="font-size: 0.95em;">
                                                                    [공지][필독] MK평생교육원 학습자 매뉴얼
                                                                </div>
                                                                <div class="col-3 text-end text-secondary" style="font-size: 0.95em;">
                                                                    2022-03-15
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <hr class="border-secondary">
                                                            </div>
                                                            <div class="row">
                                                                <div class="col text-dark-emphasis" style="font-size: 0.95em;">
                                                                    [공지]테스트시험 응시방법 안내
                                                                </div>
                                                                <div class="col-3 text-end text-secondary" style="font-size: 0.95em;">
                                                                    2023-07-21
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col rounded-4 border px-4 py-4">
                                                    <div class="row">
                                                        <div class="col text-black text-opacity-75 fw-semibold" style="font-size: 1.1em;">
                                                            <span style="color: #f7a505;">수강신청 중</span>인 과정
                                                        </div>
                                                        <div onclick="goApplyPage()" class="col text-end text-secondary" style="font-size: 1.3em; cursor: pointer;">
                                                            <i class="fa-solid fa-plus"></i>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col overflow-auto mx-2" style="height: 20.32em;">
                                                            <div class="row">
                                                                <div class="col text-center fw-bold py-2" style="background-color: #F0F4F8; font-size: 0.95em;">
                                                                    <div class="row">
                                                                        <div class="col">인정학점</div>
                                                                        <div class="col-4">과목명</div>
                                                                        <div class="col">강사</div>
                                                                        <div class="col">상세정보</div>
                                                                        <div class="col">수강신청</div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                            	<div id="receivingLectureBox" class="col">
                                                            		
                                                            	</div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-5">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col rounded-4 border me-5 px-4 py-1">
                                                    <div class="row">
                                                        <div class="col fw-bold my-auto pe-0" style="color: #4a3187; font-size: 1.2em; letter-spacing: -0.05em;">
                                                            취업정보
                                                        </div>
                                                        <div class="col">
                                                            <img class="img-fluid" src="../../resources/img/lifeStudent/bottom_icon1.png">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col rounded-4 border me-5 px-4 py-1">
                                                    <div class="row">
                                                        <div class="col fw-bold my-auto" style="color: #4a3187; font-size: 1.2em; letter-spacing: -0.05em;">
                                                            실습지원센터
                                                        </div>
                                                        <div class="col">
                                                            <img class="img-fluid" src="../../resources/img/lifeStudent/bottom_icon2.png">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col rounded-4 border me-5 px-4 py-1">
                                                    <div class="row">
                                                        <div class="col fw-bold my-auto" style="color: #4a3187; font-size: 1.2em; letter-spacing: -0.05em;">
                                                            <p class="mb-0">학습 가이드북</p>
                                                            <p class="mb-0">다운로드</p>
                                                        </div>
                                                        <div class="col">
                                                            <img class="img-fluid" src="../../resources/img/lifeStudent/bottom_icon3.png">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col rounded-4 border px-4 py-1">
                                                    <div class="row">
                                                        <div class="col fw-bold my-auto" style="color: #4a3187; font-size: 1.2em; letter-spacing: -0.05em;">
                                                            증명서 발급
                                                        </div>
                                                        <div class="col">
                                                            <img class="img-fluid" src="../../resources/img/lifeStudent/bottom_icon4.png">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-5">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col rounded-4 px-5 py-5" style="background-color: #f7f7f9;">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row justify-content-center">
                                                                <div class="col-3 my-auto pe-0">
                                                                    <img class="img-fluid float-end" src="../../resources/img/lifeStudent/consulting.png" style="height: 1.5em;">
                                                                </div>
                                                                <div class="col-5 ps-1 fw-semibold" style="font-size: 1.3em;">
                                                                    고객센터
                                                                </div>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col d-grid justify-content-center">
                                                                            <button class="btn rounded-pill text-white py-0 fw-bold" style="background-color: #7844ae; font-size: 0.95em;">학습상담 및 설계문의</button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col fw-bold text-center" style="font-size: 2em; letter-spacing: -0.07em; color: #7844ae;">
                                                                            02-313-1711
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col d-grid justify-content-center">
                                                                            <button class="btn rounded-pill text-white py-0 fw-bold" style="background-color: #f7a505; font-size: 0.95em;">시스템문의</button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col fw-bold text-center" style="font-size: 2em; letter-spacing: -0.07em; color: #f7a505;">
                                                                            1601-0000
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="vr px-0 border-secondary-subtle"></div>
                                                        <div class="col my-auto ps-5">
                                                            <div class="row">
                                                                <div class="col fw-semibold" style="font-size: 1.3em;">
                                                                    수강신청 입금계좌
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col fw-bold" style="font-size: 2em; letter-spacing: -0.03em; color: #7844ae;">
                                                                            110-512-561684
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col" style="font-size: 0.9em; letter-spacing: -0.03em;">
                                                                            신한은행 / 예금주 : (주)MK평생교육원
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-2">
                                                                <div class="col" style="font-size: 0.9em; letter-spacing: -0.03em;">
                                                                    <p class="mb-0">평일 : 09:30 ~ 18:00</p>
                                                                    <p class="mb-0">점심시간 : 12:00 ~ 13:00</p>
                                                                    <p class="mb-0">주말/공휴일 : (신규문의) 간편상담신청</p>
                                                                    <p class="mb-0">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;(기존학습자) 1:1상담게시판</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-6 my-auto">
                                                            <div class="row">
                                                                <div class="col d-grid">
                                                                    <button class="btn rounded text-white fw-bold" style="background-color: #5D57FF; font-size: 1.3em; font-style: italic;">간편상담 신청</button>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col px-1 d-grid">
                                                                            <button class="btn pe-4 rounded-0 border-secondary-subtle bg-white">
                                                                                <div class="row">
                                                                                    <div class="col">
                                                                                        <img class="img-fluid" src="../../resources/img/lifeStudent/list_icon1.png">
                                                                                    </div>
                                                                                    <div class="col-7 my-auto text-end" style="font-size: 0.9em; letter-spacing: -0.03em;">
                                                                                        카톡 상담
                                                                                    </div>
                                                                                </div>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col px-1 mt-2 d-grid">
                                                                            <button class="btn pe-4 rounded-0 border-secondary-subtle bg-white">
                                                                                <div class="row">
                                                                                    <div class="col">
                                                                                        <img class="img-fluid" src="../../resources/img/lifeStudent/list_icon3.png">
                                                                                    </div>
                                                                                    <div class="col-7 my-auto text-end" style="font-size: 0.9em; letter-spacing: -0.03em;">
                                                                                        <p class="mb-0">학점은행제</p>
                                                                                        <p class="mb-0">이해하기</p>
                                                                                    </div>
                                                                                </div>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col px-1 d-grid">
                                                                            <button class="btn pe-4 rounded-0 border-secondary-subtle bg-white">
                                                                                <div class="row">
                                                                                    <div class="col">
                                                                                        <img class="img-fluid" src="../../resources/img/lifeStudent/list_icon2.png">
                                                                                    </div>
                                                                                    <div class="col-7 my-auto text-end" style="font-size: 0.9em; letter-spacing: -0.03em;">
                                                                                        블로그
                                                                                    </div>
                                                                                </div>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col px-1 mt-2 d-grid">
                                                                            <button class="btn pe-4 rounded-0 border-secondary-subtle bg-white">
                                                                                <div class="row">
                                                                                    <div class="col">
                                                                                        <img class="img-fluid" src="../../resources/img/lifeStudent/list_icon4.png">
                                                                                    </div>
                                                                                    <div class="col-7 my-auto text-end" style="font-size: 0.9em; letter-spacing: -0.03em;">
                                                                                        <p class="mb-0">교육부인증기관</p>
                                                                                        <p class="mb-0">확인하기</p>
                                                                                    </div>
                                                                                </div>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-5">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col text-black text-opacity-75 fw-semibold" style="font-size: 1.2em;">
                                                    <span style="color: #f7a505;">희망을 주는 배움에너지</span>&nbsp;MK평생교육원
                                                </div>
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col my-auto">
                                                    <img class="img-fluid" src="../../resources/img/lifeStudent/corperation_logo1.png">
                                                </div>
                                                <div class="col my-auto">
                                                    <img class="img-fluid" src="../../resources/img/lifeStudent/corperation_logo2.png">
                                                </div>
                                                <div class="col my-auto">
                                                    <img class="img-fluid" src="../../resources/img/lifeStudent/corperation_logo3.png">
                                                </div>
                                                <div class="col my-auto">
                                                    <img class="img-fluid" src="../../resources/img/lifeStudent/corperation_logo4.png">
                                                </div>
                                                <div class="col my-auto">
                                                    <img class="img-fluid" src="../../resources/img/lifeStudent/corperation_logo5.png">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="./bottom.jsp"></jsp:include>
                </div>
            </div>
        </div>
        
        <div id="templete" class="d-none">
        	
        	<div class="receivingLectureWrapper row border-top">
	            <div class="col text-center py-1 fw-semibold" style="font-size: 0.85em;">
	                <div class="row">
	                    <div class="credit col my-auto">3학점</div>
	                    <div class="name col-4 my-auto">가족상담및가족진료</div>
	                    <div class="lecturer col my-auto">아무개</div>
	                    <div class="col">
	                        <div class="row">
	                            <div class="col">
	                                <button class="btn rounded-pill text-white py-0 fw-bold" style="background-color: #FA4D5A; font-size: 0.9em; width: 90%;">강의게획서</button>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col">
	                                <button class="btn rounded-pill text-white py-0 fw-bold" style="background-color: #70AD47; font-size: 0.9em; width: 90%;">샘플강의</button>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col my-auto">
	                        <button class="applyButton btn rounded-pill text-white py-1 fw-bold" style="background-color: #7844ae; font-size: 0.9em;">수강신청</button>
	                    </div>
	                </div>
	            </div>
	        </div>
        
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>