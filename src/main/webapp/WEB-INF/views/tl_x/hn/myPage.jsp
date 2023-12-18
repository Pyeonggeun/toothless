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
        
	        let ingPageNumber = 1;
	    	let ingTotalPageNumber = 1;
	    	
	    	let overPageNumber = 1;
	    	let overTotalPageNumber = 1;
	    	
			let lifeStudentKey = 1;
	    	
	    	let lectureStudentKey = 1;
	    	let openLectureKey = 1;
	    	let lectureTestKey = 1;
	    	
			function getLifeStudentKey() {
	    		
	    		const url = "./getLifeStudentKey";
	    		
	    		fetch(url)
	    		.then(response => response.json())
	    		.then(response => {
	    			
	    			lifeStudentKey = response.data;
	    			
	    		});
	    		
	    	}
			
			function previousIngPage() {
	    		
				ingPageNumber--;
	    		
	    	}
			
			function nextIngPage() {
	    		
				ingPageNumber++;
	    		
	    	}
			
			function previousOverPage() {
	    		
				overPageNumber--;
	    		
	    	}
			
			function nextOverPage() {
	    		
				overPageNumber++;
	    		
	    	}
			
			function ingPagination() {
				
	 			if(ingPageNumber <= 1) {
	 				document.getElementById("ingPrevious").classList.add("disabled");
	 			}else {
	 				document.getElementById("ingPrevious").classList.remove("disabled");
	 			}
	 			
	 			if(ingPageNumber >= ingTotalPageNumber) {
	 				document.getElementById("ingNext").classList.add("disabled");
	 			}else {
	 				document.getElementById("ingNext").classList.remove("disabled");	
	 			}
	 			
	 			document.getElementById("ingPageNumber").innerText = ingPageNumber;
	 			document.getElementById("ingTotalPageNumber").innerText = ingTotalPageNumber;
	 			
			}
			
			function overPagination() {
				
	 			if(overPageNumber <= 1) {
	 				document.getElementById("overPrevious").classList.add("disabled");
	 			}else {
	 				document.getElementById("overPrevious").classList.remove("disabled");
	 			}
	 			
	 			if(overPageNumber >= overTotalPageNumber) {
	 				document.getElementById("overNext").classList.add("disabled");
	 			}else {
	 				document.getElementById("overNext").classList.remove("disabled");	
	 			}
	 			
	 			document.getElementById("overPageNumber").innerText = overPageNumber;
	 			document.getElementById("overTotalPageNumber").innerText = overTotalPageNumber;
	 			
			}
        	
	        function goMyPage() {
	    		
	    		/* if(myPk == null) {
	    			location.href = "../../another/student/loginPage";
	    			return;
	    		} */
	    		
	    		location.href = "./myPage";
	    		
	    	}
	    	
	    	function goApplyPage() {
	    		
	    		/* if(myPk == null) {
	    			location.href = "../../another/student/loginPage";
	    			return;
	    		} */
	    		
	    		location.href = "./applyPage";
	    		
	    	}
	    	
	    	function goMainPage() {
	    		
	    		location.href = "./mainPage";
	    		
	    	}
	    	
			function goLecturePage() {
	    		
	    		location.href = "./lecturePage";
	    		
	    	}
	    	
	    	function goReviewPage() {
	    		
	    		location.href = "./reviewPage";
	    		
	    	}
	    	
	    	function logout() {
	    		
	    		location.href = "../../another/external/logoutProcess";
	    		
	    	}
	    	
	    	window.addEventListener("DOMContentLoaded", () => {
	    		
	    		/* getMyPk(); */
	    		
	    	});
        
        </script>

    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <jsp:include page="./top.jsp"></jsp:include>
                    <div class="row">
                        <div class="col py-4 progress-bar progress-bar-striped" style="background-color: #7844ae;">
                            <div class="row">
                                <div class="col text-white text-center fw-bold" style="font-size: 2em; letter-spacing: -0.05em;">
                                    나의 강의실
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row my-5">
                        <div class="col">
                            <div class="row" style="margin-left: 10.5%; margin-right: 10.5%;">
                                <div class="col-2">
                                    <div class="row sticky-top" style="top: 8em;">
                                        <div class="col rounded border">
                                            <div onclick="goMyPage()" class="row">
                                                <div class="col fw-bold py-3 ps-3" style="font-size: 0.95em; color: #7844ae;">
                                                    홈
                                                </div>
                                                <div class="col text-end fw-bold py-3 pe-3" style="color: #7844ae;">
                                                    &gt;
                                                </div>
                                            </div>
                                            <div>
                                                <hr class="my-0">
                                            </div>
                                            <div onclick="goLecturePage()" class="row">
                                                <div class="col fw-bold text-secondary py-3 ps-3" style="font-size: 0.95em;">
                                                    학습
                                                </div>
                                                <div class="col text-end fw-bold text-secondary py-3 pe-3">
                                                    &gt;
                                                </div>
                                            </div>
                                            <div>
                                                <hr class="my-0">
                                            </div>
                                            <div onclick="goReviewPage()" class="row">
                                                <div class="col fw-bold text-secondary py-3 ps-3" style="font-size: 0.95em;">
                                                    만족도/후기
                                                </div>
                                                <div class="col text-end fw-bold text-secondary py-3 pe-3">
                                                    &gt;
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col ms-5">
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col fw-bold" style="font-size: 2em;">
                                                    홈
                                                </div>
                                            </div>
                                            <div>
                                                <hr>
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col fw-semibold" style="font-size: 1.3em;">
                                                            학습활동
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col mx-3 py-3 px-5 rounded" style="background-color: #F3ECFF;">
                                                            <div class="row">
                                                                <div class="col my-auto fw-semibold" style="font-size: 1em;">
                                                                    학습 중
                                                                </div>
                                                                <div class="col text-end my-auto fw-bold" style="font-size: 2em; color: #7844ae;">
                                                                    0
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col mx-3 py-3 px-5 rounded" style="background-color: #FFFAEB;">
                                                            <div class="row">
                                                                <div class="col my-auto fw-semibold" style="font-size: 1em;">
                                                                    학습 대기
                                                                </div>
                                                                <div class="col text-end my-auto fw-bold" style="font-size: 2em; color: #FF9100;">
                                                                    0
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col mx-3 py-3 px-5 rounded" style="background-color: #F1F9F1;">
                                                            <div class="row">
                                                                <div class="col my-auto fw-semibold" style="font-size: 1em;">
                                                                    학습 완료
                                                                </div>
                                                                <div class="col text-end my-auto fw-bold" style="font-size: 2em; color: #4CAF50;">
                                                                    0
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-5">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col text-black text-opacity-75 fw-semibold" style="font-size: 1.3em;">
                                                                    학습 중인 과정
                                                                </div>
                                                                <div class="col">
                                                                    <nav aria-label="Page navigation example">
                                                                        <ul class="pagination justify-content-end">
                                                                            <li id="ingPrevious" class="page-item">
                                                                                <a onclick="previousIngPage()" class="page-link fw-bold rounded-circle py-1" href="#" aria-label="Previous" style="font-size: 1em; color: #f7a505;">
                                                                                    <span aria-hidden="true">&laquo;</span>
                                                                                </a>
                                                                            </li>
                                                                            <li class="page-item px-1 my-auto">
                                                                            	<a class="page-link border-0 link-secondary px-1 fw-bold" style="font-size: 0.9em;">
                                                                            		<span id="ingPageNumber" style="color: #f7a505">1</span> / <span id="ingTotalPageNumber">10</span>
                                                                            	</a>
                                                                            </li>
                                                                            <li id="ingNext" class="page-item">
                                                                                <a onclick="nextIngPage()" class="page-link fw-bold rounded-circle py-1" href="#" aria-label="Next" style="font-size: 1em; color: #f7a505;">
                                                                                    <span aria-hidden="true">&raquo;</span>
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </nav>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-1">
                                                                <div class="col rounded border px-3 py-4" style="height: 18.78em;">
                                                                    <div class="row align-items-center" style="height: 15.78em;">
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-center">
                                                                                    <i class="bi bi-chat-dots-fill" style="color: #EEEEEE; font-size: 2.5em;"></i>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col text-center" style="font-size: 0.9em;">
                                                                                    학습중인 과정이 없습니다
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col ms-5">
                                                            <div class="row">
                                                                <div class="col text-black text-opacity-75 fw-semibold" style="font-size: 1.3em;">
                                                                    학습완료 과정
                                                                </div>
                                                                <div class="col">
                                                                    <nav aria-label="Page navigation example">
                                                                        <ul class="pagination justify-content-end">
                                                                            <li id="overPrevious" class="page-item">
                                                                                <a onclick="previousOverPage()" class="page-link fw-bold rounded-circle py-1" href="#" aria-label="Previous" style="font-size: 1em; color: #f7a505;">
                                                                                    <span aria-hidden="true">&laquo;</span>
                                                                                </a>
                                                                            </li>
                                                                            <li class="page-item px-1 my-auto">
                                                                            	<a class="page-link border-0 link-secondary px-1 fw-bold" style="font-size: 0.9em;">
                                                                            		<span id="overPageNumber" style="color: #f7a505">1</span> / <span id="overTotalPageNumber">10</span>
                                                                            	</a>
                                                                            </li>
                                                                            <li id="overNext" class="page-item">
                                                                                <a onclick="nextOverPage()" class="page-link fw-bold rounded-circle py-1" href="#" aria-label="Next" style="font-size: 1em; color: #f7a505;">
                                                                                    <span aria-hidden="true">&raquo;</span>
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </nav>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-1">
                                                                <div class="col rounded border px-3 py-4" style="height: 18.78em;">
                                                                    <div class="row align-items-center" style="height: 15.78em;">
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    <div class="row">
                                                                                        <div class="col">
                                                                                            <span class="text-body-tertiary border-secondary-subtle ps-2 pe-1 py-1 fw-bold" style="border: solid; border-width: 0.01em; font-size: 0.85em;">
                                                                                                &#91;123&#93;<span style="font-size: 0.9em;">차</span>
                                                                                            </span>
                                                                                            <span class="ms-2 px-2 py-1 fw-bold" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #f7a505;">
                                                                                                오프라인
                                                                                            </span>
                                                                                        </div>
                                                                                        <div class="col text-end">
                                                                                            <span class="ms-2 px-3 py-1 fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #4CAF50; background-color: #F1F9F1;">
                                                                                                수료
                                                                                            </span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row mt-3">
                                                                                        <div class="col fw-bold text-body-tertiary" style="font-size: 0.95em;">
                                                                                            파이썬
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row mt-2">
                                                                                        <div class="col fw-bold" style="font-size: 1.1em;">
                                                                                            기업현장교사 기본과정
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-4">
                                                                                <div class="col">
                                                                                    <div class="row">
                                                                                        <div class="col-auto fw-bold text-body-tertiary" style="font-size: 0.9em;">
                                                                                            교육기간
                                                                                        </div>
                                                                                        <div class="col fw-bold" style="font-size: 0.9em;">
                                                                                            2024.01.01~2024.12.31
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row">
                                                                                        <div class="col-auto fw-bold text-body-tertiary" style="font-size: 0.9em;">
                                                                                            인정학점
                                                                                        </div>
                                                                                        <div class="col fw-bold" style="font-size: 0.9em;">
                                                                                            3학점
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-4">
                                                                                <div class="col d-grid pe-2">
                                                                                    <button class="btn fw-bold" style="font-size: 0.9em; color: #7844ae; border: solid; border-color: #7844ae; border-width: 0.01em;">
                                                                                        수료증 출력
                                                                                    </button>
                                                                                </div>
                                                                                <div class="col d-grid ps-2">
                                                                                    <button class="btn fw-bold text-white" style="font-size: 0.9em; background-color: #7844ae;">
                                                                                        과정 살펴보기
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>