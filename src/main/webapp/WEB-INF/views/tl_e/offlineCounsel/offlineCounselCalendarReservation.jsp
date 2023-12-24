<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gowun+Dodum&family=Quicksand:wght@300&display=swap" rel="stylesheet">

	<style>
		*{
			font-family: 'Gowun Dodum', sans-serif;
		}
	</style>

	<script>
	
		let myId = ${sessionStudentInfo.student_pk};
		let direction = 'current';
		let currentDate = new Date();
		
		function calendar(direction){
			
			const studentPk = document.querySelector(".studentPk");
			
			const categoryPk = document.querySelector(".categoryPk");
			console.log("cav: "+categoryPk.value);
			
			const counselorPk = document.querySelector(".counselorPk");
			console.log("cov: "+counselorPk.value);
			
			const selectDate = document.querySelector(".selectDate");
			
			const sYear = selectDate.querySelector(".sYear");
			const yearValue = sYear.innerText;
			console.log("yV: "+yearValue);
			
			const sMonth = selectDate.querySelector(".sMonth");
			const monthValue = sMonth.innerText;
			console.log("mV: "+monthValue);
			
			const sDate = selectDate.querySelector(".sDate");
			const dateValue = sDate.innerText;
			console.log("dV: "+dateValue);
			
			const sDay = selectDate.querySelector(".sDay");
			const dayValue = sDay.getAttribute("data-value");
			console.log("dV: "+dayValue);
			
			const sHour = selectDate.querySelector(".sHour");
			const hourValue = sHour.innerText;
			console.log("hV: "+hourValue);
			
			if(yearValue === '' && monthValue === '' && dateValue === ''){
				selectDate.classList.add("text-white");
			}else{
				selectDate.classList.remove("text-white");
			}
			
			const parameterDate = yearValue + "." + monthValue + "." + dateValue + "." + hourValue + "." + dayValue;
			console.log("파라메터: "+ parameterDate);
			
			const text = document.querySelector(".text");
			const textValue = text.value;
			console.log("textValue: "+textValue);

			
			url = "./categoryAndCounselorName?categoryPk="+categoryPk.value + "&counselorPk=" + counselorPk.value;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const result = response.data;
				
				const categoryName = document.querySelector(".categoryName");
				categoryName.innerText = result.categoryDto.name;
				
				const counselorName = document.querySelector(".counselorName");
				counselorName.innerText = result.counselorDto.name;
				
			});
			
			console.log("d: "+direction);
			const calendarBox = document.getElementById("calendarBox");
			calendarBox.innerHTML = "";
			let currentRow;
			
			let modifiedDate = new Date(currentDate);
		  	
		  	let firstDayOfMonth;
		  	let lastDayOfPreviousMonth;
		  	let lastDayOfMonth;
		  	let firstDayOfNextMonth;
		  	let firstDayOfMonthOfDay;

			
			<%-- 달력 출력하기: 지날 달, 이번 달, 다음 달 같이 출력 --%>
			
			if(direction === 'previous'){
				
				modifiedDate.setMonth(modifiedDate.getMonth() - 1);
				currentDate = modifiedDate;

			}else if(direction === 'next'){
				
				modifiedDate.setMonth(modifiedDate.getMonth() + 1);
				currentDate = modifiedDate;
			}
			
		  	firstDayOfMonth = new Date(modifiedDate.getFullYear(), modifiedDate.getMonth(), 1);
		  	lastDayOfPreviousMonth = new Date(firstDayOfMonth.getFullYear(), firstDayOfMonth.getMonth(), 0);
		  	lastDayOfMonth = new Date(modifiedDate.getFullYear(), modifiedDate.getMonth() + 1, 0);
		  	firstDayOfNextMonth = new Date(modifiedDate.getFullYear(), modifiedDate.getMonth() + 1, 1);
		  	firstDayOfMonthOfDay = firstDayOfMonth.getDay();
					  	
		  	console.log("Current: "+modifiedDate);
		  	console.log("지난 달 마지막 날 : "+lastDayOfPreviousMonth.getDate());
		  	console.log("이번 달 첫 요일 : "+firstDayOfMonthOfDay);
		  	console.log("이번 달 첫째 날 : "+firstDayOfMonth.getDate());
		  	console.log("이번 달 마지막 날 : "+lastDayOfMonth.getDate());
		  	
			const year = modifiedDate.getFullYear();
			console.log("y: "+year);
			const month = modifiedDate.getMonth() + 1;
			console.log("m: "+month);
			
			const calendarYear = document.querySelector('.calendarYear');
			calendarYear.innerText = year;
			
			const calendarMonth = document.querySelector('.calendarMonth');
			calendarMonth.innerText = month;

			const arrCalendar = [];
			
			for(let i = ((lastDayOfPreviousMonth.getDate() - firstDayOfMonthOfDay) + 1); i <= lastDayOfPreviousMonth.getDate(); i++){
				arrCalendar.push(i);
				console.log("a: "+arrCalendar);
			}
			
			for(let i = firstDayOfMonth.getDate(); i <= lastDayOfMonth.getDate(); i++){
				arrCalendar.push(i);
			}
			
			let filledCount = 0;
			for (let i = 0; i < 42; i++) {
			    if (arrCalendar[i] !== undefined) {
			        filledCount++;
			    }
			}
			
			console.log("fillC: "+filledCount);
			
			const remainingSpace = 42 - filledCount;
			
			console.log("reSpace: "+remainingSpace);
			
			for(let i = firstDayOfNextMonth.getDate(); i <= remainingSpace; i++){
				arrCalendar.push(i);
			}
			
	        const today = new Date();
	        const threeMonthsLater = new Date();
	        threeMonthsLater.setMonth(threeMonthsLater.getMonth() + 2);
	         
	        for(let i = 1; i <= arrCalendar.length; i++){
	            
	            const currentDay = new Date(year, month - 1, arrCalendar[i - 1]).getDay();
	            const currentDate = new Date(year, month - 1, arrCalendar[i - 1]);
	            const currentMonth = today.getMonth();
	            
	                if (i % 7 === 1) {
	                    currentRow = document.createElement("div");
	                    currentRow.classList.add("row", "row-cols-7");
	                    calendarBox.appendChild(currentRow);
	                }
	            
	            const dateCol = document.querySelector("#templete .dateCol").cloneNode(true);
	            const currentNum = arrCalendar[i - 1];
				
	            if (currentDay === 0 || currentDay === 6) {
	                // 주말인 경우 선택 못하도록 비활성화
	                dateCol.classList.add('text-secondary');
	                dateCol.style.pointerEvents = "none"; // 클릭 이벤트 비활성화
	            }
	            
	            dateCol.innerText = currentNum;
	            
	            if (i <= firstDayOfMonth.getDay() && currentMonth === (month - 1)) {
	                 // 현재 날짜 기준 이전 달의 날짜 비활성화 & bg 컬러 변경 
	                let prevMonthYear = modifiedDate.getFullYear();
	                let prevMonth = modifiedDate.getMonth();
	                if (prevMonth === 0) {
	                    prevMonth = 12;
	                    prevMonthYear--;
	                }
	                dateCol.classList.add('text-secondary');
	                dateCol.style.backgroundColor = "#f2f1f1";
	            }else if (i <= firstDayOfMonth.getDay()) {
	                 // 이전 달의 날짜 text-secondary 변경
	                let prevMonthYear = modifiedDate.getFullYear();
	                let prevMonth = modifiedDate.getMonth();
	                if (prevMonth === 0) {
	                    prevMonth = 12;
	                    prevMonthYear--;
	                }
	                dateCol.classList.add('text-secondary');
	                dateCol.setAttribute("onclick", "showModal(" + prevMonthYear + "," + prevMonth + "," + arrCalendar[i - 1] + "," + currentDay + "," + counselorPk.value + ")");
	            }else if (i > (lastDayOfMonth.getDate() + firstDayOfMonth.getDay())) {
	                // 다음 달의 날짜 활성화 & text-secondary 변경
	                let nextMonthYear = modifiedDate.getFullYear();
	                let nextMonth = modifiedDate.getMonth() + 2;
	                if (nextMonth === 13) {
	                    nextMonth = 1;
	                    nextMonthYear++;
	                }
	                dateCol.classList.add('text-secondary');
	                dateCol.setAttribute("onclick", "showModal(" + nextMonthYear + "," + nextMonth + "," + arrCalendar[i - 1] + "," + currentDay + "," + counselorPk.value + ")");
	                if(modifiedDate.getTime() > threeMonthsLater.getTime() && i > (lastDayOfMonth.getDate() + firstDayOfMonth.getDay())){
	                   dateCol.removeAttribute("onclick");
	                }
	            }else if (today.getFullYear() === year && today.getMonth() === month - 1 && arrCalendar[i - 1] < today.getDate()) {
	                // 이번 달의 오늘 이전의 날짜인 경우, 비활성화
	                dateCol.classList.add('text-secondary');
	                dateCol.style.backgroundColor = "#f2f1f1";
	            }else {
	                // 나머지 날짜는 활성화
	                dateCol.setAttribute("onclick", "showModal(" + year + "," + month + "," + arrCalendar[i - 1] + "," + currentDay + "," + counselorPk.value + ")");
	            }
	            
	            currentRow.appendChild(dateCol);
	        }
	        
	        
			const previousMonthBtn = document.querySelector(".previousMonthBtn");
			
		    if (currentDate.getMonth() === today.getMonth()) {
		        previousMonthBtn.disabled = true;
		    } else {
		        previousMonthBtn.disabled = false;
		        previousMonthBtn.setAttribute("onclick", "previousMonth()");
		    }
			
		    const nextMonthBtn = document.querySelector(".nextMonthBtn");
		    
		    if(modifiedDate <= threeMonthsLater){
		    	nextMonthBtn.disabled = false;
		    	nextMonthBtn.setAttribute("onclick", "nextMonth()");
		    }else{
		    	nextMonthBtn.disabled = true;
		    }
			
			const reservationBtn = document.querySelector(".reservationBtn");
			
			reservationBtn.onclick = function() {
			    const text = document.querySelector(".text").value;
			    checkDuplication(studentPk.value, categoryPk.value, counselorPk.value, text, parameterDate);
			};
			
		}
		
		
		
		function previousMonth(){
			calendar('previous');
		}
		
		function nextMonth(){
			calendar('next');
		}
		
		function showModal(year, month, date, day, counselorPk){
			
			console.log("my: "+year);
			console.log("mm: "+month);
			console.log("md: "+date);
			console.log("mday: "+day);
			
            const writeModal = bootstrap.Modal.getOrCreateInstance("#writeModal");  // 매개변수로 질의 사용
            const writeModalElement = document.querySelector("#writeModal");
			
			const url = "./isPossibleReservation?counselor_id=" + counselorPk;
            
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
	            const todayYear = writeModalElement.querySelector(".todayYear");
	            todayYear.innerText = year;
	            
	            const todayMonth = writeModalElement.querySelector(".todayMonth");
	            todayMonth.innerText = month;
	            
	            const todayDate = writeModalElement.querySelector(".todayDate");
	            todayDate.innerText = date;
	            
	            const modalTimeBox = writeModalElement.querySelector(".modalTimeBox");
	            modalTimeBox.innerHTML = "";
	            
				for(let i = 9; i <= 17; i++){
					
					const modalTimeWrapper = document.querySelector("#templete .modalTimeWrapper").cloneNode(true);
					const timeBtn = modalTimeWrapper.querySelector(".timeBtn");
					
					if(i == 12){
						continue;
					}
					
					timeBtn.value = i + ":00"
					
					const a = year + '.' + month + '.' + date + '.' + i + '.' + day;
					
					
					for(e of response.data){
						
						console.log("a: "+a);
						console.log("있는 예약: "+e.DATE_VALUE);
						
						if(e.DATE_VALUE == a){
							timeBtn.disabled = true;
						}

					}
					
					const saveBtn = writeModalElement.querySelector('.saveBtn');
					
					timeBtn.addEventListener("click", function() {
						
						timeBtn.classList.toggle("btn-dark");
					    timeBtn.classList.toggle("btn-outline-dark");
					    timeBtn.classList.toggle("text-white");

				        saveBtn.onclick = function() {
				            save(year, month, date, i, day);
				        };
				    });
					
					modalTimeBox.appendChild(modalTimeWrapper);
				}
				
			});
            
            writeModal.show();
			
		}
		
		function save(year, month, date, hour, day){
			
			const studentPk = document.querySelector(".studentPk");
			const student = studentPk.value;
			
			const categoryPk = document.querySelector(".categoryPk");
			const category = categoryPk.value;
			
			const counselorPk = document.querySelector(".counselorPk");
			const counselor = counselorPk.value;
			
			console.log("dv: "+year);
			console.log("dv: "+month);
			console.log("dv: "+date);
			console.log("dv: "+hour);
			console.log("dv: "+day);
			
			const sYear = document.querySelector(".sYear");
			sYear.innerText = year;
			const sMonth = document.querySelector(".sMonth");
			sMonth.innerText = month;
			const sDate = document.querySelector(".sDate");
			sDate.innerText = date;
			
			const sDay = document.querySelector(".sDay");
			
			if(day == 0){
				sDay.innerText = '일';
			}else if(day == 1){
				sDay.innerText = '월';
			}else if(day == 2){
				sDay.innerText = '화';
			}else if(day == 3){
				sDay.innerText = '수';
			}else if(day == 4){
				sDay.innerText = '목';
			}else if(day == 5){
				sDay.innerText = '금';
			}else if(day == 6){
				sDay.innerText = '토';
			}
			sDay.setAttribute("data-value", day);
			
			const sHour = document.querySelector(".sHour");
			sHour.innerText = hour;
			
			closeModal();
			calendar(direction);
			
		}
		
		function closeModal(){
			
            const writeModal = bootstrap.Modal.getOrCreateInstance("#writeModal");  // 매개변수로 질의 사용
            const writeModalElement = document.querySelector("#writeModal");
			
            writeModal.hide();
			
		}
		
		function checkDuplication(studentPk, categoryPk, counselorPk, text, date){
			
			const sYear = document.querySelector(".sYear");
			const sMonth = document.querySelector(".sMonth");
			const sDate = document.querySelector(".sDate");
			const sDay = document.querySelector(".sDay");
			let dayValue = sDay.getAttribute("data-value");
			const sHour = document.querySelector(".sHour");
			const textValue = document.querySelector(".text");
			
			url = "./isPossibleReservation?counselor_id=" + counselorPk;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				let isDuplicate = false;
				
				for(e of response.data){
					
					console.log("있는 예약: "+e.DATE_VALUE);
					console.log("date: "+date);
					
					if(e.DATE_VALUE == date){
						
						isDuplicate = true;
						alert("이미 예약이 완료된 일정입니다. 일정을 다시 선택해주세요.");
						
						sYear.innerText = "";
						sMonth.innerText = "";
						sDate.innerText = "";
						sDay.innerText = "";
						dayValue = "";
						sHour.innerText = "";
						textValue.value = "";

						calendar('current');

						break;
					}
				}
				
				if(isDuplicate == false){
					reservationRegister(studentPk, categoryPk, counselorPk, text, date);
				}
				
			});
			
		}
		
		
		function reservationRegister(studentPk, categoryPk, counselorPk, text, date){
			
			console.log("text: "+text);
			
			url = "./reservationCalendarProcess?student_pk=" + studentPk + "&counselor_id=" + counselorPk + "&type_category_id=" + categoryPk + "&text=" + text + "&reservationDate=" + date;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const result = response.data;
				const categoryName = result.typeCategoryDto.name;
				const counselorName = result.counselorDto.name;
				const year = result.offlineReservationDto.counsel_year;
				const month = result.offlineReservationDto.counsel_month;
				const date = result.offlineReservationDto.counsel_date;
				const day = result.dayString;
				const hour = result.offlineReservationDto.counsel_hour;
				
				const newPageUrl = './counselReservationCompletedPage?categoryName=' + categoryName + "&counselorName=" + counselorName + "&year=" + year + "&month=" + month + "&date=" + date + "&day=" + day + "&hour=" + hour;

			     window.location.href = newPageUrl;
				
			});

		}
		
		
		window.addEventListener("DOMContentLoaded", () => {
			calendar(direction);
		});
	
	</script>


</head>
<body>
	
	<div class="container-fluid">
	
		<div class="row">
			<div class="col">
				<jsp:include page="../commons/studentTopArea.jsp"></jsp:include>
			</div>
		</div>	
		
		<!-- 상단 배너 -->
		<div class="row">
		    <div class="col mx-0 px-0" style="height: 35em; position: relative;">
		        <img class="banner img-fluid" src="/toothless/resources/img/groupCounsel/fff.jpg" style="width: 100%; height: 100%;">
		
		        <div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height: 100%; position: absolute; bottom: 0; left: 0;"></div>
		
		        <div class="title-text" style="font-size: 4em; color: white; position: absolute; bottom: 48%; left: 20.5%; transform: translate(-50%, 50%);">오프라인 상담</div>
		
		        <div style="color: white; position: absolute; font-size: 5em; bottom: 36%; transform: translate(-50%, -50%); text-align: center; left: -8%; border-top: 1px; border-top-style: solid; border-top-color: white; width: 80%;"></div>
		
		        <div style="color: white; position: absolute; font-size: 1.4em; bottom: 24.5%; transform: translate(-50%, -50%); text-align: center; left: 19.6%;">너와 나 그리고 우리를 위한 마음을 위한 치료</div>
		
		        <div style="color: white; position: absolute; font-size: 1.4em; bottom: 17.5%; transform: translate(-50%, -50%); text-align: center; left: 24.2%;">마음도 관리가 필요합니다</div>
		
		        <div style="height: 17em; width: 18em; border-radius: 0px 50px 0px 0px; background-color: #679467; opacity: 0.9; position: absolute; bottom: -24.2%; transform: translate(-50%, -50%); text-align: center; left: 85%;"></div>
		
		        <div style="font-weight: 900; color: #464646; position: absolute; font-size: 1.5em; bottom: 34%; transform: translate(-50%, -50%); text-align: center; left: 82%;">Contact Us</div>
		
		        <div style="font-weight: 900; color: white; position: absolute; font-size: 2.6em; bottom: 10%; transform: translate(-50%, -50%); text-align: center; left: 84%;">1544-3054</div>
		
		        <div style="color: white; position: absolute; font-size: 0.9em; bottom: 8%; transform: translate(-50%, -50%); text-align: center; left: 83.5%;">E-mail. mkmk@naver.com</div>
		
		        <div style="color: white; position: absolute; font-size: 0.9em; bottom: 3%; transform: translate(-50%, -50%); text-align: center; left: 82.5%;">Tel. 010-4097-3054</div>
		    </div>
		</div>
	
		<!-- 본문 -->
		<div class="row">
			<div class="col-2"></div>
			<div class="col">
				<div class="row pt-5 mt-5">
					<div class="col text-center py-2 fs-5 border border-white border-1 rounded" style="background-color: #b6dbb6;">
						STEP <i class="bi bi-1-circle"></i> 상담원 선택
					</div>
					<div class="col text-center text-white py-2 fs-5 border border-white border-1 rounded" style="background-color: #679467;">
						STEP <i class="bi bi-2-circle"></i> 일정 선택
					</div>
					<div class="col text-center py-2 fs-5 border border-white border-1 rounded" style="background-color: #b6dbb6;">
						STEP <i class="bi bi-3-circle"></i> 예약 완료
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		
		<!-- 상담원 정보 -->
		<div class="row mt-5">
			<div class="col-2"></div>
			<div class="col">
				<i class="bi bi-info-circle-fill fs-5"></i>
				<span class="fw-bold fs-4">&nbsp;&nbsp;상담원 정보</span>
			</div>
			<div class="col-2"></div>
		</div>
		<div class="row pt-4">
			<div class="col-2"></div>
			<div class="col border border-dark rounded">
				<div class="row border-bottom border-dark fs-5 fw-bold rounded" style="background-color: rgb(246, 246, 242);">
					<div class="col-3 ps-4 py-2 border-end border-dark">
						상담사명
					</div>
					<div class="col-9 py-2 ps-4">
						경력사항
					</div>
				</div>
				<div class="row">
					<div class="col-3 border-end border-dark">
						<div class="row">
							<div class="col pt-4 px-4">
								<img class="img-fluid" src="../../resources/img/counselorImage/${counselorDto.profileImage }">
							</div>
						</div>
						<div class="row pt-4 pb-3">
							<div class="col text-center fs-4">
								${counselorDto.name }
							</div>
						</div>
					</div>
					<div class="col-9 py-4 ps-4">
						${counselorDto.career }
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		
		<div class="row pt-5 mt-5">
			<div class="col-2"></div>
			<div class="col">
				<i class="bi bi-info-circle-fill fs-5"></i>
				<span class="fw-bold fs-4">&nbsp;&nbsp;예약 일정</span>
			</div>
			<div class="col-2"></div>
		</div>
		
		<!-- 일정(7일) -->
		<div class="row pt-3">
			<div class="col-2"></div>
			<div class="col">
				<div class="row">
					<div class="col">
						<div class="row">
							<div class="col text-end pt-1">
								<input class="previousMonthBtn btn btn-outline-dark" type="button" value="&lt">
							</div>
							<div class="col-3 text-center fs-3 fw-bold">
								<span class="calendarYear">2023</span>년 <span class="calendarMonth">12</span>월
							</div>
							<div class="col text-start pt-1">
								<input class="nextMonthBtn btn btn-outline-dark" type="button" value="&gt">
							</div>
						</div>
						<div class="row mt-5">
							<div class="col text-center fw-bold border">
								Sun
							</div>
							<div class="col text-center fw-bold border">
								Mon
							</div>
							<div class="col text-center fw-bold border">
								Tue
							</div>
							<div class="col text-center fw-bold border">
								Wed
							</div>
							<div class="col text-center fw-bold border">
								Thu
							</div>
							<div class="col text-center fw-bold border">
								Fri
							</div>
							<div class="col text-center fw-bold border">
								Sat
							</div>
						</div>
						<div class="row">
							<div id="calendarBox" class="col">
								
							</div>
						</div>
					</div>
					<div class="col-4 ps-5 mt-5">
						<div class="row mt-5">
							<div class="col fs-4 fw-bold">
								<i class="bi bi-info-circle-fill fs-5"></i>&nbsp;&nbsp;예약 날짜
							</div>
						</div>
						<div class="row pt-3">
							<div class="selectDate fs-5 col">
								<span class="sYear"></span>년&nbsp;<span class="sMonth"></span>월&nbsp;
								<span class="sDate"></span>일(<span class="sDay"></span>)&nbsp;
								<span class="sHour"></span>시 
							</div>
						</div>
						<div class="row pt-4 fw-bold">
							<div class="col fs-4">
								<i class="bi bi-info-circle-fill fs-5"></i>&nbsp;&nbsp;상담 종류
							</div>
						</div>
						<div class="row pt-3">
							<div class="categoryName col fs-5">
								&nbsp;&nbsp;&nbsp;&nbsp;우울/불안 문제
							</div>
						</div>
						<div class="row pt-4 fw-bold">
							<div class="col fs-4">
								<i class="bi bi-info-circle-fill fs-5"></i>&nbsp;&nbsp;상담사명
							</div>
						</div>
						<div class="row pt-3">
							<div class="counselorName col fs-5">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김현영
							</div>
						</div>
						<div class="row pt-4 fw-bold">
							<div class="col fs-4">
								<i class="bi bi-info-circle-fill fs-5"></i>&nbsp;&nbsp;남기고 싶은 말
							</div>
						</div>
						<div class="row pt-4">
							<div class="col fs-5 d-grid px-0">
								<textarea class="text rounded" rows="8"></textarea>
							</div>
						</div>
						<div class="row pt-3">
							<div class="col d-grid px-0">
								<input class="studentPk" name="student_pk" type="hidden" value="${sessionStudentInfo.student_pk }">
								<input class="categoryPk" name="type_category_id" type="hidden" value="${categoryId }">
								<input class="counselorPk" name="counselor_id" type="hidden" value="${counselorId }">
								<input class="reservationBtn btn btn-lg text-white" type="button" value="신청하기" style="background-color: #679467;">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		<pre>
		
		
		
		</pre>
		<div class="row mt-5" style="background-color: #5a5a5a; height: 14em;">
			<div class="col-1"></div>
			<div class="col">
				<div class="row" style="height: 4em;"></div>
				<div class="row">
					<div class="col">
						<span style="font-size: 1.4em; color: #FF8200; font-weight: 500;">개인정보처리방침</span>
						<span style="font-size: 1.2em; color: white; font-weight: 500;">▪</span>
						<span style="font-size: 1.2em; color: white; font-weight: 500;">이메일무단수집거부</span>
					</div>
				</div>
				<div class="row pt-4">
					<div class="col">
						<div class="fw-bold" style="color:#d2d2d2; font-size: 0.9em;">서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층) / 대표자:정현경 / 사업자등록번호:220-90-07535 / 통신판매번호:제 강남-8062호 / TEL:02-561-1911 / FAX:02-538-2613</div>
					</div>
				</div>
				<div class="row pt-2">
					<div class="col">
						<div class="fw-bold" style="color:#d2d2d2; font-size: 0.9em;">©2023 MK NATIONAL UNIVERSITY. ALL RIGHTS RESERVED.</div>
					</div>
				</div>
				<div class="row pt-4" style="border-bottom-style: solid; border-bottom-color: gray; border-bottom-width: 1px;"></div>
			</div>
			<div class="col-1"></div>
		</div>
	
	</div>
	
	<!-- ★★★템플릿!!★★★ -->
	<div id="templete" class="d-none">
		<div class="dateCol col border" style="height: 7em; vertical-align: top; display: flex; justify-content: flex-end; align-items: flex-start;">
			
		</div>
		<div class="modalTimeWrapper col-3 d-grid my-2">
			<input type="button" class="timeBtn btn btn-outline-dark py-2">
		</div>
	</div>
	
	        <!-- Modal, Offcanvas : container 밖으로 빼놓기(왜? fixed option), 꼭! js로 띄우기 -->
        <div id="writeModal" class="modal" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title fw-bold fs-2 px-3 py-2">일정 선택</h5>
                  <input type="button" onclick="closeModal()" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                </div>
                <div class="modal-body">
					<div class="row py-3">
						<div class="col fs-4 ps-4">
							<span class="todayYear">2023</span>년 <span class="todayMonth">12</span>월 <span class="todayDate">20</span>일
						</div>
					</div>
					<hr>
					<div class="row py-3">
						<div class="col">
							<div class="modalTimeBox row">
								
							</div>
						</div>
					</div>
				</div>
                <div class="modal-footer">
                  <input onclick="closeModal()" type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="닫기">
                  <button onclick="save()" class="saveBtn btn btn-dark">신청하기</button>
                  <%-- 
                  <input onclick="save()" type="button" class="reservationBtn btn btn-primary" value="신청하기">
                  --%>
                </div>
              </div>
            </div>
          </div>
	



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>