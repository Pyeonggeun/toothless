<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	// 현재 시간 가져오기
	Date currentDate = new Date();
	
	// 시간을 특정 형식으로 포맷팅
	SimpleDateFormat dateFormat = new SimpleDateFormat("yy.MM.dd HH:mm:ss");
	SimpleDateFormat newDateFormat = new SimpleDateFormat("yy.MM.dd");
	SimpleDateFormat hourDateFormat = new SimpleDateFormat("HH:mm:ss");
	String formattedDate = dateFormat.format(currentDate);
	String newFormattedDate = newDateFormat.format(currentDate);
	String hourFormattedDate = hourDateFormat.format(currentDate);
%>
  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Insert title here</title>
<style>
    .word {
        width: 1rem;
        font-size: 1rem;
        font-weight: !important;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    
    .shadow {   /* 그림자 효과 */
      box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
    }
    
     .text-over-cut {
        display: block;
        max-width: 800px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
   	}
   	
     .text-over-cut2 {
        display: block;
        max-width: 320px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
   	}
   	
</style>


<script>

	//초기 월 값 설정
	let currentDate = new Date(2023, 11, 21); // 2023.12.01 (월은 0부터 시작하므로 11은 12월을 나타냄)
	
	// 일을 변경하는 함수
	function changeDay(offset) {
	  currentDate.setDate(currentDate.getDate() + offset);
	  updateDayDisplay();
	}
	
	// 일 표시 업데이트 함수
	function updateDayDisplay() {
	  const year = currentDate.getFullYear() % 100;
	  const month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
	  const day = currentDate.getDate().toString().padStart(2, '0');
	  const formattedDay = year + '.' + month + '.' + day;
	  document.getElementById('currentDay').textContent = formattedDay;
	
	  const url = "./selectSomeDayDiaryList?month=" + month + "&day=" + day;
	
	  fetch(url)
	    .then(response => response.json())
	    .then(response => {
	
	      // 데일리 일지 리스트
	      let daliyDiaryList = response.data.daliyDiaryList;
	
	      document.getElementById("templateWrapper").innerHTML = "";
	
	      const dateTemplate = document.querySelector("#dateTemplate");
	
	      for (const e of daliyDiaryList) {
	
	        // 템플릿 복사
	        const template = document.querySelector(".template").cloneNode(true);
	
	        // 보여줄 정보 넣고
	        template.querySelector("#someDate").innerText = e.STUNAME
	        template.querySelector("#someName").innerText = e.DIARY;
	
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
		updateDayDisplay();
		showNoticeContent();
	});

</script>

</head>
<body>
<div class="container-fluid">
	<!-- 최상단 -->
	<jsp:include page="../commons/staff/mainPageTopNavi.jsp"></jsp:include>

	<!-- 내용시작 -->
	<div class="row">
		<!-- 우측내용 -->
		<div class="col" style="background-color: #F5F6F6">
			<div class="row justify-content-center mt-5">
				<div class="col-6">
					<div class="row">
						<!-- 마이페이지 -->
						<div class="col shadow bg-white text-center">
							<div class="row border-bottom py-2" style="background-color: #E5EFF6">
								<div class="col">
									<span class="fs-5 fw-bold" style="color:#0061AA">${sessionStaffInfo.name}</span>님 환영합니다.
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
									<button type="button" class="btn rounded-0 text-white" style="background-color: #007AC3; font-size: 0.7em;" 
									data-bs-toggle="modal" data-bs-target="#exampleModal">마이페이지</button>
								</div>
								<div class="col-4">
									<a href="./logoutProcess" class="text-black d-grid" style="text-decoration: none;">
									<button type="button" class="btn rounded-0 btn-danger" style="font-size: 0.8em;">로그아웃</button>
									</a>
								</div>
							</div>
						</div>
						
						<!-- 모달 -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header" style="background-color: #E5EFF6">
										<h1 class="modal-title fs-5 fw-bold" id="exampleModalLabel">마이페이지</h1>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="row py-1">
											<div class="col-3 fw-bold text-center border-end">사번</div>
											<div class="col ms-2">${sessionStaffInfo.staff_id}</div>
										</div>
										<div class="row py-1">
											<div class="col-3 fw-bold text-center border-end">이름</div>
											<div class="col ms-2">${sessionStaffInfo.name}</div>
										</div>
										<div class="row py-1 ">
											<div class="col-3 fw-bold text-center border-end">전화번호</div>
											<div class="col ms-2">${sessionStaffInfo.phone}</div>
										</div>
										<div class="row py-1 ">
											<div class="col-3 fw-bold text-center border-end">이메일</div>
											<div class="col ms-2">${sessionStaffInfo.email}</div>
										</div>
									</div>
									<div class="modal-footer">
										<div class="row d-flex">
											<div class="col">
												<button type="button" class="btn btn-secondary mx-0 rounded-0 text-white fw-bold" data-bs-dismiss="modal" >닫기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 수강신청 일정 -->
						<div class="col shadow bg-white ms-3">
							<div class="row border-bottom p-2">
								<div class="col fs-5">
									<span class="fw-bold">일지 목록</span>
								</div>
								<div class="col text-end align-self-end">
									<span style="font-size: 0.9em;" class="fw-lighter text-end">
										<%= hourFormattedDate %>
										 <span style="font-size: 0.8em;">기준</span>
									</span>
								</div>
							</div>
						    <div class="row p-2 mb-3 text-center">
							    <div class="col-1 fs-5 month-selector" onclick="changeDay(-1)">
							      <i class="bi bi-chevron-left"></i>
							    </div>
							    <div class="col fs-5 fw-bold" id="currentDay">
							      2023.12
							    </div>
							    <div class="col-1 fs-5 me-2 month-selector" onclick="changeDay(1)">
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
											<div id="someDate" class="col" >
												임원명
											</div>
										</div>
										<div class="row text-start mb-1">
											<div class="col-1">
											</div>
											<div onclick="location.href='./jw_diaryManagementPage'" id="someName" class="col text-over-cut2" style="color: #007AC3; cursor: pointer;">
												일지내용
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
					<div class="row p-2 border-bottom">
						<div class="col fw-bold fs-5">
							 ${thisSemester.semester_year} ${thisSemester.semester} 선발 현황
						</div>
						<div style="font-size: 0.9em;" class="col fw-lighter text-end align-self-end">
							 <%= newFormattedDate %>
							<span style="font-size: 0.8em;">기준</span>
						</div>
					</div>
					<div class="row mt-4">
						<div class="col mt-3">
							<div class="row mx-3 py-5" style="background-color: #F5F6F6;">
								<div class="col text-center" onclick="location.href='./mj_readApplyDormInfoPage'" style="cursor: pointer;">
									<div class="row mb-3">
									 	<div class="col">
									 		<i class="fs-1 bi bi-file-earmark-check"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">신청 목록</div>
									</div>
									<div class="row">
									 	<div id="cntlecture" class="col fw-bold fs-5" style="color:#007AC3"> ${countApplyList }</div>
									</div>
								</div>
								<div class="col text-center" onclick="location.href='./mj_readApplyDormInfoPage'" style="cursor: pointer;">
									<div class="row mb-3">
									 	<div class="col">
									 		<i class="fs-1 bi bi-person-vcard"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">선발 완료</div>
									</div>
									<div class="row">
									 	<div id="cntOpenLec" class="col fw-bold fs-5" style="color:#007AC3">${countDormSelectedList }</div>
									</div>
								</div>
								<div class="col text-center" onclick="location.href='./mj_managePaymentPage'" style="cursor: pointer;">
									<div class="row mb-3">
									 	<div class="col">
									 		<i class="fs-1 bi bi-credit-card"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">납부 완료</div>
									</div>
									<div class="row">
									 	<div id="cntTeacher" class="col fw-bold fs-5" style="color:#007AC3">${countPaymentYesList }</div>
									</div>
								</div>
								<div class="col text-center" onclick="location.href='./dm_roomAssignment'" style="cursor: pointer;">
									<div class="row mb-3">
									 	<div class="col">
									 		<i class="fs-1 bi bi-house-check"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">배정 완료</div>
									</div>
									<div class="row">
									 	<div id="cntStudent" class="col fw-bold fs-5" style="color:#007AC3">${assignedDormStudentCount }</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
			
			<!-- 중간 -->
			<div class="row justify-content-center mt-3">
				<div class="col-6">
					<div class="row">
						<!-- 마이페이지 -->
						<div class="col shadow bg-white rounded-0 border border-light-subtle" style="height: 220px;">
                           <div class="row ms-4 mt-4">
                           	<div class="col fs-5 fw-bold">
                           		임원 관리
                           	</div>
                           </div>
                                 <div class="row ms-4 mt-1">
                           	<div class="col fw-lighter" style="font-size: 0.9rem">
                           		 ${thisSemester.semester_year} ${thisSemester.semester} <%= newFormattedDate %> 기준
                           	</div>
                           </div>
                           <div class="row pt-2">
                           	<div class="col">
                           		<div class="row mt-4 justify-content-between" onclick="location.href='./jw_executiveAssignmentPage'" style="cursor: pointer;">
                           			<div class="col-1"></div>
                           			<div class="col fw-lighter text-start align-self-center">임원 현황</div>
                           			<div class="col fw-bold fs-4 text-end">${countExecutive}
                           				<span class="fw-lighter" style="font-size: 0.9rem"><i class="bi bi-chevron-right"></i></span>
                           			</div>
                           			<div class="col-2"></div>
                           		</div>
                           		<div class="row justify-content-between" onclick="location.href='./jw_diaryManagementPage'" style="cursor: pointer;">
                           			<div class="col-1"></div>
                           			<div class="col fw-lighter text-start align-self-center">일지 관리</div>
                           			<div class="col fw-bold fs-4 text-end">${countTodayDiary}
                           				<span class="fw-lighter" style="font-size: 0.9rem"><i class="bi bi-chevron-right"></i></span>
                           			</div>
                           			<div class="col-2"></div>
                           		</div>
                           	</div>
                           </div>
                       </div>
						
						<!-- 수강신청 일정 -->
							<div class="col shadow bg-white rounded-0 border border-light-subtle ms-3" style="height: 220px;">
                               <div class="row ms-4 mt-4">
                               	<div class="col fs-5 fw-bold">
                               		상/벌점 관리
                               	</div>
                               </div>
                               <div class="row ms-4 mt-1">
                               	<div class="col fw-lighter" style="font-size: 0.9rem">
                               		${thisSemester.semester_year} ${thisSemester.semester} <%= newFormattedDate %> 기준
                               	</div>
                               </div>
                                     <div class="row pt-2">
                               	<div class="col">
                               		<div class="row mt-4 justify-content-between" onclick="location.href='./jw_pointSituationPage'" style="cursor: pointer;">
                               			<div class="col-1"></div>
                               			<div class="col fw-lighter text-start align-self-center">장학금 대상</div>
                               			<div class="col fw-bold fs-4 text-end">${countPlusPointDormStudent}
                               				<span class="fw-lighter" style="font-size: 0.9rem"><i class="bi bi-chevron-right"></i></span>
                               			</div>
                               			<div class="col-2"></div>
                               		</div>
                               		<div class="row justify-content-between" onclick="location.href='./jw_pointSituationPage'" style="cursor: pointer;">
                               			<div class="col-1"></div>
                               			<div class="col fw-lighter text-start align-self-center">징계 대상</div>
                               			<div class="col fw-bold fs-4 text-end text-danger">${countMinusPointDormStudent}
                               				<span class="fw-lighter text-black" style="font-size: 0.9rem"><i class="bi bi-chevron-right"></i></span>
                               			</div>
                               			<div class="col-2"></div>
                               		</div>
                               	</div>
                              
                           </div>
						</div>
					</div>
				</div>
				
				
				<!-- 바로가기 -->
				<div class="col-5 shadow bg-white rounded-0 border border-light-subtle mx-3" style="height: 220px;">
					<div class="row">
						<div class="col">
							<div class="row ms-4 mt-4">
                             	<div class="col fs-5 fw-bold">
                             		외출/외박 현황
                             	</div>
                             	<div class="col-2"></div>
                             </div>
                             <div class="row ms-4 mt-1">
                             	<div class="col fw-lighter" style="font-size: 0.9rem">
                             		<%= formattedDate %> 기준
                             	</div>
                             </div>
                             <div class="row pt-2">
                             	<div class="col">
                             		<div class="row mt-4 justify-content-between" onclick="location.href='./jw_exitSituationPage'" style="cursor: pointer;">
                             			<div class="col-1 me-1"></div>
                             			<div class="col fw-lighter text-start align-self-center">외출/외박인원</div>
                             			<div class="col fw-bold fs-4 text-end">${countTodayExit}
                             				<span class="fw-lighter" style="font-size: 0.9rem"><i class="bi bi-chevron-right"></i></span>
                             			</div>
                             			<div class="col-2"></div>
                             		</div>
                             	</div>
                             </div>
						</div>
						<div class="col">
							<div class="row ms-4 mt-4">
	                         	<div class="col fs-5 fw-bold">
	                         		점호 참석 현황
	                         	</div>
	                         </div>
	                         <div class="row ms-4 mt-1">
	                         	<div class="col fw-lighter" style="font-size: 0.9rem">
	                         		<%= newFormattedDate %> 기준
	                         	</div>
	                         </div>
	                         <div class="row pt-2">
	                         	<div class="col">
	                         		<div class="row mt-4 justify-content-between" onclick="location.href='./jw_callAttendSituationPage'" style="cursor: pointer;">
	                         			<div class="col-1 me-1"></div>
	                         			<div class="col fw-lighter text-start align-self-center" >
	                          				불참인원
	                         			</div>
	                         			<div class="col fw-bold fs-4 text-end text-danger">${countTodayCallAbsence}
	                         				<span class="fw-lighter" style="font-size: 0.9rem"><i class="bi bi-chevron-right"></i></span>
	                         			</div>
	                         			<div class="col-2"></div>
	                         		</div>
	                         	</div>
	                         </div>
						</div>
					</div>
				</div>
			</div>
            
			
			<!-- 하단 row -->
			<div class="row justify-content-center mt-3 mb-5">
				
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
					
					<div id="noticeContent" class="d-none">
						<div class="col info">
							<div class="row"  style="height: 180px;">
								<div class="col">
									<!-- 반복문 돌곳 -->
									<c:forEach items="${dormNoticeList}" var="dormNoticeList">
									<div class="row py-2">
										<div class="col-1 text-end">
											<i class="bi bi-dot fw-bold"></i>
										</div>
										<div class="col text-start ps-0 text-over-cut">
											<span style="color: #007AC3">[알림]</span>
											 <a href="../student/dm_NoticeArticlePage?dorm_notice_pk=${dormNoticeList.dorm_notice_pk}"
											 class="text-black" style="text-decoration: none;"
											 > ${dormNoticeList.title}
											 </a>
										</div>
										<div class="col-2 text-center" style="font-size: 0.9em; color: #ADB5BD;">
											<fmt:formatDate value="${dormNoticeList.created_at}" pattern="yy.MM.dd" />
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
							<div class="row">
								<div class="col text-end me-3">
                                <a class="btn fw-bold" href="../student/dm_dormNoticePage" role="button" style="background-color: #E5EFF6">공지사항 등록하기</a>
                              	</div>
							</div>
						</div>
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
				</div>
				
				<!-- 바로가기 -->
				<div class="col-5 shadow bg-white mx-3 pb-3">
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
									단위기간
								</div>
								<div class="col text-start text-over-cut">
									학년도/학기 '2024-1학기' 추가 부탁드립니다.
								</div>
								<div class="col-2">
									1
								</div>
							</div>
							<div class="row text-center py-2">
								<div class="col-3" style="color: #007AC3">
									기숙사
								</div>
								<div class="col text-start text-over-cut">
									'A'동 2인실 세부사진 추가 부탁드립니다.
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
									기숙사 주차장 관련 문의사항 있습니다.
								</div>
								<div class="col-2">
									2
								</div>
							</div>
							<div class="row text-center py-2">
								<div class="col-3" style="color: #007AC3">
									기숙사
								</div>
								<div class="col text-start text-over-cut">
									'B동' 선발 인원 추가 부탁드립니다.
								</div>
								<div class="col-2">
									1
								</div>
							</div>
							<div class="row text-center py-2">
								<div class="col-3" style="color: #007AC3">
									사생
								</div>
								<div class="col text-start text-over-cut">
									임원 추가 모집 부탁드립니다.
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

            <!-- 최하단 -->
            <div style="background-color:rgb(219, 241, 248)">
                
            </div>
		</div>
	</div>

</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>