<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집단 상담 예약 목록</title>
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
	
	function showModal(groupCounselReservationId){
		
		const writeModal = bootstrap.Modal.getOrCreateInstance("#writeModal");
		
		const hiddenValue = document.querySelector("#hiddenValue");
		hiddenValue.setAttribute("value", groupCounselReservationId);
		
		writeModal.show();
		
		
		
	}	
	
	
	</script>




</head>
<body>


<jsp:include page="../../commons/studentTopArea.jsp"></jsp:include>

<div class="container-fluid">


	

	
	<div class="row">
		
		<!-- 내용 -->
		<div class="col">
		
				
			<div class="row">
			    <div class="col mx-0 px-0" style="height: 35em; position: relative;">
			        <img class="banner img-fluid" src="/toothless/resources/img/groupCounsel/fff.jpg" style="width: 100%; height: 100%;">
			
			        <div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height: 100%; position: absolute; bottom: 0; left: 0;"></div>
			
			        <div class="title-text" style="font-size: 4em; color: white; position: absolute; bottom: 48%; left: 24.2%; transform: translate(-50%, 50%);">집단 상담</div>
			
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
				
				
		
				
			<div class="row my-0">
				<div class="col my-0 py-4"></div>
			</div>
			
			<div class="row">
				<div class="col-1"></div>
				<div class="col">
					<div class="fw-bold" style="font-size: 1.1em; color:black;"><i class="bi bi-house-door-fill"></i> / 집단 상담 / 예약 조회</div>
				</div>
				<div class="col-1"></div>
			</div>
			
			<div class="row my-0">
				<div class="col my-0 py-4"></div>
			</div>			
			
			<div class="row mt-0 pt-0">
				<div class="col">
					<div class="row" style="height:3em;"></div>
					<div class="row mb-5">
						<div class="col-1"></div>
						<div class="col rounded-4" style="width:100%; height: 30em; background-color: rgba(103, 148, 103, 0.1);">
							<div class="row">
								<div class="col">
									<div class="row" style="height: 5em;"></div>
									<div class="row">
										<div class="col-2"></div>
										<div class="col">
											<div class="fw-bold" style="font-size: 1.7em; color: black;">다양한 주제와 전문 상담가들과 함께하는 집단 상담 프로그램</div>
											<div class="fw-bold" style="font-size: 1.7em; color: black;">& 감정을 나누고 새로운 경험을 쌓아보세요</div>
										</div>
									</div>
									<div class="row" style="height: 1em;"></div>
									<div class="row">
										<div class="col-2"></div>
										<div class="col">
											<div class="fw-bold" style="font-size: 1em; color: black;">Explore group counseling programs with diverse topics and professional counselors.</div>
											<div class="fw-bold" style="font-size: 1em; color: black;">Share emotions and gain new experiences.</div>
										</div>
									</div>									
									<div class="row" style="height: 3.5em;"></div>
									<div class="row">
										<div class="col-2 text-center" style="padding-top: 0.4em;">
										</div>
										<div class="col">
											<input class="form-control" type="text" style="width: 100%;" placeholder="Search">
										</div>
									</div>
									<div class="row" style="height: 1em;"></div>
									<div class="row">
										<div class="col"></div>
										<div class="col-1 text-end">
											<div class="fw-bold" style="font-size: 1.7em;"><i class="bi bi-search" style="cursor: pointer;"></i></div>
										</div>
									</div>														
								</div>
								<div class="col-1"></div>
								<div class="col-4">
									<div class="row" style="height: 12em;"></div>
									<div class="row">
										<div class="col pt-0 mt-0 text-end">
											<div style="font-size: 15em; color: gray; opacity: 0.2;">MKU</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-1"></div>
					</div>
					<div class="row pt-5">
						<div class="col-1"></div>
						<div class="col">
							<div class="row border-top border-2 border-black">
								<div class="col"></div>
							</div>
						
							<div class="row py-2 border-bottom border-1" style="background-color: rgba(103, 148, 103, 0.1);">
								<div class="col-3">
									<div class="fw-bold text-center" style="font-size:1.1em;">상담 제목</div>
								</div>
								<div class="col-2">
									<div class="fw-bold text-center" style="font-size:1.0em;">신청 인원</div>
								</div>
								<div class="col-2">
									<div class="fw-bold text-center" style="font-size:1.0em;">장소</div>
								</div>						
								<div class="col-2">
									<div class="fw-bold text-center" style="font-size:1.0em;">상담 일자</div>	
								</div>
								<div class="col-1">
									<div class="fw-bold text-center" style="font-size:1.0em;">상담 현황</div>
								</div>
								<div class="col-2">
									<div class="fw-bold text-center" style="font-size:1.0em;">만족도 조사</div>
								</div>
							</div>
							
							<c:forEach items="${groupCounselReservationListByStudent}" var="list">
							<div class="row pt-3 pb-2 border-bottom border-1">
								<div class="col-3">
									<div class="fw-bold text-black text-center" style="font-size:1.0em;">${list.groupCounselDto.title}</div>
								</div>
								<div class="col-2">
									<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">${list.groupCounselDto.amount}</div>
								</div>
								<div class="col-2">
									<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">${list.groupCounselDto.location}</div>
								</div>						
								<div class="col-2">
									<div class="fw-bold text-secondary text-center" style="font-size:0.9em;"><fmt:formatDate value="${list.groupCounselDto.counsel_date}" pattern="yy.MM.dd"/></div>	
								</div>
								
								<c:choose>
									<c:when test="${today > list.groupCounselDto.counsel_date && list.groupCounselReservationDto.isAttend == 'Y'}">
										<div class="col-1">
											<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">수료</div>
										</div>
										<c:choose>
											<c:when test="${list.count == 0 }">
												<div class="col-2 text-center">
													<div class="fw-bold text-center" style="cursor:pointer; font-size:0.9em; color: red;" onclick="showModal(${list.groupCounselReservationDto.id})">등록</div>
												</div>											
											</c:when>
											<c:otherwise>
												<div class="col-2 text-center">
													<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">등록완료</div>
												</div>											
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<div class="col-1">
											<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">미수료</div>
										</div>
										<div class="col-2">
										
										</div>									
									</c:otherwise>									
								</c:choose>
							</div>				
							</c:forEach>
						
						</div>
						<div class="col-1"></div>
					</div>
				</div>
			</div>
			<div class="row" style="height: 5em;"></div>
			<div class="row" style="background-color: #5a5a5a; height: 14em;">
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
	</div>
</div>

<div id="writeModal" class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <div class="modal-title fw-bold" style="font-size:2em;">만족도 조사</div>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
           	<form action="./registerGroupCounselProcess" method="post">
				<div class="row my-3">
					<div class="col-2 text-center">
						<div class="fw-bold" style="font-size: 1.0em;">평점</div>
					</div>
					<div class="col">
						<input type="number" min="0" max="5" name="score" class="form-control">
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-2 text-center">
						<div class="fw-bold" style="font-size: 1.0em;">리뷰</div>
					</div>
					<div class="col">
						<textarea class="form-control" name="text" style="width:100%; height: 300px;"></textarea>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-10 text-center">
					</div>
					<div class="col">
						<input id="hiddenValue" type="hidden" name="group_reservation_id">
						<input class="form-control" type="submit" value="등록">
					</div>
				</div>	
				</form>					     			
            </div>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>