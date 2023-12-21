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
        
        	const openLectureKey = ${open_lecture_key};
        	let canApply = true;
        	let canSatisfaction = true;
        	let canOverlap = true;
        	
			function getTopName() {
		    		
	    		const url = "./getTopName";
	    		
	    		fetch(url)
	    		.then(response => response.json())
	    		.then(response => {
	    			
	    			document.getElementById("topName").innerText = response.data;
	    			
	    		});
	    		
	    	}
        	
        	function reloadDetailPage() {
        		
        		const url = "./getDetailPageInfo?open_lecture_key=" + openLectureKey;
        		
        		removeDetailPage();
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			document.getElementById("sideRound").innerText = response.data.round;
        			document.getElementById("sideName").innerText = response.data.lectureInfo.name;
        			document.getElementById("sideCurrentApplyNumber").innerText = response.data.currentApplyNumber;
        			document.getElementById("sideTotalApplyNumber").innerText = response.data.openLectureInfo.max_student;
        			
        			document.getElementById("studyContent").innerText = response.data.lectureInfo.study_content;
        			document.getElementById("studyGoal").innerText = response.data.lectureInfo.study_goal;
        			document.getElementById("studyKnowledge").innerText = response.data.lectureInfo.need_knowledge;
        			document.getElementById("studyTarget").innerText = response.data.lectureInfo.study_target;
        			
        			let str = "";
        			
        			for(e of response.data.conditionLectureNameList) {
        				
        				str += "- " + e + " ";
        				
        			}
        			
        			document.getElementById("condition").innerText = str;
        			document.getElementById("lecturer").innerText = response.data.lecturerName;
        			document.getElementById("credit").innerText = response.data.lectureInfo.credit + "학점";
        			document.getElementById("currentApplyNumber").innerText = response.data.currentApplyNumber;
        			document.getElementById("totalApplyNumber").innerText = response.data.openLectureInfo.max_student;
        			document.getElementById("totalHour").innerText = response.data.lectureInfo.total_hour + "시간";
        			
        			const openDate = new Date(response.data.openLectureInfo.open_date);
        			const closeDate = new Date(response.data.openLectureInfo.close_date);
        			const startApply = new Date(response.data.openLectureInfo.start_apply);
        			const endApply = new Date(response.data.openLectureInfo.end_apply);
        			
        			document.getElementById("lectureDate").innerText =
        				openDate.getFullYear() + "." + ("0" + (openDate.getMonth() + 1)).slice(-2) + "." + ("0" + openDate.getDate()).slice(-2) + "~" +
        				closeDate.getFullYear() + "." + ("0" + (closeDate.getMonth() + 1)).slice(-2) + "." + ("0" + closeDate.getDate()).slice(-2);
        			
        			document.getElementById("applyDate").innerText =
        				startApply.getFullYear() + "." + ("0" + (startApply.getMonth() + 1)).slice(-2) + "." + ("0" + startApply.getDate()).slice(-2) + "~" +
        				endApply.getFullYear() + "." + ("0" + (endApply.getMonth() + 1)).slice(-2) + "." + ("0" + endApply.getDate()).slice(-2);
        			
        			document.getElementById("name").innerText = response.data.lectureInfo.name;
        			document.getElementById("category").innerText = response.data.categoryName;
        			
        			const applyButton = document.getElementById("applyButton");
        			
        			if(canApply == false && canSatisfaction == true && canOverlap == false) {

        				applyButton.setAttribute("onclick", "applyLecture()");
        				
        			}else if(canApply == false && canSatisfaction == true && canOverlap == true) {
        				
        				applyButton.setAttribute("onclick", "showOverlapDate()");
        				
        			}else if(canApply == true && canSatisfaction == true) {

        				applyButton.setAttribute("onclick", "showApplyAlreadyComplete()");
        				
        			}else {
        				
        				applyButton.setAttribute("onclick", "showNotApplicable()")
        				
        			}
        			
        			if(response.data.currentApplyNumber >= response.data.openLectureInfo.max_student) {
        				
        				applyButton.classList.add("disabled");
        				applyButton.innerText = "신청마감";
        				applyButton.removeAttribute("onclick");
        				
        			}
        			
        		});
        		
        	}
        	
        	function isApply() {
        		
        		const url = "./isApply?open_lecture_key=" + openLectureKey;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			canApply = response.data;
        			
        			isConditionSatisfaction();
        			
        		});
        		
        	}
        	
        	function isConditionSatisfaction() {
        		
        		const url = "./isConditionSatisfaction?open_lecture_key=" + openLectureKey;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			canSatisfaction = response.data;
        			
        			reloadDetailPage();
        			
        		});
        		
        	}
        	
        	function isOverlapDate() {
        		
				const url = "./isOverlapDate?open_lecture_key=" + openLectureKey;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			canOverlap = response.data;
        			
        			reloadDetailPage();
        			
        		});
        		
        	}
        	
        	function applyLecture() {
        		
        		const url = "./insertLectureStudentInfo?open_lecture_key=" + openLectureKey;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			showApplyComplete();
        			
        		});
        		
        	}
        	
        	function removeDetailPage() {
        		
        		document.getElementById("sideRound").innerText = "";
    			document.getElementById("sideName").innerText = "";
    			document.getElementById("sideCurrentApplyNumber").innerText = "";
    			document.getElementById("sideTotalApplyNumber").innerText = "";
    			
    			document.getElementById("studyContent").innerText = "";
    			document.getElementById("studyGoal").innerText = "";
    			document.getElementById("studyKnowledge").innerText = "";
    			document.getElementById("studyTarget").innerText = "";
    			
    			document.getElementById("condition").innerText = "";
    			document.getElementById("lecturer").innerText = "";
    			document.getElementById("credit").innerText = "";
    			document.getElementById("currentApplyNumber").innerText = "";
    			document.getElementById("totalApplyNumber").innerText = "";
    			document.getElementById("totalHour").innerText = "";
    			
    			document.getElementById("lectureDate").innerText = "";
    			
    			document.getElementById("applyDate").innerText = "";
    			
    			document.getElementById("name").innerText = "";
    			document.getElementById("category").innerText = "";
        		
        	}

            function showApplyComplete() {
                const modal = bootstrap.Modal.getOrCreateInstance("#applyCompleteModal");
                modal.show();
            }

            function showApplyAlreadyComplete() {
                const modal = bootstrap.Modal.getOrCreateInstance("#applyAlreadyCompleteModal");
                modal.show();
            }
            
            function showNotApplicable() {
            	const modal = bootstrap.Modal.getOrCreateInstance("#notApplicableModal");
                modal.show();	
            }
            
            function showOverlapDate() {
            	const modal = bootstrap.Modal.getOrCreateInstance("#overlapDateModal");
                modal.show();
            }
            
            function applyCompleteModalHide() {
            	
            	const modal = bootstrap.Modal.getOrCreateInstance("#applyCompleteModal");
            	
            	isApply();
                modal.hide();
            	
            }
            
			function applyAlreadyCompleteModalHide() {
            	
            	const modal = bootstrap.Modal.getOrCreateInstance("#applyAlreadyCompleteModal");
            	
            	isApply();
                modal.hide();
            	
            }
			
			function notApplicableModalHide() {
            	
            	const modal = bootstrap.Modal.getOrCreateInstance("#notApplicableModal");
            	
            	isApply();
                modal.hide();
            	
            }
			
			function notApplicableModalHide() {
            	
            	const modal = bootstrap.Modal.getOrCreateInstance("#overlapDateModal");
            	
            	isApply();
                modal.hide();
            	
            }
            
			function goMyPage() {
        		
        		/* if(myPk == null) {
        			location.href = "../../another/student/loginPage";
        			return;
        		} */
        		
        		applyCompleteModalHide();
        		applyAlreadyCompleteModalHide();
        		notApplicableModalHide();
        		notApplicableModalHide();
        		
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
        		
        		location.href = "../../another/student/logoutProcess";
        		
        	}
        	
        	window.addEventListener("DOMContentLoaded", () => {
        		
        		/* getMyPk(); */
        		
        		getTopName();
        		isApply();
        		
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
                                <div class="col px-5">
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row">
                                                        <div id="category" class="col fw-bold text-body-tertiary" style="font-size: 0.95em;">
                                                            
                                                        </div>
                                                        <div class="col text-end">
                                                            <span class="ms-2 px-3 py-1 fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #7844ae; background-color: #F3ECFF;">
                                                                모집중
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div id="name" class="col fw-bold" style="font-size: 1.3em;">
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col">
                                                            <table class="table table-bordered border border-top-0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="fw-bold py-3 ps-3" style="font-size: 0.85em; width: 15%; background-color: #f7f7f9;">접수기간</td>
                                                                        <td id="applyDate" class="fw-semibold py-3 ps-3" style="font-size: 0.9em;"></td>
                                                                        <td class="fw-bold py-3 ps-3" style="font-size: 0.85em; width: 15%; background-color: #f7f7f9;">교육기간</td>
                                                                        <td id="lectureDate" class="fw-semibold py-3 ps-3" style="font-size: 0.9em;"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fw-bold py-3 ps-3" style="font-size: 0.85em; width: 15%; background-color: #f7f7f9;">교육시간</td>
                                                                        <td id="totalHour" class="fw-semibold py-3 ps-3" style="font-size: 0.85em;"></td>
                                                                        <td class="fw-bold py-3 ps-3" style="font-size: 0.85em; width: 15%; background-color: #f7f7f9;">교육비</td>
                                                                        <td class="fw-semibold py-3 ps-3" style="font-size: 0.85em;">무료</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fw-bold py-3 ps-3" style="font-size: 0.85em; width: 15%; background-color: #f7f7f9;">교육정원</td>
                                                                        <td id="totalApplyNumber" class="fw-semibold py-3 ps-3" style="font-size: 0.85em;"></td>
                                                                        <td class="fw-bold py-3 ps-3" style="font-size: 0.85em; width: 15%; background-color: #f7f7f9;">현산청인원</td>
                                                                        <td id="currentApplyNumber" class="fw-semibold py-3 ps-3" style="font-size: 0.85em;"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fw-bold py-3 ps-3" style="font-size: 0.85em; width: 15%; background-color: #f7f7f9;">인정학점</td>
                                                                        <td id="credit" class="fw-semibold py-3 ps-3" style="font-size: 0.85em;"></td>
                                                                        <td class="fw-bold py-3 ps-3" style="font-size: 0.85em; width: 15%; background-color: #f7f7f9;">강사</td>
                                                                        <td id="lecturer" class="fw-semibold py-3 ps-3" style="font-size: 0.85em;"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fw-bold py-3 ps-3" style="font-size: 0.85em; width: 15%; background-color: #f7f7f9;">신청조건</td>
                                                                        <td id="condition" colspan="3" class="fw-semibold py-3 ps-3" style="font-size: 0.85em;">
                                                                        	
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-5">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col text-center fw-bold" style="font-size: 0.95em;">
                                                            상세내용
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <hr class="border-2">
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row mt-4">
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col-auto" style="font-size: 1.5em; color: #f7a505;">
                                                                            <i class="fa-solid fa-chess-knight"></i>
                                                                        </div>
                                                                        <div class="col fw-bold ps-0 my-auto" style="font-size: 1.3em;">
                                                                            교육<span style="color: #4a3187;">대상</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-3">
                                                                        <div id="studyTarget" class="col rounded border mx-2 py-4 px-4 fw-semibold" style="font-size: 0.9em; background-color: #f7f7f9;">
                                                                            
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-5">
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col-auto" style="font-size: 1.5em; color: #f7a505;">
                                                                            <i class="fa-solid fa-chess-knight"></i>
                                                                        </div>
                                                                        <div class="col fw-bold ps-0 my-auto" style="font-size: 1.3em;">
                                                                            선수<span style="color: #4a3187;">지식</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-3">
                                                                        <div id="studyKnowledge" class="col rounded border mx-2 py-4 px-4 fw-semibold" style="font-size: 0.9em; background-color: #f7f7f9;">
                                                                            
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-5">
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col-auto" style="font-size: 1.5em; color: #f7a505;">
                                                                            <i class="fa-solid fa-chess-knight"></i>
                                                                        </div>
                                                                        <div class="col fw-bold ps-0 my-auto" style="font-size: 1.3em;">
                                                                            교육<span style="color: #4a3187;">목표</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-3">
                                                                        <div id="studyGoal" class="col rounded border mx-2 py-4 px-4 fw-semibold" style="font-size: 0.9em; background-color: #f7f7f9;">
                                                                            
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-5">
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col-auto" style="font-size: 1.5em; color: #f7a505;">
                                                                            <i class="fa-solid fa-chess-knight"></i>
                                                                        </div>
                                                                        <div class="col fw-bold ps-0 my-auto" style="font-size: 1.3em;">
                                                                            교육<span style="color: #4a3187;">내용</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-3">
                                                                        <div id="studyContent" class="col rounded border mx-2 py-4 px-4 fw-semibold" style="font-size: 0.9em; background-color: #f7f7f9;">
                                                                            
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col d-grid justify-content-end pe-2">
                                                            <button onclick="goApplyPage()" class="btn btn-outline-secondary fw-bold" style="font-size: 0.85em;">목록으로</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="row sticky-top" style="top: 8em;">
                                        <div class="col rounded px-3 py-3" style="border: solid; border-color: #7844ae; border-width: 0.01em;">
                                            <div class="row">
                                                <div class="col">
                                                    <span class="text-body-tertiary border-secondary-subtle ps-2 pe-1 py-1 fw-bold" style="border: solid; border-width: 0.01em; font-size: 0.85em;">
                                                        &#91;<span id="sideRound"></span>&#93;<span style="font-size: 0.9em;">회차</span>
                                                    </span>
                                                    <span class="ms-2 px-2 py-1 fw-bold" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #f7a505;">
                                                        오프라인
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="row mt-3">
                                                <div id="sideName" class="col fw-bold" style="font-size: 1.02em;">
                                                    
                                                </div>  
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col fw-bold" style="font-size: 0.9em;">
                                                    신청인원
                                                </div>
                                                <div class="col text-end fw-bold text-body-tertiary" style="font-size: 0.9em;">
                                                    <span id="sideCurrentApplyNumber" class="text-black"></span> / <span id="sideTotalApplyNumber"></span>
                                                </div>
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col d-grid">
                                                    <button id="applyButton" class="btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #7844ae;">신청하기</button>
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

        <div id="applyCompleteModal" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body text-center fw-bold py-5" style="font-size: 0.9em;">
                        수강 신청이 완료되었습니다
                    </div>
                    <div class="modal-footer py-1 border-0">
                        <button onclick="applyCompleteModalHide()" class="btn btn-secondary" style="font-size: 0.8em;" data-bs-dismiss="modal">닫기</button>
                        <button onclick="goMyPage()" class="btn text-white fw-bold" style="background-color: #7844ae; font-size: 0.8em;">나의 강의실</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="applyAlreadyCompleteModal" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body text-center fw-bold py-5" style="font-size: 0.9em;">
                        이미 신청이 완료된 강의입니다
                    </div>
                    <div class="modal-footer py-1 border-0">
                        <button onclick="applyAlreadyCompleteModalHide()" class="btn btn-secondary" style="font-size: 0.8em;" data-bs-dismiss="modal">닫기</button>
                        <button onclick="goMyPage()" class="btn text-white fw-bold" style="background-color: #7844ae; font-size: 0.8em;">나의 강의실</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="notApplicableModal" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body text-center fw-bold py-5" style="font-size: 0.9em;">
                        신청 조건에 부합하지 않습니다
                    </div>
                    <div class="modal-footer py-1 border-0">
                        <button onclick="notApplicableModalHide()" class="btn btn-secondary" style="font-size: 0.8em;" data-bs-dismiss="modal">닫기</button>
                        <button onclick="goMyPage()" class="btn text-white fw-bold" style="background-color: #7844ae; font-size: 0.8em;">나의 강의실</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="overlapDateModal" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body text-center fw-bold py-5" style="font-size: 0.9em;">
                        교육기간이 겹치는 강의는 신청이 불가능합니다
                    </div>
                    <div class="modal-footer py-1 border-0">
                        <button onclick="overlapDateModalHide()" class="btn btn-secondary" style="font-size: 0.8em;" data-bs-dismiss="modal">닫기</button>
                        <button onclick="goMyPage()" class="btn text-white fw-bold" style="background-color: #7844ae; font-size: 0.8em;">나의 강의실</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>