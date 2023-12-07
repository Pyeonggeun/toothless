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
	const internship_course_pk = ${internshipCourseDetail.internshipCourseDto.internship_course_pk};
	
	function getProfessorPk(){
		fetch("./getProfessorPk")
		.then(response => response.json())
		.then(response => {
			professorPk = response.data;
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
				studentDetailPageBtn.innerText = 상세보기
				studentDetailPageBtn.classList.add("btn", "btn-secondary", "btn-sm", "rounded-1");
				studentDetailPageBtn.setAttribute("href", "./viewStudentDetailPage?student_pk="+applyingStudent.studentInfoDto.student_pk+"");
				
				const applyingStudentCreatedAt = applyingStudentWrapper.querySelector(".applyingStudentCreatedAt");
				applyingStudentCreatedAt.innerText = applyingStudent.studentApplyingDto.created_at;
				
			}
			
		});
	}
	
	function reloadInternList(){
		
		fetch("./getStudentInternList?internship_course_pk=" + internship_course_pk)
		.then(response => response.json())
		.then(response => {
			
			const internListBox = document.getElementById("internListBox");
			internListBox.innerHTML = "";
			
			for(intern of response.data) {
				
				const internWrapper = document.querySelector("#internListTemplete .internWrapper").cloneNode(true);
				
				const internPk = internWrapper.querySelector(".internPk");
				internPk.innerText = intern.studentInfoDto.student_pk;
				
				const internName = internWrapper.querySelector(".internName");
				internName.innerText = intern.studentInfoDto.name;
				
				const internDepartment = internWrapper.querySelector(".internDepartment");
				internDepartment.innerText = intern.studentDepartment.name;
				
				const internProfessor = internWrapper.querySelector(".internProfessor");
				internProfessor.innerText = intern.studentProfessorInfo.name;
				
				const studentDetailPageBtn = internWrapper.querySelector(".studentDetailPageBtn");
				studentDetailPageBtn.innerText = 상세보기
				studentDetailPageBtn.classList.add("btn", "btn-outline-secondary", "btn-sm", "rounded-1");
				studentDetailPageBtn.setAttribute("href", "./viewStudentDetailPage?student_pk="+intern.studentInfoDto.student_pk+"");
				
				const internAttendance = internWrapper.querySelector(".internAttendance");
				internAttendance.innerText = 
					"출근" + intern.countAttendance + "&nbsp" +
					"지각" + intern.countLate&nbsp + "&nbsp" +
					"조퇴" + intern.countEarlyleave&nbsp + "&nbsp" +
					"결근" + intern.countAbsent;

				const readInternReport = internWrapper.querySelector(".readInternReport");
				readInternReport.innerText = 업무일지확인
				readInternReport.classList.add("btn", "btn-secondary", "btn-sm", "rounded-1");
				readInternReport.setAttribute("href", "./viewInternReport?student_intern_pk="+intern.studentInternDto.student_intern_pk+"");
				
				const internEvaluation = internWrapper..querySelector(".internEvaluation");
				
				if(intern.didEvaluateIntern == 0){
					internEvaluation.innerText = 성적입력하기
					internEvaluation.classList.add("btn", "btn-secondary", "btn-sm", "rounded-1");
				}else(intern.didEvaluateIntern > 0){
					internEvaluation.innerText = 성적입력완료
					internEvaluation.removeAttribute("button")
				}
				
				
			}
			
		});
	}



	
	
	window.addEventListener("DOMContentLoaded", () => {
		getProfessorPk();
		reloadApplyStudentList();
		reloadInternList();
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
										<div class="col border-start ps-4 fw-semibold">
											${internshipCourseDetail.internshipCourseDto.course_title}
										</div>
									</div>
									<div class="row border-bottom py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											산업체명
										</div>
										<div class="col border-start ps-4 border-end">
											${internshipCourseDetail.companyInfoDto.company_name}
										</div>
										<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
											실습인원
										</div>
										<div class="col border-start ps-4">
											${internshipCourseDetail.countStudentIntern} / ${internshipCourseDetail.internshipCourseDto.internship_total_member}
										</div>
									</div>
									<div class="row border-bottom py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											모집학과
										</div>
										<div class="col border-start ps-4 border-end">
											${internshipCourseDetail.departmentDto.name}
										</div>
										<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
											자격학기
										</div>
										<div class="col border-start ps-4">
											${internshipCourseDetail.internshipCourseDto.semester_qualification}학기 이상
										</div>
									</div>
									<div class="row border-bottom py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											모집기간
										</div>
										<div class="col border-start ps-4 border-end">
											<fmt:formatDate value="${internshipCourseDetail.internshipCourseDto.applying_start_date}" pattern="yyyy.MM.dd"/>
											 - <fmt:formatDate value="${internshipCourseDetail.internshipCourseDto.applying_end_date}" pattern="yyyy.MM.dd"/>
										</div>
										<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
											결과발표일
										</div>
										<div class="col border-start ps-4">
											<fmt:formatDate value="${internshipCourseDetail.internshipCourseDto.announcement_date}" pattern="yyyy.MM.dd"/>
											학기 이상
										</div>
									</div>
									<div class="row py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											실습기간
										</div>
										<div class="col border-start ps-4">
											<fmt:formatDate value="${internshipCourseDetail.internshipCourseDto.internship_start_date}" pattern="yyyy.MM.dd"/>
											 - <fmt:formatDate value="${internshipCourseDetail.internshipCourseDto.internship_end_date}" pattern="yyyy.MM.dd"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row mt-4">
						<div class="col">
						<jsp:useBean id="now" class="java.util.Date"/>
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
						<c:choose>
							<c:when test="${internshipCourseDetail.internshipCourseDto.applying_start_date < now && internshipCourseDetail.internshipCourseDto.internship_start_date > now}">
								<div class="row">
									<div class="col fw-semibold" style="font-size:1.1em">
										현장실습 신청 내역
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
							</c:when>
							
							<c:when test="${internshipCourseDetail.internshipCourseDto.internship_start_date < now && internshipCourseDetail.internshipCourseDto.internship_end_date > now}">
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
											<div class="col-2 border-end">
												학과
											</div>
											<div class="col-2 border-end">
												담당교수
											</div>
											<div class="col-1 border-end">
												학생정보
											</div>
											<div class="col-2 border-end">
												출결
											</div>
											<div class="col-2">
												업무일지
											</div>
										</div>
										<div class="row">
											<div id="internListBox" class="col">
												
											</div>
										</div>
									</div>
								</div>
							</c:when>
							
							<c:when test="${internshipCourseDetail.internshipCourseDto.internship_end_date < now}">
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
							</c:when>					
						</c:choose>	
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
				<div class="col-2 align-self-center border-end d-grid px-4">
					<a class="studentDetailPageBtn"></a>
				</div>
				<div class="applyingStudentCreatedAt col-1 align-self-center">
					신청날짜 출력되는 곳
				</div>
			</div>
		</div>
		
		<!-- 실습생 리스트 -->
		<div id="internListTemplete" class="d-none">
			<div class="internWrapper row text-center py-1 border-bottom" style="font-size:0.95em">
				<div class="internPk col-1 align-self-center fw-semibold border-end">
					학생 Pk
				</div>
				<div class="internName col-2 align-self-center fw-semibold border-end">
					이름
				</div>
				<div class="internDepartment col-2 align-self-center border-end">
					학과
				</div>
				<div class="internProfessor col-2 align-self-center border-end">
					교수이름
				</div>
				<div class="col-1 align-self-center border-end d-grid px-3">
					<a class="studentDetailPageBtn"></a>
				</div>
				<div class="internAttendance col-2 align-self-center border-end" style="font-size:0.9em">
					출근지각조퇴결근
				</div>
				<div class="col-2 align-self-center d-grid px-4">
					<a class="readInternReport"></a>
				</div>
			</div>
		</div>
		
		<!-- 실습 끝나고 -->
		<div id="internListTemplete" class="d-none">
			<div class="internWrapper row text-center py-1 border-bottom" style="font-size:0.95em">
				<div class="internPk col-1 align-self-center fw-semibold border-end">
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
				<div class="internAttendance col-2 align-self-center border-end" style="font-size:0.9em">
				</div>
				<div class="col-2 align-self-center d-grid px-4 border-end">
					<a class="readInternReport"></a>
				</div>
				<div class="col-2 align-self-center d-grid px-4">
					<span class="internEvaluation"></span>
				</div>
			</div>
		</div>
		

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>