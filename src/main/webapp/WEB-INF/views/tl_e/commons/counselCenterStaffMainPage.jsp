<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<%-- 구글폰트(Quicksand, Dongle, Gowun Dodum --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gowun+Dodum&family=Quicksand:wght@300&display=swap" rel="stylesheet">
<style>
*{
	/* font-family: 'Dongle', sans-serif; */
	font-family: 'Gowun Dodum', sans-serif;
	/* font-family: 'Quicksand', sans-serif; */
}

#topBannerCol
{	
	background-image: url("/toothless/resources/img/counselCenterStaff/topBanner01.jpg");
	background-position: center;
	background-size: cover;
	height: 14em;
	background-repeat: no-repeat;
	
}

.scrollableCounselorListRow
{
	max-height : 15em;
	overflow-y : auto;
	overflow-x : hidden;
	  
}
.scrollableCounselorListRow::-webkit-scrollbar
{
  width: 10px; /* 스크롤바 너비 설정 */
}

.scrollableCounselorListRow::-webkit-scrollbar-thumb
{
	background-color: silver;
	border-radius: 10px;
}

.scrollableCounselorListRow::-webkit-scrollbar-track {
  background-color: white; /* 스크롤바 트랙 색상 */
}

/* 컨텐츠박스 CSS */
.contentBox
{
	background-color: white;
	border: 0;
	border-radius : 0.2rem;
}

</style>
<script>
	<%-- 여기부터 차트 관련 코드 --%>
	function chartControl(){
		
		let completeCounselCountValue = null;
		
		fetch("./getCompleteCounselData")
		.then(response => response.json())
		.then(response =>{
			
			completeCounselCountValue = response.data;
			const offlineCountValue = completeCounselCountValue.OFFLINECOUNT;
			const onlineCountValue = completeCounselCountValue.ONLINECOUNT;
			const groupCountValue = completeCounselCountValue.GROUPCOUNT;
			
			const completeCounselGraph = document.getElementById('completeCounselGraph');
			
			new Chart(completeCounselGraph, {
				type: 'bar',
				data: {
					// 그래프 데이터 설정
					labels: ['오프라인', '온라인', '집단상담'],
					datasets: [{
						axis: 'y',
						label: '상담완료 된 상담수',
						data: [offlineCountValue, onlineCountValue, groupCountValue],
						fill: false,
						backgroundColor: [
							'rgba(255, 99, 132, 0.2)',
							'rgba(255, 159, 64, 0.2)',
							'rgba(255, 205, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(201, 203, 207, 0.2)'
						],
						borderColor: [
							'rgb(255, 99, 132)',
							'rgb(255, 159, 64)',
							'rgb(255, 205, 86)',
							'rgb(75, 192, 192)',
							'rgb(54, 162, 235)',
							'rgb(153, 102, 255)',
							'rgb(201, 203, 207)'
						],
						borderWidth: 1
					}]
				},
				options: {
					indexAxis: 'y',
					scales: {
						x: {
							beginAtZero: true, // x축이 0부터 시작하도록 설정
							ticks: {
								stepSize: 1, // 눈금 간격 설정
								font: {								 
									family: 'Gowun Dodum, sans-serif',
								}
							}
						},
						y: {
							ticks: {
								stepSize: 1, // 눈금 간격 설정
								font: {								 
									family: 'Gowun Dodum, sans-serif',
								}
							}
						}
					},
					plugins: {
						legend: {
							labels: {
								font: {
									 // 원하는 글꼴 패밀리로 변경(먼저나온 폰트 지정 못할시 쉼표 뒤에꺼로 지정됨)
									family: 'Gowun Dodum, sans-serif',
								}
							}
						},
						title: {
							font: {								 
								family: 'Gowun Dodum, sans-serif',
							}
						}
						// 기타 플러그인 설정
					}
				}
			});
		});			
	}
	<%-- 여기까지 차트 관련 코드 --%>
	
	function getGroupCounselListForStaffMain(){
		fetch("./getGroupCounselListForStaffMain")
		.then(response => response.json())
		.then(response => {
			
			const groupCounselList = response.data;
			
			const tbody_groupCounselBoard = document.getElementById("tbody_groupCounselBoard");
			tbody_groupCounselBoard.innerHTML = "";
			
			for(e of groupCounselList){
				
				const tr_groupCounselBoard = document.querySelector("#templete #groupCounselItemWrapper").cloneNode(true);
				tr_groupCounselBoard.setAttribute("onclick", "groupCounselDetailPage(e.ID)");
				
				const groupCounselId = tr_groupCounselBoard.querySelector("groupCounselId");
				groupCounselId.innerText = e.ID;
				const groupCounselTitle = tr_groupCounselBoard.querySelector("groupCounselTitle");
				groupCounselTitle.innerText = e.TITLE;
				const groupCounselRegDate = tr_groupCounselBoard.querySelector("groupCounselRegDate");
				groupCounselRegDate.innerText = e.REGDATE;
				const groupCounselApply = tr_groupCounselBoard.querySelector("groupCounselApply");
				groupCounselApply.innerText = e.APPLYPERSON + "/" + e.MAXPERSON;
				const groupCounselStatus = tr_groupCounselBoard.querySelector("groupCounselStatus");
				groupCounselStatus.innerText = e.STATUS;
				
				tbody_groupCounselBoard.appendChild(tr_groupCounselBoard);
			}
			
		});
	}
	
	
	function getAllCompleteCounselList(){
		fetch("./getAllCompleteCounselList")
		.then(response => response.json())
		.then(response =>{
			
			const completeCounselList = response.data;
			
			const completeCounselListCol = document.getElementById("completeCounselListCol");
			completeCounselListCol.innerHTML = "";
			
			for(e of completeCounselList){
				
				const completeCounselListWrapperRow = document.querySelector("#templete #completeCounselListWrapperRow").cloneNode(true);
				
				const counselorId = completeCounselListWrapperRow.querySelector("#counselorId");
				counselorId.innerText = e.ID;
				
				const counselorName = completeCounselListWrapperRow.querySelector("#counselorName");
				if(e.TOTALRANK == 1){
					const rank01 = document.createElement("img");
					rank01.setAttribute("src", "/toothless/resources/img/counselorImage/icon/1st.png");
					const counselorNameCol = counselorName.closest("#counselorNameCol");
					counselorNameCol.insertBefore(rank01, counselorName);
				}
				else if(e.TOTALRANK == 2){
					const rank02 = document.createElement("img");
					rank02.setAttribute("src", "/toothless/resources/img/counselorImage/icon/2nd.png");
					const counselorNameCol = counselorName.closest("#counselorNameCol");
					counselorNameCol.insertBefore(rank02, counselorName);
					
				}
				else if(e.TOTALRANK == 3){
					const rank03 = document.createElement("img");
					rank03.setAttribute("src", "/toothless/resources/img/counselorImage/icon/3rd.png");
					const counselorNameCol = counselorName.closest("#counselorNameCol");
					counselorNameCol.insertBefore(rank03, counselorName);
				}
				counselorName.innerText = e.NAME;
				
				const offlineCount = completeCounselListWrapperRow.querySelector("#offlineCount");
				offlineCount.innerText = e.OFFCOUNT;
				
				const onlineCount = completeCounselListWrapperRow.querySelector("#onlineCount");
				onlineCount.innerText = e.ONCOUNT;
				
				const groupCount = completeCounselListWrapperRow.querySelector("#groupCount");
				groupCount.innerText = e.GROUPCOUNT;
				
				const totalCount = completeCounselListWrapperRow.querySelector("#totalCount");
				totalCount.innerText = e.TOTALCOUNT;
				
				completeCounselListCol.appendChild(completeCounselListWrapperRow);
			}
		});		
	}
	
	window.addEventListener("DOMContentLoaded", ()=>{
		
		getAllCompleteCounselList()
		chartControl()
		getGroupCounselListForStaffMain()
		
	});


</script>
</head>
<body>
	<div class="container-fluid">
		<!-- 상단 배너 -->	
		<jsp:include page="./staffTopArea.jsp"></jsp:include>
		
		<!-- 상단 배너 이미지 -->
		<div class="row">
			<div id="topBannerCol" class="col">
				<div class="row mt-3">
					<div class="col ms-5">
						<span class="fs-1 fw-bold text-white">Management</span>
					</div>
				</div>				
			</div>
		</div>
		
		<!-- 메인컨텐츠 상단 로우 -->
		<div class="row bg-body-secondary bg-opacity-25 pb-5">
			<div class="col-1"></div>
			<div class="col">
				<!-- 통계 : 진용 작업 -->		
				<div class="row mt-5">
					<div class="col bg-white border border-0 rounded me-3">
						<div class="row mt-2">
							<div class="col text-center">
								<span class="fw-bold fs-2">상담사 상담실적</span>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col border border-0 rounded">
								<div class="row py-1">
									<div class="col">
										<div class="row mx-2 mt-1 border-bottom border-dark-subtle border-3">
											<div class="col text-center px-0">
												<span class="fw-bold">번호</span>
											</div>
											<div class="col text-center px-1 mx-0">
												<span class="fw-bold">이름</span>
											</div>
											<div class="col text-center px-0">
												<span class="fw-bold">오프라인</span>
											</div>
											<div class="col text-center px-0">
												<span class="fw-bold">온라인</span>
											</div>
											<div class="col text-center px-0">
												<span class="fw-bold">집단상담</span>
											</div>
											<div class="col text-center px-0">
												<span class="fw-bold">통합실적</span>
											</div>							
										</div>
										<div class="row mt-2 mb-3 mx-2 scrollableCounselorListRow">
											<div id="completeCounselListCol" class="col">
												<!-- 자료 반복될 로우 -->
												
											</div>
										</div>						
									</div>
								</div>
							</div>			
						</div>
					</div>
					
					<div class="col bg-white border border-0 rounded ms-3">
						<div class="row mt-2">
							<div class="col">
								<div class="row">
									<div class="col text-center">
										<span class="fw-bold fs-2">상담종류별 완료 현황 분표도</span>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col border border-0 rounded">
										<div class="row">
											<div class="col d-flex align-items-center">
												<canvas id="completeCounselGraph"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>	
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		
		
		<!-- 메인컨텐츠 하단 로우 -->
		<div class="row mt-5">
			<div class="col-1"></div>
			<div class="col">
				<div class="row">
					
					<!-- 집단상담 -->
					<div class="col contentBox">
						
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col text-center">
										<span class="fw-bold fs-4">집단상담</span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col">
								<div class="row mt-3">
									<div class="col">
										<table class="table table-sm table-hover">
											<thead>
												<tr class="text-center">
													<th scope="col">No.</th>
													<th scope="col" colspan="3">제목</th>
													<th scope="col">작성일</th>
													<th scope="col">인원</th>													
													<th scope="col">상태</th>
												</tr>
											</thead>
											<tbody id="tbody_groupCounselBoard" class="mt-3">
												
											</tbody>
										</table>									
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 공지사항 -->
					<div class="col contentBox">
						
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col">
										<span class="fw-bold fs-6">집단상담</span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col">
										<div class="row">
											<div class="col">
												<span>No.</span>
											</div>
											<div class="col">
												<span>Title</span>
											</div>
											<div class="col">
												<span>등록일</span>
											</div>
											<div class="col">
												<span>상태</span>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 학생자유게시판 -->
					<div class="col contentBox">
						
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col">
										<span class="fw-bold fs-6">집단상담</span>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col">
										<div class="row">
											<div class="col">
												<span>No.</span>
											</div>
											<div class="col">
												<span>Title</span>
											</div>
											<div class="col">
												<span>등록일</span>
											</div>
											<div class="col">
												<span>상태</span>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		
		<!-- 임시저장 -->
		<div class="row">
			<div class="col">
				<a href="../groupcounsel/staff/groupCounselListPage" class="link-offset-2 link-underline link-underline-opacity-0" style="color: mediumblue;">집단상담more</a>						
				<a href="../notice/noticeMainPage_Staff" class="link-offset-2 link-underline link-underline-opacity-0" style="color: mediumblue;">공지사항more</a>			
				<a href="../freeboardCounsel/freeboardCounselPage" class="link-offset-2 link-underline link-underline-opacity-0" style="color: mediumblue;">자게more</a>					
			</div>
		</div>
		
		<!-- 풋터 -->	
		<div class="row border-top mb-3">
			<div class="col">
				<div class="row mt-3">
					<div class="col" style="font-size: 0.9em; font-weight: bold; text-align: center;">
						서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층)  |  TEL:010-4761-2103 / E-MAIL:se001lec@naver.com  |  COPYRIGHT© 2023 MINKUE UNIVERSITY ALL RIGHTS RESERVED.  |  <i class="bi bi-twitter"></i><i class="bi bi-facebook"></i><i class="bi bi-instagram"></i>					
					</div>
				</div>
			</div>
		</div>						
	</div>
	
	
	
<div id="templete" class="d-none">

	<div id="completeCounselListWrapperRow" class="row mt-1 border-bottom">
		<div class="col text-center px-0">
			<span id="counselorId"></span>
		</div>
		<div id="counselorNameCol" class="col text-center px-1 mx-0 single-line">
			<span id="counselorName"></span>
		</div>
		<div class="col text-center px-0">
			<span id="offlineCount"></span>
		</div>
		<div class="col text-center px-0">
			<span id="onlineCount"></span>
		</div>
		<div class="col text-center px-0">
			<span id="groupCount"></span>
		</div>
		<div class="col text-center px-0">
			<span id="totalCount"></span>
		</div>
	</div>
	
	<div id="groupCounselItemWrapper">
		<tr id="tr_groupCounselBoard">													
			<th id="groupCounselId" scope="row" class="text-center">1</th>
			<td id="groupCounselTitle" colspan="3">닐리야야야야야야리리야</td>
			<td id="groupCounselRegDate" class="text-center">2023.12.21</td>
			<td id="groupCounselApply" class="text-center">3/10</td>													
			<td id="groupCounselStatus" class="text-center">진행중</td>
		</tr>
	</div>

</div>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>