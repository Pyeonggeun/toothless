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

            .nav-pills .nav-link.active, .nav-pills .show>.nav-link {

                color: #f7a505;
                background-color: #fff;
                border-bottom: solid;
                border-color: #f7a505;

            }

            .nav-link {

                color: #909294;

            }

            .nav-link:focus, .nav-link:hover {

                color: #f7a505;

            }

        </style>

        <script>

            function showLectureProgressModal() {
                const modal = bootstrap.Modal.getOrCreateInstance("#lectureProgressModal");
                modal.show();
            }
            
            function showTestModal() {
                const modal = bootstrap.Modal.getOrCreateInstance("#testModal");
                const warnModal = bootstrap.Modal.getOrCreateInstance("#testWarningModal");
                warnModal.hide();
                modal.show();
            }
            
            function showTestWarningModal() {
                const modal = bootstrap.Modal.getOrCreateInstance("#testWarningModal");
                modal.show();
            }

            function showSubmitWarningModal() {
                const modal = bootstrap.Modal.getOrCreateInstance("#submitWarningModal");
                modal.show();
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
                                                <div class="col fw-bold text-secondary py-3 ps-3" style="font-size: 0.95em;">
                                                    홈
                                                </div>
                                                <div class="col text-end fw-bold text-secondary py-3 pe-3">
                                                    &gt;
                                                </div>
                                            </div>
                                            <div>
                                                <hr class="my-0">
                                            </div>
                                            <div onclick="goLecturePage()" class="row">
                                                <div class="col fw-bold py-3 ps-3" style="font-size: 0.95em; color: #7844ae;">
                                                    학습
                                                </div>
                                                <div class="col text-end fw-bold py-3 pe-3" style="color: #7844ae;">
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
                                                <div class="col px-0 fw-bold" style="font-size: 2em;">
                                                    학습
                                                </div>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="col px-0">
                                                    <div class="row">
                                                        <div class="col text-secondary" style="font-size: 0.9em;">
                                                            총 <span class="fw-semibold">155</span> 건
                                                        </div>
                                                        <div class="col">
                                                            <div class="row row-cols-auto justify-content-end">
                                                                <div class="col">
                                                                    <select class="form-select rounded-0 border-0" style="font-size: 0.9em;" >
                                                                        <option>학습 전체</option>
                                                                        <option>학습중</option>
                                                                        <option>학습 대기</option>
                                                                        <option>학습 완료</option>
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
                                                <div class="col">

                                                    <div class="row mt-3">
                                                        <div class="col py-4 rounded border">
                                                            <div class="row">
                                                                <div class="col px-4">
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
                                                                            기업현장교사 기본과정 온라인교육(15시간) 이수자를 위한 보충 영상 ※선택사항, 정규교과과정아님
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-4">
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col-auto fw-bold" style="font-size: 0.9em;">
                                                                                    교육기간
                                                                                </div>
                                                                                <div class="col-3 fw-bold text-body-tertiary" style="font-size: 0.9em;">
                                                                                    2024.01.01~2024.12.31
                                                                                </div>
                                                                                <div class="col-auto fw-bold" style="font-size: 0.9em;">
                                                                                    교육시간
                                                                                </div>
                                                                                <div class="col fw-bold text-body-tertiary" style="font-size: 0.9em;">
                                                                                    900시간
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="vr px-0 text-body-tertiary"></div>
                                                                <div class="col-3 my-auto">
                                                                    <div class="row">
                                                                        <div class="col d-grid justify-content-center">
                                                                            <button class="btn fw-bold px-5 py-2" style="font-size: 0.9em; color: #7844ae; border: solid; border-color: #7844ae; border-width: 0.01em; width: 13.5em;">수료증 출력</button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-2">
                                                                        <div class="col d-grid justify-content-center">
                                                                            <button onclick="showLectureProgressModal()" class="btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #7844ae; width: 13.5em;">과정 살펴보기</button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-2">
                                                                        <div class="col d-grid justify-content-center">
                                                                            <button class="btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #f7a505; width: 13.5em;">안내서 <i class="fa-solid fa-download"></i></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row mt-3">
                                                        <div class="col py-4 rounded border">
                                                            <div class="row">
                                                                <div class="col px-4">
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
                                                                            <span class="ms-2 px-3 py-1 fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #FA4D5A; background-color: #FAF1F4;">
                                                                                미수료
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
                                                                            기업현장교사 기본과정 온라인교육(15시간) 이수자를 위한 보충 영상 ※선택사항, 정규교과과정아님
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-4">
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col-auto fw-bold" style="font-size: 0.9em;">
                                                                                    교육기간
                                                                                </div>
                                                                                <div class="col-3 fw-bold text-body-tertiary" style="font-size: 0.9em;">
                                                                                    2024.01.01~2024.12.31
                                                                                </div>
                                                                                <div class="col-auto fw-bold" style="font-size: 0.9em;">
                                                                                    교육시간
                                                                                </div>
                                                                                <div class="col fw-bold text-body-tertiary" style="font-size: 0.9em;">
                                                                                    900시간
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="vr px-0 text-body-tertiary"></div>
                                                                <div class="col-3 my-auto">
                                                                    <div class="row">
                                                                        <div class="col d-grid justify-content-center">
                                                                            <button class="btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #7844ae; width: 13.5em;">과정 살펴보기</button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-2">
                                                                        <div class="col d-grid justify-content-center">
                                                                            <button class="btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #f7a505; width: 13.5em;">안내서 <i class="fa-solid fa-download"></i></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col py-4 rounded border">
                                                            <div class="row">
                                                                <div class="col px-4">
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
                                                                            <span class="ms-2 px-3 py-1 fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #7844ae; background-color: #F3ECFF;">
                                                                                학습중
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
                                                                            기업현장교사 기본과정 온라인교육(15시간) 이수자를 위한 보충 영상 ※선택사항, 정규교과과정아님
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-4">
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col-auto fw-bold" style="font-size: 0.9em;">
                                                                                    교육기간
                                                                                </div>
                                                                                <div class="col-3 fw-bold text-body-tertiary" style="font-size: 0.9em;">
                                                                                    2024.01.01~2024.12.31
                                                                                </div>
                                                                                <div class="col-auto fw-bold" style="font-size: 0.9em;">
                                                                                    교육시간
                                                                                </div>
                                                                                <div class="col fw-bold text-body-tertiary" style="font-size: 0.9em;">
                                                                                    900시간
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="vr px-0 text-body-tertiary"></div>
                                                                <div class="col-3 my-auto">
                                                                    <div class="row">
                                                                        <div class="col d-grid justify-content-center">
                                                                            <button class="btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #7844ae; width: 13.5em;">과정 살펴보기</button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-2">
                                                                        <div class="col d-grid justify-content-center">
                                                                            <button class="btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #f7a505; width: 13.5em;">안내서 <i class="fa-solid fa-download"></i></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col py-4 rounded border">
                                                            <div class="row">
                                                                <div class="col px-4">
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
                                                                            <span class="ms-2 px-3 py-1 fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #FF9100; background-color: #FFFAEB;">
                                                                                학습대기
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
                                                                            기업현장교사 기본과정 온라인교육(15시간) 이수자를 위한 보충 영상 ※선택사항, 정규교과과정아님
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-4">
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col-auto fw-bold" style="font-size: 0.9em;">
                                                                                    교육기간
                                                                                </div>
                                                                                <div class="col-3 fw-bold text-body-tertiary" style="font-size: 0.9em;">
                                                                                    2024.01.01~2024.12.31
                                                                                </div>
                                                                                <div class="col-auto fw-bold" style="font-size: 0.9em;">
                                                                                    교육시간
                                                                                </div>
                                                                                <div class="col fw-bold text-body-tertiary" style="font-size: 0.9em;">
                                                                                    900시간
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="vr px-0 text-body-tertiary"></div>
                                                                <div class="col-3 my-auto">
                                                                    <div class="row">
                                                                        <div class="col d-grid justify-content-center">
                                                                            <button class="btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #7844ae; width: 13.5em;">과정 살펴보기</button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-2">
                                                                        <div class="col d-grid justify-content-center">
                                                                            <button class="btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #f7a505; width: 13.5em;">안내서 <i class="fa-solid fa-download"></i></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row mt-5">
                                                        <div class="col d-grid justify-content-center">
                                                            <nav aria-label="Page navigation example">
                                                                <ul class="pagination mb-0">
                                                                    <li class="page-item">
                                                                        <a class="page-link border-0 text-black fw-bold" href="#" aria-label="Previous" style="font-size: 1.1em;">
                                                                            <span aria-hidden="true">&laquo;</span>
                                                                        </a>
                                                                    </li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-4" href="#" style="font-size: 1.1em;">1</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-4" href="#" style="font-size: 1.1em;">2</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-4" href="#" style="font-size: 1.1em;">3</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-4" href="#" style="font-size: 1.1em;">4</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-4" href="#" style="font-size: 1.1em;">5</a></li>
                                                                    <li class="page-item">
                                                                        <a class="page-link border-0 text-black fw-bold" href="#" aria-label="Next" style="font-size: 1.1em;">
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

        <jsp:include page="./lectureProgressModal.jsp"></jsp:include>

        <jsp:include page="./testModal.jsp"></jsp:include>
        
        <div id="testWarningModal" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body text-center fw-bold pt-4" style="font-size: 0.9em;">
                        <p class="mb-0">※ 응시하기 버튼을 누르면 시험이 바로 시작됩니다</p>
                        <p class="mb-0">※ 시험이 시작되면 제출하기 전까지 뒤로 갈 수 없습니다</p>
                        <p class="mb-0">※ 답안 제출 후 점수가 바로 채점됩니다</p>
                        <p class="mt-4 mb-0">시험을 응시하시겠습니까?</p>
                    </div>
                    <div class="modal-footer pb-3 border-0 justify-content-center">
                        <button class="btn btn-secondary me-3" style="font-size: 0.8em;" data-bs-dismiss="modal">닫기</button>
                        <button onclick="showTestModal()" class="btn text-white fw-bold" style="background-color: #7844ae; font-size: 0.8em;">응시하기</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="submitWarningModal" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-sm">
                <div class="modal-content">
                    <div class="modal-body text-center fw-bold pt-4" style="font-size: 0.9em;">
                        제출하시겠습니까?
                    </div>
                    <div class="modal-footer pb-3 pt-0 border-0 justify-content-center">
                        <button class="btn btn-secondary me-3" style="font-size: 0.8em;" data-bs-dismiss="modal">닫기</button>
                        <button  class="btn text-white fw-bold" style="background-color: #7844ae; font-size: 0.8em;">제출하기</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>