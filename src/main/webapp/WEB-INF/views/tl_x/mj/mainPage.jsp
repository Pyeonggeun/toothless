<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
 <!-- Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
 
<title>Insert title here</title>

<style>
	.shadow {   /* 그림자 효과 */
      box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
    }
    
     .text-over-cut {
        display: block;
        max-width: 500px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
   }

</style>

<script>
	//날짜 포맷
	function formatDate(date) {
	    var day = date.getDate();
	    var month = date.getMonth() + 1;
	    var year = date.getFullYear() % 100;	// 뒤에 두자리만
	
	    // 원하는 형식에 맞게 조합 (여기서는 YY-MM-DD 형식)
	    return year + '.' + (month < 10 ? '0' : '') + month + '.' + (day < 10 ? '0' : '') + day;
	}
	
	// 숫자를 문자열로 변환하고 한 자리 숫자에 0을 붙임	--> 날짜가 23-08-03 으로 나오게
	function addLeadingZero(number) {
	    return number < 10 ? '0' + number : '' + number;
	}
	

	// 바로가기 밑에 숫자 가져오기
	function getAllCount() {
	
		fetch("./getAllOpenLectureInfoList")
		.then(response => response.json())
		.then(response => {

			// 교육과정 리스트
			const lectureCategoryList = response.data.lectureCategoryList;
			document.querySelector("#cntlecture").innerText = lectureCategoryList.length +"개";
			
			// 개설강의 리스트
			const allOpenLectureInfoList = response.data.allOpenLectureInfoList;
			document.querySelector("#cntOpenLec").innerText = allOpenLectureInfoList.length +"개";
			
			// 강사 전체 리스트
			const allTeacherList = response.data.allTeacherList;
			document.querySelector("#cntTeacher").innerText = allTeacherList.length +"명";
			
			// 학생 전체 리스트
			const allStudentInfoList = response.data.allStudentInfoList;
			document.querySelector("#cntStudent").innerText = allStudentInfoList.length +"명";
			
		});
	}
	  // 초기 월 값 설정
	  let currentMonth = new Date(2023, 11); // 2023.12 (월은 0부터 시작하므로 11은 12월을 나타냄)

	  // 월을 변경하는 함수
	  function changeMonth(offset) {
	    currentMonth.setMonth(currentMonth.getMonth() + offset);
	    updateMonthDisplay();
	  }

	  // 월 표시 업데이트 함수
	  function updateMonthDisplay() {
	    const year = currentMonth.getFullYear();
	    const month = (currentMonth.getMonth() + 1).toString().padStart(2, '0');
	    const formattedMonth = year + '.' + month;
	    document.getElementById('currentMonth').textContent = formattedMonth;
	    
	 	// 교육과정 카테고리 보여줘야함
	 	console.log(month);
	 	
	 	const url = "./selectMonthlyOpenLectureList?month="+ month;
	 	

		fetch(url) 
		.then(response => response.json())
		.then(response => {
				
			// 교육과정 리스트
			let monthlyOpenLectureList = response.data.monthlyOpenLectureList;
			console.log(monthlyOpenLectureList);
			
			document.getElementById("templateWrapper").innerHTML = "";
			
			const dateTemplate = document.querySelector("#dateTemplate");
			
		    for(const e of monthlyOpenLectureList){
		    	
		    	// 템플릿복사
		    	const template = document.querySelector(".template").cloneNode(true);
		    	
		    	// 보여줄 정보넣고
		        template.querySelector("#someDate").innerText = formatDate(new Date(e.SA)) + " ~ " + formatDate(new Date(e.EA));
		        template.querySelector("#someName").innerText = e.TITLE;
	
		        // 리스트에 추가
		        templateWrapper.appendChild(template);
		    	
		    }
			
		});
	    
	    
	  }
	  
	  // 공지사항 탭
	  function showNoticeContent(){
		  
		    const someWrapper = document.querySelector(".someWrapper");
		    someWrapper.innerHTML = "";
			 
			// 탭 전체가져와서 --> 이때 clone을 안하면 다른 탭으로 이동할 때 원본 innerHTML이 삭제됨!!!!! 중요****
			const noticeContent = document.getElementById("noticeContent").cloneNode(true);
			
			// manageInfoTab의 모든 하위 요소를 가져옴
			const allChildElements = noticeContent.querySelectorAll(".info");

			// 그 하위내용(= child들)을 돌면서 tabContent에 추가
			for(e of allChildElements){
				someWrapper.appendChild(e);
			}
			
		
			// 해당 탭만 active되게
			const notice = document.getElementById("notice");
			notice.style.borderTop = "3px solid #007AC3";
			notice.style.backgroundColor = "";
			
			const reference = document.getElementById("reference");
			reference.style.borderTop = "";
			reference.style.backgroundColor = "#F5F6F6";
		 
	  }
	  
	  
	  // 서식자료실 탭
	  function showReferenceContent(){
		  
		    const someWrapper = document.querySelector(".someWrapper");
		    someWrapper.innerHTML = "";
			 
			// 탭 전체가져와서 --> 이때 clone을 안하면 다른 탭으로 이동할 때 원본 innerHTML이 삭제됨!!!!! 중요****
			const referenceContent = document.getElementById("referenceContent").cloneNode(true);
			
			// manageInfoTab의 모든 하위 요소를 가져옴
			const allChildElements = referenceContent.querySelectorAll(".info");

			// 그 하위내용(= child들)을 돌면서 tabContent에 추가
			for(e of allChildElements){
				someWrapper.appendChild(e);
			}
			
		
			// 해당 탭만 active되게
			const notice = document.getElementById("notice");
			notice.style.borderTop = "";
			notice.style.backgroundColor = "#F5F6F6";
			
			const reference = document.getElementById("reference");
			reference.style.borderTop = "3px solid #007AC3";
			reference.style.backgroundColor = "";
		 
	  }
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	
	// 페이지의 DOM이 로드되면 실행될 함수 등록!! 
	//	--> 함수가 실행이 안되면 값을 못 가져오는거...
	window.addEventListener("DOMContentLoaded", () => {
		updateMonthDisplay();
		getAllCount();
		showNoticeContent();
	});

</script>


</head>
<body>


<%
    // 현재 시간 가져오기
    Date currentDate = new Date();
    
    // 시간을 특정 형식으로 포맷팅
    SimpleDateFormat dateFormat = new SimpleDateFormat("yy.MM.dd HH:mm:ss");
    SimpleDateFormat newDateFormat = new SimpleDateFormat("yy.MM.dd");
    String formattedDate = dateFormat.format(currentDate);
    String newFormattedDate = newDateFormat.format(currentDate);
%>


<div class="container-fluid">
	<!-- 최상단 -->
	<jsp:include page="../commons/staff/topNavi.jsp"></jsp:include>
	

	<!-- 내용시작 -->
	<div class="row">
		<!-- 좌측 카테고리 -->
		<jsp:include page="../commons/staff/leftCategory.jsp"></jsp:include>
		
		<!-- 우측내용 -->
		<div class="col" style="background-color: #F5F6F6">
			<div class="row justify-content-center mt-5">
				<div class="col-6">
					<div class="row">
						<!-- 마이페이지 -->
						<div class="col shadow bg-white text-center">
							<div class="row border-bottom py-2" style="background-color: #E5EFF6">
								<div class="col">
									<span class="fs-5 fw-bold" style="color:#0061AA">${sessionStaffInfo.name }</span>님 환영합니다.
								</div>
							</div>
							<div class="row border-bottom text-secondary py-2" style="background-color: #E5EFF6">
								<div class="col">
									비밀번호 변경 | 인증서 등록
								</div>
							</div>
							<div class="row border-bottom py-2">
								<div class="col">
									<div class="row">
									 	<div class="col">
									 		<i class="bi bi-envelope-at fs-2 fw-light"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">웹메일</div>
									</div>
									<div class="row">
									 	<div class="col fw-bold" style="color:#0061AA">13</div>
									</div>
								</div>
								<div class="col">
									<div class="row">
									 	<div class="col">
									 		<i class="bi bi-envelope-paper fs-2 fw-light"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">쪽지</div>
									</div>
									<div class="row">
									 	<div class="col fw-bold" style="color:#0061AA">25</div>
									</div>
								</div>
								<div class="col">
									<div class="row">
									 	<div class="col">
									 		<i class="bi bi-clipboard2-check fs-2 fw-light"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">업무게시판</div>
									</div>
									<div class="row">
									 	<div class="col fw-bold" style="color:#0061AA">4</div>
									</div>
								</div>
							</div>
							<div class="row pt-2 text-start">
								<div class="col-4">
									<i class="bi bi-dot"></i> 시간
								</div>
								<div class="col">
									<%= formattedDate %>
								</div>
							</div>
							<div class="row py-2 text-start">
								<div class="col-4">
									<i class="bi bi-dot"></i> 접속 IP
								</div>
								<div class="col">
									211.244.434.12
								</div>
							</div>
							<div class="row py-4 text-start justify-content-center">
								<div class="col-4 d-grid">
									<button type="button" class="btn rounded-0 text-white" style="background-color: #007AC3; font-size: 0.7em;">마이페이지</button>
								</div>
								<div class="col-4">
									<a href="./logoutProcess" class="text-black d-grid" style="text-decoration: none;">
									<button type="button" class="btn rounded-0 btn-outline-secondary" style="font-size: 0.8em;">로그아웃</button>
									</a>
								</div>
							</div>
						</div>
						
						<!-- 수강신청 일정 -->
						<div class="col shadow bg-white ms-3">
							<div class="row border-bottom p-2">
								<div class="col fs-5">
									<span class="fw-bold">수강신청 일정</span>
								</div>
								<div class="col text-end">
									<span style="font-size: 0.9em;" class="fw-lighter text-end">
										<%= newFormattedDate %> <span style="font-size: 0.8em;">기준</span>
									</span>
								</div>
							</div>
						    <div class="row p-2 mb-3 text-center">
						    <div class="col-1 fs-5 month-selector" onclick="changeMonth(-1)">
						      <i class="bi bi-chevron-left"></i>
						    </div>
						    <div class="col fs-5 fw-bold" id="currentMonth">
						      2023.12
						    </div>
						    <div class="col-1 fs-5 me-2 month-selector" onclick="changeMonth(1)">
						      <i class="bi bi-chevron-right"></i>
						    </div>
						  </div>
							  
							<!-- 반복문 돌곳 -->
							<div id="templateWrapper">
							
							</div>
							
							<div id="dateTemplate" class="d-none">
								<div class="template row py-2 mx-2 text-start border-bottom mb-2">
									<div class="col info">
										<div class="row text-start">
											<div class="col-1">
												<i class="bi bi-dot fw-bold"></i>
											</div>
											<div id="someDate" class="col" style="color: #007AC3">
												12.08 ~ 12.15
											</div>
										</div>
										<div class="row text-start mb-1">
											<div class="col-1">
											</div>
											<div id="someName" class="col">
												어떠한 수업명
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- 바로가기 -->
				<div class="col-5 shadow bg-white mx-3">
					<div class="row p-2">
						<div class="col fw-bold fs-5">
							바로가기
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="row mx-3 pt-3 pb-2" style="background-color: #F5F6F6;">
								<div class="col text-center" onclick="location.href='./manageLecturePage2'" style="cursor: pointer;">
									<div class="row">
									 	<div class="col">
									 		<i class="fs-1 bi bi-book"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">교육과정 목록</div>
									</div>
									<div class="row">
									 	<div id="cntlecture" class="col fw-bold fs-5" style="color:#007AC3">13</div>
									</div>
								</div>
								<div class="col text-center" onclick="location.href='./manageOpenLecturePage2'" style="cursor: pointer;">
									<div class="row">
									 	<div class="col">
									 		<i class="fs-1 bi bi-journals"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">강의 목록</div>
									</div>
									<div class="row">
									 	<div id="cntOpenLec" class="col fw-bold fs-5" style="color:#007AC3">13</div>
									</div>
								</div>
							</div>
							<div class="row mx-3 pb-3 pt-2" style="background-color: #F5F6F6;">
								<div class="col text-center" onclick="location.href='./manageTeacherPage2'" style="cursor: pointer;">
									<div class="row">
									 	<div class="col">
									 		<i class="fs-1 bi bi-person-vcard"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">강사 목록</div>
									</div>
									<div class="row">
									 	<div id="cntTeacher" class="col fw-bold fs-5" style="color:#007AC3">13</div>
									</div>
								</div>
								<div class="col text-center" onclick="location.href='./manageStudentPage2'" style="cursor: pointer;">
									<div class="row">
									 	<div class="col">
									 		<i class="fs-1 bi bi-person"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">학생 목록</div>
									</div>
									<div class="row">
									 	<div id="cntStudent" class="col fw-bold fs-5" style="color:#007AC3">13</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
			
			<!-- 하단 row -->
			<div class="row justify-content-center mt-4">
				
				<!-- 수강신청 일정 -->
				<div class="col-6 shadow bg-white">
					<div class="row text-center mb-3">
						<div onclick="showNoticeContent()" id="notice" class="col fw-bold py-2" style="border-top: 3px solid #007AC3; font-size: 1.1em;">
							공지사항
						</div>
						<div onclick="showReferenceContent()" id="reference" class="col fw-bold py-2" style="background-color: #F5F6F6; font-size: 1.1em;">
							서식자료실
						</div>
						<div class="col-7 py-2" style="background-color: #F5F6F6;"></div>
					</div>
					
					<div class="someWrapper row">
					
					</div>
		
					
					<div id="referenceContent" class="d-none">
						<div class="col info">
							<!-- 반복문 돌곳 -->
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[양식]</span>
									공용 증명 발급 신청서
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									23.04.12
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[서식]</span>
									부정청탁 및 금품등의 수수행위 신고사무 서식
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									21.06.29
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[양식]</span>
									직원 사직서
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									21.03.05
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[총무과]</span>
									물품(구입.제작) 청구 방법
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									19.09.11
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[양식]</span>
									급여 및 수당 계좌 변경신청서
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									19.07.04
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[서식]</span>
									잡부금 반환 신청서
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									17.05.16
								</div>
							</div>
						</div>
					</div>
					<div id="noticeContent" class="d-none">
						<div class="col info">
							<!-- 반복문 돌곳 -->
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[알림]</span>
									 MK대학교 전임교원 교수단체 'MK대 교수그룹' 출범
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									23.12.05
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[노조소식]</span>
									 2023년도 한국 사립대학 교수노동조합 MK대 지회 정기총회 개최
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									23.12.01
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[공고]</span>
									2024년 2월말 퇴직교원 정부포상 공개검증
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									23.11.24
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[모집]</span>
									2023년 장애청소년 나들이 자원봉사자 모집 안내
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									23.11.15
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[공고]</span>
									2023 중앙도서관 온라인 전자정보 박람회 개최
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									23.11.12
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[공고]</span>
									2023학년도 신규직원 채용 최종 결과 발표
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									23.11.08
								</div>
							</div>
						</div>
					</div>
					
				</div>
				
				<!-- 바로가기 -->
				<div class="col-5 shadow bg-white mx-3">
					<div class="row p-2" style="background-color: #E5EFF6">
						<div class="col fw-bold fs-5">
							업무알림
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="row text-center py-2 border-top border-bottom">
								<div class="col-3">
									업무
								</div>
								<div class="col">
									내용
								</div>
								<div class="col-2">
									건수
								</div>
							</div>
							<div class="row text-center py-2">
								<div class="col-3" style="color: #007AC3">
									교육과정
								</div>
								<div class="col text-start text-over-cut">
									교육과정 '인공지능' 추가 부탁드립니다.
								</div>
								<div class="col-2">
									1
								</div>
							</div>
							<div class="row text-center py-2">
								<div class="col-3" style="color: #007AC3">
									강의
								</div>
								<div class="col text-start text-over-cut">
									'Spring 프레임워크 과정' 추가 개설 부탁드립니다.
								</div>
								<div class="col-2">
									1
								</div>
							</div>
							<div class="row text-center py-2">
								<div class="col-3" style="color: #007AC3">
									개선요청
								</div>
								<div class="col text-start text-over-cut">
									'C++언어' 평가 점수 관련 문의사항 있습니다.
								</div>
								<div class="col-2">
									2
								</div>
							</div>
							<div class="row text-center py-2">
								<div class="col-3" style="color: #007AC3">
									강의
								</div>
								<div class="col text-start text-over-cut">
									'자바(JAVA) 입문 과정' 수강 인원 추가 부탁드립니다.
								</div>
								<div class="col-2">
									1
								</div>
							</div>
							<div class="row text-center py-2">
								<div class="col-3" style="color: #007AC3">
									강사
								</div>
								<div class="col text-start text-over-cut">
									교육과정 'JAVA' 강사 추가 모집 부탁드립니다.
								</div>
								<div class="col-2">
									1
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
		</div> <!-- 우측내용 col 끝 -->
            
        
	</div> <!-- main row 끝 -->
	<jsp:include page="../commons/staff/footer.jsp"></jsp:include>
</div>


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>