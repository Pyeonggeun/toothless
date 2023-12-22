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
	
	function formSubmit(){
		const reportForm = document.getElementById("reportForm");
		
		const inputReportContent = document.getElementById("inputReportContent")
		const reportContentRegex = /^.{1,1000}$/;
		
		if(!reportContentRegex.test(inputReportContent.value)){
			alert("내용을 작성해야 제출 가능합니다");
			inputReportContent.focus();
			return;
		}

		reportForm.submit();		
		
	}	
	
	function reloadReportList(){
		
		const url = "./getInternReportList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
		const internReportListBox = document.getElementById("internReportListBox");
		internReportListBox.innerHTML = "";
		
			for(e of response.data){			
				const reportWrapper = document.querySelector("#reportTemplate .reportWrapper").cloneNode(true); 
				
				if(e.REPORT_CONTENT == null){
					continue;
				}else{
					
					const reportContent = reportWrapper.querySelector(".reportContent");					
					reportContent.innerText = e.REPORT_CONTENT;
					
					const reportDate = reportWrapper.querySelector(".reportDate");
					const tempDate = new Date(e.REPORT_DATE);				
					<!-- 월요일에 강사님한테 여쭤보기, console에는 날짜가 제대로 찍힌다, 그런데 출력은 이상하게 된다 -->
					reportDate.innerText = tempDate.getFullYear() + "-" + (tempDate.getMonth()+1) + "-" + tempDate.getDate();
					
				}				
				internReportListBox.appendChild(reportWrapper);
			}
		
		});
	}
	
	function reloadAttendanceCountList(){
		
		const url = "./getAttendanceCountList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
		const attendanceCountListBox = document.getElementById("attendanceCountListBox");
		attendanceCountListBox.innerHTML = "";
		
			for(e of response.data){
				const attendanceWrapper = document.querySelector("#attendanceTemplate .attendanceWrapper").cloneNode(true);
				
				<!-- 여기도 console은 제대로 찍히는데, 값이 이상하게 나온다 -->
				const attendanceCount = attendanceWrapper.querySelector(".attendanceCount");
				attendanceCount.innerText = e.ATTENDANCE_COUNT + "일";
				
				attendanceCountListBox.appendChild(attendanceWrapper);				
			}
		});
	}
	
	window.addEventListener("DOMContentLoaded", () => {
		reloadReportList();
		reloadAttendanceCountList();
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

<div class="row"><!-- 전체화면 입구 -->

<!-- 좌측메뉴바 -->
<jsp:include page="../../common/ajdksSideMenubarForStudent.jsp"></jsp:include>

<!-- 본문 : 자유롭게 이용하세요 화이팅 -->	
<div class="col">

	<!-- 현재 참가 과정 요약 -->
	<div class="row py-3" style="box-shadow: 2px 2px 2px gray; font-size: 0.9em;">
		<div class="col">
			
			<div class="row border-bottom border-white-50 pb-3 mx-1 fw-bold">
				<div class="col ps-2">
					<i class="bi bi-caret-right-fill"></i>&nbsp;현재 진행 과정
				</div>
			</div>
		
			<div class="row pt-3">
				<div class="col ps-5">
					<span>과정명&nbsp;:&nbsp;${internshipCourseInfoMap.COURSE_TITLE }</span>
				</div>
			</div>
			<div class="row pt-1">
				<div class="col ps-5">
					<span>산업체명&nbsp;:&nbsp;${internshipCourseInfoMap.COMPANY_NAME }</span>
				
				</div>
			</div>
			<div class="row pt-1">
				<div class="col ps-5">
					<span>산업체대표명&nbsp;:&nbsp;${internshipCourseInfoMap.CEO_NAME }</span>
				
				</div>
			</div>
			<div class="row pt-1">
				<div class="col ps-5">
					<span>지도교수명&nbsp;:&nbsp;${internshipCourseInfoMap.NAME }</span>			
				</div>
			</div>
			<div class="row pt-1">
				<div class="col ps-5">
					<span>실습기간&nbsp;:&nbsp;<fmt:formatDate value="${internshipCourseInfoMap.INTERNSHIP_START_DATE }" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${internshipCourseInfoMap.INTERNSHIP_END_DATE }" pattern="yyyy.MM.dd"/></span>
				</div>
			</div>

		</div>
	</div>
	
	<!-- 출결현황 요약 -->
	<div class="row mt-3">
		<div class="col fw-bold ps-4">
			<i class="bi bi-person-walking"></i>&nbsp;<span>나의 출결 현황</span>
		</div>
	</div>
	
	<div class="row border-top border-bottom mx-3 my-2 text-center">
		<div class="col">
			<div class="row border-bottom py-2">
				<div class="col"><i class="bi bi-check-circle text-success"></i>&nbsp;출근</div>
				<div class="col"><i class="bi bi-dash-circle text-warning"></i>&nbsp;지각</div>
				<div class="col"><i class="bi bi-dash-circle text-primary"></i>&nbsp;조퇴</div>
				<div class="col"><i class="bi bi-x-circle text-danger"></i>&nbsp;결근</div>
			</div>

			
			<!-- 출결요약 AJAX 들어가는 공간 -->
			<div id="attendanceCountListBox" class="row py-3">
				<!-- 출결요약 내용 들어가는 공간 -->
			</div>

			<!-- 출결요약 AJAX TEMPLATE -->
			<div id="attendanceTemplate" class="d-none">
				<div class="attendanceWrapper col">
					<span class="attendanceCount ps-2">
						<!-- 출결요약 탬플릿 내용 -->				
					</span>
				</div>
			</div>


		
		</div>
	</div>

	<!-- 대망의 일일업무보고 작성하기 1 : 일단 불러오기 -->
	<div class="row mt-4 px-3">
		<div class="col fw-bold">
			<i class="bi bi-pencil-square"></i>&nbsp;나의 일일업무보고
		</div>
		<div class="col text-end">
				<c:set var="today" value="<%=new java.util.Date()%>" />
				<fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일"/>의&nbsp;
				
				<!-- 모달 버튼 -->
				<button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">업무보고 작성</button>
				
				<!-- 모달 핵심 -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header py-2">
						<span class="modal-title fs-6" id="staticBackdropLabel">
							<c:set var="today" value="<%=new java.util.Date()%>" />
							<fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일"/>							
						</span>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      
				      <form id="reportForm" action="./writeInternReportProcess" method="get">
					    <div class="modal-body">
					    <input name="student_intern_pk" type="hidden" value="${internshipCourseInfoMap.STUDENT_INTERN_PK }">
						<textarea id="inputReportContent" name="report_content" rows="10" cols="59"></textarea>
					    </div>
					    <div class="modal-footer">
					      <input type="button" class="btn btn-primary btn-sm" onclick="formSubmit()" value="제출하기">
					    </div>
				      </form>
				      
				    </div>
				  </div>
				</div>
				
		</div>
	</div>

	
	<!-- AJAX 업무보고카드 들어가는 공간 -->
	<div id="internReportListBox" class="row row-cols-5 px-3">
		<!-- 여기에 AJAX 카드 들어갈 예정 -->
	</div>


	<!-- 탬플릿 -->	
	<div id="reportTemplate" class="d-none">
		<div class="reportWrapper col pt-3">
			
			<div class="card" style="height: 13em;">
				<div class="reportDate card-header ps-3">
					<!-- 날짜 -->
				</div>
				
				<div class="card-body">
					<p class="reportContent card-text">
						<!-- 보고서 내용 -->
					</p>					
				</div>
			</div>
			
		</div>
	</div>



<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>		

</div><!-- 본문 출구 -->
	
</div><!-- 전체화면 출구 -->

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>