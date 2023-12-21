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

	
	/* yyyy-mm-dd  */
	function formatDate(dateString) {
	    const date = new Date(dateString);
	    const year = date.getFullYear();
	    let month = (1 + date.getMonth()).toString().padStart(2, '0');
	    let day = date.getDate().toString().padStart(2, '0');
	
	    return year + "-" + month + "-" + day;
	}
	

	function internshipCourseList(){
		 
		const url = "./internshipCourseList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const courseListBox = document.getElementById("courseListBox");
			
			for(e of response.data){
				const courseListWrapper = document.querySelector("#templete .courseListWrapper").cloneNode(true);
				
				const courseTitle = courseListWrapper.querySelector(".courseTitle");
				courseTitle.innerText = e.course_title;
				
				const semesterQualification = courseListWrapper.querySelector(".semesterQualification");
				semesterQualification.innerText = e.semester_qualification + "학기 이상";
				
				const internshipTotalMember = courseListWrapper.querySelector(".internshipTotalMember");
				internshipTotalMember.innerText = e.internship_total_member;
				
				const internshipStartDate = formatDate(e.internship_start_date);
				const internshipEndDate = formatDate(e.internship_end_date);
				const internshipDate = courseListWrapper.querySelector(".internshipDate");
				internshipDate.innerText = internshipStartDate+ " ~ " + internshipEndDate;
				
				const applyingStartDate = formatDate(e.applying_start_date);
				const applyingEndDate = formatDate(e.applying_end_date);
				const applyingDate = courseListWrapper.querySelector(".applyingDate");
				applyingDate.innerText = applyingStartDate + " ~ " + applyingEndDate;
				
				const announceDateFormmated = formatDate(e.announcement_date);
				const announceDate = courseListWrapper.querySelector(".announceDate");
				announceDate.innerText = announceDateFormmated;
				
				courseListBox.appendChild(courseListWrapper);
			}
			
		});
		
	}
		
	
	
	
	
	
	
	window.addEventListener("DOMContentLoaded", () =>{
		internshipCourseList();
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
				<span>&#035;&nbsp;${ajdksCompanyInfoDto.company_name } 님 환영합니다</span>
			</div>	
			<div class="col pe-2 text-end nolinenoblue">
				<a href="../../taeho/external/ajdksCompanyLogoutProcess">로그아웃</a>
			</div>	
		</div>
		
		<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
		
		<div class="col">
		<div class="row">
			<div class="col mx-5">
			
			<!-- 본문작성공간 -->
				<div class="row mt-5">
					<div class="col fw-bold" style="font-size: 1.5em;">
						현장실습과정 조회
					</div>
				</div>
				<div class="row mt-3">
					<div class="col border border-2"></div>
				</div>
				
				<div class="row mt-5">
					<div class="col border border-1 border-dark"></div>
				</div>
				<div class="row mt-3 pb-3 border-bottom border-2 text-center fw-bold" style="font-size: 0.9em;">
					<div class="col">과정제목</div>
					<div class="col-1">자격조건</div>
					<div class="col-1">실습인원</div>
					<div class="col-2">실습기간</div>
					<div class="col-2">모집기간</div>
					<div class="col-2">발표일</div>
				</div>
				<div class="row mt-1">
					<div id="courseListBox" class="col border-bottom border-secondary-subtle"></div>
				</div>
			</div>
		</div>
		<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>
	</div>
	</div>
	
</div>

</div><!-- 전체 container 출구 -->
			
		<!-- 템플릿 -->
		<div id="templete" class="d-none">
			<div class="courseListWrapper row">
				<div class="col">
					<div class="row mt-3 text-center" style="font-size: 0.9em;">
						<div class="courseTitle col">과정제목</div>
						<div class="semesterQualification col-1">자격조건</div>
						<div class="internshipTotalMember col-1">실습인원</div>
						<div class="internshipDate col-2">실습기간</div>
						<div class="applyingDate col-2">모집기간</div>
						<div class="announceDate col-2">발표일</div>
					</div>
					
					<div class="row mt-3">
						<div class="col border-bottom border-secondary-subtle"></div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>