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
<title> AJDKS TEMPLATE FOR STUDENT </title>
<style>
	/*학생좌측메뉴바설정*/
	.studentleftmenubar input {
	    display: none;
	}
	
	.studentleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.studentleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.studentleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.studentleftmenubar input + label + .content {
	    display: none;
	}
	
	.studentleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}
	
	

</style>

<script>

	let studentPk = null;
	
	function getStudentPk(){
		fetch("./getStudentPk")
		.then(response => response.json())
		.then(response => {
			const studentPk = response.data;
		});
	}

	function reloadGradeInquiryList(){
		
		fetch("./gradeInquiry")
		.then(response => response.json())
		.then(response => {
			
			if(response.data === false){
				const noCourseToRead = document.getElementById("noCourseToRead");
				noCourseToRead.classList.remove("d-none");
			}else{
				
				const gradeInquiryListBox = document.getElementById("gradeInquiryListBox");
				gradeInquiryListBox.innerHTML = "";
				
				const gradeInquiryWrapper = document.querySelector("#gradeInquiryListTemplete .gradeInquiryWrapper").cloneNode(true);
				
				const index = gradeInquiryWrapper.querySelector(".index");
				const courseTitle = gradeInquiryWrapper.querySelector(".courseTitle");
				const companyName = gradeInquiryWrapper.querySelector(".companyName");
				const chargedProfessor = gradeInquiryWrapper.querySelector(".chargedProfessor");
				const internshipPeroid = gradeInquiryWrapper.querySelector(".internshipPeroid");
				const evaluationDetails = gradeInquiryWrapper.querySelector(".evaluationDetails");
				const showGrade = gradeInquiryWrapper.querySelector(".showGrade");
				const satisfactionButton = gradeInquiryWrapper.querySelector(".satisfactionButton");
				
				for(info of response.data){
					
						let internshipStartDate = new Date(info.internshipCourseDto.internship_start_date);
						let internshipEndDate = new Date(info.internshipCourseDto.internship_end_date);
						internshipStartDate = internshipStartDate.getFullYear() + "." + (internshipStartDate.getMonth()+1) + "." + internshipStartDate.getDate();
						internshipEndDate = internshipEndDate.getFullYear() + "." + (internshipEndDate.getMonth()+1) + "." + internshipEndDate.getDate();
						
						let i = 1;
						
						index.innerText = i;
						courseTitle.innerText = info.internshipCourseDto.course_title;
						companyName.innerText = info.companyInfoDto.company_name;
						chargedProfessor.innerText = info.professorDto.name;
						
						internshipPeroid.innerText = internshipStartDate + " - " + internshipEndDate;
						
						if(info.grade == 0){
							showGrade.setAttribute("style", "font-size:0.95em");
							showGrade.classList.add("text-secondary", "fw-bold");
							showGrade.innerText = "평가 미완료";
							
							evaluationDetails.innerText=""
							
							const noEvaluation = document.getElementById("noEvaluation");
							noEvaluation.classList.remove("d-none");
							
							evaluationDetails.innerText="ㅡ"
						}else{
							
							if(info.didSatisfaction === 0){
							satisfactionButton.innerText = "만족도평가";
							satisfactionButton.classList.add("btn", "btn-secondary", "btn-sm", "rounded-1", "open-Modal");
							
							const needSatisfaction = document.getElementById("needSatisfaction");
							needSatisfaction.classList.remove("d-none");
							const noEvaluation = document.getElementById("noEvaluation");
							noEvaluation.classList.add("d-none");
							
							const inputStudentInternPk = document.getElementById("inputStudentInternPk");
							inputStudentInternPk.setAttribute("value", info.studentInternPk);
							
							satisfactionButton.setAttribute("onclick", "openModal()");
							
							evaluationDetails.innerText="평가상세보기"
							evaluationDetails.classList.add("btn", "btn-secondary-outline", "btn-sm", "rounded-1");
							
							}else if(info.didSatisfaction !== 0){
								showGrade.setAttribute("style", "font-size:0.95em");
								
								const needSatisfaction = document.getElementById("needSatisfaction");
								needSatisfaction.classList.add("d-none");
								const noEvaluation = document.getElementById("noEvaluation");
								noEvaluation.classList.add("d-none");
								
								if(info.grade === "fail"){
									showGrade.classList.add("text-danger-emphasis", "fw-bold");
								}else{
									showGrade.classList.add("text-primary-emphasis", "fw-bold");
								}
								
								showGrade.innerText = info.grade;
							}
						}
						
						i++;
					}
				
				gradeInquiryListBox.appendChild(gradeInquiryWrapper);
				}

		});
	}
	
	function openModal() {
    	
    	const modal = bootstrap.Modal.getOrCreateInstance("#satisfactionModal");
    	
    	modal.show();
	}
	
    function closeModal() {
    	
    	const modal = bootstrap.Modal.getOrCreateInstance("#satisfactionModal");
    	
        modal.hide();
	}
    
    function writeSatisfaction(){
    	
    	const ratingValue = document.getElementById("ratingValue");
    	const review = document.getElementById("review");
    	const inputStudentInternPk = document.getElementById("inputStudentInternPk");
    	
    	fetch("./writeSatisfaction", {
			method: "post",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: "student_intern_pk=" + inputStudentInternPk.value + 
					"&rating=" + ratingValue.value +
					"&review=" + review.value
		})
		.then(response => response.json())
		.then(response => {
			
			const star1 = document.getElementById("star1");
			const star2 = document.getElementById("star2");
			const star3 = document.getElementById("star3");
			const star4 = document.getElementById("star4");
			const star5 = document.getElementById("star5");
			
			star1.classList.remove("bi-star-fill");
			star1.classList.add("bi-star");
			star2.classList.remove("bi-star-fill");
			star2.classList.add("bi-star");
			star3.classList.remove("bi-star-fill");
			star3.classList.add("bi-star");
			star4.classList.remove("bi-star-fill");
			star4.classList.add("bi-star");
			star5.classList.remove("bi-star-fill");
			star5.classList.add("bi-star");

			
			ratingValue.value = "";
			review.value = "";
			
			
			const gradeInquiryListBox = document.getElementById("gradeInquiryListBox");
			gradeInquiryListBox.innerHTML = "";
			reloadGradeInquiryList();
			
			closeModal();
			
		});
    }
    
	
	function star1(){
		const star1 = document.getElementById("star1");
		const star2 = document.getElementById("star2");
		const star3 = document.getElementById("star3");
		const star4 = document.getElementById("star4");
		const star5 = document.getElementById("star5");
		
		star1.classList.remove("bi-star");
		star1.classList.add("bi-star-fill");
		star2.classList.remove("bi-star-fill");
		star2.classList.add("bi-star");
		star3.classList.remove("bi-star-fill");
		star3.classList.add("bi-star");
		star4.classList.remove("bi-star-fill");
		star4.classList.add("bi-star");
		star5.classList.remove("bi-star-fill");
		star5.classList.add("bi-star");
		
		const ratingValue = document.getElementById("ratingValue");
		ratingValue.removeAttribute("value");
		ratingValue.setAttribute("value","1");
		
	}
	
	function star2(){
		const star1 = document.getElementById("star1");
		const star2 = document.getElementById("star2");
		const star3 = document.getElementById("star3");
		const star4 = document.getElementById("star4");
		const star5 = document.getElementById("star5");

		star1.classList.remove("bi-star");
		star1.classList.add("bi-star-fill");
		star2.classList.remove("bi-star");
		star2.classList.add("bi-star-fill");
		star3.classList.remove("bi-star-fill");
		star3.classList.add("bi-star");
		star4.classList.remove("bi-star-fill");
		star4.classList.add("bi-star");
		star5.classList.remove("bi-star-fill");
		star5.classList.add("bi-star");
		
		const ratingValue = document.getElementById("ratingValue");
		ratingValue.removeAttribute("value");
		ratingValue.setAttribute("value","2");
	}
	
	function star3(){
		const star1 = document.getElementById("star1");
		const star2 = document.getElementById("star2");
		const star3 = document.getElementById("star3");
		const star4 = document.getElementById("star4");
		const star5 = document.getElementById("star5");
		
		star1.classList.remove("bi-star");
		star1.classList.add("bi-star-fill");
		star2.classList.remove("bi-star");
		star2.classList.add("bi-star-fill");
		star3.classList.remove("bi-star");
		star3.classList.add("bi-star-fill");
		star4.classList.remove("bi-star-fill");
		star4.classList.add("bi-star");
		star5.classList.remove("bi-star-fill");
		star5.classList.add("bi-star");
		
		const ratingValue = document.getElementById("ratingValue");
		ratingValue.removeAttribute("value");
		ratingValue.setAttribute("value","3");
	}
	
	function star4(){
		const star1 = document.getElementById("star1");
		const star2 = document.getElementById("star2");
		const star3 = document.getElementById("star3");
		const star4 = document.getElementById("star4");
		const star5 = document.getElementById("star5");
		
		star1.classList.remove("bi-star");
		star1.classList.add("bi-star-fill");
		star2.classList.remove("bi-star");
		star2.classList.add("bi-star-fill");
		star3.classList.remove("bi-star");
		star3.classList.add("bi-star-fill");
		star4.classList.remove("bi-star");
		star4.classList.add("bi-star-fill");
		star5.classList.remove("bi-star-fill");
		star5.classList.add("bi-star");
		
		const ratingValue = document.getElementById("ratingValue");
		ratingValue.removeAttribute("value");
		ratingValue.setAttribute("value","4");
	}
	
	function star5(){
		const star1 = document.getElementById("star1");
		const star2 = document.getElementById("star2");
		const star3 = document.getElementById("star3");
		const star4 = document.getElementById("star4");
		const star5 = document.getElementById("star5");
		
		star1.classList.remove("bi-star");
		star1.classList.add("bi-star-fill");
		star2.classList.remove("bi-star");
		star2.classList.add("bi-star-fill");
		star3.classList.remove("bi-star");
		star3.classList.add("bi-star-fill");
		star4.classList.remove("bi-star");
		star4.classList.add("bi-star-fill");
		star5.classList.remove("bi-star");
		star5.classList.add("bi-star-fill");
		
		const ratingValue = document.getElementById("ratingValue");
		ratingValue.removeAttribute("value");
		ratingValue.setAttribute("value","4");
	}
	
	
	
	
	window.addEventListener("DOMContentLoaded", () => {
		getStudentPk();
		reloadGradeInquiryList();
	});
</script>



</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<div class="row">
	<div class="col">
		<jsp:include page="../../common/ajdksHighestMenubarForStudent.jsp"></jsp:include>
	</div>
</div>
<div class="row">

	<!-- 좌측메뉴바 -->
	<jsp:include page="../../common/ajdksSideMenubarForStudent.jsp"></jsp:include>
	
	<!-- 본문 : 자유롭게 이용하세요 화이팅 -->	
	<div class="col">
		<div class="row">
			<div class="col mx-5">
			
				<!-- 본문작성공간 -->
				<div class="row mt-5">
					<div class="col fw-semibold" style="font-size:1.3em">
						<span class="text-secondary fs-3">&gt;</span>
						현장실습 성적 조회
					</div>
				</div>
				
				<div id="needSatisfaction" class="row mt-3 d-none">
					<div class="col px-4 py-4 mt-2" style="background-color:#e6ecf5">
						<div class="row">
							<div class="col mx-2 py-2">
								<i class="bi bi-exclamation-triangle"></i>&nbsp;&nbsp;최종 성적은 만족도조사 작성 후 열람하실 수 있습니다.
							</div>
						</div>
					</div>
				</div>
				
				<div id="noEvaluation" class="row mt-3 d-none">
					<div class="col px-4 py-4 mt-2" style="background-color:#e6ecf5">
						<div class="row">
							<div class="col mx-2 py-2">
								<i class="bi bi-exclamation-triangle"></i>&nbsp;&nbsp;교수나 산업체 담당자가 아직 평가를 완료하지않았을 경우, '평가 미완료'로 표기됩니다.
							</div>
						</div>
					</div>
				</div>
				
				<div id="noCourseToRead" class="row mt-4 d-none">
					<div class="col px-4 py-4" style="background-color:#e6ecf5">
						<div class="row">
							<div class="col mx-2 py-2">
								<i class="bi bi-exclamation-triangle"></i>&nbsp;&nbsp;성적을 열람할 수 있는 현장실습 과정이 존재하지 않습니다.
							</div>
						</div>
					</div>
				</div>
				
				<div class="row mt-4" style="height:15em">
					<div class="col border-secondary border-top border-bottom overflow-y-scroll mt-1">
						<div class="row text-center bg-body-secondary border-bottom border-secondary py-1 fw-semibold">
							<div class="col-1 border-end">
								번호
							</div>
							<div class="col-4 border-end">
								현장실습 과정명
							</div>
							<div class="col-2 border-end">
								현장실습 기관명
							</div>
							<div class="col-1 border-end">
								담당교수
							</div>
							<div class="col-2 border-end">
								진행기간
							</div>
							<div class="col-1 border-end">
								평가상세
							</div>
							<div class="col-1 border-end">
								성적확인
							</div>
						</div>
						<div class="row">
							<div id="gradeInquiryListBox" class="col">
								
							</div>
						</div>
					</div>
				</div>
				
				<div id="notice" class="row border mt-5" style="font-size:0.85em">
					<div class="col px-4 py-4 text-dark-emphasis">
						<div class="row mt-2">
							<div class="col fw-semibold">
								성적 열람시 주의사항
							</div>
						</div>
						<div class="row">
							<div class="col mt-2">
								- 현장실습 성적은 "Pass" 와 "Fail"로 표기됩니다.
							</div>
						</div>
						<div class="row">
							<div class="col mt-2">
								- 취득 학점에 대한 이의신청은 교수 및 담당 산업체에 문의하여 주시길 바랍니다.
							</div>
						</div>
						<div class="row mb-2">
							<div class="col mt-2">
								- 현장실습 만족도 조사를 완료해야 성적을 열람하실 수 있습니다.
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
</div>

</div><!-- 전체 container 출구 -->


	<div id="gradeInquiryListTemplete" class="d-none">
		<div class="gradeInquiryWrapper row text-center py-1 border-bottom" style="font-size:0.95em">
			<div class="index col-1 align-self-center fw-semibold border-end">
			
			</div>
			<div class="courseTitle col-4 align-self-center fw-semibold border-end">
			
			</div>
			<div class="companyName col-2 align-self-center border-end">
			
			</div>
			<div class="chargedProfessor col-1 align-self-center border-end">
			
			</div>
			<div class="internshipPeroid col-2 align-self-center border-end">
			
			</div>
			<div class="col-1 align-self-center d-grid px-2 border-end">
				<span class="evaluationDetails"></span>
			</div>
			<div class="showGrade col-1 align-self-center d-grid px-2">
				<span class="satisfactionButton"></span>
			</div>
		</div>
	</div>
	
	<!-- 모달 -->
	<div id="satisfactionModal" class="modal">
		<div class="modal-dialog">
			<div class="modal-content px-3 rounded-0">
				<div class="modal-header mt-1">
					<h5 class="modal-title fw-semibold">만족도 평가</h5>
					<span onclick="closeModal()" class="close text-secondary fs-4" id="close-modal"><i class="bi bi-x-lg"></i></span>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col">
							<div class="row">
								<div class="col fw-semibold d-flex">
									<span class="align-self-center">별점</span>
									<i id="star1" onclick="star1()" class="radioBtn bi bi-star fs-2 align-self-center text-warning ms-4" name="rating"></i>
									<i id="star2" onclick="star2()" class="radioBtn bi bi-star fs-2 align-self-center text-warning ms-3" name="rating"></i>
									<i id="star3" onclick="star3()" class="radioBtn bi bi-star fs-2 align-self-center text-warning ms-3" name="rating"></i>
									<i id="star4" onclick="star4()" class="bi bi-star fs-2 align-self-center text-warning ms-3" name="rating"></i>
									<i id="star5" onclick="star5()" class="bi bi-star fs-2 align-self-center text-warning ms-3" name="rating"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="row mt-4">
								<div class="col fw-semibold">
									리뷰
								</div>
							</div>
							<div class="row">
								<div class="col mt-2">
									<textarea id="review" rows="5" class="form-control rounded-0"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer border-0 mb-3">
					<input type="hidden" id="ratingValue">
					<input type="hidden" id="inputStudentInternPk">
					<button id="submitButton" onclick="writeSatisfaction()" class="closeModal btn btn-secondary rounded-0">제출</button>
				</div>
			</div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>