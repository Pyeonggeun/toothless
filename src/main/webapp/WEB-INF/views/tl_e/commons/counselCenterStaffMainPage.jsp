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
</style>
<script>
	<%-- 여기부터 차트 관련 코드 --%>
	function chartControl(){
		fetch("./getCompleteCounselData")
		.then(response => response.json())
		.then(response =>{
			
			
		});
		
		const completeCounselGraph = document.getElementById('completeCounselGraph');
		
		new Chart(completeCounselGraph, {
		  type: 'bar',
		  data: {
		    labels: ['오프라인','온라인','집단상담'],
		    datasets: [{
		    	axis : 'y',
		    	label: '상담완료 된 상담수',
		    	data: [12, 19, 3],
		    	fill : false,
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
		  	}
		});	
	}
	
	
	<%-- 여기까지 차트 관련 코드 --%>
	
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
		
	});


</script>
</head>
<body>


	<!-- 상단 배너 -->
	
	<jsp:include page="./staffTopArea.jsp"></jsp:include>
	

	
	<!-- 상단 배너 이미지 -->	

	<div class="row">
		<div class="col fw-bold text-center">
			<img src="../../resources/img/counselCenterStaff/topBanner01.jpg" class="border border-dark" style="max-width: 100%; height: auto;">
		</div>
	</div>
	
	
	
	
	<!-- 중메뉴 -->

	<div class="container">
		<div class="row">			
			<div class="col">
				<!-- 통계 : 진용 작업 -->		
				<div class="row mt-5">
					<div class="col-5">
						<div class="row">
							<div class="col text-center">
								<span class="fw-bold fs-2">상담사 상담실적</span>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col border rounded">
								<div class="row px-1 py-1">
									<div class="col">
										<div class="row mt-1">
											<div class="col text-center border-bottom">
												<span class="fw-bold">번호</span>
											</div>
											<div class="col text-center border-bottom">
												<span class="fw-bold">이름</span>
											</div>
											<div class="col text-center border-bottom">
												<span class="fw-bold">오프라인</span>
											</div>
											<div class="col text-center border-bottom">
												<span class="fw-bold">온라인</span>
											</div>
											<div class="col text-center border-bottom">
												<span class="fw-bold">집단상담</span>
											</div>
											<div class="col text-center border-bottom">
												<span class="fw-bold">통합실적</span>
											</div>							
										</div>
										<div class="row mt-2">
											<div id="completeCounselListCol" class="col">
												<!-- 자료 반복될 로우 -->
												
											</div>
										</div>						
									</div>
								</div>
							</div>			
						</div>
					</div>
					<div class="col-1"></div>
					<div class="col-6">
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col text-center">
										<span class="fw-bold fs-2">상담종류별 완료 현황 분표도</span>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col border rounded">
										<div class="row">
											<div class="col">
												<canvas id="completeCounselGraph"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>	
				</div>
				
				
				<div class="row text-center fw-bold mt-4">
					<div class="col text-primary-emphasis">집단상담</div>
					<div class="col text-primary-emphasis">공지사항</div>
					<div class="col text-primary-emphasis">자유게시판</div>
				</div>
				<div class="row text-center mt-3">
					<div class="col">
						<div class="row">
							<div class="col-2"></div>
							<div class="col" style="border-top: 1.3px solid #ffa500;"></div>
							<div class="col-2"></div>
						</div>
					</div>
					<div class="col">
						<div class="row">
							<div class="col-2"></div>
							<div class="col" style="border-top: 1.3px solid #ffa500;"></div>
							<div class="col-2"></div>
						</div>
					</div>
					<div class="col">
						<div class="row">
							<div class="col-2"></div>
							<div class="col" style="border-top: 1.3px solid #ffa500;"></div>
							<div class="col-2"></div>
						</div>
					</div>
				</div>
				<div class="row mt-2" style="font-weight: bold; font-size: 0.6em; color: navy; text-align:center;">
					<div class="col">
						<div class="row">
							<div class="col-8"></div>
							<div class="col">
								<a href="../groupcounsel/staff/groupCounselListPage" class="link-offset-2 link-underline link-underline-opacity-0" style="color: mediumblue;">more</a>			
							</div>
						</div>
					</div>
					<div class="col">
						<div class="row">
							<div class="col-8"></div>
							<div class="col">
								<a href="../notice/noticeMainPage_Staff" class="link-offset-2 link-underline link-underline-opacity-0" style="color: mediumblue;">more</a>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="row">
							<div class="col-8"></div>
							<div class="col">
								<a href="../freeboardCounsel/freeboardCounselPage" class="link-offset-2 link-underline link-underline-opacity-0" style="color: mediumblue;">more</a>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				<!-- 리스트 -->
				
					<!-- 집단상담 -->
				<div class="row mt">
					<div class="col">
						<c:forEach items="${groupCounselList }" var="groupCounselList">
							<c:set var="title" value="${groupCounselList.title}" />
							<div class="row mt-1" style="font-size: 0.8em;">
								<div class="col-3"></div>
								<div class="col fw-bold">
									<c:choose>
										<c:when test="${fn:length(title) > 9 }">
											<c:set var="cutedTitle" value="${fn:substring(title, 0, 9)}"></c:set>
											<a href="../groupcounsel/staff/groupCounselDetailPage?id=${groupCounselList.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${cutedTitle }...</a>
										</c:when>
										<c:otherwise>
											<a href="../groupcounsel/staff/groupCounselDetailPage?id=${groupCounselList.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${title }</a>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col">
									<fmt:formatDate value="${groupCounselList.created_at }" pattern="yy.MM.dd"/>
								</div>
								<div class="col-2"></div>
							</div>
						</c:forEach>
					</div>
					
					<!-- 공지사항 -->
					<div class="col">
						<c:forEach items="${noticeList }" var="noticeList">
							<c:set var="title" value="${noticeList.title}" />
							<div class="row mt-1" style="font-size: 0.8em;">
								<div class="col-1"></div>
								<div class="col-6 text-center fw-bold">
									<c:choose>
										<c:when test="${fn:length(title) > 9 }">
											<c:set var="cutedTitle" value="${fn:substring(title, 0, 9)}"></c:set>
											<a href="..//notice/readNoticeBoardPage_Staff?id=${noticeList.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${cutedTitle }...</a>
										</c:when>
										<c:otherwise>
											<a href="..//notice/readNoticeBoardPage_Staff?id=${noticeList.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${title }</a>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col">
									<fmt:formatDate value="${noticeList.created_at}" pattern="yy.MM.dd"/>
								</div>
								<div class="col-3"></div>
							</div>
						</c:forEach>
					</div>
					
					
					<!-- 자유게시판 -->
					<div class="col">
						<c:forEach items="${freeboardList }" var="freeboardList">
							<c:set var="title" value="${freeboardList.title}" />
							<div class="row" style="font-size: 0.8em;">
								<div class="col-3"></div>
								<div class="col fw-bold">
									<c:choose>
										<c:when test="${fn:length(title) > 9 }">
											<c:set var="cutedTitle" value="${fn:substring(title, 0, 9)}"></c:set>
											<a href="../freeboardCounsel/readFreeboardPostPage?id=${freeboardList.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${cutedTitle }...</a>
										</c:when>
										<c:otherwise>
											<a href="../freeboardCounsel/readFreeboardPostPage?id=${freeboardList.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${title }</a>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col mt-1">
									<fmt:formatDate value="${freeboardList.created_at }" pattern="yy.MM.dd"/>
								</div>
								<div class="col-2"></div>
							</div>
						</c:forEach>
					</div>
				</div>
				
				
				
		
				
				<div class="row mt-5">
					<div class="col-1"></div>
					<div class="col" style="font-weight: bold; color: navy; text-align: center;">상담원 관리</div>
					<div class="col" style="font-weight: bold; color: navy; text-align: center;">조회수 Top3 공지사항</div>
					<div class="col" style="font-weight: bold; color: navy; text-align: center;">조회수 Top3 게시글</div>
					<div class="col-1"></div>
				</div>
					
		
		
				<div class="row mt-4">
					<div class="col-1"></div>
		
					<!-- 통계1 -->
					<div class="col">
						<div class="row mb-2" style="font-weight: bold; font-size: 0.8em; text-align: center;">
							<div class="col-4">상담원 번호</div>
							<div class="col">이름</div>
							<div class="col">성별</div>
							<div class="col">등록일</div>
						</div>
						<c:forEach items="${counselorList }" var="counselorList">
							<div class="row">
								<div class="col-4" style="text-align: center; font-size: 0.8em; font-weight: bold;">
									${counselorList.id }
								</div>
								<div class="col" style="text-align: center; font-size: 0.8em; font-weight: bold;">
									${counselorList.name }
								</div>
								<div class="col" style="text-align: center; font-size: 0.8em; font-weight: bold;">
									${counselorList.gender }
								</div>
								<div class="col" style="text-align: center; font-size: 0.8em;">
									<fmt:formatDate value="${counselorList.created_at }" pattern="yy.MM.dd"/>
								</div>
							</div>
						</c:forEach>
					</div>			
					
					
					<!-- 통계2 -->
					<div class="col-1" style="font-weight: bold; font-size: 0.8em; text-align: right;">
						<div class="row">
							<div class="col">
								순위
							</div>
						</div>
						<div class="row mt-2">
							<div class="col" style="color: red;">1위</div>
						</div>
						<div class="row">
							<div class="col" style="color: mediumblue;">2위</div>
						</div>
						<div class="row">
							<div class="col" style="color: darkgreen;">3위</div>
						</div>
					</div>
					<div class="col">
						<div class="row mb-2" style="font-weight: bold; font-size: 0.8em; text-align: center;">
							<div class="col">제목</div>
							<div class="col">조회수</div>
							<div class="col">작성일</div>
						</div>
						<c:forEach items="${top3Notice }" var="top3Notice">
							<div class="row">
								<div class="col" style="font-weight: bold; font-size: 0.8em; text-align: center;">
									<a href="..//notice/readNoticeBoardPage?id=${top3Notice.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${top3Notice.title }</a>
								</div>
								<div class="col" style="font-weight: bold; font-size: 0.8em; text-align: center;">
									<a href="..//notice/readNoticeBoardPage?id=${top3Notice.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${top3Notice.read_count }</a>
								</div>
								<div class="col" style="font-size: 0.8em; text-align: center;">
									<a href="..//notice/readNoticeBoardPage?id=${top3Notice.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;"><fmt:formatDate value="${top3Notice.created_at }" pattern="yy.MM.dd"/></a>
								</div>
							</div>
						</c:forEach>
					</div>
					
					
					<!-- 통계3 -->
					<div class="col-1" style="font-weight: bold; font-size: 0.8em; text-align: right;">
						<div class="row">
							<div class="col">
								순위
							</div>
						</div>
						<div class="row mt-2">
							<div class="col" style="color: red;">1위</div>
						</div>
						<div class="row">
							<div class="col" style="color: mediumblue;">2위</div>
						</div>
						<div class="row">
							<div class="col" style="color: darkgreen;">3위</div>
						</div>
					</div>
					<div class="col">
						<div class="row mb-2" style="font-weight: bold; font-size: 0.8em; text-align: center;">
							<div class="col-5">제목</div>
							<div class="col">조회수</div>
							<div class="col">작성일</div>
						</div>
						<c:forEach items="${top3Freeboard }" var="top3Freeboard">
							<div class="row">
								<div class="col-5" style="font-weight: bold; font-size: 0.8em; text-align: center;">
									${top3Freeboard.title }
								</div>
								<div class="col" style="font-weight: bold; font-size: 0.8em; text-align: center;">
									${top3Freeboard.read_count }
								</div>
								<div class="col" style="font-size: 0.8em; text-align: center;">
									<fmt:formatDate value="${top3Freeboard.created_at }" pattern="yy.MM.dd"/>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="col-1"></div>
				</div>
			</div>
		</div>						
	</div>


	
	
	

	<!-- 풋터 -->
	
	<div class="row border-top">
		<div class="col">
			<div class="row mt-3">
				<div class="col" style="font-size: 0.7em; font-weight: bold; text-align: center;">
					서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층)  |  TEL:010-4761-2103 / E-MAIL:se001lec@naver.com  |  COPYRIGHT© 2023 MINKUE UNIVERSITY ALL RIGHTS RESERVED.  |  <i class="bi bi-twitter"></i><i class="bi bi-facebook"></i><i class="bi bi-instagram"></i>					
				</div>
			</div>
		</div>
	</div>
	
	
<div id="templete" class="d-none">

	<div id="completeCounselListWrapperRow" class="row mt-1 bg-body-secondary border">
		<div class="col text-center">
			<span id="counselorId"></span>
		</div>
		<div id="counselorNameCol" class="col text-center px-1 mx-0">
			<span id="counselorName"></span>
		</div>
		<div class="col text-center">
			<span id="offlineCount"></span>
		</div>
		<div class="col text-center">
			<span id="onlineCount"></span>
		</div>
		<div class="col text-center">
			<span id="groupCount"></span>
		</div>
		<div class="col text-center">
			<span id="totalCount"></span>
		</div>
	</div>

</div>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>