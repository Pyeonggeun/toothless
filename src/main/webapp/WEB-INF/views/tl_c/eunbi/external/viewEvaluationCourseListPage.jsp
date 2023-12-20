<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title> AJDKS TEMPLATE FOR COMPANY </title>
<style>
	/*산업체좌측메뉴바설정*/
	.companyleftmenubar input {
	    display: none;
	}
	
	.companyleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #22212E;
	    transition: ease .1s;
	}
	
	.companyleftmenubar label:hover {
	    background: #22212E;
	    opacity: 50%;
	}
	
	.companyleftmenubar .content {
	    background: #1C1C26;
   	    transition: ease .5s;    
	}
	
	.companyleftmenubar input + label + .content {
	    display: none;
	}
	
	.companyleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

</style>

<script>
	
	let companyPk = ${companyPk}
	
	function loadNullAlert(){
		
		const itemBox = document.getElementById("itemBox");
		const ifNull = document.getElementById("ifNull");
		
		ifNull.classList.remove("d-none");
		itemBox.classList.add("d-none");
	}
	
	function reloadNeedEvaluationCourseInfo(){
		
		fetch("./getNeedEvaluationCourseList?company_pk=" + companyPk)
		.then(response => response.json())
		.then(response => {
			
			if(response.data === false){
				loadNullAlert();
			}else{
				
				const internshipCourseListBox = document.getElementById("internshipCourseListBox");
				internshipCourseListBox.innerHTML = "";
				
				for(course of response.data){
					
					const internshipCourseWrapper = document.querySelector("#internshipCourseTemplete .internshipCourseWrapper").cloneNode(true);
					
					const courseTitle = internshipCourseWrapper.querySelector(".courseTitle");
					const countIntern = internshipCourseWrapper.querySelector(".countIntern");
					const coursePeroid = internshipCourseWrapper.querySelector(".coursePeroid");
					const showCourseInfoButton = internshipCourseWrapper.querySelector(".showCourseInfoButton");
					
					let startDate = new Date(course.internshipCourseDto.internship_start_date);
					startDate = startDate.getFullYear() + "." + (startDate.getMonth()+1) + "." + startDate.getDate();
					let endDate = new Date(course.internshipCourseDto.internship_end_date);
					endDate = endDate.getFullYear() + "." + (endDate.getMonth()+1) + "." + endDate.getDate();
					
					courseTitle.innerText = course.internshipCourseDto.course_title;
					countIntern.innerText = course.countInternBycoursePk;
					coursePeroid.innerText = startDate + " - " + endDate;
					
					showCourseInfoButton.setAttribute("data-value", course.internshipCourseDto.internship_course_pk);
					
					if(course.countDidCompanyEvaluate < course.countInternBycoursePk){
						internshipCourseListBox.appendChild(internshipCourseWrapper);
					}
				}
				
			}
			
			
		});
	}
	
	function showCourseInfo(internshipCoursePk){
		
		toggleCourseInfoButton(internshipCoursePk);
		
		reloadCourseInfo(internshipCoursePk);
		
	}
	
	function toggleCourseInfoButton(internshipCoursePk){
		
		const detailBox = document.getElementById("detailBox");
		detailBox.classList.toggle("d-none");
		
	}
	
	function changeActive(internshipCoursePk){
		
		const targetValue = internshipCoursePk;
		console.log(targetValue);
		
		const showCourseInfoButton = document.querySelector(".showCourseInfoButton");
		const getValue = showCourseInfoButton.dataset.value;
		
		if(targetValue === getValue){
			showCourseInfoButton.classList.add("active");
		}
	}
	
	function reloadCourseInfo(internshipCoursePk){	
		
		fetch("./getInternshipCourseInfo?internship_course_pk=" + internshipCoursePk)
		.then(response => response.json())
		.then(response => {
		
			const info = response.data;
			
			const internshipCourseTitle = document.querySelector(".internshipCourseTitle");
			const professorName = document.querySelector(".professorName");
			const totalMember = document.querySelector(".totalMember");
			const recruitmentDepartment = document.querySelector(".recruitmentDepartment");
			const semesterQualification = document.querySelector(".semesterQualification");
			const applicationPeriod = document.querySelector(".applicationPeriod");
			const announcementDate = document.querySelector(".announcementDate");
			const internshipPeriod = document.querySelector(".internshipPeriod");
			
			let applyingStartDate = new Date(info.internshipCourseDto.applying_start_date);
			let applyingEndDate = new Date(info.internshipCourseDto.applying_end_date);
			applyingStartDate = applyingStartDate.getFullYear() + "." + (applyingStartDate.getMonth()+1) + "." + applyingStartDate.getDate();
			applyingEndDate = applyingEndDate.getFullYear() + "." + (applyingEndDate.getMonth()+1) + "." + applyingEndDate.getDate();
			
			const announcement_date = new Date(info.internshipCourseDto.announcement_date);
			
			let internshipStartDate = new Date(info.internshipCourseDto.internship_start_date);
			let internshipEndDate = new Date(info.internshipCourseDto.internship_end_date);
			internshipStartDate = internshipStartDate.getFullYear() + "." + (internshipStartDate.getMonth()+1) + "." + internshipStartDate.getDate();
			internshipEndDate = internshipEndDate.getFullYear() + "." + (internshipEndDate.getMonth()+1) + "." + internshipEndDate.getDate();
			
			internshipCourseTitle.innerText = info.internshipCourseDto.course_title;
			professorName.innerText = info.professorDto.name;
			totalMember.innerText = info.countIntern + "/" + info.internshipCourseDto.internship_total_member + "명";
			recruitmentDepartment.innerText = info.departmentDto.name;
			semesterQualification.innerText = info.internshipCourseDto.semester_qualification + "학기 이상";
			applicationPeriod.innerText = applyingStartDate + " - " + applyingEndDate;
			announcementDate.innerText = announcement_date.getFullYear() + "." + (announcement_date.getMonth()+1) + "." + announcement_date.getDate();
			internshipPeriod.innerText = internshipStartDate + " - " + internshipEndDate;
			
		});
		
		reloadInternList(internshipCoursePk);
	}
	
	function reloadInternList(internshipCoursePk){
		
		fetch("./getStudentInternList?internship_course_pk=" + internshipCoursePk)
		.then(response => response.json())
		.then(response => {
			
			const internListBox = document.getElementById("internListBox");
			internListBox.innerHTML = "";
			
			for(intern of response.data) {
				
				let internshipEndDate = new Date(intern.internshipCourseDto.internship_end_date);
			
				internshipEndDateYear = internshipEndDate.getFullYear();
				internshipEndDateMonth = internshipEndDate.getMonth();
				internshipEndDateDate = internshipEndDate.getDate();
				internshipEndDateHour = internshipEndDate.getHours();
				internshipEndDateMinute= internshipEndDate.getMinutes();
				internshipEndDateSeconds = internshipEndDate.getSeconds();
				
				internshipEndDate = internshipEndDate.getTime();
				
				const internWrapper = document.querySelector("#internListTemplete .internWrapper").cloneNode(true);
				
				const internStudentPk = internWrapper.querySelector(".internStudentPk");
				internStudentPk.innerText = intern.studentInfoDto.student_pk;
				
				const internName = internWrapper.querySelector(".internName");
				internName.innerText = intern.studentInfoDto.name;
				
				const internDepartment = internWrapper.querySelector(".internDepartment");
				internDepartment.innerText = intern.studentDepartment.name;
				
				const internProfessor = internWrapper.querySelector(".internProfessor");
				internProfessor.innerText = intern.studentProfessorInfo.name;
				
				const internAttendance = internWrapper.querySelector(".internAttendance");
				internAttendance.innerText = "출석" + intern.countAttendance +" "+ "지각" + intern.countLate +" "+ "조퇴" + intern.countEarlyleave +" "+ "결근" + intern.countAbsent;
				
				const studentDetailPageBtn = internWrapper.querySelector(".studentDetailPageBtn");
				studentDetailPageBtn.innerText = "상세보기";
				studentDetailPageBtn.classList.add("btn", "btn-outline-secondary", "btn-sm", "rounded-1");
				studentDetailPageBtn.setAttribute("href", "./viewStudentDetailPage?student_pk="+intern.studentInfoDto.student_pk+"");
				
				const readInternReport = internWrapper.querySelector(".readInternReport");
				readInternReport.innerText = "업무일지확인";
				readInternReport.classList.add("btn", "btn-outline-secondary", "btn-sm", "rounded-1");
				readInternReport.setAttribute("href", "./viewInternTimeCard?student_intern_pk="+intern.studentInternDto.student_intern_pk+"");
				
				if(intern.didCompanyEvaluateIntern === 0){
					const evaluationButton = internWrapper.querySelector(".evaluationButton");
					evaluationButton.innerText = "평가하기";
					evaluationButton.classList.add("btn", "btn-secondary", "btn-sm", "rounded-1", "open-Modal");
					
					evaluationButton.setAttribute("onclick", "openModal()");
					
					const inputStudentInternPk = document.getElementById("inputStudentInternPk");
					inputStudentInternPk.setAttribute("value",intern.studentInternDto.student_intern_pk);
					
				}else if(intern.didCompanyEvaluateIntern !== 0){
					const internEvaluation = internWrapper.querySelector(".internEvaluation");
					internEvaluation.setAttribute("style", "font-size:0.95em");
					internEvaluation.classList.add("text-secondary", "fw-bold");
					internEvaluation.innerText = "평가완료";
				}

				internListBox.appendChild(internWrapper);
			}
			
		});
	}
	
	function writeInternEvaluation(){
		
		const diligence_score = document.querySelector('input[name="diligence_score"]:checked');
		const responsibility_score = document.querySelector('input[name="responsibility_score"]:checked');
		const coorporation_score = document.querySelector('input[name="coorporation_score"]:checked');
		const achievement_score = document.querySelector('input[name="achievement_score"]:checked');
		const inputReview = document.getElementById("inputReview");
		const inputStudentInternPk = document.getElementById("inputStudentInternPk");
		
		if (!diligence_score || !responsibility_score || !coorporation_score || !achievement_score ||
		        inputReview.value.trim() === '' ||
		        inputStudentInternPk.value.trim() === '') {
				alert('모든 항목에 평가를 완료해주세요');
		        return;
		    }

		fetch("./writeInternEvaluation", {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: "&diligence_score=" + diligence_score.value +
					"&responsibility_score=" + responsibility_score.value +
					"&coorporation_score=" + coorporation_score.value +
					"&achievement_score=" + achievement_score.value +
					"&review=" + inputReview.value + 
					"&student_intern_pk=" + inputStudentInternPk.value
		})
		.then(response => response.json())
		.then(response => {
			
			diligence_score.value = "";
			responsibility_score.value = "";
			coorporation_score.value = "";
			achievement_score.value = "";
			inputReview.value = "";
			
			const internListBox = document.getElementById("internListBox");
			internListBox.innerHTML = "";
			reloadInternList();
			
			closeModal();
			
		});
	}
	
	function openModal() {
    	
    	const modal = bootstrap.Modal.getOrCreateInstance("#internEvaluationModal");
    	
    	modal.show();
	}
	
    function closeModal() {
    	
    	const modal = bootstrap.Modal.getOrCreateInstance("#internEvaluationModal");
    	
        modal.hide();
	}
	
	
	


	window.addEventListener("DOMContentLoaded", () => {
		reloadNeedEvaluationCourseInfo();
	});


</script>


</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<div class="row">

	<!-- 좌측메뉴바 : col-2 -->
	<jsp:include page="../../common/ajdksTemplateForCompany.jsp"></jsp:include>
	
	<!-- 메인화면 -->
	<div class="col">
		<!-- 안내문구 -->
		<div class="row py-2" style="box-shadow: 2px 2px 2px gray; font-size: 0.9em;">
			<div class="col ps-2">
				<span>&#035;&nbsp;ㅇㅇㅇ 님 환영합니다</span>
			</div>	
			<div class="col pe-2 text-end nolinenoblue">
				<a href="./ajdksCompanyLogoutProcess">로그아웃</a>
			</div>	
		</div>
		
		<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
		<div class="row">
			<div class="col mx-5">
				
				<div id="ifNull" class="row mt-5 d-none">
					<div class="col">
						<div class="row">
							<div class="col fw-semibold mt-2" style="font-size:1.3em">
								<span class="text-secondary fs-3">&gt;</span>
								최종평가 입력
							</div>
						</div>
						<div class="row mt-2 px-4">
							<div class="col mt-2 bg-body-secondary py-5 px-5">
								<i class="bi bi-exclamation-triangle"></i> 평가할 수 있는 실습과정이 존재하지 않습니다.
							</div>
						</div>
					</div>
				</div>
			
				<div id="itemBox" class="row">
					<div class="col">
						<div class="row mt-4">
							<div class="col fw-semibold mt-2" style="font-size:1.3em">
								<span class="text-secondary fs-3">&gt;</span>
								최종평가 입력
							</div>
						</div>
					
						<div id="internshipCourseListBox" class="row row-cols-4 mt-2">
							
						</div>
						
						<!-- 현장실습 정보/학생 -->
						
						<div id="detailBox" class="row mt-4 d-none">
							<div class="col px-3">
								<div class="row">
									<div class="col border border-start-0 border-end-0 border-dark-subtle px-3 py-3">
									
										<div class="row mt-2 px-3">
											<div class="col">
												<div class="row">
													<div class="col fw-semibold" style="font-size:1.1em">
														현장실습 상세정보
													</div>
												</div>
												<div class="row mt-2">
													<div class="col border border-start-0 border-end-0 border-secondary" style="font-size:0.95em">
														<div class="row border-bottom py-2">
															<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
																현장실습명
															</div>
															<div class="internshipCourseTitle col border-start ps-4 fw-semibold">
																
															</div>
														</div>
														<div class="row border-bottom py-2">
															<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
																담당 교수명
															</div>
															<div class="professorName col border-start ps-4 border-end">
																
															</div>
															<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
																실습인원
															</div>
															<div class="totalMember col border-start ps-4">
																
															</div>
														</div>
														<div class="row border-bottom py-2">
															<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
																모집학과
															</div>
															<div class="recruitmentDepartment col border-start ps-4 border-end">
																
															</div>
															<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
																자격학기
															</div>
															<div class="semesterQualification col border-start ps-4">
																
															</div>
														</div>
														<div class="row border-bottom py-2">
															<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
																모집기간
															</div>
															<div class="applicationPeriod col border-start ps-4 border-end">
																
															</div>
															<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
																결과발표일
															</div>
															<div class="announcementDate col border-start ps-4">
																
															</div>
														</div>
														<div class="row py-2">
															<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
																실습기간
															</div>
															<div class="internshipPeriod col border-start ps-4">
																
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row mt-2 mb-4 px-3">
											<div class="col">
												<div class="row mt-4">
													<div class="col fw-semibold" style="font-size:1.1em">
														인턴목록
													</div>
												</div>

												<div id="studentInternForm">
												<div class="row mt-2" style="height:15em">
													<div class="col border-secondary border-top border-bottom overflow-y-scroll">
														<div class="row text-center border-bottom border-secondary py-1 fw-semibold" style="background-color:#e4e4eb">
															<div class="col-1 border-end">
																학번
															</div>
															<div class="col-2 border-end">
																이름
															</div>
															<div class="col-1 border-end">
																학과
															</div>
															<div class="col-1 border-end">
																담당교수
															</div>
															<div class="col-1 border-end">
																학생정보
															</div>
															<div class="col-2 border-end">
																출결
															</div>
															<div class="col-2 border-end">
																업무일지
															</div>
															<div class="col-2">
																성적산출
															</div>
														</div>
														<div class="row">
															<div id="internListBox" class="col">
																<div class="col">
																	
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
	</div>
	
</div>



	<!-- 현장실습과정 리스트 -->
	<div id="internshipCourseTemplete" class="d-none">
		<div class="internshipCourseWrapper col px-4 pt-3">
			<div class="row">
				<div class="borderStyle col border px-1 py-1 d-grid">
					<div id="getInternPk" onclick="showCourseInfo(this.getAttribute('data-value'))" class="showCourseInfoButton btn btn-light rounded-0 border py-3">
						<div class="row">
							<div class="courseTitle col fw-semibold">
							</div>
						</div>
						<div class="row mt-2" style="font-size:0.9em">
							<div class="col">
								실습인원 : <span class="countIntern fw-semibold"></span>
							</div>
						</div>
						<div class="row mt-1">
							<div class="coursePeroid col text-secondary fw-semibold" style="font-size:0.85em">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 실습생 리스트 -->
	<div id="internListTemplete" class="d-none">
		<div class="internWrapper row text-center py-1 border-bottom" style="font-size:0.95em">
			<div class="internStudentPk col-1 align-self-center fw-semibold border-end">
			</div>
			<div class="internName col-2 align-self-center fw-semibold border-end">
			</div>
			<div class="internDepartment col-1 align-self-center border-end">
			</div>
			<div class="internProfessor col-1 align-self-center border-end">
			</div>
			<div class="col-1 align-self-center border-end d-grid px-3">
				<a class="studentDetailPageBtn"></a>
			</div>
			<div class="internAttendance col-2 align-self-center border-end" style="font-size:0.95em">
			</div>
			<div class="col-2 align-self-center d-grid px-4 border-end">
				<a class="readInternReport"></a>
			</div>
			<div class="internEvaluation col-2 align-self-center d-grid px-4">
				<span class="evaluationButton"></span>
			</div>
		</div>
	</div>

	
	<!-- 모달 -->
	<div id="internEvaluationModal" class="modal">
		<div class="modal-dialog">
			<div class="modal-content px-3 rounded-0">
				<div class="modal-header mt-1">
					<h5 class="modal-title fw-semibold">실습생 평가</h5>
					<span onclick="closeModal()" class="close text-secondary fs-4" id="close-modal"><i class="bi bi-x-lg"></i></span>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col">
							<div class="row">
								<div class="col fw-semibold">
									성실성 평가
								</div>
							</div>
							<div class="row mt-2">
								<div class="col">
									<input class="form-check-input me-1" type="radio" name="diligence_score" value="5"> 매우높음
									<input class="form-check-input me-1 ms-2" type="radio" name="diligence_score" value="4"> 높음
									<input class="form-check-input me-1 ms-2" type="radio" name="diligence_score" value="3"> 보통
									<input class="form-check-input me-1 ms-2" type="radio" name="diligence_score" value="2"> 낮음
									<input class="form-check-input ms-2" type="radio" name="diligence_score" value="1"> 매우낮음
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="row mt-4">
								<div class="col fw-semibold">
									책임감 평가
								</div>
							</div>
							<div class="row mt-2">
								<div class="col">
									<input class="form-check-input me-1" type="radio" name="responsibility_score" value="5"> 매우높음
									<input class="form-check-input me-1 ms-2" type="radio" name="responsibility_score" value="4"> 높음
									<input class="form-check-input me-1 ms-2" type="radio" name="responsibility_score" value="3"> 보통
									<input class="form-check-input me-1 ms-2" type="radio" name="responsibility_score" value="2"> 낮음
									<input class="form-check-input ms-2" type="radio" name="responsibility_score" value="1"> 매우낮음
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="row mt-4">
								<div class="col fw-semibold">
									협조성 평가
								</div>
							</div>
							<div class="row mt-2">
								<div class="col">
									<input class="form-check-input me-1" type="radio" name="coorporation_score" value="5"> 매우높음
									<input class="form-check-input me-1 ms-2" type="radio" name="coorporation_score" value="4"> 높음
									<input class="form-check-input me-1 ms-2" type="radio" name="coorporation_score" value="3"> 보통
									<input class="form-check-input me-1 ms-2" type="radio" name="coorporation_score" value="2"> 낮음
									<input class="form-check-input ms-2" type="radio" name="coorporation_score" value="1"> 매우낮음
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="row mt-4">
								<div class="col fw-semibold">
									업무달성도
								</div>
							</div>
							<div class="row mt-2">
								<div class="col">
									<input class="form-check-input me-1" type="radio" name="achievement_score" value="5"> 매우높음
									<input class="form-check-input me-1 ms-2" type="radio" name="achievement_score" value="4"> 높음
									<input class="form-check-input me-1 ms-2" type="radio" name="achievement_score" value="3"> 보통
									<input class="form-check-input me-1 ms-2" type="radio" name="achievement_score" value="2"> 낮음
									<input class="form-check-input ms-2" type="radio" name="achievement_score" value="1"> 매우낮음 
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="row mt-4">
								<div class="col fw-semibold">
									총평가
								</div>
							</div>
							<div class="row">
								<div class="col mt-2">
									<textarea id="inputReview" rows="5" class="form-control rounded-0"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer border-0 mb-3">
					<input type="hidden" id="inputStudentInternPk">
					<button id="submitButton" onclick="writeInternEvaluation()" class="closeModal btn btn-secondary rounded-0">제출</button>
				</div>
			</div>
		</div>
	</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>