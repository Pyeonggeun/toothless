<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title> AJDKS TEMPLATE FOR PROFESSOR </title>

<style>
	/*교수좌측메뉴바설정*/
	.professorleftmenubar input {
	    display: none;
	}
	
	.professorleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.professorleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.professorleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.professorleftmenubar input + label + .content {
	    display: none;
	}
	
	.professorleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

</style>

<script>

	let professorPk = null;
	let internship_course_pk = ${internship_course_pk}
	
	function getProfessorPk(){
		fetch("./getProfessorPk")
		.then(response => response.json())
		.then(response => {
			const professorPk = response.data;
		});
	}
	
	function reloadInternshipCourseInfo(){
		
		const internshipCourseTitle = document.querySelector(".internshipCourseTitle");
		const companyName = document.querySelector(".companyName");
		const totalMember = document.querySelector(".totalMember");
		const recruitmentDepartment = document.querySelector(".recruitmentDepartment");
		const semesterQualification = document.querySelector(".semesterQualification");
		const applicationPeriod = document.querySelector(".applicationPeriod");
		const announcementDate = document.querySelector(".announcementDate");
		const internshipPeriod = document.querySelector(".internshipPeriod");
		
		fetch("./getInternshipCourseInfo?internship_course_pk=" + internship_course_pk)
		.then(response => response.json())
		.then(response => {
			
			const info = response.data;
			
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
			companyName.innerText = info.companyInfoDto.company_name;
			totalMember.innerText = info.internshipCourseDto.internship_total_member;
			recruitmentDepartment.innerText = info.departmentDto.name;
			semesterQualification.innerText = info.internshipCourseDto.semester_qualification;
			applicationPeriod.innerText = applyingStartDate + " - " + applyingEndDate;
			announcementDate.innerText = announcement_date.getFullYear() + "." + (announcement_date.getMonth()+1) + "." + announcement_date.getDate();
			internshipPeriod.innerText = internshipStartDate + " - " + internshipEndDate;
			
		});
	}
	
	function reloadApplyStudentList(){
		
		fetch("./getApplyingStudentListByCourse?internship_course_pk=" + internship_course_pk)
		.then(response => response.json())
		.then(response => {
			
			const applyingStudentListBox = document.getElementById("applyingStudentListBox");
			applyingStudentListBox.innerHTML = "";
			
			for(applyingStudent of response.data) {
				
				const applyingStudentWrapper = document.querySelector("#applyingStudentListTemplete .applyingStudentWrapper").cloneNode(true);
				
				const applyingStudentPk = applyingStudentWrapper.querySelector(".applyingStudentPk");
				applyingStudentPk.innerText = applyingStudent.studentInfoDto.student_pk;
				
				const applyingStudentName = applyingStudentWrapper.querySelector(".applyingStudentName");
				applyingStudentName.innerText = applyingStudent.studentInfoDto.name;
				
				const applyingStudentDepartment = applyingStudentWrapper.querySelector(".applyingStudentDepartment");
				applyingStudentDepartment.innerText = applyingStudent.studentDepartment.name;
				
				const applyingStudentProfessor = applyingStudentWrapper.querySelector(".applyingStudentProfessor");
				applyingStudentProfessor.innerText = applyingStudent.studentProfessorInfo.name;
				
				const applyingStudentSemester = applyingStudentWrapper.querySelector(".applyingStudentSemester");
				applyingStudentSemester.innerText = applyingStudent.countSemester;
				
				const applyingStudentStatus = applyingStudentWrapper.querySelector(".applyingStudentStatus");
				applyingStudentStatus.innerText = applyingStudent.studentApplyingDto.status;
				
				const studentDetailPageBtn = applyingStudentWrapper.querySelector(".studentDetailPageBtn");
				studentDetailPageBtn.innerText = "상세보기";
				studentDetailPageBtn.classList.add("btn", "btn-secondary", "btn-sm", "rounded-1");
				studentDetailPageBtn.setAttribute("href", "./viewStudentDetailPage?student_pk="+applyingStudent.studentInfoDto.student_pk+"");
				
				const applyingStudentCreatedAt = applyingStudentWrapper.querySelector(".applyingStudentCreatedAt");
				const date = new Date(applyingStudent.studentApplyingDto.created_at);
				applyingStudentCreatedAt.innerText = date.getFullYear() + "." + (date.getMonth()+1) + "." + date.getDate();

				applyingStudentListBox.appendChild(applyingStudentWrapper);
			}
			
			
		});
	}
	
	function reloadInternList(){
		
		fetch("./getStudentInternList?internship_course_pk=" + internship_course_pk)
		.then(response => response.json())
		.then(response => {
			
			const internListBox = document.getElementById("internListBox");
			internListBox.innerHTML = "";
			
			let now = new Date();
			nowYear = now.getFullYear();
			nowMonth = now.getMonth();
			nowDate = now.getDate();
			nowHour = now.getHours();
			nowMinute = now.getMinutes();
			nowSeconds = now.getSeconds();
			
			now = now.getTime();
			
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
				readInternReport.setAttribute("href", "./viewInternReport?student_intern_pk="+intern.studentInternDto.student_intern_pk+"");
				
				console.log(now);
				console.log(internshipEndDate);
				
				if(now <= internshipEndDate){
					const internEvaluation = internWrapper.querySelector(".internEvaluation");
					internEvaluation.setAttribute("style", "font-size:0.95em");
					internEvaluation.classList.add("text-secondary", "fw-bold");
					internEvaluation.innerText = "평가입력기간이 아닙니다";
					
				}else if(now > internshipEndDate){
					console.log(intern.didEvaluateIntern);
					if(intern.didEvaluateIntern === 0){
						const evaluationButton = internWrapper.querySelector(".evaluationButton");
						evaluationButton.innerText = "평가하기";
						evaluationButton.classList.add("btn", "btn-secondary", "btn-sm", "rounded-1", "open-Modal");
						
						evaluationButton.setAttribute("onclick", "openModal()");
						
					}else if(intern.didEvaluateIntern !== 0){
						const internEvaluation = internWrapper.querySelector(".internEvaluation");
						internEvaluation.setAttribute("style", "font-size:0.95em");
						internEvaluation.classList.add("text-secondary", "fw-bold");
						internEvaluation.innerText = "평가완료";
					}
				}
				
				internListBox.appendChild(internWrapper);
				
			}
			
			
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
	
	function writeInternEvaluation(){
		
		const diligence_score = document.querySelector('input[name="diligence_score"]:checked');
		const responsibility_score = document.querySelector('input[name="responsibility_score"]:checked');
		const coorporation_score = document.querySelector('input[name="coorporation_score"]:checked');
		const achievement_score = document.querySelector('input[name="achievement_score"]:checked');
		const inputReview = document.getElementById("inputReview");
		
		fetch("./writeInternEvaluation", {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: "diligence_score=" + diligence_score.value +
					"&responsibility_score=" + responsibility_score.value +
					"&coorporation_score=" + coorporation_score.value +
					"&achievement_score=" + achievement_score.value +
					"&review=" + inputReview.value
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
	
	function loadApplyingInternForm(){
		
		fetch("./isNow?internship_course_pk=" + internship_course_pk)
		.then(response => response.json())
		.then(response => {
			
			const isStartApplying = response.data.isStartApplying;
			const isStartInternship = response.data.isStartInternship;
			const applyingInternForm = document.getElementById("applyingInternForm");
			const studentInternForm = document.getElementById("studentInternForm");
			
			if(isStartApplying == 1 && isStartInternship == 0){
				applyingInternForm.removeAttribute("class");
			}
			
		});
	}
	
	function loadStudentInternForm(){
		
		fetch("./isNow?internship_course_pk=" + internship_course_pk)
		.then(response => response.json())
		.then(response => {
			
			const isStartInternship = response.data.isStartInternship;
			const studentInternForm = document.getElementById("studentInternForm");
			const applyingInternForm = document.getElementById("applyingInternForm");
			
			if(isStartInternship == 1){
				studentInternForm.removeAttribute("class");
			}
			
		});
	}
	
	function reloadWhichList(){
	
		fetch("./isNow?internship_course_pk=" + internship_course_pk)
		.then(response => response.json())
		.then(response => {
			
			let isStartInternship = response.data.isStartInternship;
			
			if(isStartInternship == 0){
				loadApplyingInternForm();
				reloadApplyStudentList();
			}else if(isStartInternship == 1){
				loadStudentInternForm();
				reloadInternList();
			} 
			
			
		});
		
	}
	
	window.addEventListener("DOMContentLoaded", () => {
		getProfessorPk();
		reloadWhichList();
		reloadInternshipCourseInfo();                                                                                                                                                                                                                                  
		// setInterval(reloadCommentList,1000); // 1초마다 reloadCommentList호출
	});

</script>


</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

	<div class="row">
		<div class="col">
			<jsp:include page="../../common/ajdksHighestMenubarForProfessor.jsp"></jsp:include>
		</div>
	</div>
	<div class="row">
	
		<!-- 좌측메뉴바 -->
		<jsp:include page="../../common/ajdksSideMenubarForProfessor.jsp"></jsp:include>
		
		<!-- 본문 :  자유롭게 이용하세요 화이팅 -->
		<div class="col">
			<div class="row">
				<div class="col mx-5">
				
					<!-- 본문작성공간 -->
					<div class="row mt-5">
						<div class="col fw-semibold" style="font-size:1.3em">
							<span class="text-secondary fs-3">&gt;</span>
							현장실습 진행 관리
						</div>
					</div>
					
					<div class="row mt-4">
					
						<div class="col">
							<div class="row">
								<div class="col fw-semibold" style="font-size:1.1em">
									현장실습과정 상세정보
								</div>
							</div>
							<div class="row mt-2">
								<div class="col border border-secondary border-start-0 border-end-0" style="font-size:0.95em">
									<div class="row border-bottom py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											현장실습명
										</div>
										<div class="internshipCourseTitle col border-start ps-4 fw-semibold">
											현장실습명입력
										</div>
									</div>
									<div class="row border-bottom py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											산업체명
										</div>
										<div class="companyName col border-start ps-4 border-end">
											산업체명입력
										</div>
										<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
											실습인원
										</div>
										<div class="totalMember col border-start ps-4">
											실습인원 입력
										</div>
									</div>
									<div class="row border-bottom py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											모집학과
										</div>
										<div class="recruitmentDepartment col border-start ps-4 border-end">
											모집학과 입력
										</div>
										<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
											자격학기
										</div>
										<div class="semesterQualification col border-start ps-4">
											자격학기 입력
										</div>
									</div>
									<div class="row border-bottom py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											모집기간
										</div>
										<div class="applicationPeriod col border-start ps-4 border-end">
											모집기간 입력
										</div>
										<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
											결과발표일
										</div>
										<div class="announcementDate col border-start ps-4">
											결과발표일 입력
										</div>
									</div>
									<div class="row py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											실습기간
										</div>
										<div class="internshipPeriod col border-start ps-4">
											실습기간 입력
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row mt-4">
						<div class="col">
							<div id="applyingInternForm" class="d-none">
								<div class="row">
									<div class="col fw-semibold" style="font-size:1.1em">
										현장실습 신청 내역
									</div>
								</div>
								<div class="row mt-2" style="height:18em">
									<div class="col border-secondary border-top border-bottom overflow-y-scroll">
										<div class="row text-center bg-body-secondary border-bottom border-secondary py-1 fw-semibold">
											<div class="col-1 border-end">
												학번
											</div>
											<div class="col-2 border-end">
												이름
											</div>
											<div class="col-2 border-end">
												학과
											</div>
											<div class="col-2 border-end">
												담당교수
											</div>
											<div class="col-1 border-end">
												수료학기
											</div>
											<div class="col-1 border-end">
												신청상태
											</div>
											<div class="col-2 border-end">
												학생정보
											</div>
											<div class="col-1">
												날짜
											</div>
										</div>
										<div class="row">
											<div id="applyingStudentListBox" class="col">
												
											</div>
										</div>
									</div>
								</div>
							</div>
						
							<div id="studentInternForm" class="d-none">
								<div class="row">
									<div class="col fw-semibold" style="font-size:1.1em">
										실습생 내역
									</div>
								</div>
								<div class="row mt-2" style="height:20em">
									<div class="col border-secondary border-top border-bottom overflow-y-scroll">
										<div class="row text-center bg-body-secondary border-bottom border-secondary py-1 fw-semibold">
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
		
		
		
		
		<!-- 신청학생리스트 -->
		<div id="applyingStudentListTemplete" class="d-none">
			<div class="applyingStudentWrapper row text-center py-1 border-bottom" style="font-size:0.95em">
				<div class="applyingStudentPk col-1 align-self-center fw-semibold border-end">
					학번 나오는곳
				</div>
				<div class="applyingStudentName col-2 align-self-center fw-semibold border-end">
					학생 이름 나오는 곳
				</div>
				<div class="applyingStudentDepartment col-2 align-self-center border-end">
					학과명 나오는 곳
				</div>
				<div class="applyingStudentProfessor col-2 align-self-center border-end">
					담당교수이름 나오는 곳
				</div>
				<div class="applyingStudentSemester col-1 align-self-center border-end">
					이수학기 나오는 곳
				</div>
				<div class="applyingStudentStatus col-1 align-self-center fw-semibold border-end">
					지원상태 나오는 곳
				</div>
				<div class="col-2 align-self-center border-end d-grid px-5">
					<a class="studentDetailPageBtn"></a>
				</div>
				<div class="applyingStudentCreatedAt col-1 align-self-center">
					신청날짜 출력되는 곳
				</div>
			</div>
		</div>
		
		<!-- 실습 -->
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