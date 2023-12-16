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
        
	        let searchWord = "";
	        let searchType = [];
	        let searchRecruitment = 0;
	        let eachTotalNumber = 5;
	        
	    	let pageNumber = 1;
	    	let totalPageNumber = 1;
	    	let startPageNumber = 1;
	    	let endPageNumber = 1;
	    	
			function previousPage() {
        		
				pageNumber = startPageNumber - 1;
        		
        		reloadClinicPatientList();
        		
        	}
			
			function reloadOpenLecture() {
				
				url = "./getOpenLectureList?searchType=" + searchType + "&searchWord=" + searchWord +
						"&searchRecruitment=" + searchRecruitment + "&pageNumber=" + pageNumber + "&eachTotalNumber=" + eachTotalNumber;
				
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
                                    수강신청
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row my-5">
                        <div class="col">
                            <div class="row" style="margin-left: 10.5%; margin-right: 10.5%;">
                                <div class="col-2">
                                    <div class="row sticky-top" style="top: 8em;">
                                        <div class="col rounded border px-3 py-3">
                                            <div class="row">
                                                <div class="col fw-bold">
                                                    강의 카테고리
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div id="sideCategoryBox" class="col">
                                                
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col ms-5">
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col py-3 rounded" style="background-color: #f7f7f9;">
                                                    <div class="row justify-content-center">
                                                        <div class="col-8">
                                                            <div class="input-group">
                                                                <input id="searchWord" type="text" class="form-control text-body-tertiary rounded-start-pill border-end-0 ps-4 py-3" placeholder="찾으시는 강의명을 입력해주세요" style="font-size: 0.85em; border: solid; border-color: #7844ae; border-width: 0.01em;">
                                                                <span onclick="setSearchWord()" class="input-group-text rounded-end-pill border-start-0 pe-4 bg-white" style="border: solid; border-color: #7844ae; border-width: 0.01em;">
                                                                    <i class="fa-solid fa-magnifying-glass" style="font-size: 1.2em; color: #7844ae;"></i>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col px-0">
                                                    <div class="row">
                                                        <div class="col text-secondary" style="font-size: 0.9em;">
                                                            총 <span id="totalCount" class="fw-semibold">155</span> 건
                                                        </div>
                                                        <div class="col">
                                                            <div class="row row-cols-auto justify-content-end">
                                                                <div class="col">
                                                                    <select onblur="reloadSearchRecruitment()" id="searchRecruitment" class="form-select rounded-0 border-0" style="font-size: 0.9em;" >
                                                                        <option value="0">모집 전체</option>
                                                                        <option value="1">모집중</option>
                                                                        <option value="2">모집마감</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col">
                                                                    <select onblur="reloadEachTotalNumber()" id="eachTotalNumber" class="form-select rounded-0 border-0" style="font-size: 0.9em;">
                                                                        <option value="5">5개씩 보기</option>
                                                                        <option value="10">10개씩 보기</option>
                                                                        <option value="20">20개씩 보기</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <hr class="mt-0">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-auto ps-0">
                                                    <div class="row">
                                                        <div class="col mt-1">
                                                            <button onclick="resetSearchType()" class="btn border rounded-pill" style="font-size: 0.75em;">
                                                                <i class="fa-solid fa-arrow-rotate-right"></i> 초기화
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div id="categoryPillBox" class="row row-cols-auto pe-0">
                                                        
                                                        <div class="categoryPillWrapper col mt-1">
                                                            <button class="categoryButton btn rounded-pill" style="font-size: 0.75em; background-color: #f7f7f9;">
                                                                <span class="categoryName">[자격교육] 자격 신규 취득과정</span> <i onclick="removeCategory(this)" class="fa-solid fa-xmark"></i>
                                                            </button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div id="openLectureBox" class="col">

                                                    <div class="row mt-5">
                                                        <div class="col d-grid justify-content-center">
                                                            <nav aria-label="Page navigation example">
                                                                <ul class="pagination mb-0">
                                                                    <li id="previous" class="page-item">
                                                                        <a onclick="previousPage()" class="page-link border-0 text-black fw-bold" href="#" aria-label="Previous" style="font-size: 1.1em;">
                                                                            <span aria-hidden="true">&laquo;</span>
                                                                        </a>
                                                                    </li>
                                                                    <li id="pageNumberBox1" class="page-item my-auto"></li>
                                                                    <li id="pageNumberBox2" class="page-item my-auto"></li>
                                                                    <li id="pageNumberBox3" class="page-item my-auto"></li>
                                                                    <li id="pageNumberBox4" class="page-item my-auto"></li>
                                                                    <li id="pageNumberBox5" class="page-item my-auto"></li>
                                                                    <li id="next" class="page-item">
                                                                        <a onclick="nextPage()" class="page-link border-0 text-black fw-bold" href="#" aria-label="Next" style="font-size: 1.1em;">
                                                                            <span aria-hidden="true">&raquo;</span>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </nav>
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
        
        <div id="templete" class="d-none">
        	
        	<div class="sideCategoryWrapper row mt-1">
	            <div class="col">
	                <div class="form-check">
	                    <input class="sideCategoryCheck form-check-input" type="checkbox" value="" id="flexCheckDefault1">
	                    <label class="sideCategoryName form-check-label" for="flexCheckDefault1" style="font-size: 0.85em;">
	                        [자격교육] 자격 신규 취득과정
	                    </label>
	                </div>
	            </div>
	        </div>
	        
	        <div class="openLectureWrapper row mt-3">
	            <div class="col py-4 rounded border">
	                <div class="row">
	                    <div class="col px-4">
	                        <div class="row">
	                            <div class="col">
	                                <span class="text-body-tertiary border-secondary-subtle ps-2 pe-1 py-1 fw-bold" style="border: solid; border-width: 0.01em; font-size: 0.85em;">
	                                    &#91;<span class="ground">123</span>&#93;<span style="font-size: 0.9em;">차</span>
	                                </span>
	                                <span class="ms-2 px-2 py-1 fw-bold" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #f7a505;">
	                                    오프라인
	                                </span>
	                            </div>
	                            <div class="col text-end">
	                                <span class="recruitment ms-2 px-3 py-1 fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #7844ae; background-color: #F3ECFF;">
	                                    모집중
	                                </span>
	                            </div>
	                        </div>
	                        <div class="row mt-3">
	                            <div class="category col fw-bold text-body-tertiary" style="font-size: 0.95em;">
	                                파이썬
	                            </div>
	                        </div>
	                        <div class="row mt-2">
	                            <div class="name col fw-bold" style="font-size: 1.1em;">
	                                기업현장교사 기본과정 온라인교육(15시간) 이수자를 위한 보충 영상 ※선택사항, 정규교과과정아님
	                            </div>
	                        </div>
	                        <div class="row mt-4">
	                            <div class="col">
	                                <div class="row">
	                                    <div class="col-auto fw-bold" style="font-size: 0.9em;">
	                                        신청기간
	                                    </div>
	                                    <div class="applyDate col-3 fw-bold text-body-tertiary" style="font-size: 0.9em;">
	                                        2023.12.01~2023.12.31
	                                    </div>
	                                    <div class="col-auto fw-bold" style="font-size: 0.9em;">
	                                        신청인원
	                                    </div>
	                                    <div class="col fw-bold text-body-tertiary" style="font-size: 0.9em;">
	                                        <span class="currentApplyNumber text-black">447</span> / <span class="totalApplyNumber">999</span>
	                                    </div>
	                                </div>
	                                <div class="row">
	                                    <div class="col-auto fw-bold" style="font-size: 0.9em;">
	                                        교육기간
	                                    </div>
	                                    <div class="lectureDate col-3 fw-bold text-body-tertiary" style="font-size: 0.9em;">
	                                        2024.01.01~2024.12.31
	                                    </div>
	                                    <div class="col-auto fw-bold" style="font-size: 0.9em;">
	                                        교육시간
	                                    </div>
	                                    <div class="totalHour col fw-bold text-body-tertiary" style="font-size: 0.9em;">
	                                        900시간
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="vr px-0 text-body-tertiary"></div>
	                    <div class="col-3 my-auto d-grid justify-content-center">
	                        <button onclick="goDetailPage()" class="applyButton btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #7844ae;">신청하기</button>
	                    </div>
	                </div>
	            </div>
	        </div>
	        
	        <a onclick="movePage(this)" class="pageNumberLink page-link border-0 text-black px-4" href="#" style="font-size: 1.1em;">1</a>
        	
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>