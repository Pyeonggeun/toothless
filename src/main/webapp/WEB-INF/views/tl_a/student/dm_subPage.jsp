<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
       	<script>
       	
       	function studentModal(){
       		
       		const modalBody = modalTemplete.querySelector(".modal-body");
       		modalBody.innerHTML = "";
       		const modalFooter = modalTemplete.querySelector(".modal-footer");
       		modalFooter.innerHTML = "";
       		
       		const url = "./studentList";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			const modalTemplete = document.querySelector("#modalTemplete");
           		modalTemplete.querySelector(".modal-title").innerText = "학생리스트";
           		
           		for(e of response.data){
           		
           		const divrow = document.createElement("div");
           		divrow.classList.add("row","mt-2");
           		const divcol1 = document.createElement("div");
           		divcol1.classList.add("col-2","fw-bold");
           		divcol1.innerText = e.name;
           		const divcol2 = document.createElement("div");
           		divcol2.classList.add("col-3");
           		divcol2.innerText = e.student_id;
           		const divcol3 = document.createElement("div");
           		divcol3.classList.add("col");
           		divcol3.innerText = e.phone;
           		const divcol4 = document.createElement("div");
           		divcol4.classList.add("col-3", "btn", "btn-secondary", "d-grid");
           		divcol4.setAttribute("onclick","studentInfo("+ e.student_pk +")");
           		divcol4.innerText = "상세정보";
           		
           		
           		divrow.appendChild(divcol1);
           		divrow.appendChild(divcol2);
           		divrow.appendChild(divcol3);
           		divrow.appendChild(divcol4);
           		
           		
           		
           		modalBody.appendChild(divrow);
           		
           		}
           		
           		const closeButton = document.createElement("button");
       			closeButton.classList.add("btn","btn-secondary");
       			closeButton.setAttribute("data-bs-dismiss","modal")
       			closeButton.setAttribute("type","button")
           		closeButton.innerText = "닫기";
       			modalFooter.appendChild(closeButton);
       			
           		const modal = bootstrap.Modal.getOrCreateInstance("#writemodal");
                modal.show();
       			
       		})
       		
       	}
       	// 모달을 다음으로 넘길때 어떻게 넘길것인가 ..?
       	// 상세정보 클릭시 ==> 새로 모달을 띄우는게 나은가? 아니면
       	function studentInfo(student_pk){
       		
       		
       		
       		const modalTemplete = document.querySelector("#modalTemplete");
       		const modalBody = modalTemplete.querySelector(".modal-body");
       		modalBody.innerHTML = "";
       		modalTemplete.querySelector(".modal-footer").innerHTML = "";
       		
       		const url = "./studentInfoPk?student_pk=" + student_pk;
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			const row1 = document.createElement("div")
       			row1.classList.add("row");
       			const col11 = document.createElement("div");
       			col11.classList.add("col-3","fw-bold");
       			col11.innerText = "이름";
       			const col12 = document.createElement("div");
       			col12.classList.add("col");
       			col12.innerText = response.data.name;
       			const row2 = document.createElement("div")
       			row2.classList.add("row","mt-2");
       			const col21 = document.createElement("div");
       			col21.classList.add("col-3","fw-bold");
       			col21.innerText = "아이디";
       			const col22 = document.createElement("div");
       			col22.classList.add("col");
       			col22.innerText = response.data.student_id;
       			const row3 = document.createElement("div")
       			row3.classList.add("row","mt-2");
       			const col31 = document.createElement("div");
       			col31.classList.add("col-3","fw-bold");
       			col31.innerText = "생년월일";
       			const col32 = document.createElement("div");
       			col32.classList.add("col");
       			col32.innerText = response.data.birth;
       			const row4 = document.createElement("div")
       			row4.classList.add("row","mt-2");
       			const col41 = document.createElement("div");
       			col41.classList.add("col-3","fw-bold");
       			col41.innerText = "성별";
       			const col42 = document.createElement("div");
       			col42.classList.add("col");
       			col42.innerText = response.data.gender;
       			const row5 = document.createElement("div")
       			row5.classList.add("row","mt-2");
       			const col51 = document.createElement("div");
       			col51.classList.add("col-3","fw-bold");
       			col51.innerText = "주소";
       			const col52 = document.createElement("div");
       			col52.classList.add("col");
       			col52.innerText = response.data.address;
       			row1.appendChild(col11);
       			row1.appendChild(col12);
       			row2.appendChild(col21);
       			row2.appendChild(col22);
       			row3.appendChild(col31);
       			row3.appendChild(col32);
       			row4.appendChild(col41);
       			row4.appendChild(col42);
       			row5.appendChild(col51);
       			row5.appendChild(col52);
       			
       			modalBody.appendChild(row1);
       			modalBody.appendChild(row2);
       			modalBody.appendChild(row3);
       			modalBody.appendChild(row4);
       			modalBody.appendChild(row5);
       			
       			const modalFooter = modalTemplete.querySelector(".modal-footer");
       			const closeButton = document.createElement("button");
       			closeButton.classList.add("btn","btn-secondary");
       			closeButton.setAttribute("data-bs-dismiss","modal")
       			closeButton.setAttribute("type","button")
       			closeButton.innerText = "닫기";
       			
       			const backList = document.createElement("button");
       			backList.classList.add("btn","btn-primary");
       			backList.setAttribute("onclick","studentModal()");
       			backList.innerText =  "뒤로가기";
       			
       			modalFooter.appendChild(closeButton);
       			modalFooter.appendChild(backList);
       			
       			
       		})
       		
       		
       	}
       	// 학생 전체인원
       	function studentCount(){
       		
       		const url = "./studentListCount";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			document.querySelector("#studentCount").innerText = response.data;
       			document.querySelector("#studentCount").style.color = "blue";
       		})
       		
       	}
       	
       	// 배정인원
       	function assignListCount(){
       		
			const url = "./assignListCount";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			document.querySelector("#assignCount").innerText = response.data;
       			document.querySelector("#assignCount").style.color = "blue";
       		})
       		
       	}
       	
       	// 배정미완료 인원
       	function assignNeedCount(){
       		
			const url = "./assignNeedListCount";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			document.querySelector("#assignNeedCount").innerText = response.data;
       			document.querySelector("#assignNeedCount").style.color = "blue";
       		})
       		
       	}
       	
       	// 임원 인원
       	function executiveCount(){
       		
			const url = "./executiveListCount";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			document.querySelector("#executiveCount").innerText = response.data;
       			document.querySelector("#executiveCount").style.color = "blue";
       		})
       		
       	}
       	
       	// 오늘 일지 작성수
       	function todayDiaryCountList(){
       		
			const url = "./todayDiaryCountList";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			document.querySelector("#todayLog").innerText = response.data;
       			document.querySelector("#todayLog").style.color = "blue";
       		})
       		
       		
       		
       	}
       	// 오늘 외출 외박 신청수
		function todayOutingCountList(){
       		
			const url = "./todayOutingCountList";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			document.querySelector("#todayOuting").innerText = response.data;
       			document.querySelector("#todayOuting").style.color = "blue";
       		})
       		
       		
       		
       	}
		
		function dongCountList(){
       		
			const url = "./dongCountList";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			document.querySelector("#dongCount").innerText = response.data;
       			document.querySelector("#dongCount").style.color = "blue";
       		})
       		
       		
       		
       	}
		
		function ingSemester(){
			
			const url = "./ingSemester";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			document.querySelector("#semester").innerText = response.data.semester_year + "학년도 " + response.data.semester ;
       			document.querySelector("#semester").style.fontSize = "0.9em";
       			document.querySelector("#semester").style.color = "blue";
       		})
			
		}
       	
		function selectionStatusN(){
       		
			const url = "./selectionStatusN";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			document.querySelector("#selectionStatusN").innerText = response.data;
       			document.querySelector("#selectionStatusN").style.color = "blue";
       		})
       		
       		
       		
       	}
		
		function unpaidPeople(){
			
			const url = "./unpaidPeople";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			document.querySelector("#unpaid").innerText = response.data;
       			document.querySelector("#unpaid").style.color = "blue";
       		})
       		
			
		}
		
		function pointListCount(){
			
			const url = "./pointListCount";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			document.querySelector("#pointCount").innerText = response.data;
       			document.querySelector("#pointCount").style.color = "blue";
       		})
       		
			
		}
		
		function todayPointCreditCount(){
			
			const url = "./todayPointCreditCount";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			document.querySelector("#pointCredit").innerText = response.data;
       			document.querySelector("#pointCredit").style.color = "blue";
       		})
			
		}
		function roomCount(){
			
			const url = "./roomCount";
       		
       		fetch(url)
       		.then(response => response.json())
       		.then(response => {
       			
       			document.querySelector("#room").innerText = response.data;
       			document.querySelector("#room").style.color = "blue";
       		})
			
		}
		function noticeCount(){
					
					const url = "./noticeCount";
		       		
		       		fetch(url)
		       		.then(response => response.json())
		       		.then(response => {
		       			
		       			document.querySelector("#noticeCount").innerText = response.data;
		       			document.querySelector("#noticeCount").style.color = "blue";
		       		})
					
				}
		function noticeRecentWriteTitle(){
			
			const url = "./noticeRecentWriteTitle";
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					document.querySelector("#noticeTitle").innerText = response.data;
					document.querySelector("#noticeTitle").style.color = "blue";
				})
			
		}
		function freeboardCount(){
			
			const url = "./freeboardCount";
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					document.querySelector("#boardCount").innerText = response.data;
					document.querySelector("#boardCount").style.color = "blue";
				})
			
		}
		function freeboardRecentWriteTitle(){
			
			const url = "./freeboardRecentWriteTitle";
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					document.querySelector("#boardTitle").innerText = response.data;
					document.querySelector("#boardTitle").style.color = "blue";
				})
			
		}
		function requestCount(){
			
			const url = "./requestCount";
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					document.querySelector("#repaireAll").innerText = response.data;
					document.querySelector("#repaireAll").style.color = "blue";
				})
			
		}
		function todayRequestCount(){
			
			const url = "./todayRequestCount";
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					document.querySelector("#repaireToday").innerText = response.data;
					document.querySelector("#repaireToday").style.color = "blue";
				})
			
		}
       	
       	
       	window.addEventListener("DOMContentLoaded", () => {
    		
       		studentCount();
       		assignListCount();
       		assignNeedCount();
       		executiveCount();
       		todayDiaryCountList();
       		todayOutingCountList();
       		dongCountList();
       		ingSemester();
       		selectionStatusN();
       		unpaidPeople();
       		pointListCount();
       		todayPointCreditCount();
       		roomCount();
       		noticeCount();
       		noticeRecentWriteTitle();
       		freeboardCount();
       		freeboardRecentWriteTitle();
       		requestCount();
       		todayRequestCount();
       		
    	});
       	
       	
       	
       	
       	
       	
       	</script>
        </head>
        <body>
            
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <div class="row" style="border-bottom: 0.02em solid black ;">
                            <div class="col"></div>
                            <div class="py-4 col fw-bold text-center fs-3">
                                Navi Page
                            </div>
                            <div class="col"></div>
                        </div>
                        <div class="row mt-5">
                            <div class="col">
                                <div class="row"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fs-5 fw-bold">
                                        사생정보
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fw-bold text-center">
                                        학생전체인원
                                    </div>
                                    <div class="col fw-bold text-center">
                                        배정인원
                                    </div>
                                    <div class="col fw-bold text-center">
                                        배정미완료
                                    </div>
                                </div>
                                <div class="row mt-2"><!-- 여기 로우콜 잡기..-->
                                    <div id="studentCount" class="col text-center">
                                        
                                    </div>
                                    <div id="assignCount" class="col text-center">
                                        
                                    </div>
                                    <div id="assignNeedCount" class="col text-center">
                                        
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col-4"></div>
                                    <div class="col d-grid text-end ps-0">
                                        <a onclick="studentModal()" class="btn btn-primary" role="button">학생리스트</a>
                                    </div>
                                    <div class="col d-grid px-0">
                                        <a href="../staff/dm_readRoomAssignment" class="btn btn-secondary" role="button">배정조회 -></a>
                                    </div>
                                    <div class="col d-grid text-end">
                                        <a href="../staff/dm_roomAssignment" class="btn btn-secondary" role="button">배정등록 -></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                
                                <div class="row"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fs-5 fw-bold">
                                        임원정보
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fw-bold text-center">
                                        임원수
                                    </div>
                                    <div class="col fw-bold text-center">
                                        오늘일지수
                                    </div>
                                    <div class="col fw-bold text-center">
                                        오늘외출신청수
                                    </div>
                                </div>
                                <div class="row mt-2"><!-- 여기 로우콜 잡기..-->
                                    <div id="executiveCount" class="col text-center">
                                        
                                    </div>
                                    <div id="todayLog" class="col text-center">
                                        
                                    </div>
                                    <div id="todayOuting" class="col text-center">
                                        
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col-4"></div>
                                    <div class="col d-grid text-end ps-0">
                                        <a onclick="" class="btn btn-primary" role="button">임원리스트</a>
                                    </div>
                                    <div class="col d-grid px-0">
                                        <a href="../staff/jw_executiveAssignmentSituationPage" class="btn btn-secondary" role="button">배정조회 -></a>
                                    </div>
                                    <div class="col d-grid text-end">
                                        <a href="../staff/jw_executiveAssignmentPage" class="btn btn-secondary" role="button">배정등록 -></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="row"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fs-5 fw-bold">
                                        동정보
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fw-bold text-center">
                                        등록된 동
                                    </div>
                                    <div class="col fw-bold text-center">
                                       	
                                    </div>
                                    <div class="col fw-bold text-center">
                                        
                                    </div>
                                </div>
                                <div class="row mt-2"><!-- 여기 로우콜 잡기..-->
                                    <div id="dongCount" class="col text-center">
                                        
                                    </div>
                                    <div class="col text-center">
                                        
                                    </div>
                                    <div class="col text-center">
                                      
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col-4"></div>
                                    <div class="col d-grid text-end ps-0">
                                        <a onclick="" class="btn btn-primary" role="button">동리스트</a>
                                    </div>
                                    <div class="col d-grid px-0">
                                        <a href="../staff/sj_manageDormInfo" class="btn btn-danger" role="button">등록취소 -></a>
                                    </div>
                                    <div class="col d-grid text-end">
                                        <a href="../staff/sj_registerDormInfo" class="btn btn-secondary" role="button">건물등록 -></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col">
                                <div class="row"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fs-5 fw-bold">
                                        공고 관련
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fw-bold text-center">
                                        현재학기
                                    </div>
                                    <div class="col fw-bold text-center">
                                        미선발인원
                                    </div>
                                    <div class="col fw-bold text-center">
                                        미납인원
                                    </div>
                                </div>
                                <div class="row mt-2"><!-- 여기 로우콜 잡기..-->
                                    <div id="semester" class="col text-center">
                                        
                                    </div>
                                    <div id="selectionStatusN" class="col text-center">
                                        
                                    </div>
                                    <div id="unpaid" class="col text-center">
                                        
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col-4"></div>
                                    <div class="col d-grid text-end ps-0">
                                        <a onclick="" class="btn btn-primary" role="button">학기정보</a>
                                    </div>
                                    <div class="col d-grid px-0">
                                        <a href="../staff/mj_registerJoinInfoPage" class="btn btn-secondary" role="button">공고조회 -></a>
                                    </div>
                                    <div class="col d-grid text-end">
                                        <a href="../staff/mj_readApplyDormInfoPage" class="btn btn-secondary" role="button">선발하기 -></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                
                                <div class="row"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fs-5 fw-bold">
                                        상 벌점
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fw-bold text-center">
                                        상벌점 리스트
                                    </div>
                                    <div class="col fw-bold text-center">
                                        오늘 부여 개수
                                    </div>
                                    <div class="col fw-bold text-center">
                                        
                                    </div>
                                </div>
                                <div class="row mt-2"><!-- 여기 로우콜 잡기..-->
                                    <div id="pointCount" class="col text-center">
                                        
                                    </div>
                                    <div id="pointCredit" class="col text-center">
                                        
                                    </div>
                                    <div class="col text-center">
                                        
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col-4"></div>
                                    <div class="col d-grid text-end ps-0">
                                        <a onclick="" class="btn btn-primary" role="button">상벌점리스트</a>
                                    </div>
                                    <div class="col d-grid px-0">
                                        <a href="../staff/jw_pointSituationPage" class="btn btn-secondary" role="button">내역확인 -></a>
                                    </div>
                                    <div class="col d-grid text-end">
                                        <a href="../staff/jw_pointManagementPage" class="btn btn-secondary" role="button">상벌점등록 -></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="row"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fs-5 fw-bold">
                                        호정보
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fw-bold text-center">
                                        등록된 호실
                                    </div>
                                    <div class="col fw-bold text-center">
                                        
                                    </div>
                                    <div class="col fw-bold text-center">
                                        
                                    </div>
                                </div>
                                <div class="row mt-2"><!-- 여기 로우콜 잡기..-->
                                    <div id="room" class="col text-center">
                                        
                                    </div>
                                    <div class="col text-center">
                                        
                                    </div>
                                    <div class="col text-center">
                                        
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col-4"></div>
                                    <div class="col d-grid text-end ps-0">
                                        <a onclick="" class="btn btn-primary" role="button">호리스트</a>
                                    </div>
                                    <div class="col d-grid px-0">
                                        <a href="../staff/sj_manageRoomInfo" class="btn btn-danger" role="button">등록취소 -></a>
                                    </div>
                                    <div class="col d-grid text-end">
                                        <a href="../staff/sj_registerRoomInfo" class="btn btn-secondary" role="button">호실등록 -></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col">
                                <div class="row"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fs-5 fw-bold">
                                        공지사항
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col-4 fw-bold text-center">
                                        글 작성수
                                    </div>
                                    <div class="col fw-bold text-center">
                                        가장 최근에 올린 글제목
                                    </div>
                                    
                                </div>
                                <div class="row mt-2"><!-- 여기 로우콜 잡기..-->
                                    <div id="noticeCount" class="col-4 text-center">
                                        
                                    </div>
                                    <div id="noticeTitle" class="col text-center">
                                        
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col-4"></div>
                                    <div class="col d-grid text-end ps-0">
                                        <a onclick="" class="btn btn-primary" role="button">공지리스트</a>
                                    </div>
                                    <div class="col d-grid px-0">
                                        <a href="../student/dm_dormNoticePage" class="btn btn-secondary" role="button">공지조회 -></a>
                                    </div>
                                    <div class="col d-grid text-end">
                                        <a href="../student/dm_NoticeWritePage" class="btn btn-secondary" role="button">공지등록 -></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                
                                <div class="row"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fs-5 fw-bold">
                                        자유게시판
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col-4 fw-bold text-center">
                                        게시글 수
                                    </div>
                                    <div class="col fw-bold text-center">
                                        가장 최근에 올린 글제목
                                    </div>
                                </div>
                                <div class="row mt-2"><!-- 여기 로우콜 잡기..-->
                                    <div id="boardCount" class="col-4 text-center">
                                        
                                    </div>
                                    <div id="boardTitle" class="col text-center">
                                        
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col-4"></div>
                                    <div class="col d-grid text-end ps-0">
                                        <a onclick="" class="btn btn-primary" role="button">게시판리스트</a>
                                    </div>
                                    <div class="col d-grid px-0">
                                        <a href="../student/mainGaesipan" class="btn btn-secondary" role="button">글조회 -></a>
                                    </div>
                                    <div class="col d-grid text-end">
                                        <a href="../student/writeGaesipan" class="btn btn-secondary" role="button">글등록 -></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="row"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fs-5 fw-bold">
                                        시설물 수리요청
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fw-bold text-center">
                                        전체요청 수
                                    </div>
                                    <div class="col fw-bold text-center">
                                        오늘요청 수
                                    </div>
                                    <div class="col fw-bold text-center">
                                        
                                    </div>
                                </div>
                                <div class="row mt-2"><!-- 여기 로우콜 잡기..-->
                                    <div id="repaireAll" class="col text-center">
                                        
                                    </div>
                                    <div id="repaireToday" class="col text-center">
                                        
                                    </div>
                                    <div class="col text-center">
                                        
                                    </div>
                                </div>
                                <div class="row mt-4"><!-- 여기 로우콜 잡기..-->
                                    <div class="col-4"></div>
                                    <div class="col d-grid text-end ps-0">
                                        <a onclick="" class="btn btn-primary" role="button">요청리스트</a>
                                    </div>
                                    <div class="col d-grid px-0">
                                        <a href="../student/sj_requestRepairPage" class="btn btn-secondary" role="button">요청조회 -></a>
                                    </div>
                                    <div class="col d-grid text-end">
                                        <a href="../student/sj_requestWritePage" class="btn btn-secondary" role="button">요청하기 -></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row my-5">
                            <div class="col">
                                <div class="row"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fs-5 fw-bold">
                                        기타 네비게이션
                                    </div>
                                </div>
                                <div class="row my-5"><!-- 여기 로우콜 잡기..-->
                                    <div class="col fw-bold text-center">
                                        <div class="row">
                                            <div class="col">
                                                <a onclick="location.href='../staff/mj_mainPage'">
                                                <i class="bi bi-house-door fs-2"></i><br>
                                                Main</a>
                                            </div>
                                            <div class="col">
                                                <a onclick="location.href='../student/jw_mainPage'">
                                                <i class="bi bi-buildings fs-2"></i><br>
                                                StudentMain
                                                </a>
                                            </div>
                                            <div class="col">
                                                <a onclick="location.href='../student/dm_dormOrganizationChart'">
                                                <i class="bi bi-telephone fs-2"></i><br>
                                                Phone</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col fw-bold text-center">
                                        <div class="row">
                                            <div class="col">
                                                <a onclick="location.href='../student/dm_paymentMoney'">
                                                <i class="bi bi-cash-coin fs-2"></i><br>
                                                Payment</a>
                                            </div>
                                            <div class="col">
                                                <a onclick="location.href='../student/dm_FAQ'">
                                                <i class="bi bi-question-circle fs-2"></i><br>
                                                FAQ</a>
                                            </div>
                                            <div class="col">
                                                <a onclick="location.href='../student/dm_streetDistribution'">
                                                <i class="bi bi-signpost-split fs-2"></i><br>
                                                Distance</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col fw-bold text-center">
                                        <div class="row">
                                            <div class="col">
                                                <a onclick="location.href='../student/dm_dormSelectionGuide'"><i class="bi bi-clipboard-check fs-2"></i><br>
                                                Starter</a>
                                            </div>
                                            <div class="col">
                                                <a onclick="location.href='../student/dm_dormSearchMap'"><i class="bi bi-cursor fs-2"></i><br>
                                                SearchRoad</a>
                                            </div>
                                            <div class="col">
                                                
                                                <a onclick="location.href='../student/dm_dormIntroduction'"><i class="bi bi-rocket-takeoff fs-2"></i><br>Hello!</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                            </div>
                            
                        </div>
                        
                        
                        
                        
                    </div>
                </div>
            </div>
            <div id="modalTemplete">
            <div id="writemodal" class="modal" tabindex="-1">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">Modal title</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			       	
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

			      </div>
			    </div>
			  </div>
			</div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        </body>
    </html>