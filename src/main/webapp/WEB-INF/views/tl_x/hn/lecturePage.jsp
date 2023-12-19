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
        
	        let pageNumber = 1;
	    	let totalPageNumber = 1;
	    	let startPageNumber = 1;
	    	let endPageNumber = 1;

	    	let searchType = 0;
	    	
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
	    			
	    			reloadTotalMyLectureCount();
	    			
	    		});
	    		
	    	}
	    	
			function previousPage() {
	    		
				pageNumber = startPageNumber - 1;
	    		
				reloadOpenLecture();
	    		
	    	}
			
			function nextPage() {
	    		
				pageNumber = endPageNumber + 1;
	    		
				reloadOpenLecture();
	    		
	    	}
			
			function movePage(target) {
	    		
				pageNumber = Number(target.innerText);
	    		
				reloadOpenLecture();
	    		
	    	}
			
			function pagination() {
				
				startPageNumber = (parseInt((pageNumber-1)/5))*5+1;
				endPageNumber = ((parseInt(pageNumber-1)/5)+1)*5;
	 			
	 			if(endPageNumber > totalPageNumber) {
	 				endPageNumber = totalPageNumber;
	 			}
	 			
	 			if(startPageNumber <= 1) {
	 				document.getElementById("previous").classList.add("disabled");
	 			}else {
	 				document.getElementById("previous").classList.remove("disabled");
	 			}
	 			
	 			if(endPageNumber >= totalPageNumber) {
	 				document.getElementById("next").classList.add("disabled");
	 			}else {
	 				document.getElementById("next").classList.remove("disabled");	
	 			}
	 			
	 			for(let i = 1 ; i <= 5 ; i++) {
	 				document.getElementById("pageNumberBox" + i).innerHTML = "";
	 			}
	 			
	 			for(let i = startPageNumber ; i <= endPageNumber ; i++) {
	 				
	 				const pageNumberLink = document.querySelector("#templete .pageNumberLink").cloneNode(true);
	 				
	 				if(i == pageNumber) {
	 					pageNumberLink.classList.remove("text-black");
	 					pageNumberLink.style.color = '#f7a505';
	 				}else {
	 					pageNumberLink.classList.add("text-black");
	 					pageNumberLink.style.removeProperty("color");
	 				}
	 				
	 				pageNumberLink.innerText = i;
	 				
	 				document.getElementById("pageNumberBox" + (i - parseInt((pageNumber-1)/5)*5)).appendChild(pageNumberLink);
	 				
	 			}
				
			}
			
			function search() {
				
				searchType = Number(document.getElementById("searchType").value);
				
				reloadTotalMyLectureCount();
				
			}
			
			function reloadTotalMyLectureCount() {
				
				const url = "./getTotalMyLectureCount?life_student_key=" + lifeStudentKey + "&searchType=" + searchType;
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					document.getElementById("totalCount").innerText = response.data;
					
					totalPageNumber = Math.ceil(response.data/5);
					
					reloadMyLecture();
					
				});
				
			}
			
			function reloadMyLecture() {
				
				const url = "./getMyLecture?life_student_key=" + lifeStudentKey + "&pageNumber=" + pageNumber + "&searchType=" + searchType;
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					pagination();
					
					const lectureBox = document.getElementById("lectureBox");
					lectureBox.innerHTML = "";
					
					if(totalPageNumber == 0) {
						
						const noApplyLectureWrapper = document.querySelector("#templete .noApplyLectureWrapper").cloneNode(true);
						lectureBox.appendChild(noApplyLectureWrapper);
						
						return;
						
					}
					
					for(e of response.data) {
						
						const openDate = new Date(e.openLectureInfo.open_date);
						const closeDate = new Date(e.openLectureInfo.close_date);
						const sysdate = new Date();
						
						const lectureWrapper = document.querySelector("#templete .lectureWrapper").cloneNode(true);
						
						lectureWrapper.querySelector(".round").innerText = e.round;
						
						const statusBox = lectureWrapper.querySelector(".statusBox");
						statusBox.innerHTML = "";
						const buttonBox = lectureWrapper.querySelector(".buttonBox");
						buttonBox.innerHTML = "";
						
						if(openDate > sysdate) {
							const wait = document.querySelector("#templete .wait").cloneNode(true);
							statusBox.appendChild(wait);
							const lectureProgress = document.querySelector("#templete .lectureProgress").cloneNode(true);
							lectureProgress.querySelector(".lectureProgressButton").value = e.openLectureInfo.open_lecture_key;
							const information = document.querySelector("#templete .information").cloneNode(true);
							buttonBox.appendChild(lectureProgress);
							buttonBox.appendChild(information);
						}else if(openDate < sysdate && closeDate > sysdate) {
							const ing = document.querySelector("#templete .ing").cloneNode(true);
							statusBox.appendChild(ing);
							const lectureProgress = document.querySelector("#templete .lectureProgress").cloneNode(true);
							lectureProgress.querySelector(".lectureProgressButton").value = e.openLectureInfo.open_lecture_key;
							const information = document.querySelector("#templete .information").cloneNode(true);
							buttonBox.appendChild(lectureProgress);
							buttonBox.appendChild(information);
						}else{
							
							if(e.isComplete) {
								const complete = document.querySelector("#templete .complete").cloneNode(true);
								statusBox.appendChild(complete);
								const certificateOutput = document.querySelector("#templete .certificateOutput").cloneNode(true);
								const lectureProgress = document.querySelector("#templete .lectureProgress").cloneNode(true);
								lectureProgress.querySelector(".lectureProgressButton").value = e.openLectureInfo.open_lecture_key;
								const information = document.querySelector("#templete .information").cloneNode(true);
								buttonBox.appendChild(certificateOutput);
								buttonBox.appendChild(lectureProgress);
								buttonBox.appendChild(information);
							}else {
								const poor = document.querySelector("#templete .poor").cloneNode(true);
								statusBox.appendChild(poor);
								const lectureProgress = document.querySelector("#templete .lectureProgress").cloneNode(true);
								lectureProgress.querySelector(".lectureProgressButton").value = e.openLectureInfo.open_lecture_key;
								const information = document.querySelector("#templete .information").cloneNode(true);
								buttonBox.appendChild(lectureProgress);
								buttonBox.appendChild(information);
							}
							
						}
						
						lectureWrapper.querySelector(".category").innerText = e.categoryName;
						lectureWrapper.querySelector(".name").innerText = e.lectureInfo.name;
						lectureWrapper.querySelector(".lectureDate").innerText =
	        				openDate.getFullYear() + "." + ("0" + (openDate.getMonth() + 1)).slice(-2) + "." + ("0" + openDate.getDate()).slice(-2) + "~" +
	        				closeDate.getFullYear() + "." + ("0" + (closeDate.getMonth() + 1)).slice(-2) + "." + ("0" + closeDate.getDate()).slice(-2);
						lectureWrapper.querySelector(".totalHour").innerText = e.lectureInfo.total_hour + "시간";
						
						lectureBox.appendChild(lectureWrapper);
						
					}
					
				});
				
			}
			
			function reloadLectureProgress() {
				/* 이놈 */
				const url = "./getLectureProgressInfo?open_lecture_key=" + openLectureKey + "&lecture_student_key=" + lectureStudentKey;
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					const openDate = new Date(response.data.openLectureInfo.open_date);
					const closeDate = new Date(response.data.openLectureInfo.close_date);
					const sysdate = new Date();
					
					document.getElementById("progressName").innerText = response.data.lectureInfo.name;
					document.getElementById("progressLectureDate").innerText =
        				openDate.getFullYear() + "." + ("0" + (openDate.getMonth() + 1)).slice(-2) + "." + ("0" + openDate.getDate()).slice(-2) + "~" +
        				closeDate.getFullYear() + "." + ("0" + (closeDate.getMonth() + 1)).slice(-2) + "." + ("0" + closeDate.getDate()).slice(-2);
					document.getElementById("progressCredit").innerText = response.data.lectureInfo.credit;
					document.getElementById("studentTotalTestCount").innerText = response.data.studentTotalTestCount;
					document.getElementById("totalTestCount").innerText = response.data.totalTestCount;
					document.getElementById("attendanceRate").style.width = response.data.attendanceResult + "%";
					document.getElementById("attendanceRatePer").innerText = response.data.attendanceResult + "%";
					
					const progressStatusBox = document.getElementById("progressStatusBox");
					
					if(openDate > sysdate) {
						const progressWaite = document.querySelector("#progressTemplete .progressWaite").cloneNode(true);
						progressStatusBox.appendChild(progressWaite);
					}else if(openDate < sysdate && closeDate > sysdate) {
						const progressIng = document.querySelector("#progressTemplete .progressIng").cloneNode(true);
						progressStatusBox.appendChild(progressIng);
					}else  {
						
						if(response.data.isComplete) {
							const progressComplete = document.querySelector("#progressTemplete .progressComplete").cloneNode(true);
							progressStatusBox.appendChild(progressComplete);
						}else {
							const progressPoor = document.querySelector("#progressTemplete .progressPoor").cloneNode(true);
							progressStatusBox.appendChild(progressPoor);
						}
						
					}
					
					const attendanceResult = response.data.attendanceResult;
					const testResult = response.data.testResult;
					
					document.getElementById("attendanceScore").innerText = attendanceResult;
					document.getElementById("score").innerText = testResult;
					document.getElementById("calcAttendanceScore").innerText = (attendanceResult * 0.5).toFixed(1);
					document.getElementById("calcScore").innerText = (testResult * 0.5).toFixed(1);
					document.getElementById("totalLeftScore").innerText = ((attendanceResult * 0.5) + (testResult * 0.5)).toFixed(1);
					document.getElementById("attendanceCondition").innerText = response.data.lectureInfo.essential_attendance;
					document.getElementById("testCondition").innerText = response.data.lectureInfo.essential_grade;
					document.getElementById("totalScore").innerText = ((attendanceResult * 0.5) + (testResult * 0.5)).toFixed(1);
					
					const testBox = document.getElementById("testBox");
					
					let count = 1;
					
					for(e of response.data.testList) {
						
						const testWrapper = document.querySelector("#progress .testWrapper").cloneNode(true);
						
						let openTestDate = new Date(e.lectureTestInfo.open_test_day);
						let closeTestDate = new Date(e.lectureTestInfo.close_test_day);
						
						testWrapper.querySelector(".testNumber").innerText = count;
						testWrapper.querySelector(".testName").innerText = e.lectureTestInfo.test_name;
						testWrapper.querySelector(".testDate").innerText =
							openTestDate.getFullYear() + "." + ("0" + (openTestDate.getMonth() + 1)).slice(-2) + "." + ("0" + openTestDate.getDate()).slice(-2) + "~" +
							closeTestDate.getFullYear() + "." + ("0" + (closeTestDate.getMonth() + 1)).slice(-2) + "." + ("0" + closeTestDate.getDate()).slice(-2);
						testWrapper.querySelector(".testWhether").innerText = "X";
						testWrapper.querySelector(".testScore").innerText = e.testScore;
						
						const testButtonBox = testWrapper.querySelector(".testButtonBox");
						
						if(openTestDate > sysdate) {
							const testBeforeOpen = document.querySlector("#progressTemplete .testBeforeOpen").cloneNode(true);
							testButtonBox.appendChild(testBeforeOpen);
						}else if(openTestDate < sysdate && closeTestDate > sysdate) {
							
							if(e.isCompleteTest) {
								const testComplete = document.querySlector("#progressTemplete .testComplete").cloneNode(true);
								testButtonBox.appendChild(testComplete);
							}else {
								const testIng = document.querySlector("#progressTemplete .testIng").cloneNode(true);
								testIng.vlaue = e.lectureTestInfo.lecture_test_key;
								testButtonBox.appendChild(testIng);
							}
							
						}else  {
							
							if(e.isCompleteTest) {
								const testComplete = document.querySlector("#progressTemplete .testComplete").cloneNode(true);
								testButtonBox.appendChild(testComplete);
							}else {
								const testPoor = document.querySlector("#progressTemplete .testPoor").cloneNode(true);
								testButtonBox.appendChild(testPoor);
							}
							
						}
						
						testBox.appendChild(testWrapper);
						
					}
					
				});
				
			}
			
			function getLectureStudentKey() {
				/* 이놈 */
				const url = "./getLectureStudentKey?life_student_key=" + lifeStudentKey + "&open_lecture_key=" + openLectureKey;
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					lectureStudentKey = response.data;
					
					reloadLectureProgress();
					
				});
				
			}
			
			function reloadTest() {
				/* 이놈 */
				const url = "./getTestInfo?lecture_test_key=" + lectureTestKey;
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					document.getElementById("testProgressName").innerText = response.data.testName;
					
					const testProgressBox = document.getElementById("testProgressBox");
					
					for(e of response.data.questionList) {
						
						const testProgressWrapper = document.querySelector("#testTemplete .testProgressWrapper").cloneNode(true);
						
						let questionNumber = e.qeustionInfo.question_number;
						
						testProgressWrapper.querySelector(".testProgressQuestionNumber").innerText = questionNumber;
						testProgressWrapper.querySelector(".testProgressQuestion").innerText = e.qeustionInfo.question;
						
						const testProgressChoiceBox = testProgressWrapper.querySelector(".testProgressWrapper");
						
						let count = 1;
						
						for(ae of e.choiceList) {
							
							const testProgressChoiceWrapper = document.querySelector("#testTemplete .testProgressChoiceWrapper").cloneNode(true);
							
							const testProgressRadio = testProgressChoiceWrapper.querySelector(".testProgressRadio");
							const testProgressChoiceNumber = testProgressChoiceWrapper.querySelector(".testProgressChoiceNumber");
							const testProgressText = testProgressChoiceWrapper.querySelector(".testProgressText");
							
							testProgressRadio.value = ae.question_choice_key;
							testProgressRadio.setAttribute("id", "example" + questionNumber + "-" + count);
							testProgressRadio.setAttribute("name", "question" + questionNumber);
							
							testProgressChoiceNumber.innerText = count;
							testProgressChoiceNumber.setAttribute("for", "example" + questionNumber + "-" + count);
							
							testProgressText.innerText = ae.choice;
							testProgressText.setAttribute("for", "example" + questionNumber + "-" + count);
							
							testProgressChoiceBox.appendChild(testProgressChoiceWrapper);
							
						}
						
						testProgressBox.appendChild(testProgressWrapper);
						
						const testProgressChoiceRightBox = document.getElementById("testProgressChoiceRightBox");
						
						const testProgressChoiceRightWrapper = document.querySelector(".testProgressChoiceRightWrapper").cloneNode(true);
						
						testProgressChoiceRightWrapper.querySelector(".testProgressQuestionRightNumber").innerText = questionNumber;
						
						for(let i = 1 ; i <= 4 ; i++) {
							
							const testProgressRightRadio = testProgressChoiceRightWrapper.querySelector(".testProgressRightRadio" + i);
							const testProgressChoiceRightNumber = testProgressChoiceRightWrapper.querySelector(".testProgressChoiceRightNumber" + i);
							
							testProgressRightRadio.setAttribute("id", "exampleRight" + questionNumber + "-" + i);
							testProgressRightRadio.setAttribute("name", "questionRight" + questionNumber);
							
							testProgressChoiceRightNumber.setAttribute("for", "exampleRight" + questionNumber + "-" + i);
							
						}
						
						testProgressChoiceRightBox.appendChild(testProgressChoiceRightWrapper);
						
					}
					
				});
				
			}
			
			function checkSideRadio(target) {
				/* 이놈 */
				const radio = target.closest(".testProgressChoiceWrapper").querySelector(".testProgressRadio");
				const common = radio.id.slice(7);
				
				if(radio.checked == true) {
					document.getElementById("exampleRight" + common).checked = true;
				}else {
					document.getElementById("exampleRight" + common).checked = false;
				}
				
			}
			
			function checkRadio(target) {
				/* 이놈 */
				const common = target.id.slice(12);
				
				if(target.checked == true) {
					document.getElementById("example" + common).checked = true;
				}else {
					document.getElementById("example" + common).checked = false;
				}
				
			}
			
			function addResult() {
				/* 이놈 */
				const testProgressRadio = document.getElementsByClassName("testProgressRadio");
				const results = [];
				
				for(let i = 0 ; i < testProgressRadio.length ; i++) {
					if(testProgressRadio[i].checked == true) {
						
						results.push(Number(testProgressRadio[i].value));
						
					}	
				}
				resetLectureProgressModal();
				saveResult(results);	
			}
			
			function saveResult(results) {
				/* 이놈 */
				const url = "./insertTestResult?results=" + results + "&lecture_student_key=" + lectureStudentKey + "&lecture_test_key=" + lectureTestKey;
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					reloadLectureProgress();
					
				});
				
			}
			
            function showLectureProgressModal(target) {
            	/* 이놈 */
            	openLectureKey = Number(target.value);
            	
            	resetLectureProgressModal();
            	getLectureStudentKey();
            	
                const modal = bootstrap.Modal.getOrCreateInstance("#lectureProgressModal");
                modal.show();
            }
            
            function showTestModal() {
            	/* 이놈 */
            	resetTestModal();
            	reloadTest();
            	
                const modal = bootstrap.Modal.getOrCreateInstance("#testModal");
                const warnModal = bootstrap.Modal.getOrCreateInstance("#testWarningModal");
                warnModal.hide();
                modal.show();
            }
            
            function showTestWarningModal(target) {
            	/*  이놈 */
            	lectureTestKey = Number(target.value);
            	
                const modal = bootstrap.Modal.getOrCreateInstance("#testWarningModal");
                modal.show();
            }

            function showSubmitWarningModal() {
            	/* 이놈 */
                const modal = bootstrap.Modal.getOrCreateInstance("#submitWarningModal");
                modal.show();
            }
            
            function hideSubmitWarningModal() {
            	/* 이놈 */
                const modal = bootstrap.Modal.getOrCreateInstance("#submitWarningModal");
                const testModal = bootstrap.Modal.getOrCreateInstance("#testModal");
                addResult();
                modal.hide();
                testModal.hide();
            }
            
            function resetLectureProgressModal() {
            	/* 이놈 */
            	document.getElementById("progressName").innerText = "";
            	document.getElementById("progressLectureDate").innerText = "";
            	document.getElementById("progressCredit").innerText = "";
            	document.getElementById("studentTotalTestCount").innerText = "";
            	document.getElementById("totalTestCount").innerText = "";
            	document.getElementById("attendanceRatePer").innerText = "";
            	document.getElementById("totalLeftScore").innerText = "";
            	document.getElementById("progressStatusBox").innerHTML = "";
            	document.getElementById("attendanceScore").innerText = "";
            	document.getElementById("score").innerText = "";
            	document.getElementById("calcAttendanceScore").innerText = "";
            	document.getElementById("calcScore").innerText = "";
            	document.getElementById("attendanceCondition").innerText = "";
            	document.getElementById("testCondition").innerText = "";
            	document.getElementById("totalScore").innerText = "";
            	document.getElementById("testBox").innerHTML = "";
            	
            }
            
            function resetTestModal() {
            	/* 이놈 */
            	document.getElementById("testProgressName").innerText = "";
            	document.getElementById("testProgressBox").innerHTML = "";
            	document.getElementById("testProgressChoiceBox").innerHTML = "";
            	document.getElementById("testProgressChoiceRightBox").innerHTML = "";
            	
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
	    		getLifeStudentKey();
	    		
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
                                                            총 <span id="totalCount" class="fw-semibold">155</span> 건
                                                        </div>
                                                        <div class="col">
                                                            <div class="row row-cols-auto justify-content-end">
                                                                <div class="col">
                                                                    <select onclick="search()" id="searchType" class="form-select rounded-0 border-0" style="font-size: 0.9em;" >
                                                                        <option value="0">학습 전체</option>
                                                                        <option value="1">학습중</option>
                                                                        <option value="2">학습 대기</option>
                                                                        <option value="3">학습 완료</option>
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
                                                <div id="lectureBox" class="col">
                                                    
                                                </div>
                                            </div>
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
                    <jsp:include page="./bottom.jsp"></jsp:include>
                </div>
            </div>
        </div>
        
        <div id="templete" class="d-none">
        
        	<div class="lectureWrapper row mt-3">
	            <div class="col py-4 rounded border">
	                <div class="row">
	                    <div class="col px-4">
	                        <div class="row">
	                            <div class="col">
	                                <span class="text-body-tertiary border-secondary-subtle ps-2 pe-1 py-1 fw-bold" style="border: solid; border-width: 0.01em; font-size: 0.85em;">
	                                    &#91;<span class="round">123</span>&#93;<span style="font-size: 0.9em;">차</span>
	                                </span>
	                                <span class="ms-2 px-2 py-1 fw-bold" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #f7a505;">
	                                    오프라인
	                                </span>
	                            </div>
	                            <div class="statusBox col text-end">
	                                
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
	                    <div class="buttonBox col-3 my-auto">
	                        <div class="certificateOutput row">
	                            <div class="col d-grid justify-content-center">
	                                <button class="btn fw-bold px-5 py-2" style="font-size: 0.9em; color: #7844ae; border: solid; border-color: #7844ae; border-width: 0.01em; width: 13.5em;">수료증 출력</button>
	                            </div>
	                        </div>
	                        <div class="lectureProgress row mt-2">
	                            <div class="col d-grid justify-content-center">
	                                <button onclick="showLectureProgressModal(this)" class="lectureProgressButton btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #7844ae; width: 13.5em;">과정 살펴보기</button>
	                            </div>
	                        </div>
	                        <div class="information row mt-2">
	                            <div class="col d-grid justify-content-center">
	                                <button class="btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #f7a505; width: 13.5em;">안내서 <i class="fa-solid fa-download"></i></button>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        
	        <div class="noApplyLectureWrapper row mt-2">
	       		<div class="col rounded border" style="height: 20em">
	       			<div class="row align-items-center" style="height: 20em">
	       				<div class="col">
	       					<div class="row">
	                            <div class="col text-center">
	                                <i class="bi bi-chat-dots-fill" style="color: #EEEEEE; font-size: 2.5em;"></i>
	                            </div>
	                        </div>
	                        <div class="row mt-2">
	                            <div class="col text-center" style="font-size: 0.9em;">
	                            	강의가 없습니다
	                            </div>
	                        </div>
	       				</div>
	       			</div>
	       		</div>
	       	</div>
	        
	        <span class="complete ms-2 px-3 py-1 fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #4CAF50; background-color: #F1F9F1;">
	        	수료
	        </span>
        
        	<span class="poor ms-2 px-3 py-1 fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #FA4D5A; background-color: #FAF1F4;">
            	미수료
            </span>
        	
        	<span class="ing ms-2 px-3 py-1 fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #7844ae; background-color: #F3ECFF;">
            	학습중
            </span>
        	
        	<span class="wait ms-2 px-3 py-1 fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #FF9100; background-color: #FFFAEB;">
            	학습대기
            </span>
        	
        	<a onclick="movePage(this)" class="pageNumberLink page-link border-0 text-black px-4" href="#" style="font-size: 1.1em;">1</a>
        	
        </div>

        <jsp:include page="./lectureProgressModal.jsp"></jsp:include>

        <jsp:include page="./testModal.jsp"></jsp:include>
        
        <jsp:include page="./testWarningModal.jsp"></jsp:include>

        <jsp:include page="./submitWarningModal.jsp"></jsp:include>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>