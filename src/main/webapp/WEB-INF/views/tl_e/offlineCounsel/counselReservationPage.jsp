<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
	
		let myId = ${sessionStudentInfo.student_pk};
	
		function isPossibleReservation(target){
			
			url = "./isPossibleReservation";
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				
				for(e of response.data){
					
					if(target == e.DATE_VALUE){
						alert('이미 예약이 완료된 시간입니다. 다시 신청해주세요.');
						location.reload();
					}
				}
				
			});

		}
		
	
	
	
	</script>


</head>
<body>
	
	<div class="container-fluid">
	
		<div class="row">
			<div class="col">
				<jsp:include page="../commons/studentTopArea.jsp"></jsp:include>
			</div>
		</div>	
		
		<!-- 상단 배너 -->
		<div class="row">
			<div class="col mx-0 px-0" style="height: 35em;">
				<img class="banner img-fluid" src="./../../resources/img/groupCounsel/fff.jpg" style="width:100%; height: 100%;">
			
				<div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height:100%; position: relative; bottom: 100%;"></div>
				<!-- 
				<div class="title-text fw-bold" style="font-size: 3.5em; color: white; top: 70%;">Mk University | 상담센터</div>
				<!--<div class="title-text" style="font-size: 1.5em; color: white; top: 42%;"></div> -->
				<div style="color: white; position: relative; font-size: 4em; bottom: 148%; transform: translate(-50%, -50%); text-align: center; left: 20.5%;">MKU 상담센터</div>
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
	
		<!-- 본문 -->
		<div class="row">
			<div class="col-2"></div>
			<div class="col">
				<div class="row pt-5 mt-5">
					<div class="col text-center py-2 fs-5 border border-white border-1 rounded" style="background-color: #b6dbb6;">
						STEP <i class="bi bi-1-circle"></i> 상담원 선택
					</div>
					<div class="col text-center text-white py-2 fs-5 border border-white border-1 rounded" style="background-color: #679467;">
						STEP <i class="bi bi-2-circle"></i> 일정 선택
					</div>
					<div class="col text-center py-2 fs-5 border border-white border-1 rounded" style="background-color: #b6dbb6;">
						STEP <i class="bi bi-3-circle"></i> 예약 완료
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		
		<!-- 상담원 정보 -->
		<div class="row pt-5">
			<div class="col-2"></div>
			<div class="col border border-dark rounded">
				<div class="row border-bottom border-dark fs-5 fw-bold rounded" style="background-color: rgb(246, 246, 242);">
					<div class="col-3 ps-4 py-2 border-end border-dark">
						상담사명
					</div>
					<div class="col-9 py-2 ps-4">
						경력사항
					</div>
				</div>
				<div class="row">
					<div class="col-3 border-end border-dark">
						<div class="row">
							<div class="col pt-4 px-4">
								<img class="img-fluid" src="../../resources/img/counselorImage/${counselorDto.profileImage }">
							</div>
						</div>
						<div class="row pt-4 pb-3">
							<div class="col text-center fs-4">
								${counselorDto.name }
							</div>
						</div>
					</div>
					<div class="col-9 pt-4 ps-4">
						${counselorDto.career }
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		
		<div class="row pt-5">
			<div class="col-2"></div>
			<div class="col">
				<i class="bi bi-info-circle-fill"></i>
				<span>&nbsp;&nbsp;일정 선택</span>
			</div>
			<div class="col-2"></div>
		</div>
		
		<form action="./counselReservationProcess" method="get">
		<!-- 일정(7일) -->
		<div class="row pt-3">
			<div class="col-2"></div>
			<div class="col">
				<div class="row">
					<c:forEach items="${sevenDaysList }" var="dayMap">
						<!-- 아래의 col 한 개를 반복문으로 돌려서 출력 -->
						<div class="col-3 border border-dark rounded">
							<div class="row">
								<div class="col">
									<div class="row py-2 rounded border-dark border-bottom" style="background-color: rgb(246, 246, 242);">
										<div class="col text-center fs-5 fw-bold">
											${dayMap.month }/${dayMap.date }
											<span>
												<c:choose>
													<c:when test="${dayMap.day == 1 }">
														(월)
													</c:when>
													<c:when test="${dayMap.day == 2 }">
														(화)
													</c:when>
													<c:when test="${dayMap.day == 3 }">
														(수)
													</c:when>
													<c:when test="${dayMap.day == 4 }">
														(목)
													</c:when>
													<c:when test="${dayMap.day == 5 }">
														(금)
													</c:when>
													<c:when test="${dayMap.day == 6 }">
														(토)
													</c:when>
													<c:when test="${dayMap.day == 7 }">
														(일)
													</c:when>
												</c:choose>
											</span>
										</div>
									</div>
									<div class="row" style="height: 23em;">
										<div class="col pb-3">
											<c:choose>
												<c:when test="${dayMap.day == 6 || dayMap.day == 7 }">
													<div class="row pt-3 align-self-center">
														<div class="col text-center fs-4 fw-bold pt-5 mt-5 text-danger">
															휴무
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<c:forEach items="${dayMap.timeList }" var="time">
														<c:if test="${time.hour != 12 }">
															<div class="row pt-3">
																<div class="col text-center form-check ps-5">
																	<c:set var="vs" value="0"/>
																	<c:forEach items="${time.reservationDateInfoList }" var="dateInfo">
																		<c:if test="${time.dateString == dateInfo }">
																			<c:set var="vs" value="${vs + 1 }"/>
																		</c:if>
																	</c:forEach>
																	<c:choose>
																		<c:when test="${(vs >= 1 && time.state != '취소') || time.state == '완료' || time.state == '노쇼' || time.state == '신청' }">
																			<input onclick="isPossibleReservation(this.value)" class="form-check-input border-dark" name="reservationDate" type="radio" value="${dayMap.year }.${dayMap.month }.${dayMap.date }.${time.hour }.${dayMap.day}" disabled>
																		</c:when>
																		<c:otherwise>
																			<input onclick="isPossibleReservation(this.value)" class="form-check-input border-dark" name="reservationDate" type="radio" value="${dayMap.year }.${dayMap.month }.${dayMap.date }.${time.hour }.${dayMap.day}">
																		</c:otherwise>
																	</c:choose>
																	<label class="form-check-label">${time.hour}시 - ${time.hour + 1 }시</label>
																</div>
															</div>
														</c:if>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		
		<div class="row pt-5">
			<div class="col-2"></div>
			<div class="col">
				<i class="bi bi-info-circle-fill"></i>
				<span>&nbsp;&nbsp;남기고 싶은 말</span>
			</div>
			<div class="col-2"></div>
		</div>
		
		<div class="row pt-3">
			<div class="col-2"></div>
			<div class="col">
				<div class="row">
					<div class="col d-grid px-0">
						<textarea name="text" class="rounded" rows="5"></textarea>
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		<div class="row pt-5">
			<div class="col-2"></div>
			<div class="col-3"></div>
			<div class="col d-grid">
				<input name="student_pk" type="hidden" value="${sessionStudentInfo.student_pk }">
				<input name="type_category_id" type="hidden" value="${type_category_id }">
				<input name="counselor_id" type="hidden" value="${counselorDto.id }">
				<input class="btn btn-dark btn-lg" type="submit" value="신청하기">
			</div>
			<div class="col-3"></div>
			<div class="col-2"></div>
		</div>
		</form>
				<pre>
		
		
		
		</pre>
		<div class="row mt-5" style="background-color: #5a5a5a; height: 14em;">
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