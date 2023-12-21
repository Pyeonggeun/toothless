<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집단 상담 목록</title>
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
	
	
	const groupCounselId = ${groupCounselDetail.groupCounselDto.id };
	
	
	
	
	function reloadStudentListByGroupCounselId(){
		
		const url="./getStudentListByGroupCounselId?group_counsel_id=" + groupCounselId;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const studentListBox = document.getElementById("studentListBox");
			studentListBox.innerHTML = "";
			
			for(e of response.data.studentInfoList){
				const studentWrapper = document.querySelector("#templete .studentWrapper").cloneNode(true);
				
				const studentDepartment = studentWrapper.querySelector(".studentDepartment");
				studentDepartment.innerText = e.departmentCategoryDto.name;
				
				const studentName = studentWrapper.querySelector(".studentName");
				studentName.innerText = e.studentInfoDto.name;
				
				const studentGender = studentWrapper.querySelector(".studentGender");
				studentGender.innerText = e.studentInfoDto.gender;
				
				const studentPhone = studentWrapper.querySelector(".studentPhone");
				studentPhone.innerText = e.studentInfoDto.phone;				
				
				const checkAttendanceButton = studentWrapper.querySelector(".checkAttendanceButton");
				checkAttendanceButton.setAttribute("onclick", "toggleAttendance(this, "+e.groupCounselReservationDto.id+")")
				
				if(e.groupCounselReservationDto.isAttend == "Y"){
					checkAttendanceButton.style.cssText = "color:red;";
					
				}else{
					checkAttendanceButton.style.cssText = "color:black;";
				}
				
				
				studentListBox.appendChild(studentWrapper);
			}
			
		});
		
	}

	
	function toggleAttendance(targetElement, groupCounselReservationId){
		
		fetch("./toggleAttendanceCheck?group_reservation_id=" + groupCounselReservationId)
		.then(response => response.json())
		.then(response => {
			
			reloadStudentListByGroupCounselId();
		});		
		
	}
	
	
	function reloadGroupCounselCounselorByGroupCounselId(){
		
		const url = "./getCounselorListByGroupCounselId?group_counsel_id=" + groupCounselId;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const counselorListBox = document.getElementById("counselorListBox");
			counselorListBox.innerHTML = "";
			
			for(e of response.data.counselorList){
				
				const counselorWrapper = document.querySelector("#templete .counselorWrapper").cloneNode(true);
				
				const counselorName = counselorWrapper.querySelector(".counselorName");
				counselorName.innerText = e.counselorDto.name;

				const counselorGender = counselorWrapper.querySelector(".counselorGender");
				counselorGender.innerText = e.counselorDto.gender;

				const counselorPhone = counselorWrapper.querySelector(".counselorPhone");
				counselorPhone.innerText = e.counselorDto.phonenumber;

				counselorListBox.appendChild(counselorWrapper);
			}
			
		});
	}
	
	
	function showModal(){
		
		const writeModal = bootstrap.Modal.getOrCreateInstance("#writeModal");
		const writeModalElement = document.querySelector("#writeModal");
		
		const url = "./getCounselorList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const allCounseolorListBox = document.getElementById("allCounseolorListBox");
			allCounseolorListBox.innerHTML= "";
			
			for(e of response.data){
				
				const allCounselorWrapper = document.querySelector("#templete .allCounselorWrapper").cloneNode(true);
				
				const counselorName = allCounselorWrapper.querySelector(".counselorName");
				counselorName.innerText = e.name;

				const counselorGender = allCounselorWrapper.querySelector(".counselorGender");
				counselorGender.innerText = e.gender;

				const counselorPhone = allCounselorWrapper.querySelector(".counselorPhone");
				counselorPhone.innerText = e.phonenumber;				
				
				
				const checkBox = allCounselorWrapper.querySelector(".checkBox");
				checkBox.value = e.id;
				
				allCounseolorListBox.appendChild(allCounselorWrapper);
			}
			
			
			
		});
		
		writeModal.show();
		
	}
	
	
	function isCheck(){
		
		const allCounseolorListBox = document.querySelector("#allCounseolorListBox");
		const checkBoxList = allCounseolorListBox.querySelectorAll(".checkBox");
		
		
		for(checkBox of checkBoxList){
			
			if(checkBox.checked == true){
				register(checkBox.value);
			}else{
				continue;
			}
		}
		closeModal();
		reloadGroupCounselCounselorByGroupCounselId();
	}
	
	
	function register(counselorId){
		
		const url = "./registerCounselor?group_counsel_id=" + groupCounselId + "&counselor_id=" + counselorId;
		
		fetch(url)
		.then(response => response)
		.then(response => {
			
			
		})
		
	}
	
	function closeModal() {
		
		const modal = bootstrap.Modal.getOrCreateInstance("#writeModal");
		
		modal.hide();
		
	}
		
	
	
	
	
	
	window.addEventListener("DOMContentLoaded", () => {
		
		reloadStudentListByGroupCounselId();
		reloadGroupCounselCounselorByGroupCounselId();
	});



</script>



	

</head>
<body>



<jsp:include page="../../commons/staffTopArea.jsp"></jsp:include>


<div class="container-fluid">




	<div class="row">
		
		<!-- 내용 -->
		<div class="col">
			
			<div class="row" style="height:8em;"></div>
		
			<div class="row mt-0 pt-0">
					
				<div class="col">
					<div class="row">
						<div class="col-1"></div>
						<div class="col-5">
							<div class="row pb-5 mb-2">
								<div class="col">
									<div class="fw-bold" style="font-size:1.9em; color: #07355e;">상담 정보</div>
								</div>
							</div>
							<div class="row border-top border-2 border-black py-3">
								<div class="col"></div>
							</div>
							
							
							<!-- 복사본 -->
							<div class="row mt-0 pt-0">
		
								<!-- 상담 리스트 -->
								<div class="col">
								
		
									<div class="row">
										<div class="col-7">
											<div class="row">
												
												<div class="col">
													<div class="row">
														<div class="col">
															<div class="fw-bold" style="font-size: 1.4em;">[<fmt:formatDate value="${groupCounselDetail.groupCounselDto.start_apply_date }" pattern="yy.MM.dd"/>] ${groupCounselDetail.groupCounselDto.title}</div>
														</div>
													</div>
													<div class="row pt-3">
														<div class="col" style="height:3.5em;">
															<div class="text-secondary fw-bold" style="font-size: 0.9em;">${groupCounselDetail.groupCounselDto.text}</div>
														</div>
													</div>
													<div class="row py-5"></div>
													<div class="row pt-3">
														<div class="col-3">
															<div class="fw-bold text-black" style="font-size:1.2em; text-decoration: underline;">신청 인원</div>
														</div>
														<div class="col">
															<div class="fw-bold text-secondary" style="font-size:1.1em;">${groupCounselDetail.count } / ${groupCounselDetail.groupCounselDto.amount }</div>
														</div>
													</div>
													<div class="row pt-3">
														<div class="col-3">
															<div class="fw-bold text-black" style="font-size:1.2em; text-decoration: underline;">신청 일자</div>
														</div>
														<div class="col">
															<div class="fw-bold text-secondary" style="font-size:1.1em;"><fmt:formatDate value="${groupCounselDetail.groupCounselDto.start_apply_date }" pattern="yy.MM.dd"/>~<fmt:formatDate value="${groupCounselDetail.groupCounselDto.end_apply_date }" pattern="yy.MM.dd"/></div>
														</div>
													</div>
													<div class="row pt-3">
														<div class="col-2">
															<div class="fw-bold text-black" style="font-size:1.2em; text-decoration: underline;"> 장소</div>
														</div>
														<div class="col-1"></div>
														<div class="col">
															<div class="fw-bold text-secondary" style="font-size:1.1em;">${groupCounselDetail.groupCounselDto.location }</div>
														</div>
													</div>
													<div class="row pt-4">
														<div class="col-10"></div>
														<div class="col text-center">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-5 text-end">
											<img class="img-fluid" style="width: 90%;" src="/uploadFiles/${groupCounselDetail.groupCounselDto.posterImage }">
										</div>
									</div>
								</div>
							</div>
						</div>
						
						
						
						<div class="col-4 ms-5">
							<div class="row pb-5 mb-2">
								<div class="col">
									<div class="fw-bold" style="font-size:1.9em; color: #07355e;">학생 정보</div>
								</div>
							</div>
							<div class="row border-top border-2 border-black pb-2 text-bg-light">
								<div class="col"></div>
							</div>
							
							
							<div class="row border-bottom pb-2 text-bg-light">
								<div class="col-4 text-center">
									<div class="fw-bold" style="font-size:1.0em;">학과</div>
								</div>
								<div class="col-2 text-center">
									<div class="fw-bold" style="font-size:1.0em;">이름</div>
								</div>
								<div class="col-2 text-center">
									<div class="fw-bold" style="font-size:1.0em;">성별</div>
								</div>
								<div class="col-4 text-center">
									<div class="row">
										<div class="col-9">
											<div class="fw-bold" style="font-size:1.0em;">전화번호</div>
										</div>
										<div class="col px-0">
											<div class="fw-bold" style="font-size:1.0em;">출석</div>
										</div>
									</div>
								</div>
							</div>							
							
							
							<div class="row">
							
								<div class="col" id="studentListBox">
								
									
									
									
								</div>
								
							</div>		
										
							
							
							
						</div>
						<div class="col-2"></div>
					</div>
					
					<div class="row mt-5">
						<div class="col-6"></div>
						<div class="col-4 ms-5">
							<div class="row pb-5 mb-2">
								<div class="col">
									<div class="fw-bold" style="font-size:1.9em; color: #07355e;">상담원 정보</div>
								</div>
								<div class="col-2 pt-1 text-end">
									<a onclick="showModal()"><i class="bi bi-plus-square" style="font-size:1.6em; color:black;"></i></a>
								</div>
							</div>
							<div class="row border-top border-2 border-black pb-2 text-bg-light">
								<div class="col"></div>
							</div>
							
							
							<div class="row border-bottom pb-2 text-bg-light">
								<div class="col-4 text-center">
									<div class="fw-bold" style="font-size:1.0em;">전문분야</div>
								</div>
								<div class="col-2 text-center">
									<div class="fw-bold" style="font-size:1.0em;">이름</div>
								</div>
								<div class="col-2 text-center">
									<div class="fw-bold" style="font-size:1.0em;">성별</div>
								</div>
								<div class="col-4 text-center">
									<div class="fw-bold" style="font-size:1.0em;">전화번호</div>
								</div>
							</div>							
							<div class="row">
								<div class="col" id="counselorListBox">

								</div>
							</div>					
						</div>
						<div class="col-2"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row" style="height:8em;"></div>
	<div class="row">
		<div class="col text-center fw-bold">
			<hr>
		</div>
	</div>
	<div class="row">
		<div class="col"></div>
		<div class="col">
			<div class="row">
				<div class="col" style="font-size: 0.7em; font-weight: bold; text-align: center;">
					서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층) /
				</div>
			</div>
			<div class="row">
				<div class="col" style="font-size: 0.7em; font-weight: bold; text-align: center;">
					TEL:010-4761-2103 / E-MAIL:se001lec@naver.com
				</div>
			</div>
			<div class="row">
				<div class="col" style="font-size: 0.7em; font-weight: bold; text-align: center;">
					COPYRIGHT© 2023 MINKUE UNIVERSITY ALL RIGHTS RESERVED.
				</div>
			</div>
		</div>
		<div class="col mt-2" style="text-align: left;">
			<i class="bi bi-twitter"></i>
			<i class="bi bi-facebook"></i>
			<i class="bi bi-instagram"></i>
		</div>
	</div>	
</div>


<!-- 템플릿 -->
<div id="templete" class="d-none">

	<div class="row studentWrapper border-bottom py-2">
		<div class="col-4 text-center">
			<div class="studentDepartment" style="font-size:0.9em;"></div>
		</div>
		<div class="col-2 text-center">
			<div class="studentName" style="font-size:0.9em;"></div>
		</div>
		<div class="col-2 text-center">
			<div class="studentGender" style="font-size:0.9em;"></div>
		</div>
		<div class="col-4 text-center">
			<div class="row">
				<div class="col-9">
					<div class="studentPhone" style="font-size:0.9em;"></div>
				</div>
				<div class="col px-0">
					<i class="checkAttendanceButton bi bi-check-square" style="color:black;"></i>
				</div>
			</div>
		</div>
	</div>
	

	<div class="row counselorWrapper border-bottom py-2">
		<div class="col-4 text-center">
			<div style="font-size:0.9em;"></div>
		</div>
		<div class="col-2 text-center">
			<div class="counselorName" style="font-size:0.9em;"></div>
		</div>
		<div class="col-2 text-center">
			<div class="counselorGender" style="font-size:0.9em;"></div>
		</div>
		<div class="col-4 text-center">
			<div class="counselorPhone" style="font-size:0.9em;"></div>
		</div>
	</div>
	
	<div class="row allCounselorWrapper border-bottom py-2">
		<div class="col-1"></div>
		<div class="col-2 text-center">
			<div style="font-size:0.9em;">
				<input type="checkbox" class="checkBox">
			</div>
		</div>
		<div class="col-2 text-center">
			<div class="counselorName" style="font-size:0.9em;"></div>
		</div>
		<div class="col-2 text-center">
			<div class="counselorGender" style="font-size:0.9em;"></div>
		</div>
		<div class="col-4 text-center">
			<div class="counselorPhone" style="font-size:0.9em;"></div>
		</div>
		<div class="col-1"></div>
	</div>	
	
</div>


<!-- 모달창 -->

<div id="writeModal" class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <div class="modal-title fw-bold" style="font-size:2em;">상담원 목록</div>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            	<div class="row">
            		<div class="col-2">
						<div class="dropdown">
						  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
						    전체
						  </button>
						  <ul class="dropdown-menu">
						    <li><a class="dropdown-item" onclick="reloadModalByCategoryId()">성격문제</a></li>
						    <li><a class="dropdown-item">대인/가족관계</a></li>
						    <li><a class="dropdown-item">이성문제</a></li>
						    <li><a class="dropdown-item">우울/불안문제</a></li>
						    <li><a class="dropdown-item">진로문제</a></li>
						    <li><a class="dropdown-item">학업문제</a></li>
						  </ul>
						</div>
            		</div>
            		<div class="col"></div>
            	</div>
            	
            	<div class="row" style="height: 1em;"></div>
            	
				<div class="row border-top border-2 border-black pb-2 text-bg-light">
					<div class="col"></div>
				</div>            
				<div class="row border-bottom pb-2 text-bg-light">
					<div class="col-1"></div>
					<div class="col-2 text-center">
						<div class="fw-bold" style="font-size:1.0em;"></div>
					</div>
					<div class="col-2 text-center">
						<div class="fw-bold" style="font-size:1.0em;">이름</div>
					</div>
					<div class="col-2 text-center">
						<div class="fw-bold" style="font-size:1.0em;">성별</div>
					</div>
					<div class="col-4 text-center">
						<div class="fw-bold" style="font-size:1.0em;">전화번호</div>
					</div>
					<div class="col-1"></div>
				</div>	            
            
				<div class="row">
					<div class="col" id= "allCounseolorListBox">
							
					
					
					</div>
				</div>   


            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            <button onclick="isCheck()" type="button" class="btn" style="background-color:white; color: black; border-color: black;">등록</button>
            </div>
        </div>
    </div>
</div>















<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>