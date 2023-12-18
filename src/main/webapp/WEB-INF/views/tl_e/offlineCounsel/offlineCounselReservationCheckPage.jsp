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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e489bc18b071ba44b80a9f876cf199ee&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

	<script>
		
		let myId = ${sessionExternalInfo.external_pk};
		let pageNum = 1;
		
		function reloadReservationList(pageNum){
			
			url = "./getReservationListByCounselor?external_pk=" + myId + "&pageNum=" + pageNum;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
					
				let index = 1;
				
				console.log("reloadlistPageNum: "+pageNum);
				
				const reservationListBox = document.getElementById("reservationListBox");
				reservationListBox.innerHTML = "";
				
				for(e of response.data){
					
					const reservationWrapper = document.querySelector("#templete .reservationWrapper").cloneNode(true);
					
					const reservationNo = reservationWrapper.querySelector(".reservationNo");
					reservationNo.innerText = index;
					index++;
					
					if(e.offlineReservationDto.state == '취소' && e.counselDocumentDto == null){
						const cancelBadge = document.createElement('span');
						cancelBadge.classList.add("badge", "bg-danger");
						cancelBadge.innerText = "취소";
						reservationNo.appendChild(cancelBadge);
					}
					
					const reservationCategoryName = reservationWrapper.querySelector(".reservationCategoryName");
					reservationCategoryName.innerText = e.typeCategoryDto.name;
					
					const reservationStudentName = reservationWrapper.querySelector(".reservationStudentName");
					reservationStudentName.innerText =  e.studentInfoDto.name;
					
					const reservationStudentId = reservationWrapper.querySelector(".reservationStudentId");
					reservationStudentId.innerText =  e.studentInfoDto.student_id;
					
					const reservationCreatedAt = reservationWrapper.querySelector(".reservationCreatedAt");
					const date = new Date(e.offlineReservationDto.created_at);					
					reservationCreatedAt.innerText = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " + date.getHours() + ":00";
					
					const reservationState = reservationWrapper.querySelector(".reservationState");
					reservationState.innerText = e.offlineReservationDto.state;
					
					const reservationDate = reservationWrapper.querySelector(".reservationDate");
					reservationDate.innerText = e.offlineReservationDto.counsel_year + "-" + e.offlineReservationDto.counsel_month + "-" 
						+ e.offlineReservationDto.counsel_date + " " + e.offlineReservationDto.counsel_hour + ":00";
					
					const createCounselReport = reservationWrapper.querySelector(".createCounselReport");
					createCounselReport.setAttribute("onclick", "showModal("+e.offlineReservationDto.id+","+e.studentInfoDto.student_pk+","+e.typeCategoryDto.id+")");
					
					if(e.counselDocumentDto != null){
						createCounselReport.classList.add("btn-dark");
						createCounselReport.value = "일지확인";
					}else{
						createCounselReport.classList.add("btn-outline-dark");
						createCounselReport.value = "일지작성";
					}
						
					reservationListBox.appendChild(reservationWrapper);
				}
				
			});

		}
		
		function showModal(reservationPk, studentPk, categoryPk){
			
			const writeModal = bootstrap.Modal.getOrCreateInstance("#writeModal");
			const writeModalElement = document.querySelector("#writeModal");
			
			url = "./getCounselReportInfo?reservationPk=" + reservationPk + "&studentPk=" + studentPk + "&categoryPk=" + categoryPk;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const map = response.data;
				
				const counselDate = writeModalElement.querySelector(".counselDate");
				counselDate.innerText = map.offlineReservationDto.counsel_year + "-" + map.offlineReservationDto.counsel_month 
				+ "-" + map.offlineReservationDto.counsel_date + " " + map.offlineReservationDto.counsel_hour + ":00";
				
				
				const studentName = writeModalElement.querySelector(".studentName");
				studentName.innerText = map.studentInfoDto.name;
				
				const stateBox = writeModalElement.querySelector(".stateBox");
				if(map.counselDocumentDto != null){
					stateBox.innerHTML = "";
					stateBox.innerText = map.offlineReservationDto.state;
					stateBox.classList.add("pt-1");
					<%--
					for(let option of counselState.options){
						if(option.value == map.offlineReservationDto.state){
							option.selected = true;
							break;
						}
					}
					--%>
				}else{
					counselState = document.createElement("select");
					counselState.classList.add(".counselState");
					counselState.classList.add("form-select");
					stateBox.appendChild(counselState);
					
					const option1 = document.createElement("option");
					option1.setAttribute("value", "신청");
					option1.innerText = "신청";
					counselState.appendChild(option1);
					
					const option2 = document.createElement("option");
					option2.setAttribute("value", "완료");
					option2.innerText = "완료";
					counselState.appendChild(option2);
					
					const option3 = document.createElement("option");
					option3.setAttribute("value", "취소");
					option3.innerText = "취소";
					counselState.appendChild(option3);
					
					const option4 = document.createElement("option");
					option4.setAttribute("value", "노쇼");
					option4.innerText = "노쇼";
					counselState.appendChild(option4);
					
				}
				
				const gender = writeModalElement.querySelector(".gender");
				gender.innerText = map.studentInfoDto.gender;
				
				const counselCategory = writeModalElement.querySelector(".counselCategory");
				counselCategory.innerText = map.typeCategoryDto.name;
				
				const studentPhoneNumber = writeModalElement.querySelector(".studentPhoneNumber");
				studentPhoneNumber.innerText = map.studentInfoDto.phone;
				
				const studentText = writeModalElement.querySelector(".studentText");
				studentText.innerText = map.offlineReservationDto.text;
				
				const contentBox = writeModalElement.querySelector(".contentBox");
				if(map.counselDocumentDto != null){
					contentBox.innerHTML = "";
				}else{
					const content = document.createElement("textarea");
					content.classList.add("form-control");
					contentBox.appendChild(content);
					content.rows = 5;
				}
				
				const counselorTextBox = writeModalElement.querySelector(".counselorTextBox");
				if(map.counselDocumentDto != null){
					counselorTextBox.innerHTML = "";
					counselorTextBox.innerText = map.counselDocumentDto.text;
				}else{
					counselorText = document.createElement("textarea");
					counselorText.classList.add("form-control");
					counselorText.classList.add("counselorText");
					counselorTextBox.appendChild(counselorText);
					counselorText.rows = 5;
				}
				
				const locationBox = writeModalElement.querySelector(".locationBox");
				if(map.counselDocumentDto != null){
					locationBox.innerHTML = "";
					locationBox.innerText = map.counselDocumentDto.location;
				}else{
					counselLocation = document.createElement("input");
					counselLocation.classList.add("form-control");
					counselLocation.classList.add("counselLocation");
					locationBox.appendChild(counselLocation);
					counselLocation.setAttribute("onclick", "locationRegister()");
				}
				
				if(map.counselDocumentDto != null){
					locationMap(map.counselDocumentDto.location);
				}
				
				const closeBtn = writeModalElement.querySelector(".closeBtn");
				closeBtn.setAttribute("onclick", "closeModal()");
				
				const saveBtn = writeModalElement.querySelector(".saveBtn");
				
				if(map.counselDocumentDto != null){
					saveBtn.disabled = true;
				}
				
			    saveBtn.addEventListener("click", function() {
			        const id = map.offlineReservationDto.id;
			        const stateValue = counselState.value;
			        const textValue = counselorText.value;
			        const locationValue = counselLocation.value;

			        // 필요한 매개변수와 함께 save 함수 호출
			        save(id, stateValue, textValue, locationValue);
			    });

				const xClose = writeModalElement.querySelector(".xClose");
				xClose.setAttribute("onclick", "closeModal()");
				
			});
			
			writeModal.show();
		}
		
		
		function save(id, state, text, location){

			console.log("reid: "+id);
			console.log("state: "+id);
			console.log("text: "+id);
			console.log("location: "+id);
			url = "./counselReportRegisterProcess?id=" + id + "&state=" + state + "&text=" + text + "&location=" + location;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				reloadReservationList(pageNum);
				closeModal();
			});
			
		}
		
		
		function closeModal(){
			
			const writeModal = bootstrap.Modal.getOrCreateInstance("#writeModal");
			const writeModalElement = document.querySelector("#writeModal");
			
			writeModalElement.querySelector(".counselDate").innerText = "";
			writeModalElement.querySelector(".studentName").innerText = "";
			writeModalElement.querySelector(".stateBox").innerHTML = "";
			writeModalElement.querySelector(".gender").innerText = "";
			writeModalElement.querySelector(".counselCategory").innerText = "";
			writeModalElement.querySelector(".studentPhoneNumber").innerText = "";
			writeModalElement.querySelector(".studentText").innerText = "";
			writeModalElement.querySelector(".contentBox").innerHTML = "";
			writeModalElement.querySelector(".counselorTextBox").innerHTML = "";
			writeModalElement.querySelector(".locationBox").innerHTML = "";
			writeModalElement.querySelector(".saveBtn").disabled = false;
			const maplocation = document.getElementById("maplocation");
			maplocation.innerText = "";
			
			<%--
			const elementsGroup = writeModalElement.querySelectorAll(".counselDate, .studentName, .counselState, .gender, .counselCategory, .studentPhoneNumber, .studentText, .counselorText");

			elementsGroup.forEach(element => {
			    if (element.tagName === "INPUT" || element.tagName === "TEXTAREA") {
			        element.value = ""; // 입력 필드 초기화
			    } else {
			        element.innerText = ""; // 텍스트 요소 초기화
			    }
			});
			--%>
			
			writeModal.hide();
		}
		
		function createPageNum(pageNum){
			
			url = "./counselorTotalCounselCount?external_pk=" + myId;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const totalCount = response.data;
				const totalPageNum = Math.ceil(totalCount / 10);
				
				let startPageNum = (Math.floor((pageNum - 1) / 5) * 5) + 1;
				let endPageNum = (Math.floor((pageNum - 1) / 5) + 1) * 5;
				
				if(endPageNum > totalPageNum){
					endPageNum = totalPageNum;
				}
				
				const pagination = document.querySelector(".pagination");
				const pageNumbers = document.querySelectorAll('.pagination .page-item:not(.startPageNumli):not(.endPageNumli)');
				
				for(e of pageNumbers){
					e.remove();
				}
				
				const startPageNumber = pagination.querySelector(".startPageNumber");
				
				if(startPageNum == 1){
					startPageNumber.disabled = true;
					startPageNumber.classList.add("bg-secondary-subtle");
				}else{
					startPageNumber.disabled = false;
					startPageNumber.classList.remove("bg-secondary-subtle");
					startPageNumber.setAttribute("onclick", "setPageNum("+(startPageNum - 1)+")");
				}
				
				const pageNumli = document.createElement("li");
				
				for(let i = startPageNum; i <= endPageNum; i++){
					
					const pageNumWrapper = pageNumli.cloneNode(true);
					pageNumWrapper.classList.add("page-item");
					
					const pageNumber = document.createElement("a");
					pageNumber.classList.add("page-link");
					pageNumber.innerText = i;
					pageNumber.classList.add("text-dark");
					pageNumWrapper.appendChild(pageNumber);
					
					pagination.insertBefore(pageNumWrapper, pagination.querySelector('.endPageNumli'));
					
					pageNumber.setAttribute("onclick", "setPageNum("+i+")");
					
	                if(pageNum == i){
	                	pageNumber.classList.add('bg-primary-subtle');
	                }else{
	                	pageNumber.classList.remove('bg-primary-subtle');
	                }
					
				}
				
				
				const endPageNumber = pagination.querySelector(".endPageNumber");
				
				if(endPageNum >= totalPageNum){
					endPageNumber.disabled = true;
					endPageNumber.classList.add("bg-secondary-subtle");
				}else{
					endPageNumber.disabled = false;
					endPageNumber.classList.remove("bg-secondary-subtle");
					endPageNumber.setAttribute("onclick", "setPageNum("+(endPageNum + 1)+")");
				}
				
			});

		}
		
		function setPageNum(clickedPageNum){
			
			console.log("setPageNum: "+clickedPageNum);
			pageNum = clickedPageNum;
			createPageNum(pageNum);
			reloadReservationList(pageNum);
			
		}
		
		
		function locationRegister(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            const counselLocation = document.querySelector(".counselLocation");
		            
		            if(data.buildingName === ""){
		            	counselLocation.value = data.address;
		            }else {
		            	counselLocation.value = data.address + " (" + data.buildingName + ")";
		            }
		            
		        }
		    }).open();			
		}
		
		function locationMap(location){
			
			var mapContainer = document.getElementById('maplocation'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(location, function(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
	
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
	
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		
		}
		
		window.addEventListener("DOMContentLoaded", () => {
			reloadReservationList(pageNum);
			createPageNum(pageNum);
		});

		
	
	</script>


</head>
<body>

	<div class="container-fluid">
	
		<div class="row">
			<div class="col">
				<jsp:include page="../commons/counselorTopArea.jsp"></jsp:include>
			</div>
		</div>

		<div class="row">
			<div class="col-1"></div>
			<div class="col-10 ps-5">
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
										이름
									</div>
									<div class="col-3">
										<input class="form-control" type="text">
									</div>
									<div class="col-1"></div>
									<div class="col-1 fw-bold">
										학번
									</div>
									<div class="col-3">
										<input class="form-control" type="text">
									</div>
								</div>
								<div class="row pt-3 pb-3 align-items-center border-bottom">
									<div class="col-1 fw-bold">
										상담종류
									</div>
									<div class="col-3">
										<select class="form-select">
										  <option value="1" selected>전체</option>
										  <option value="2">성격문제</option>
										  <option value="3">대인/가족관계</option>
										  <option value="4">이성문제</option>
										  <option value="5">우울/불안문제</option>
										  <option value="6">진로문제</option>
										  <option value="7">학업문제</option>
										</select>								
									</div>
									<div class="col-1"></div>
									<div class="col-1 fw-bold">
										상담상태
									</div>
									<div class="col-3">
										<select class="form-select">
										  <option value="1" selected>전체</option>
										  <option value="2">신청</option>
										  <option value="3">완료</option>
										  <option value="4">취소</option>
										  <option value="5">노쇼</option>
										</select>								
									</div>
								</div>
								<div class="row pt-3 pb-3 border-bottom">
									<div class="col-1 fw-bold pt-1">
										일자
									</div>
									<div class="col-2">
										<select class="form-select">
										  <option selected>일자</option>
										  <option value="1">상담신청일</option>
										  <option value="2">상담예약일</option>
										</select>								
									</div>
									<div class="col-3 ps-5">
										<input class="form-control" type="date">
									</div>
								</div>
								<div class="row py-3">
									<div class="col-4"></div>
									<div class="col-2 d-grid">
										<input class="btn btn-outline-dark" type="submit" value="초기화" style="background-color: rgb(255,255,255);">
									</div>
									<div class="col-2 d-grid">
										<input class="btn btn-dark" type="submit" value="검색">
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
					<div class="col">
						상담종류
					</div>
					<div class="col">
						이름
					</div>
					<div class="col">
						학번
					</div>
					<div class="col-2">
						신청일
					</div>
					<div class="col">
						상담상태
					</div>
					<div class="col-2">
						상담일자
					</div>
					<div class="col">
						상담일지
					</div>
				</div>
				<div class="row">
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
	
	<!-- 템플릿!!! -->
	<div id="templete" class="d-none">
		<div class="reservationWrapper row pt-3 pb-3 border-bottom text-center">
			<div class="reservationNo col-1 pt-2">
				<%-- 
				<c:if test="${map.offlineReservationDto.state == '취소' && map.counselDocumentDto.id == null }">
					<span class="badge text-bg-danger">취소</span>
				</c:if>
				--%>
				${fn:length(list) - vs.index}
			</div>
			<div class="reservationCategoryName col pt-2">
				${map.typeCategoryDto.name }
			</div>
			<div class="reservationStudentName col pt-2">
				${map.studentInfoDto.name }
			</div>
			<div class="reservationStudentId col pt-2">
				${map.studentInfoDto.student_id }
			</div>
			<div class="reservationCreatedAt col-2 pt-2">
				<fmt:formatDate value="${map.offlineReservationDto.created_at }" pattern="yyyy-MM-dd"/>
			</div>
			<div class="reservationState col pt-2">
				${map.offlineReservationDto.state }
			</div>
			<div class="reservationDate col-2 pt-2">
				${map.offlineReservationDto.counsel_year }-${map.offlineReservationDto.counsel_month }-${map.offlineReservationDto.counsel_date }&nbsp;
				${map.offlineReservationDto.counsel_hour }<span>:00</span>
			</div>
			<div class="col d-grid">
				<c:choose>
					<c:when test="${!empty map.counselDocumentDto.id }">
						<input class="createCounselReport btn" type="submit" value="일지확인">
					</c:when>
					<c:otherwise>
						<input class="createCounselReport btn" type="submit" value="일지작성">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<%--
		<input name="reservationPk" type="hidden" value="${map.offlineReservationDto.id }">
		<input name="studentPk" type="hidden" value="${map.studentInfoDto.student_pk }">
		<input name="categoryPk" type="hidden" value="${map.typeCategoryDto.id }">
		 --%>
	</div>
	
    <div id="writeModal" class="modal modal-xl" tabindex="-1">
       <div class="modal-dialog">
         <div class="modal-content">
           <div class="modal-header">
             <h5 class="modal-title fw-bold fs-2 px-3 py-2">개인 상담 일지</h5>
             <input type="button" onclick="closeModal()" class="xClose btn-close" data-bs-dismiss="modal" aria-label="Close">
           </div>
           <div class="modal-body">
			<div class="row pt-4 px-3">
				<div class="col border border-dark">
					<div class="row text-center border-bottom border-dark">
						<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
							<div class="row">
								<div class="col">
									상담일자
								</div>
							</div>
						</div>
						<div class="col border-end border-dark py-3">
							<div class="row">
								<div class="counselDate col">
									
								</div>
							</div>
						</div>
						<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
							<div class="row">
								<div class="col">
									성명									
								</div>
							</div>
						</div>
						<div class="col py-3">
							<div class="row">
								<div class="studentName col">
										
								</div>
							</div>
						</div>
					</div>
					<div class="row text-center border-bottom border-dark">
						<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
							<div class="row">
								<div class="col pt-2">
									상담상태
								</div>
							</div>
						</div>
						<div class="col border-end border-dark py-3">
							<div class="row">
								<div class="stateBox col">

								</div>
							</div>
						</div>
						<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
							<div class="row">
								<div class="col pt-2">
									성별									
								</div>
							</div>
						</div>
						<div class="col py-3">
							<div class="row">
								<div class="gender col pt-2">
									남
								</div>
							</div>
						</div>
					</div>
					<div class="row text-center border-bottom border-dark">
						<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
							<div class="row">
								<div class="col">
									상담주제
								</div>
							</div>
						</div>
						<div class="col border-end border-dark py-3">
							<div class="row">
								<div class="counselCategory col">
									${map.typeCategoryDto.name }
								</div>
							</div>
						</div>
						<div class="col-2 border-end border-dark py-3 fw-bold" style="background-color: rgb(244, 244, 241);">
							<div class="row">
								<div class="col">
									연락처								
								</div>
							</div>
						</div>
						<div class="col py-3">
							<div class="row">
								<div class="studentPhoneNumber col">
									${map.studentInfoDto.phone }									
								</div>
							</div>
						</div>
					</div>
					<div class="row text-center border-bottom border-dark align-items-center">
						<div class="col-2 py-3 fw-bold border-end border-dark" style="background-color: rgb(244, 244, 241);">
							<div class="row">
								<div class="col">
									신청자<br>
									코멘트
								</div>
							</div>
						</div>
						<div class="col py-3">
							<div class="row">
								<div class="studentText col text-start">
									${map.offlineReservationDto.text }
								</div>
							</div>
						</div>
					</div>
					<div class="row text-center border-bottom border-dark align-items-center py-0">
						<div class="col-2 py-4 fw-bold border-end border-dark" style="background-color: rgb(244, 244, 241);">
							<div class="row">
								<div class="col">
									<br><br>
									상담내용
									<br><br><br>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="row">
								<div class="contentBox col text-start py-3 d-grid">
									
								</div>
							</div>
						</div>
					</div>
					<div class="row text-center align-items-center">
						<div class="col-2 py-5 fw-bold border-end border-dark" style="background-color: rgb(244, 244, 241);">
							<div class="row">
								<div class="col">
									<br>
									상담자의<br>
									평가
									<br>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="row">
								<div class="counselorTextBox col text-start py-3 d-grid">
									
								</div>
							</div>
						</div>
					</div>
					<div class="row text-center align-items-center border-top border-dark">
						<div class="col-2 py-5 fw-bold border-end border-dark" style="background-color: rgb(244, 244, 241);">
							<div class="row">
								<div class="col">상담 장소
								</div>
							</div>
						</div>
						<div class="col">
							<div class="row">
								<div class="locationBox col text-start py-3 d-grid">
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row pt-4 px-3">
				<div class="col">
					<em class="link">
				        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
				            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
				        </a>
				    </em>
				</div>
			</div>
			<div class="row pt-3 px-3">
				<div class="col">
					<div id="maplocation" style="width:100%;height:350px;"></div>
				</div>
			</div>
			<div class="row pt-4 px-3">
				<div class="col">
					* 상담자 본인은 상담일지 내용에 거짓이 없음을 확인합니다.<br>
					* 작성한 상담일지는 학생생활상담센터 제출 이외 용도로 이용하거나 제 3자에게 제공하지 않습니다.
				</div>
			</div>
           </div>
           <div class="modal-footer">
             <input onclick="closeModal()" type="button" class="closeBtn btn btn-dark" data-bs-dismiss="modal" value="닫기">
             <input type="button" class="saveBtn btn btn-primary" value="작성완료">
           </div>
         </div>
       </div>
     </div>
	


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>