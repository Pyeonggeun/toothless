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
			
			const testWrapper = document.querySelector("#progressTemplete .testWrapper").cloneNode(true);
			
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
				const testBeforeOpen = document.querySelector("#progressTemplete .testBeforeOpen").cloneNode(true);
				testButtonBox.appendChild(testBeforeOpen);
			}else if(openTestDate < sysdate && closeTestDate > sysdate) {
				if(e.isCompleteTest) {
					const testComplete = document.querySelector("#progressTemplete .testComplete").cloneNode(true);
					testWrapper.querySelector(".testWhether").innerText = "O";
					testWrapper.querySelector(".testScore").style.color = '#f7a505';
					testButtonBox.appendChild(testComplete);
				}else {
					const testIng = document.querySelector("#progressTemplete .testIng").cloneNode(true);
					testIng.value = e.lectureTestInfo.lecture_test_key;
					testButtonBox.appendChild(testIng);
				}
				
			}else  {
				
				if(e.isCompleteTest) {
					const testComplete = document.querySelector("#progressTemplete .testComplete").cloneNode(true);
					testButtonBox.appendChild(testComplete);
				}else {
					const testPoor = document.querySelector("#progressTemplete .testPoor").cloneNode(true);
					testButtonBox.appendChild(testPoor);
				}
				
			}
			
			testBox.appendChild(testWrapper);
			count++;
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
			
			const testProgressChoiceBox = testProgressWrapper.querySelector(".testProgressChoiceBox");
			
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
				count++;
				
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
	
	bootstrap.Tab.getOrCreateInstance("#pills-home-tab").show();
    const modal = bootstrap.Modal.getOrCreateInstance("#lectureProgressModal");
    modal.show();
}

function showTestModal() {
	/* 이놈 */
	reloadTest();
	
    const modal = bootstrap.Modal.getOrCreateInstance("#testModal");
    const warnModal = bootstrap.Modal.getOrCreateInstance("#testWarningModal");
    warnModal.hide();
    modal.show();
}

function showTestWarningModal(target) {
	/*  이놈 */
	lectureTestKey = Number(target.value);
	resetTestModal();
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
	document.getElementById("testProgressChoiceRightBox").innerHTML = "";
	
}