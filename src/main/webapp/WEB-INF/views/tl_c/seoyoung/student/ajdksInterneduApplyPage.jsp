<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%
String formattedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>AJDKS TEMPLATE FOR STUDENT</title>
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

.studentleftmenubar input+label+.content {
	display: none;
}

.studentleftmenubar input:checked+label+.content {
	display: block;
}

/*a태그기본설정제거*/
.nolinenoblue>a {
	text-decoration: none;
	color: #000000;
}
/*seoyoung style*/
.relative-padding {
	padding-left: 0.5em; /* Adjust the value as needed */
	padding-right: 0.5em; /* Adjust the value as needed */
}

.reduce-font-size {
	font-size: 0.9em; /* Adjust the value as needed */
}

/*accordion*/
.accordion { -
	-bs-accordion-btn-focus-border-color: #f2f5f7;
	-bs-accordion-btn-focus-box-shadow: 0 0 0 0.25rem #f2f5f7;
}

.accordion-button:not(.collapsed) {
	background-color: #f2f5f7;
}

.accordion { -
	-bs-accordion-btn-focus-box-shadow: none;
}

/*table*/
.table { -
	-bs-table-bg: none;
}
</style>
<!-- Bootstrap JS -->

<script>

const student_pk = ${sessionStudentInfo.student_pk};
	function reloadcompanyList(){
        
        const url = "./companyListBox";
        //const url = "https://www.naver.com";
        
        fetch(url)
        .then(response => response.json())
        .then(response => {
           
      	  console.log(response);
           const companyListBox = document.getElementById("companyListBox");
           companyListBox.innerHTML = "";
           
           for(e of response.data){
              const companyListWrapper = document.querySelector("#companyListTemplete .companyListWrapper").cloneNode(true);
              
              const INTERNSHIP_COURSE_PK = companyListWrapper.querySelector(".INTERNSHIP_COURSE_PK");
              INTERNSHIP_COURSE_PK.innerText = e.INTERNSHIP_COURSE_PK;
              
              const COMPANY_CATEGORY_NAME = companyListWrapper.querySelector(".COMPANY_CATEGORY_NAME");
              COMPANY_CATEGORY_NAME.innerText = e.COMPANY_CATEGORY_NAME;
              
              const COMPANY_NAME = companyListWrapper.querySelector(".COMPANY_NAME");
              COMPANY_NAME.innerText = e.COMPANY_NAME;
              
              const ADDRESS = companyListWrapper.querySelector(".ADDRESS");
              ADDRESS.innerText = e.ADDRESS;
              
              const INTERNSHIP_START_DATE = companyListWrapper.querySelector(".INTERNSHIP_START_DATE");
              const date = new Date(e.INTERNSHIP_START_DATE); 
              const formattedStartDate = date.getFullYear() + "-" + padZero(date.getMonth() + 1) + "-" + padZero(date.getDate()) +
                 " ~ ";
              INTERNSHIP_START_DATE.innerText = formattedStartDate;
              
              const INTERNSHIP_END_DATE = companyListWrapper.querySelector(".INTERNSHIP_END_DATE");
              const date2 = new Date(e.INTERNSHIP_END_DATE); 
              const formattedEndDate = date2.getFullYear() + "-" + padZero(date2.getMonth() + 1) + "-" + padZero(date2.getDate())
                ;
              INTERNSHIP_END_DATE.innerText = formattedEndDate;
              
              const APPLYING_END_DATE = companyListWrapper.querySelector(".APPLYING_END_DATE");
              const date3 = new Date(e.APPLYING_END_DATE); 
              const formattedApplyEndDate = date3.getFullYear() + "-" + padZero(date3.getMonth() + 1) + "-" + padZero(date3.getDate()) 
                ;
                APPLYING_END_DATE.innerText = formattedApplyEndDate;

              function padZero(number) {
                return number < 10 ? "0" + number : number;
              }

              const INTERNSHIP_TOTAL_MEMBER = companyListWrapper.querySelector(".INTERNSHIP_TOTAL_MEMBER");
              INTERNSHIP_TOTAL_MEMBER.innerText = e.INTERNSHIP_TOTAL_MEMBER;
              
              
              const viewButton = companyListWrapper.querySelector(".viewButton");
              viewButton.innerText = "상세보기";
              viewButton.classList.add("btn", "btn-sm", "rounded-1", "open-Modal");
              viewButton.setAttribute("onclick", "openModal("+e.INTERNSHIP_COURSE_PK+")");
			
              companyListBox.appendChild(companyListWrapper);
           }
        });   
     }
	
	function openModal(itemPk) {
	
		const modal = bootstrap.Modal.getOrCreateInstance("#internEvaluationModal");
        
        const companyListWrapper = document.querySelector("#internEvaluationModal .companyListWrapper");
		const aaa = document.querySelector("#internEvaluationModal .aaa");
        
		
        const url = "./companyListModal?pk="+itemPk;
        fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const modalValues = response.data;
            console.log(modalValues.INTERNSHIP_COURSE_PK);
			

            const INTERNSHIP_COURSE_PK = companyListWrapper.querySelector(".INTERNSHIP_COURSE_PK");
            INTERNSHIP_COURSE_PK.innerText = modalValues.INTERNSHIP_COURSE_PK;
            
            const COMPANY_NAME = companyListWrapper.querySelector(".COMPANY_NAME");
            COMPANY_NAME.innerText = modalValues.COMPANY_NAME;
            
            const SEMESTER_QUALIFICATION = companyListWrapper.querySelector(".SEMESTER_QUALIFICATION");
            SEMESTER_QUALIFICATION.innerText = modalValues.SEMESTER_QUALIFICATION;
            
            
            const COURSE_TITLE = companyListWrapper.querySelector(".COURSE_TITLE");
            COURSE_TITLE.innerText = modalValues.COURSE_TITLE;
            
            const CEO_NAME = companyListWrapper.querySelector(".CEO_NAME");
            CEO_NAME.innerText = modalValues.CEO_NAME;
            
            const INTERNSHIP_TOTAL_MEMBER = companyListWrapper.querySelector(".INTERNSHIP_TOTAL_MEMBER");
            INTERNSHIP_TOTAL_MEMBER.innerText = modalValues.INTERNSHIP_TOTAL_MEMBER;
            
            const ADDRESS = companyListWrapper.querySelector(".ADDRESS");
            ADDRESS.innerText = modalValues.ADDRESS;
            
            const INTERNSHIP_START_DATE = companyListWrapper.querySelector(".INTERNSHIP_START_DATE");
            const date = new Date(modalValues.INTERNSHIP_START_DATE); 
            
            console.log(modalValues.INTERNSHIP_START_DATE);

            
            const formattedStartDate = date.getFullYear() + "-" + padZero(date.getMonth() + 1) + "-" + padZero(date.getDate()) +
              " " + padZero(date.getHours()) + ":" + padZero(date.getMinutes()) + "  ~ ";
            INTERNSHIP_START_DATE.innerText = formattedStartDate;
            
            const INTERNSHIP_END_DATE = companyListWrapper.querySelector(".INTERNSHIP_END_DATE");
            const date2 = new Date(modalValues.INTERNSHIP_END_DATE); 
            const formattedEndDate6 = date2.getFullYear() + "-" + padZero(date2.getMonth() + 1) + "-" + padZero(date2.getDate()) +
              " " + padZero(date2.getHours()) + ":" + padZero(date2.getMinutes());
            INTERNSHIP_END_DATE.innerText = formattedEndDate6;

            const APPLYING_START_DATE = companyListWrapper.querySelector(".APPLYING_START_DATE");
            const date3 = new Date(modalValues.APPLYING_START_DATE); 
            const formattedStartDate2 = date3.getFullYear() + "-" + padZero(date3.getMonth() + 1) + "-" + padZero(date3.getDate()) +
              " " + padZero(date3.getHours()) + ":" + padZero(date3.getMinutes()) + "  ~ ";
              APPLYING_START_DATE.innerText = formattedStartDate2;
            
            const APPLYING_END_DATE = companyListWrapper.querySelector(".APPLYING_END_DATE");
            const date4 = new Date(modalValues.APPLYING_END_DATE); 
            const formattedEndDate3 = date4.getFullYear() + "-" + padZero(date4.getMonth() + 1) + "-" + padZero(date4.getDate()) +
              " " + padZero(date4.getHours()) + ":" + padZero(date4.getMinutes());
              APPLYING_END_DATE.innerText = formattedEndDate3;
            
            const ANNOUNCEMENT_DATE = companyListWrapper.querySelector(".ANNOUNCEMENT_DATE");
            const date5 = new Date(modalValues.ANNOUNCEMENT_DATE); 
            const formattedEndDate4 = date5.getFullYear() + "-" + padZero(date5.getMonth() + 1) + "-" + padZero(date5.getDate()) +
              " " + padZero(date5.getHours()) + ":" + padZero(date5.getMinutes());
            ANNOUNCEMENT_DATE.innerText = formattedEndDate4;  
              
                
            const CREATED_AT = companyListWrapper.querySelector(".CREATED_AT");
            const date6 = new Date(modalValues.CREATED_AT); 
            const formattedEndDate5 = date6.getFullYear() + "-" + padZero(date6.getMonth() + 1) + "-" + padZero(date6.getDate()) +
              " " + padZero(date6.getHours()) + ":" + padZero(date6.getMinutes());
              CREATED_AT.innerText = formattedEndDate5;      
            
            function padZero(number) {
                return number < 10 ? "0" + number : number;
              }
            
            
            const viewButton = aaa.querySelector(".viewButton2");
            console.log(viewButton);
            viewButton.value = "다음";
            viewButton.classList.add("btn", "btn-primary", "rounded-1", "open-Modal");
            viewButton.setAttribute("onclick", "openModal2("+modalValues.INTERNSHIP_COURSE_PK+")");
            

		});
        //console.log(companyListWrapper);
        modal.show();
        
    	
    	
	}
	
	function openModal2(itemPk) {
		const modal = bootstrap.Modal.getOrCreateInstance("#nextModal");
	  
        fetch("./companyTF")
        .then(response => response.json())
        .then(response => {
        	console.log(response.data);
        	const modalValues = response.data;
        	if (modalValues == "yes") {
    		    const applyButton = document.getElementById("applyButton");
    		    applyButton.setAttribute("onclick", "studentApplyProcess("+itemPk+")");
    		} else {
    		    failModal();
    		    modal.hide();
    		}
     
        });
        
		modal.show();
		//modal.hide();
	}
	
	function studentApplyProcess(itemPk){
		//const modalValues = response.data;
       // console.log(modalValues.INTERNSHIP_COURSE_PK);
		
		const url = "./insertInternApply"
			
			fetch(url,{
				method: "post",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				},
				body: "student_pk=" + student_pk
				+ "&internship_course_pk=" + itemPk
			})
			.then(response => response.json())
			.then(response => {
				
				
				reloadcompanyList();
				
				alert("신청완료되었습니다.");
				closeopenModal2();

			})
			;
		}
	function failModal() {
		const modal = bootstrap.Modal.getOrCreateInstance("#failModal");    
        const companyListWrapper = document.querySelector("#failModal .companyListWrapper");
        modal.show();
        setTimeout(function() {
            closeModal();
        }, 0);
	//	modal.hide();
	}
	
	function searchAppButton(){
		const modal = bootstrap.Modal.getOrCreateInstance("#searchCompany");
        
        const url = "./companyListModal?pk="+itemPk;
        fetch(url)
		.then(response => response.json())
		.then(response => {
		})
		;
	}
	
	function searchByCompany(){
		const inputCategory = document.getElementById("inputCategory").value;	
		const searchCompanyWord = document.getElementById("searchCompanyWord").value;
		
		
		console.log(inputCategory);
		console.log(searchCompanyWord);
		
		
		const url = "./searchCompany";
		const searchOption = {
				method : "post",
				headers : {
					"Content-Type" : "application/x-www-form-urlencoded"
				},
				body : "company_category_pk=" +  inputCategory + "&searchCompanyWord=" + searchCompanyWord
		}
		fetch(url, searchOption)
		.then(response => response.json())
		.then(response =>{			
			searchData = response.data;
			console.log(searchData);
			console.log(response);
			
			const companyListBox = document.getElementById("companyListBox");
	           companyListBox.innerHTML = "";
	           
	           for(e of response.data){
	              const companyListWrapper = document.querySelector("#companyListTemplete .companyListWrapper").cloneNode(true);
	              
	              const INTERNSHIP_COURSE_PK = companyListWrapper.querySelector(".INTERNSHIP_COURSE_PK");
	              INTERNSHIP_COURSE_PK.innerText = e.INTERNSHIP_COURSE_PK;
	              
	              const COMPANY_CATEGORY_NAME = companyListWrapper.querySelector(".COMPANY_CATEGORY_NAME");
	              COMPANY_CATEGORY_NAME.innerText = e.COMPANY_CATEGORY_NAME;
	              
	              const COMPANY_NAME = companyListWrapper.querySelector(".COMPANY_NAME");
	              COMPANY_NAME.innerText = e.COMPANY_NAME;
	              
	              const ADDRESS = companyListWrapper.querySelector(".ADDRESS");
	              ADDRESS.innerText = e.ADDRESS;
	              
	              const INTERNSHIP_START_DATE = companyListWrapper.querySelector(".INTERNSHIP_START_DATE");
	              const date = new Date(e.INTERNSHIP_START_DATE); 
	              const formattedStartDate = date.getFullYear() + "-" + padZero(date.getMonth() + 1) + "-" + padZero(date.getDate()) +
	                " " + padZero(date.getHours()) + ":" + padZero(date.getMinutes()) + " ~ ";
	              INTERNSHIP_START_DATE.innerText = formattedStartDate;
	              
	              const INTERNSHIP_END_DATE = companyListWrapper.querySelector(".INTERNSHIP_END_DATE");
	              const date2 = new Date(e.INTERNSHIP_END_DATE); 
	              const formattedEndDate = date2.getFullYear() + "-" + padZero(date2.getMonth() + 1) + "-" + padZero(date2.getDate()) +
	                " " + padZero(date2.getHours()) + ":" + padZero(date2.getMinutes());
	              INTERNSHIP_END_DATE.innerText = formattedEndDate;
	              
	              const APPLYING_END_DATE = companyListWrapper.querySelector(".APPLYING_END_DATE");
	              const date3 = new Date(e.APPLYING_END_DATE); 
	              const formattedApplyEndDate = date3.getFullYear() + "-" + padZero(date3.getMonth() + 1) + "-" + padZero(date3.getDate()) +
	                " " + padZero(date3.getHours()) + ":" + padZero(date3.getMinutes());
	                APPLYING_END_DATE.innerText = formattedApplyEndDate;

	              function padZero(number) {
	                return number < 10 ? "0" + number : number;
	              }

	              const INTERNSHIP_TOTAL_MEMBER = companyListWrapper.querySelector(".INTERNSHIP_TOTAL_MEMBER");
	              INTERNSHIP_TOTAL_MEMBER.innerText = e.INTERNSHIP_TOTAL_MEMBER;
	              
	              
	              const viewButton = companyListWrapper.querySelector(".viewButton");
	              viewButton.innerText = "상세보기";
	              viewButton.classList.add("btn", "btn-sm", "rounded-1", "open-Modal");
	              viewButton.setAttribute("onclick", "openModal("+e.INTERNSHIP_COURSE_PK+")");
				
	              companyListBox.appendChild(companyListWrapper);
	           }
			
		//	processSearchData(searchData);
		});
		
	}
		
		
		
		function pressEnter(){
	    	if(window.event.keyCode == 13){
	    		searchByCompany();
	    	}
	    }
	
    function closeModal() {
    	const modal = bootstrap.Modal.getOrCreateInstance("#internEvaluationModal");
        modal.hide();
	}
    
    function closeModalfail() {
        const modal = bootstrap.Modal.getOrCreateInstance("#failModal");
        modal.hide();
    }
    
    function closeopenModal2() {
    	//closeModal();
    	const modal = bootstrap.Modal.getOrCreateInstance("#internEvaluationModal");
    	const modal2 = bootstrap.Modal.getOrCreateInstance("#nextModal");
        modal.hide();
        modal2.hide();
	}
	
	
    function reloadWhichList(){
    	
		fetch("./companyListBox")
		.then(response => response.json())
		.then(response => {
			reloadcompanyList();
		});
		
	}
    
	function ajdksInterneduApplyPage(){
		fetch("./ajdksInterneduApplyPage")
		.then(response => response.json())
		.then(response => {
			const studentPk = response.data;
		});
	}
	
	function CompanyList() {
		const url = "ajdksInterneduApplyPage" + company_Pk;
	}
	
	function reloadSearchTypeCategory(){
		console.log("reloadSearchTypeCategory() 실행");
		
		const inputCategory = document.getElementById("searchCategoryCheckBox").value;	
	//	const searchCompanyWord = document.getElementById("searchCompanyWord").value;
		
		
		console.log(inputCategory);
		console.log(searchCompanyWord);
		
		
		
	}
	
	

	window.addEventListener("DOMContentLoaded", () => {
		reloadcompanyList();
		//reloadWhichList();
	});

</script>
</head>
<body>
	<div class="container-fluid">
		<!-- 전체 container 입구 -->

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
						<br> <br>
						<div class="row">
							<h2>
								<span class="fw-bolder"><i class="bi bi-calendar-check"></i>&nbsp;현장실습
									기관조회</span>
							</h2>
						</div>
						<br>

						<nav class="row navbar navbar-light" id="searchCompany"
							style="background-color: #f2f5f7;">
							<div class="col">
								<div class="row ms-3 mt-3 me-3 mb-3">
									<div class="col-2 px-0">
										<select class="form-select" id="inputCategory">
											<option selected value=0>업종 선택</option>
											<option value=1>제조업</option>
											<option value=2>건설업</option>
											<option value=3>정보통신업</option>
											<option value=4>금융업</option>
											<option value=5>부동산업</option>
										</select>
									</div>
									<div class="input-group col px-0 ">
										<input id="searchCompanyWord" onkeyup="pressEnter()"
											type="text" class="form-control btn-outline-light"> <a
											href="#" onclick="searchByCompany()" role="button"
											class="btn btn-secondary  btn-outline-light"> <i
											class="bi bi-search"></i></a>
									</div>
								</div>
								<div class="row mt-4 mx-3">
									<div class="col ">
										<div class="row">
											<div class="col-2 mx-3 mb-2">
												<span class="fw-bold align-middle">세부검색</span>
											</div>
											<div class="col form-check mx-3">
												<input class="form-check-input" type="checkbox" value=1
													id="flexCheckDefault" checked> <label
													class="form-check-label" for="flexCheckChecked">
													제조업 </label>
											</div>
											<div class="col form-check mx-3">
												<input class="form-check-input" type="checkbox" value=2
													id="flexCheckDefault" checked> <label
													class="form-check-label" for="flexCheckChecked">
													건설업 </label>
											</div>
											<div class="col form-check mx-3">
												<input class="form-check-input" type="checkbox" value=3
													id="flexCheckDefault" checked> <label
													class="form-check-label" for="flexCheckChecked">
													정보통신업 </label>
											</div>
											<div class="col form-check mx-3">
												<input class="form-check-input" type="checkbox" value=4
													id="flexCheckDefault" checked> <label
													class="form-check-label" for="flexCheckChecked">
													금융업 </label>
											</div>
											<div class="col form-check mx-3">
												<input class="form-check-input" type="checkbox" value=5
													id="flexCheckDefault" checked> <label
													class="form-check-label" for="flexCheckChecked">
													부동산업 </label>
											</div>
											<div class="searchCategoryCheckBox col-auto"></div>
										</div>
									</div>
								</div>
							</div>
						</nav>
						<br>
						<!-- 컴퍼니 리스트 -->
						<div class="row mt-2" >
							<div class="col border-secondary border-top text-center">
								<div class="row text-center py-1 border-botton"
									style="height: 50px; background-color: #f2f5f7; font-weight: bold;">
									<div class="col align-self-center">#</div>
									<div class="col-2 align-self-center">업종</div>
									<div class="col-2 align-self-center">회사명</div>
									<div class="col-2 align-self-center">소재지</div>
									<div class="col-2 text-center align-self-center">실습기간</div>
									<div class="col align-self-center">접수마감</div>
									<div class="col align-self-center">선발인원</div>
									<div class="col align-self-center">지원</div>
								</div>
								<div class="row">
									<div id="companyListBox" class="col mt-2 text-center"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--컴퍼니 리스트 -->
	<div id="companyListTemplete" class="d-none">


		<div class="companyListWrapper row text-center py-1 border-bottom"
			style="font-size: 0.95em">
			<div
				class="INTERNSHIP_COURSE_PK col align-self-center fw-semibold border-end">
				INTERNSHIP_COURSE_PK 확인</div>
			<div
				class="COMPANY_CATEGORY_NAME col-2 align-self-center fw-semibold border-end relative-padding reduce-font-size">
				COMPANY_CATEGORY_NAME 확인</div>
			<div
				class="COMPANY_NAME col-2 align-self-center border-end relative-padding reduce-font-size">
				COMPANY_NAME 확인</div>
			<div
				class="ADDRESS col-2 align-self-center border-end relative-padding reduce-font-size">
				ADDRESS 확인</div>
			<div class="col-2 align-self-center text-center">
				<div
					class="INTERNSHIP_START_DATE row d-flex justify-content-center align-items-center relative-padding reduce-font-size">
					INTERNSHIP_START_DATE</div>
				<div
					class="INTERNSHIP_END_DATE row d-flex justify-content-center align-items-center relative-padding reduce-font-size">
					INTERNSHIP_END_DATE 확인</div>
			</div>
			<div class="APPLYING_END_DATE col align-self-center reduce-font-size">
				ANNOUNCEMENT_DATE 확인</div>
			<div
				class="INTERNSHIP_TOTAL_MEMBER col align-self-center reduce-font-size">
				INTERNSHIP_TOTAL_MEMBER 확인</div>
			<div class="col">
				<span class="viewButton"></span>
			</div>
		</div>

	</div>

	<!-- 상세 모달 -->
	<div id="internEvaluationModal" class="modal">
		<div class=" modal-dialog modal-fullscreen">
			<div class="modal-content px-3 rounded-0">
				<div class="modal-header mt-1">
					<h5 class="modal-title fw-semibold" id="exampleModalToggleLabel">현장학습신청</h5>
					<span onclick="closeModalfail()" class="close text-secondary fs-4"
						id="close-modal"><i class="bi bi-x-lg"></i></span>
				</div>
				<div class="modal-body">
					<div class="card">
						<img src="../../../resources/img/companyImage/company1.jpg"
							class="card-img-top" alt="...">
						<div class="companyListWrapper 	card-body">
							<div
								class="COMPANY_NAME card-title fw-bolder align-self-center border-end relative-padding reduce-font-size">확인
							</div>
							<div></div>
							<p class="card-text">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">과정명</th>
										<td class="COURSE_TITLE text-start"><span
											class="text-muted "></span></td>
										<th scope="col">자격조건</th>
										<td class="SEMESTER_QUALIFICATION col-1 text-end"></td>
										<td class="col text-start"><span class="text-muted">학년&nbsp;</span></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="col">코드번호</th>
										<td class="INTERNSHIP_COURSE_PK text-start"></td>
									</tr>
									<tr>
										<th scope="col">대표자명</th>
										<td class="CEO_NAME text-start"></td>
										<th scope="col">실습인원</th>
										<td class="INTERNSHIP_TOTAL_MEMBER col text-end"></td>
										<td class="col text-start"><span class="text-muted">명&nbsp;</span></td>
									</tr>
									<tr>
										<th scope="row">주소</th>
										<td class="ADDRESS text-start">ADDRESS</td>

									</tr>
									<tr>
										<th scope="col">선발방법</th>
										<td class="text-start"><span class="text-muted">MK
												학생만 선발</span></td>
									</tr>
									<tr>
										<th scope="col">운형유형</th>
										<td class="text-start"><span class="text-muted">채용연계형</span></td>
									</tr>
									<tr>
										<th scope="col">실습기간</th>
										<td class="INTERNSHIP_START_DATE col-3 text-end"></td>
										<td class="INTERNSHIP_END_DATE col-3 text-start"></td>
									</tr>
									<tr>
										<th scope="col">실습요일</th>
										<td class="text-start"><span class="text-muted">주
												5일</span></td>
									</tr>
									<tr>
										<th scope="col">전형방법</th>
										<td class="text-start"><span class="text-muted">면접선발</span></td>
									</tr>
									<tr>
										<th scope="col">모집기간</th>
										<td class="APPLYING_START_DATE col text-end"></td>
										<td class="APPLYING_END_DATE col text-start"></td>
									</tr>
									<tr>
										<th scope="col">선발결과발표일</th>
										<td class="ANNOUNCEMENT_DATE col text-start"></td>
									</tr>
									<tr>
										<th scope="col">등록일자</th>
										<td class="CREATED_AT col text-start"></td>
									</tr>
								</tbody>
							</table>
							<p class="card-text">
								<small class="text-muted">MK University</small>
							</p>
						</div>
					</div>
				</div>
				<div class="aaa modal-footer text-end">
					<div class="col text-end">
						<button type="button" class="btn text-end btn-secondary "
							data-bs-dismiss="modal">닫기</button>
						<input type="button" class="viewButton2">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- [다음]버튼 모달 -->
	<div id="nextModal" class="modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalToggleLabel2">현장학습신청</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					신청하시겠습니까?<br> *신청 하시면 결과 발표 때까지 지원이 불가 합니다.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-danger"
						data-bs-dismiss="modal">취소</button>
					<button type="button" id="applyButton" class="btn btn-primary">신청</button>
				</div>


			</div>
		</div>
	</div>
	<!-- 이미 신청 내역 있 모달 -->
	<div class="modal fade " id="failModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalToggleLabel2">현장학습신청</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>이미 신청한 내역 혹은 지원서 확인 후 신청해주세요.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
				<div class="closeModal"></div>
			</div>
		</div>
	</div>
	<!-- 서치 -->


	<!-- 전체 container 출구 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>