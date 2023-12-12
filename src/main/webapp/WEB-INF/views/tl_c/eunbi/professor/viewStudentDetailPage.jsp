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
	let student_pk = ${student_pk}
	
	function getProfessorPk(){
		fetch("./getProfessorPk")
		.then(response => response.json())
		.then(response => {
			const professorPk = response.data;
		});
	}
	
	function reloadStudentDetails(){
		
		const introductionImg = document.querySelector(".introductionImg");
		const studentName = document.querySelector(".studentName");
		const studentResidentId = document.querySelector(".studentResidentId");
		const studentDepartment = document.querySelector(".studentDepartment");
		const studentSemester = document.querySelector(".studentSemester");
		const studentBirth = document.querySelector(".studentBirth");
		const studentgender = document.querySelector(".studentgender");
		const studentPhone = document.querySelector(".studentPhone");
		const studentEmail = document.querySelector(".studentEmail");
		const studentAdress = document.querySelector(".studentAdress");
		
		fetch("./getStudentDetails?student_pk=" + student_pk)
		.then(response => response.json())
		.then(response => {
			
			const info = response.data;
			
			const introductionImgSrc = info.selfIntroductionImg.self_introduction_img;
			introductionImg.setAttribute("src", "/Git_imageFile/" + introductionImgSrc);
			
			const birth = new Date(info.studentInfoDto.birth);
			
			studentName.innerText = info.studentInfoDto.name;
			studentResidentId.innerText = info.studentInfoDto.resident_id;
			studentDepartment.innerText = info.studentDepartment.name;
			studentSemester.innerText = info.countSemester + "학기";
			studentBirth.innerText = birth.getFullYear() + "." + (birth.getMonth()+1) + "." + birth.getDate();
			studentgender.innerText = info.studentInfoDto.gender;
			studentPhone.innerText = info.studentInfoDto.phone;
			studentEmail.innerText = info.studentInfoDto.email;
			studentAdress.innerText = info.studentInfoDto.address;
			
		});
	}

	function reloadSelfIntroduction(){
		
		const answer1 = document.querySelector(".answer1");
		const answer2 = document.querySelector(".answer2");
		const answer3 = document.querySelector(".answer3");
		const answer4 = document.querySelector(".answer4");
		
		fetch("./getSelfIntroduction?student_pk=" + student_pk)
		.then(response => response.json())
		.then(response => {
			
			const text = response.data;
			
			answer1.innerText = text.selfIntroduction.answer1;
			answer2.innerText = text.selfIntroduction.answer2;
			answer3.innerText = text.selfIntroduction.answer3;
			answer4.innerText = text.selfIntroduction.answer4;
			
		});
		
	}
	
	function reloadCertification(){
		
		fetch("./getSelfIntroduction?student_pk=" + student_pk)
		.then(response => response.json())
		.then(response => {
			
			const certificationListBox = document.getElementById("certificationListBox");
			certificationListBox.innerHTML = "";
			
			const certificationWrapper = document.querySelector("#certificationListTemplete .certificationWrapper").cloneNode(true);
			
			const certificationName = document.querySelector(".certificationName");
			const acquisitionDate = document.querySelector(".acquisitionDate");
			const certificationFile = document.querySelector(".certificationFile");
			
			for(certification of response.data.certificationList){
				
				let acquisition_date = new Date(certification.certification_acquisition_date);
				
				certificationName.innerText = certification.certification_name;
				acquisitionDate.innerText = acquisition_date.getFullYear + "." + (acquisition_date.getMonth()+1) + "." + acquisition_date.getDate();
				certificationFile.innerText = "자격증파일 보기";
				certificationFile.setAttribute("class", "btn");
				certificationFile.classList.add("btn-sm", "btn-outline-secondary");
				certificationFile.setAttribute("onclick", "openModal()");
				
				certificationListBox.appendChild(certificationWrapper);
			}
		});
		
	}
	
	function showSelfIntroduction(){
		
		const showCertificationList = document.getElementById("showCertificationList");
		showCertificationList.classList.add("d-none");
		
		const loadCertificationList = document.getElementById("loadCertificationList");
		loadCertificationList.classList.remove("active");
		
		const showSelfIntroduction = document.getElementById("showSelfIntroduction");
		showSelfIntroduction.classList.remove("d-none");
		
		const loadSelfIntroduction = document.getElementById("loadSelfIntroduction");
		loadSelfIntroduction.classList.add("active");
		
		reloadSelfIntroduction();
		
	}
	
	function showCertificationList(){
		
		const showSelfIntroduction = document.getElementById("showSelfIntroduction");
		showSelfIntroduction.classList.add("d-none");
		
		const loadSelfIntroduction = document.getElementById("loadSelfIntroduction");
		loadSelfIntroduction.classList.remove("active");
		
		const showCertificationList = document.getElementById("showCertificationList");
		showCertificationList.classList.remove("d-none");
		
		const loadCertificationList = document.getElementById("loadCertificationList");
		loadCertificationList.classList.add("active");
		
		reloadCertification();
	}
	
	
	
	
	
	window.addEventListener("DOMContentLoaded", () => {
		getProfessorPk();
		reloadStudentDetails();
		showSelfIntroduction();
		function showCertificationList(){
			
			const showSelfIntroduction = document.getElementById("showSelfIntroduction");
			showSelfIntroduction.classList.add("d-none");
			
			const loadSelfIntroduction = document.getElementById("loadSelfIntroduction");
			loadSelfIntroduction.classList.remove("active");
			
			const showCertificationList = document.getElementById("showCertificationList");
			showCertificationList.classList.remove("d-none");
			
			const loadCertificationList = document.getElementById("loadCertificationList");
			loadCertificationList.classList.add("active");
			
			reloadCertification();
		}
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
									학생 기본정보
								</div>
							</div>
							<div class="row mt-2">
								<div class="col border border-secondary border-start-0 border-end-0" style="font-size:0.95em">
									<div class="row pt-1 pb-1">
										<div class="col-2 border-end">
											<div class="row py-3 px-5">
												<div class="col border" style="height:10.5em">
													<img class="introductionImg img-fluid" alt="...">
												</div>
											</div>
										</div>
										<div class="col">
											<div class="row border-bottom pt-1 pb-2">
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													이름
												</div>
												<div class="studentName col border-start ps-4 border-end fw-semibold">
													이름넣는 칸
												</div>
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													주민번호
												</div>
												<div class="studentResidentId col border-start ps-4">
													주민번호 넣는 칸
												</div>
											</div>
											<div class="row border-bottom py-2">
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													전공
												</div>
												<div class="studentDepartment col border-start ps-4 border-end">
													전공 넣는 칸
												</div>
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													이수학기
												</div>
												<div class="studentSemester col border-start ps-4">
													학기 넣는 칸
												</div>
											</div>
											<div class="row border-bottom py-2">
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													생년월일
												</div>
												<div class="studentBirth col border-start ps-4 border-end">
													생년월일 넣는 칸
												</div>
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													성별
												</div>
												<div class="studentgender col border-start ps-4">
													성별 넣는 칸
												</div>
											</div>
											<div class="row border-bottom py-2">
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													전화번호
												</div>
												<div class="studentPhone col border-start ps-4 border-end">
													전화번호 넣는 칸
												</div>
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													이메일
												</div>
												<div class="studentEmail col border-start ps-4">
													이메일 넣는 칸
												</div>
											</div>
											<div class="row pt-2 pb-1">
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													주소
												</div>
												<div class="studentAdress col border-start ps-4">
													주소 넣는 칸
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<!-- 이력서 출력 -->
							<div class="row mt-4">
								<div class="col mt-3">
									<div class="row border-bottom border-secondary">
										<div class="col-2 d-flex px-0">
											<div class="btn-group">
											<button id="loadSelfIntroduction" onclick="showSelfIntroduction()" class="btn btn-outline-secondary px-3 rounded-0 btn-sm border-bottom-0">자기소개서</button>
											<button id="loadCertificationList" onclick="showCertificationList()" class="btn btn-outline-secondary px-3 rounded-0 btn-sm border-bottom-0 border-dark-subtle">자격증</button>
											</div>
										</div>
									</div>
									
									<div id="showSelfIntroduction" class="row border border-secondary border-top-0 d-none">
										<div class="col">
											<div class="row">
												<div class="col-2 border-end text-center fw-semibold d-grid align-items-center" style="height:9em; background-color:#f2f5f7;">
													Q1. 지원동기
												</div>
												<div class="answer1 col px-4 overflow-y-scroll align-self-center" style="font-size:0.95em; height:8em">
													지원동기 나오는곳
												</div>
											</div>
											<div class="row border-top">
												<div class="col-2 border-end text-center fw-semibold d-grid align-items-center" style="height:9em; background-color:#f2f5f7;">
													Q2. 전공지식 및 기술능력
												</div>
												<div class="answer2 col px-4 overflow-y-scroll align-self-center" style="font-size:0.95em; height:8em">
													전공지식 및 기술능력 나오는곳
												</div>
											</div>
											<div class="row border-top">
												<div class="col-2 border-end text-center fw-semibold d-grid align-items-center" style="height:9em; background-color:#f2f5f7;">
													Q3. 주요경력 및 자격사항
												</div>
												<div class="answer3 col px-4 overflow-y-scroll align-self-center" style="font-size:0.95em; height:8em">
													주요경력 및 자격사항 나오는곳
												</div>
											</div>
											<div class="row border-top">
												<div class="col-2 border-end text-center fw-semibold d-grid align-items-center" style="height:9em; background-color:#f2f5f7;">
													Q4. 성격 및 장단점
												</div>
												<div class="answer4 col px-4 overflow-y-scroll align-self-center" style="font-size:0.95em; height:8em">
													성격 및 장단점
												</div>
											</div>
										</div>
									</div>
									<!-- 자격증 출력 -->
									<div id="showCertificationList" class="row border border-secondary border-top-0 d-none">
										<div class="col text-center">
											<div class="row border-bottom py-1 fw-semibold text-dark-emphasis" style="background-color:#f2f5f7;">
												<div class="col-5">
													자격증명
												</div>
												<div class="col-4">
													자격증 취득일
												</div>
												<div class="col-3">
													자격증 파일
												</div>
											</div>
											<div class="row">
												<div class="col" id="certificationListBox">
												<div id="certificationListTemplete" class="d-none">
													<div class="certificationWrapper row py-2">
														<div class="certificationName col-5 fw-semibold">
															자격증명 입력
														</div>
														<div class="acquisitionDate col-4">
															자격증 취득일 입력
														</div>
														<div class="certificationFile col-3">
															<button>자격증 파일 입력</button>
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

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>