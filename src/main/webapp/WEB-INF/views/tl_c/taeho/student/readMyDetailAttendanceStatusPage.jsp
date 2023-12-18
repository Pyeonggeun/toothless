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
	
	function reloadMyInternCourseInfo(){
		const url = "./getMyInternCourseInfo";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {

			const myInternCourseInfoBox = document.getElementById("myInternCourseInfoBox");
			
			const myInternCourseTitle = document.querySelector(".myInternCourseTitle");
			myInternCourseTitle.innerText = response.data.COURSE_TITLE;
			
			const internCourseTitle = document.querySelector(".internCourseTitle");
			internCourseTitle.innerText = response.data.COURSE_TITLE;
			
			const companyName = document.querySelector(".companyName");
			companyName.innerText = response.data.COMPANY_NAME;
			
			const internshipPeriod = document.querySelector(".internshipPeriod");
			const startDate = new Date(response.data.INTERNSHIP_START_DATE);
			const endDate = new Date(response.data.INTERNSHIP_END_DATE);
			
			internshipPeriod.innerText = 
				startDate.getFullYear() + "." + (startDate.getMonth()+1) + "." + startDate.getDate() + " ~ " 
				+ endDate.getFullYear() + "." + (endDate.getMonth()+1) + "." + endDate.getDate();  
			
		});		
	}

 	function changeCategoryType(){
		
		var selectedCategoryType = document.getElementById("categorySelectBox");
		
		var categoryType = selectedCategoryType.options[selectedCategoryType.selectedIndex].value; 

		console.log(categoryType);
		
		return categoryType;
		
		reloadDetailAttendanceList();
	}
	
	
	function reloadDetailAttendanceList(){
				
 		var categoryType = changeCategoryType();
		
		const url = "./getDetailAttendanceList?categoryType=" + categoryType;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
		const attendanceStatusListBox = document.getElementById("attendanceStatusListBox");
		attendanceStatusListBox.innerHTML = "";
		
			for(e of response.data){
				const attendanceWrapper = document.auerySelector("#attendanceTemplate .attendanceWrapper").cloneNode(true);
				
				const attendanceDate = document.querySelector(".attendanceDate");
				attendanceDate.innerText = e.TIMECARD_YEAR + "-" + e.TIMECARD_MONTH + "-" + e.TIMECARD_DATE;
				
				
				attendanceStatusListBox.appendChild(attendanceWrapper);	
			}
			
		});
	}





	window.addEventListener("DOMContentLoaded", ()=>{
		reloadMyInternCourseInfo();
		reloadDetailAttendanceList();
		
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
			<div class="col mx-4">
	<!-- 본문 시작 -->
			
	<!-- 현재 과정 정보 -->			
	<div id="myInternCourseInfoBox" class="row">
		<div class="col">
		
			<div class="row py-4">
				<div class="myInternCourseTitle col fw-bold ps-0" style="font-size: 1.2em;">
					<!-- 현재 접속 과정명 -->
				</div>
			</div>
			<div class="row border-bottom border-dark border-2 pb-1">
				<div class="col ps-0" style="font-size: 0.9em;">※ 당일 출근 결과는 익일 반영됩니다.</div>
			</div>
			<div class="row border-bottom">
				<div class="col-2 border-end py-3" style="background-color: #E7E9EF;">실습과정명</div>
				<div class="internCourseTitle col py-3 text-center"><!-- 현재 접속 과정명 --></div>
			</div>
			<div class="row border-bottom">
				<div class="col-2 border-end py-3" style="background-color: #E7E9EF;">산업체명</div>
				<div class="companyName col py-3 text-center"><!-- 산업체명 --></div>
			</div>
			<div class="row border-bottom">
				<div class="col-2 border-end py-3" style="background-color: #E7E9EF;">실습기간</div>
				<div class="internshipPeriod col py-3 text-center"><!-- 실습기간 --></div>
			</div>
			
		</div>
	</div>			
	
		
	<!-- 카테고리 드롭다운 -->		
	<div class="row mt-5 pb-2 border-bottom">
		<div class="col ps-0">
			<select id="categorySelectBox" class="px-4" onchange="changeCategoryType()">
				<option value="wholeInfo" selected>전체</option>
				<option value="goodJob">출근</option>
				<option value="lateJob">지각</option>
				<option value="leaveJob">조퇴</option>
				<option value="absenceJob">결근</option>
			</select>		
		</div>
	</div>
			
	<div class="row">
		<div class="col">
			<div class="row border-bottom border-dark border-2" style="background-color: #E7E9EF;">
				<div class="col py-2 text-center border-end">일자</div>
				<div class="col py-2 text-center border-end">출근시간</div>
				<div class="col py-2 text-center border-end">퇴근시간</div>
				<div class="col py-2 text-center">출결상태</div>
			</div>
			<div class="row">
				<div id="attendanceStatusListBox" class="col">
					<!-- 출결 리스트 들어갈 공간 -->			
				</div>
			</div>
		</div>
	</div>
	
	<div id="attendanceTemplate" class="d-none">
		<div class="attendanceWrapper row border-bottom">
			<div class="attendanceDate col py-2 text-center border-end"><!-- 출근일자 --></div>
			<div class="getinTime col py-2 text-center border-end"><!-- 출근시간 --></div>
			<div class="getoffTime col py-2 text-center border-end"><!-- 퇴근시간 --></div>
			<div class="attendanceStatus col py-2 text-center"><!-- 출결상태 --></div>		
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