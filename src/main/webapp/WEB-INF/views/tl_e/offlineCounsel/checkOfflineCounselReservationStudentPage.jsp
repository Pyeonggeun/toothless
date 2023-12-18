<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	
	<script>
		
		let myId = ${sessionStudentInfo.student_pk};
		let pageNum = 1;
		
		function reloadReservationList(pageNum, counselorNameValue = 0, selectDateType = 0, datevalue = 0, categoryValues = 0, stateType = 0){
			
			console.log("reloadPageNum: "+pageNum);
			
			const url = "./getReservationList?student_pk=" + myId + "&pageNum=" + pageNum
					+ "&counselorNameValue=" + counselorNameValue + "&selectDateType=" + selectDateType
					+ "&datevalue=" + datevalue + "&categoryValues=" + categoryValues + "&stateType=" + stateType;
			
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				let index = 1;
				
				const reservationListBox = document.getElementById("reservationListBox");
				reservationListBox.innerHTML = "";
				
				for(e of response.data){
					
					const reservationDataWrapper = document.querySelector("#templete .reservationDataWrapper").cloneNode(true);
					
					const reservationNo = reservationDataWrapper.querySelector(".reservationNo");
					reservationNo.innerText = index;
					index++;
					
					const reservationCategoryName = reservationDataWrapper.querySelector(".reservationCategoryName");
					reservationCategoryName.innerText = e.typeCategoryDto.name;
					
					const reservationCounselorName = reservationDataWrapper.querySelector(".reservationCounselorName");
					reservationCounselorName.innerText = e.counselorDto.name;
					
					const reservationCreatedAt = reservationDataWrapper.querySelector(".reservationCreatedAt");
					
					const date = new Date(e.offlineReservationDto.created_at);
					
					reservationCreatedAt.innerText = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + " " + date.getHours() + ":00";
					
					const reservationState = reservationDataWrapper.querySelector(".reservationState");
					reservationState.innerText = e.offlineReservationDto.state;
					
					const reservationDate = reservationDataWrapper.querySelector(".reservationDate");
					reservationDate.innerText = e.offlineReservationDto.counsel_year + "-" + e.offlineReservationDto.counsel_month + "-" + e.offlineReservationDto.counsel_date + " " + e.offlineReservationDto.counsel_hour + ":00";
					
					const canceledReservation = reservationDataWrapper.querySelector(".canceledReservation");
					
					canceledReservation.setAttribute("onclick", "updateReservationStatus("+e.offlineReservationDto.id+")");
					
					if(e.offlineReservationDto.state == "완료"){
						canceledReservation.disabled = true;
						canceledReservation.classList.replace("btn-danger","btn-outline-danger");
					}else if(e.offlineReservationDto.state == "취소" || e.offlineReservationDto.state == "노쇼"){
						canceledReservation.disabled = true;
						canceledReservation.value = "취소완료";
						canceledReservation.classList.replace("btn-danger","btn-outline-danger");
					}
					
					const createReview = reservationDataWrapper.querySelector(".createReview");
					
					<%-- 포워딩 방식으로 하고 싶을 때 a태그 걸고 링크 이동
					const showReview = reservationDataWrapper.querySelector(".showReview");
					showReview.setAttribute("href", "./counselReviewPage?reservation_id="+e.offlineReservationDto.id);
					--%>
					
					createReview.setAttribute("onclick", "showModal("+e.offlineReservationDto.id+")");
					
					if(e.offlineSurveyDto != null){
						createReview.value = "리뷰확인";
					}else {
						if(e.offlineReservationDto.state == "완료"){
							createReview.value = "리뷰작성";
							createReview.classList.replace("btn-dark", "btn-outline-dark");
						}else {
							createReview.value = "리뷰작성";
							createReview.disabled = true;
							createReview.classList.replace("btn-dark", "btn-outline-dark");
						}
					}
					reservationListBox.appendChild(reservationDataWrapper);
				}
			});
		}
		
		function updateReservationStatus(reservationId){
			
			const url = "./reservationCancelProcess?reservation_id=" + reservationId;
			fetch(url)
			.then(response => response.json())
			.then(response => {
				reloadReservationList(pageNum);
			});
			
		}
		
		function showModal(reservationId){
			
            const writeModal = bootstrap.Modal.getOrCreateInstance("#writeModal");  // 매개변수로 질의 사용
            const writeModalElement = document.querySelector("#writeModal");
            const reviewRegister = writeModalElement.querySelector(".reviewRegister");
            
            const url = "./counselReviewModal?reservation_id=" + reservationId;
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const modalValues = response.data;
				
				if(modalValues.offlineSurveyDto != null){
					
					const counselDate = writeModalElement.querySelector(".counselDate");
					counselDate.innerText = modalValues.offlineReservationDto.counsel_year + "-" + modalValues.offlineReservationDto.counsel_month 
						+ "-" + modalValues.offlineReservationDto.counsel_date + " " + modalValues.offlineReservationDto.counsel_hour + ":00";
					
					const counselorName = writeModalElement.querySelector(".counselorName");
					counselorName.innerText = modalValues.counselorDto.name;
					
					
					const reviewScoreBox = writeModalElement.querySelector(".reviewScoreBox");
					reviewScoreBox.innerHTML = "";
					reviewScoreBox.classList.add("text-warning");

					for(let i = 1; i <= 5; i++){
						if(modalValues.offlineSurveyDto.score == i){
							let a = '★'.repeat(i);
							reviewScoreBox.innerText = a;
						}
					}
					
					const categoryName = writeModalElement.querySelector(".categoryName");
					categoryName.innerText = modalValues.typeCategoryDto.name;
					
					const reviewContentBox = writeModalElement.querySelector(".reviewContentBox");
					reviewContentBox.innerHTML = "";
					reviewContentBox.innerText = modalValues.offlineSurveyDto.text;
					
					reviewRegister.disabled = true;
					
				}else{
					const counselDate = writeModalElement.querySelector(".counselDate");
					counselDate.innerText = modalValues.offlineReservationDto.counsel_year + "-" + modalValues.offlineReservationDto.counsel_month 
						+ "-" + modalValues.offlineReservationDto.counsel_date + " " + modalValues.offlineReservationDto.counsel_hour + ":00";
					
					const counselorName = writeModalElement.querySelector(".counselorName");
					counselorName.innerText = modalValues.counselorDto.name;
					
					const categoryName = writeModalElement.querySelector(".categoryName");
					categoryName.innerText = modalValues.typeCategoryDto.name;
					
					const reviewScoreBox = writeModalElement.querySelector(".reviewScoreBox");
					const reviewScore = document.createElement("select");
					reviewScore.classList.add(".reviewScore");
					reviewScore.classList.add("form-select");
					reviewScore.classList.add("text-warning");
					reviewScoreBox.appendChild(reviewScore);
					
					const option1 = document.createElement("option");
					option1.setAttribute("value", 5);
					option1.innerText = "★★★★★";
					reviewScore.appendChild(option1);
					
					const option2 = document.createElement("option");
					option2.setAttribute("value", 4);
					option2.innerText = "★★★★";
					reviewScore.appendChild(option2);
					
					const option3 = document.createElement("option");
					option3.setAttribute("value", 3);
					option3.innerText = "★★★";
					reviewScore.appendChild(option3);
					
					const option4 = document.createElement("option");
					option4.setAttribute("value", 2);
					option4.innerText = "★★";
					reviewScore.appendChild(option4);

					const option5 = document.createElement("option");
					option5.setAttribute("value", 1);
					option5.innerText = "★";
					reviewScore.appendChild(option5);

					
					const reviewContentBox = writeModalElement.querySelector(".reviewContentBox");
					const reviewContent = document.createElement("textarea");
					reviewContent.classList.add("form-control");
					reviewContent.classList.add("reviewContent");
					reviewContent.rows = 5;
					reviewContentBox.appendChild(reviewContent);
					
					reviewRegister.addEventListener("click", function(){
						
						const id = modalValues.offlineReservationDto.id;
						const scoreValue = reviewScore.value;
						const contentValue = reviewContent.value;
						
						save(id, scoreValue, contentValue);
					});
					
				}
				
			});
			
			const xClose = writeModalElement.querySelector(".xClose");
			xClose.setAttribute("onclick", "closeModal()");
			
			const closeBtn = writeModalElement.querySelector(".closeBtn");
			closeBtn.setAttribute("onclick", "closeModal()");
			
			writeModal.show();  // show() & hide()
			
		}
		
		function save(reservation_id, scoreValue, contentValue){
			
			const url = "./counselReviewProcess?reservation_id=" + reservation_id + "&score=" + scoreValue + "&text=" + contentValue;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				search();
				<%--
				reloadReservationList(pageNum);
				--%>
				closeModal();
			});
			
		}
		
		function closeModal() {
			
			const writeModalElement = document.querySelector("#writeModal");
			const modal = bootstrap.Modal.getOrCreateInstance("#writeModal");
			const reviewRegister = writeModalElement.querySelector(".reviewRegister");
			
			// 모달 값 초기화는 모달창 닫는 function에서 실행
			writeModalElement.querySelector(".counselDate").innerText = "";
			writeModalElement.querySelector(".counselorName").innerText = "";
			writeModalElement.querySelector(".categoryName").innerText = "";
			writeModalElement.querySelector(".reviewScoreBox").innerHTML = "";
			writeModalElement.querySelector(".reviewContentBox").innerHTML = "";
			reviewRegister.disabled = false;
			
			modal.hide();
			
		}
		
		
		function createPageNum(pageNum, counselorNameValue = 0, selectDateType = 0, datevalue = 0, categoryValues = 0, stateType = 0){
			
			const url = "./studentTotalCounselCount?counselorNameValue=" + counselorNameValue + "&selectDateType=" + selectDateType
			+ "&datevalue=" + datevalue + "&categoryValues=" + categoryValues + "&stateType=" + stateType;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const totalCount = response.data;
				const totalPageNum = Math.ceil(totalCount / 10);
				
				let startPageNum = (Math.floor((pageNum - 1) / 5) * 5) + 1;
				let endPageNum = (Math.floor((pageNum - 1) / 5) + 1) * 5;
				
				if(endPageNum > totalPageNum) {
					endPageNum = totalPageNum;
				}
				
				const pagination = document.querySelector(".pagination");
				const pageNumbers = document.querySelectorAll('.pagination .page-item:not(.startPageNumli):not(.endPageNumli)');
				
				const startPageNumber = pagination.querySelector(".startPageNumber");
				
				if(startPageNum <= 1){
					startPageNumber.disabled = true;
					startPageNumber.classList.add('bg-secondary-subtle');
				}else{
					startPageNumber.classList.remove("bg-secondary-subtle");
					
					startPageNumber.addEventListener("click", function() {
	                    setPageNum((startPageNum - 1), counselorNameValue, selectDateType, datevalue, categoryValues, stateType);
	                });
					
					<%--
					startPageNumber.setAttribute("onclick", "setPageNum("+(startPageNum - 1)+","+counselorNameValue+","+selectDateType+","+datevalue+","+categoryValues+","+stateType+")");
					--%>
					
					for (e of pageNumbers) {
				        e.remove();
				    }
				}
				
				const pageNumli = document.createElement('li');
				
				for(let i = startPageNum; i <= endPageNum; i++){
					
					const pageNumWrapper = pageNumli.cloneNode(true);
					pageNumWrapper.classList.add('page-item');

	                const currentPageNumber = document.createElement('a');
	                currentPageNumber.classList.add('page-link', 'text-dark');
	                currentPageNumber.innerText = i;
	                
	                console.log("상담원명: "+counselorNameValue);
	                console.log("날짜타입: "+selectDateType);
	                console.log("날짜값: "+datevalue);
	                console.log("상태타입: "+stateType);
	                console.log("카테고리타입: "+categoryValues);
	                
	                currentPageNumber.addEventListener("click", function() {
	                    setPageNum(i, counselorNameValue, selectDateType, datevalue, categoryValues, stateType);
	                });
	                
	                <%--
	                currentPageNumber.setAttribute("onclick", "setPageNum("+i+","+counselorNameValue+","+selectDateType+","+datevalue+","+categoryValues+","+stateType+")");
	                --%>
	                
	                pageNumWrapper.appendChild(currentPageNumber);
	                pagination.insertBefore(pageNumWrapper, pagination.querySelector('.endPageNumli'));

	                if(pageNum == i){
	                	currentPageNumber.classList.add('bg-primary-subtle');
	                }else{
	                	currentPageNumber.classList.remove('bg-primary-subtle');
	                }
				}
				
				for (e of pageNumbers) {
			        e.remove();
			    }
				
				const endPageNumber = pagination.querySelector(".endPageNumber");
				
				if(endPageNum >= totalPageNum){
					endPageNumber.disabled = true;
					endPageNumber.removeAttribute("onclick");
					endPageNumber.classList.add("bg-secondary-subtle");
				}else {
					endPageNumber.classList.remove("bg-secondary-subtle");
					
					endPageNumber.addEventListener("click", function() {
	                    setPageNum((endPageNum - 1), counselorNameValue, selectDateType, datevalue, categoryValues, stateType);
	                });

					<%--
					endPageNumber.setAttribute("onclick", "setPageNum("+(endPageNum - 1)+","+counselorNameValue+","+selectDateType+","+datevalue+","+categoryValues+","+stateType+")");
					--%>
					
					for (e of pageNumbers) {
				        e.remove();
				    }
				}
				
			});
			
		}
		
		function setPageNum(clickedPage, counselorNameValue = 0, selectDateType = 0, datevalue = 0, categoryValues = 0, stateType = 0){
			
			pageNum = clickedPage;
			console.log("setPageNum(): "+pageNum);
			console.log("counselorNameValue(): "+counselorNameValue);
			console.log("selectDateType(): "+selectDateType);
			console.log("datevalue(): "+datevalue);
			console.log("categoryValues(): "+categoryValues);
			console.log("stateType(): "+stateType);
			
			createPageNum(pageNum, counselorNameValue, selectDateType, datevalue, categoryValues, stateType);
			reloadReservationList(pageNum, counselorNameValue, selectDateType, datevalue, categoryValues, stateType);
		}
		
		
		function enterKey(){
			
	        if (window.event.keyCode == 13) {
	            search();
	        }

		}
		
		function toggleCheckBoxes(target){
			
			const categoryBox = document.getElementById("categoryBox");
			const selectCategory = categoryBox.querySelectorAll(".selectCategory");
			
			const isChecked = target.checked;
			
			selectCategory.forEach((checkbox) => {
			    checkbox.checked = isChecked;
			});
			
		}
		
		function toggleCheckSingle(target){
			
			const categoryBox = document.getElementById("categoryBox");
			const selectCategoryAll = categoryBox.querySelector(".selectCategoryAll");
			const selectCategory = categoryBox.querySelectorAll(".selectCategory");
			
			let count = 0;
			
			selectCategory.forEach((checkbox) => {
				if(checkbox.checked == false){
					count = count + 1;
				}
			});
			
			if(count > 0){
				selectCategoryAll.checked = false;
			}
			
		}
		
		
		function search(){
			
			const searchCounselorName = document.querySelector(".searchCounselorName");
			let counselorNameValue = searchCounselorName.value.trim();
			const selectSearchDate = document.querySelector(".selectSearchDate");
			const selectDateType = selectSearchDate.value;
			const searchDate = document.querySelector(".searchDate");
			let datevalue = searchDate.value.trim();
			const selectCategory = document.querySelectorAll(".selectCategory");
			const categoryValues = [];
			const selectState = document.querySelector(".selectState");
			const stateType = selectState.value;
			
			
			if(searchCounselorName.value === ''){
				counselorNameValue = 0;
			}
			
			if(searchDate.value === ''){
				datevalue = 0;
			}
			
			selectCategory.forEach((checkbox) => {
				if(checkbox.checked){
					categoryValues.push(checkbox.value);
					console.log(checkbox.value);
				}
			});
			
            console.log("s상담원명: "+counselorNameValue);
            console.log("s날짜타입: "+selectDateType);
            console.log("s날짜값: "+datevalue);
            console.log("s상태타입: "+stateType);
			
			reloadReservationList(pageNum, counselorNameValue, selectDateType, datevalue, categoryValues, stateType);
			createPageNum(pageNum, counselorNameValue, selectDateType, datevalue, categoryValues, stateType);
			
		}
		
		
		function initialize(){
			
			const searchCounselorName = document.querySelector(".searchCounselorName");
			searchCounselorName.value = "";
			
			const selectSearchDate = document.querySelector(".selectSearchDate");
			selectSearchDate.value = "0";
			
			const searchDate = document.querySelector(".searchDate");
			searchDate.value = "";
			
			const selectState = document.querySelector(".selectState");
			selectState.value = "0";
			
			const selectCategoryAll = document.querySelector(".selectCategoryAll");
			selectCategoryAll.checked = false;
			
			const selectCategory = document.querySelectorAll(".selectCategory");
			selectCategory.forEach((checkbox) => {
					checkbox.checked = false;
			});
			
			pageNum = 1;
			reloadReservationList(pageNum);
			createPageNum(pageNum);
			
		}
		

		window.addEventListener("DOMContentLoaded", () => {
			reloadReservationList(pageNum);
			createPageNum(pageNum);
		});

	
	</script>
	
</head>
<body>

	<div class="container-fluid">
	
		<div class="row py-2 border-bottom">
            <div class="col-4 ps-5 text-start">
                <a class="navbar-brand" href="../commons/counselCenterStudentMainPage"><img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
                <span class="fw-bold fs-3 text-start align-middle">MK University</span><span class="fs-6t align-middle">&nbsp;&nbsp;|&nbsp;&nbsp;</span><span class="fs-5 fw-bold align-middle">상담센터</span></a>
            </div>
            <div class="col-1"></div>
            <div class="col">
            	<div class="row pt-3 align-items-center">
					<div class="col pt-1 pe-4 text-end fs-5">
						<span class="fw-bold"><a class="navbar-brand" href="../offlineCounsel/offlineCounselReservationCheckPage">오프라인 상담</a></span><span class="fs-5 text-body-tertiary">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
						<span class="fw-bold"><a class="navbar-brand" href="../onlineCounsel/counselorOnlineCounselMainPage">온라인 상담</a></span><span class="fs-5 text-body-tertiary">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
						<span class="fw-bold"><a class="navbar-brand" href="">집단 상담</a></span><span class="fs-5 text-body-tertiary">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
						<span class="fw-bold"><a class="navbar-brand" href="../offlineCounsel/offlineCounselStatisticsPage">통계 자료</a></span>
					</div>
            	</div>
            </div>
			<div class="col-1 pt-3 me-0 pe-0 text-center dropdown nav-item">
			  <a class="nav-link pt-2 dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    <span class="fw-bold">${sessionStudentInfo.student_id }</span>님
			  </a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">마이페이지</a></li>
			    <li><hr class="dropdown-divider"></li>
			    <li><a class="dropdown-item" href="#"><span><i class="bi bi-power"></i></span>&nbsp;로그아웃</a></li>
			  </ul>
			</div>
			<div class="col-1"></div>
		</div>

		<div class="row">
			<div class="col-2 ms-4 border-end" style="height: 53em">
				<div class="row pt-5">
					<div class="col fw-bold fs-3 ps-4">
						MENU
					</div>
				</div>
				<div class="row pt-5">
					<div class="col fs-5">						
						<div class="dropend">
							<button class="btn btn-white dropdown-toggle navbar-brand" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							온라인상담
							</button>
							<ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="#">emptyPage1</a></li>
							    <li><hr class="dropdown-divider"></li>
						   		<li><a class="dropdown-item" href="#">emptyPage2</a></li>
						   		<li><hr class="dropdown-divider"></li>
						   		<li><a class="dropdown-item" href="#">emptyPage3</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col fs-5">						
						<div class="dropend">
							<button class="btn btn-white dropdown-toggle navbar-brand" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							오프라인상담
							</button>
							<ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="../offlineCounsel/checkOfflineCounselReservationStudentPage">예약 조회</a></li>
							    <li><hr class="dropdown-divider"></li>
						   		<li><a class="dropdown-item" href="#">일정 변경</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col fs-5">						
						<div class="dropend">
							<button class="btn btn-white dropdown-toggle navbar-brand" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							집단상담
							</button>
							<ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="#">emptyPage1</a></li>
							    <li><hr class="dropdown-divider"></li>
						   		<li><a class="dropdown-item" href="#">emptyPage2</a></li>
						   		<li><hr class="dropdown-divider"></li>
						   		<li><a class="dropdown-item" href="#">emptyPage3</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-9 ps-5">
				<div class="row pt-5">
					<div class="col fs-3 fw-bold">
						예약 조회
					</div>
				</div>
				<div class="row pt-4">
					<div class="col">
						<div class="row border" style="background-color: rgb(244, 244, 241);">
							<div class="col">
								<div class="row py-3 align-items-center border-bottom">
									<div class="col-1 fw-bold">
										상담사명
									</div>
									<div class="col-3">
										<input onkeyup="enterKey()" class="searchCounselorName form-control" type="text">
									</div>
									<div class="col-1"></div>
									<div class="col-1 fw-bold">
										일자
									</div>
									<div class="col-2">
										<select class="selectSearchDate form-select">
										  <option value="0" selected>일자</option>
										  <option value="1">상담신청일</option>
										  <option value="2">상담예약일</option>
										</select>								
									</div>
									<div class="col-3 ps-5">
										<input class="searchDate form-control" type="datetime-local">
									</div>
								</div>
								<div class="row pt-3 pb-3 align-items-center border-bottom">
									<div class="col-1 fw-bold">
										상담종류
									</div>
									<div id="categoryBox" class="col">
										<span><input onclick="toggleCheckBoxes(this)" class="selectCategoryAll" type="checkbox" value="0"> 전체&nbsp;&nbsp;</span>
										<c:forEach items="${categoryList }" var="list">
											<span><input onclick="toggleCheckSingle(this)" class="selectCategory" type="checkbox" value="${list.id }"> ${list.name }&nbsp;&nbsp;</span>
										</c:forEach>						
									</div>
								</div>
								<div class="row pt-3 pb-3 align-items-center border-bottom">
									<div class="col-1 fw-bold">
										상담상태
									</div>
									<div class="col-3">
										<select class="selectState form-select">
										  <option value="0" selected>전체</option>
										  <option value="1">신청</option>
										  <option value="2">완료</option>
										  <option value="3">취소</option>
										  <option value="4">노쇼</option>
										</select>								
									</div>
								</div>
								<div class="row py-3">
									<div class="col-4"></div>
									<div class="col-2 d-grid">
										<input class="initializeBtn btn btn-outline-dark" onclick="initialize()" type="button" value="초기화" style="background-color: rgb(255,255,255);">
									</div>
									<div class="col-2 d-grid">
										<input onclick="search()" id="searchBtn" class="btn btn-dark" type="button" value="검색">
									</div>
									<div class="col-4"></div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				<div class="row pt-5 pb-3 border-bottom border-dark">
					<div class="col-10"></div>
					<div class="col-2">
						<select class="form-select">
						  <option selected>전체</option>
						  <option value="1">오름차순</option>
						  <option value="2">내림차순</option>
						</select>								
					</div>
				</div>
				<div class="row pt-3 pb-3 border-bottom border-dark text-center fw-bold" style="background-color: rgb(244, 244, 241);">
					<div class="col-1">
						No.
					</div>
					<div class="col-2">
						상담종류
					</div>
					<div class="col-1">
						상담사명
					</div>
					<div class="col-2">
						신청일
					</div>
					<div class="col-1">
						상담상태
					</div>
					<div class="col-2">
						상담일자
					</div>
					<div class="col">
						예약취소
					</div>
					<div class="col">
						리뷰
					</div>
				</div>
				<!-- 이 row 한 개 반복문으로 돌려서 출력 -->
				<div class="row text-center">
					<div id="reservationListBox" class="col">

					</div>
				</div>
				<div class="row pt-5">
					<div class="col">
						<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
						    <li class="startPageNumli page-item">
						      <a class="startPageNumber page-link text-dark">&lt;</a>
						    </li>
						    
						    <li class="endPageNumli page-item">
						      <a class="endPageNumber page-link text-dark">&gt;</a>
						    </li>
						  </ul>
						</nav>
					</div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		
		<pre>
		
		
		
		
		
		
		
		</pre>
	
	
	</div>
	
	<!-- ★★★템플릿!!★★★ -->
	<div id="templete" class="d-none">
		<div class="reservationDataWrapper row py-3 border-bottom align-items-center">
			<div class="reservationNo col-1">

			</div>
			<div class="reservationCategoryName col-2">

			</div>
			<div class="reservationCounselorName col-1">

			</div>
			<div class="reservationCreatedAt col-2">

			</div>
			<div class="reservationState col-1">

			</div>
			<div class="reservationDate col-2">

			</div>
			<div class="col d-grid">
				<input class="canceledReservation btn btn-danger" type=button value="예약취소">
			</div>
			<div class="col d-grid">
				<input class="createReview btn btn-dark" type="button" value="리뷰확인">
			</div>
		</div>
	</div>
	
	<!-- 모달창 -->
    <div id="writeModal" class="modal modal-xl" tabindex="-1">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title fw-bold">상담 만족도 조사</h5>
              <button type="button" class="xClose btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
				<div class="row py-5">
                    <div class="col-1"></div>
					<div class="col border border-dark">
						<div class="row text-center border-bottom border-dark">
							<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
								<div class="row">
									<div class="col">
										상담일자
									</div>
								</div>
							</div>
							<div class="col-4 border-end border-dark py-3">
								<div class="row">
									<div class="counselDate col">
										2023-12-28 14:00                                        
									</div>
								</div>
							</div>
							<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
								<div class="row">
									<div class="col">
										상담사명									
									</div>
								</div>
							</div>
							<div class="col-4 py-3">
								<div class="row">
									<div class="counselorName col">
										${map.counselorDto.name }								
									</div>
								</div>
							</div>
						</div>
						<div class="row text-center border-bottom border-dark">
							<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
								<div class="row">
									<div class="col pt-2">
										점수
									</div>
								</div>
							</div>
							<div class="col-4 py-3 border-end border-dark">
								<div class="row">
									<div class="reviewScoreBox col">

									</div>
								</div>
							</div>
							<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
								<div class="row">
									<div class="col pt-2">
										상담주제
									</div>
								</div>
							</div>
							<div class="col-4 py-3">
								<div class="row">
									<div class="categoryName col pt-2">
										${map.typeCategoryDto.name }								
									</div>
								</div>
							</div>
						</div>
						<div class="row text-center align-items-center">
							<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
								<div class="row">
									<div class="col pb-3">
										<br><br><br>
										리뷰내용
										<br><br><br>
									</div>
								</div>
							</div>
							<div class="col py-3">
								<div class="row">
									<div class="reviewContentBox col">

									</div>
								</div>
							</div>
						</div>
					</div>
                    <div class="col-1"></div>
				</div>
            </div>
            <div class="modal-footer">
	            <input type="button" class="closeBtn btn btn-dark" data-bs-dismiss="modal" value="닫기">
	            <input type="button" class="reviewRegister btn btn-primary" value="리뷰등록">
            </div>
          </div>
        </div>
      </div>
	
	
	


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>