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
		
		.banner{
		  image-rendering: -moz-crisp-edges; /* firefox */
		  image-rendering: -o-crisp-edges; /* opera */
		  image-rendering: -webkit-optimize-contrast; /* chrome(비표준) */
		  image-rendering: crisp-edges;
		}			
		
		
		
	</style>






</head>
<body>



<jsp:include page="../../commons/studentTopArea.jsp"></jsp:include>


<div class="container-fluid">

	
	
	<div class="row">
		<div class="col mx-0 px-0" style="height: 35em;">
			<img class="banner img-fluid" src="/toothless/resources/img/groupCounsel/fff.jpg" style="width:100%; height: 100%;">
		
			<div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height:100%; position: relative; bottom: 100%;"></div>
			<!-- 
			<div class="title-text fw-bold" style="font-size: 3.5em; color: white; top: 70%;">Mk University | 상담센터</div>
			<!--<div class="title-text" style="font-size: 1.5em; color: white; top: 42%;"></div> -->
			<div style="color: white; position: relative; font-size: 4em; bottom: 148%; transform: translate(-50%, -50%); text-align: center; left: 20.5%;">집단 상담 신청</div>
			<div style="color: white; position: relative; font-size: 5em; bottom: 154%; transform: translate(-50%, -50%); text-align: center; left: -18%; border-top:1px; border-top-style: solid; border-top-color: white;"></div>
			<div style="color: white; position: relative; font-size: 1.4em; bottom: 148%; transform: translate(-50%, -50%); text-align: center; left: 19.6%;">너와 나 그리고 우리를 위한 마음을 위한 치료</div>
			<div style="color: white; position: relative; font-size: 1.4em; bottom: 147%; transform: translate(-50%, -50%); text-align: center; left: 24.3%;">마음도 관리가 필요합니다</div>		
			<div style="height:13em; width:14em; border-radius: 0px 50px 0px 0px; background-color: #679467; opacity:0.9; position: relative; font-size: 1.4em; bottom: 155.2%; transform: translate(-50%, -50%); text-align: center; left: 86.7%;"></div>				
			<div style="font-weight:900; color: #464646; position: relative; font-size: 1.5em; bottom: 225%; transform: translate(-50%, -50%); text-align: center; left: 84%;">Contact Us</div>
			<div style="font-weight:900; color: white; position: relative; font-size: 2.8em; bottom: 212%; transform: translate(-50%, -50%); text-align: center; left: 86.3%;">1544-3054</div>
			<div style="color: white; position: relative; font-size: 0.9em; bottom: 215%; transform: translate(-50%, -50%); text-align: center; left: 85.5%;">E-mail. mkmk@naver.com</div>
			<div style="color: white; position: relative; font-size: 0.9em; bottom: 214%; transform: translate(-50%, -50%); text-align: center; left: 84.5%;">Tel. 010-4097-3054</div>
		</div>
	</div>	
	
	<div class="row" style="height:10em;"></div>
	
	<div class="row">
		<div class="col">
			<c:forEach items="${groupCounselList}" var="list">
			<div class="row pt-4">
				<!-- 상담 리스트 -->
				<div class="col ps-5">
				
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10">
							<div class="row">
								<div class="col mx-0 pe-0" style="border-top-style: solid; border-top-width: 4px; border-top-color: #8FBC8F;"></div>
								<div class="col-2"></div>
							</div>
						</div>
						<div class="col-1"></div>
					</div>
					
					<div class="row">
						<div class="col-1"></div>
						
						<div class="col">
							<div class="row pt-3">
							<div class="col-6 pt-2">
								<div class="row">
									<div class="col">
										<div class="row">
											<div class="col">
												<div class="fw-bold" style="font-size: 1.5em;">[<fmt:formatDate value="${list.groupCounselDto.start_apply_date }" pattern="yy.MM.dd"/>] ${list.groupCounselDto.title}</div>
											</div>
										</div>
										<div class="row pt-3">
											<div class="col" style="height:4.5em;">
												<div class="text-secondary fw-bold" style="font-size: 1em;">${list.groupCounselDto.text}</div>
											</div>
										</div>
										<div class="row py-5"></div>
										<div class="row pt-3">
											<div class="col-3">
												<div class="fw-bold text-black" style="font-size:1.2em; text-decoration: underline;">신청 인원</div>
											</div>
											<div class="col">
												<div class="fw-bold text-secondary" style="font-size:1.2em;">${list.reservationCount} / ${list.groupCounselDto.amount }</div>
											</div>
										</div>
										<div class="row pt-3">
											<div class="col-3">
												<div class="fw-bold text-black" style="font-size:1.2em; text-decoration: underline;">신청 일자</div>
											</div>
											<div class="col">
												<div class="fw-bold text-secondary" style="font-size:1.2em;"><fmt:formatDate value="${list.groupCounselDto.start_apply_date }" pattern="yy.MM.dd"/>~<fmt:formatDate value="${list.groupCounselDto.end_apply_date }" pattern="yy.MM.dd"/></div>
											</div>
										</div>
										<div class="row pt-3">
											<div class="col-2">
												<div class="fw-bold text-black" style="font-size:1.2em; text-decoration: underline;"> 장소</div>
											</div>
											<div class="col-1"></div>
											<div class="col">
												<div class="fw-bold text-secondary" style="font-size:1.2em;">${list.groupCounselDto.location }</div>
											</div>
											<div class="col-2 text-end">
												<c:if test="${list.count==0}">
													<input class="px-4 py-2 btn btn-primary" style="font-size: 1.1em;" type="button" value="마감" onClick="location.href='./groupCounselReservationProcess?group_counsel_id=${list.groupCounselDto.id }&student_pk=${sessionStudentInfo.student_pk}'">													
												</c:if>
												<c:if test="${list.count==1}">
													<button class="fw-bold ms-0" type="button" style="font-size: 1.1em; width: 80%; height: 40px; padding: 4px; border-color: #8FBC8F; border-style: solid; border-width: 2px; background-color: white; color: black;">
													마 감
													</button>
																										
												</c:if>
												
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-4 text-end pt-2">
								<img class="img-fluid" style="width: 60%; opacity: 0.8;" src="/uploadFiles/${list.groupCounselDto.posterImage }">
							</div>												
							<div class="col"></div>					
												
															
							</div>
						</div>
						<div class="col-1"></div>
					</div>		
				</div>
			</div>
			</c:forEach>		
		</div>
	</div>
	
	
	
	<div class="row" style="height:10em;"></div>
	
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





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>