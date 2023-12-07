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
</head>
<body>

<div class="container-fluid">

	<div class="row pt-2 pb-3 border-bottom border-dark-subtle">
		<div class="col-2 pt-3">
			<div class="fw-bold" style="font-size: 1.5em;"><img class="img-fluid" style="width: 60px; height: 60px; color:blue;" src="../../../resources/img/groupCounsel/logo_black.png"> Mk University</div>
		</div>
		<div class="col">
			<div class="row">
				<div class="col"></div>
				<div class="col-2">
					<div class="row" style="height: 1.4em;"></div>
					<div class="row">
						<div class="col-6 pt-2 text-center">
							<div class="fw-bold" style="font-size: 1.2em;">[${sessionStaffInfo.name}]님</div>
						</div>
						<div class="col-6 pt-1	">
							<i class="bi bi-box-arrow-right" style="font-size:1.6em;"></i>						
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	
	
	
	<div class="row mb-0 pb-0">
		<div class="col-2 border-end border-dark-subtle"></div>
		<div class="col ps-0 ms-0 pt-4 pb-0 mb-1">
			<div class="row pt-5"></div>
			<div class="row ms-0 ps-0">
				<div class="col ms-0 ps-3 pt-5" style="background-color:#07355e; opacity: 0.8;">
					<div class="fw-bold" style="font-size: 3.5em; color:white;">집단 상담</div>
				</div>
				<div class="col-9"></div>
			</div>
			<div class="row ms-0 ps-0">
				<div class="col ms-0 ps-3 pt-2 pb-2" style="background-color:#07355e; opacity: 0.8;">
					<div class="fw-bold" style="font-size: 0.8em; color:white;">&nbsp;&nbsp;<i class="bi bi-house-door-fill"></i> / 집단 상담 / 상담 관리</div>
				</div>
				<div class="col-9"></div>
			</div>
			<div class="row pb-4"></div>
		</div>	
	</div>
	
	
	
	<div class="row my-0">
		<div class="col-2 my-0 py-5 border-end border-dark-subtle"></div>
		<div class="col"></div>
	</div>
	
	
	<div class="row mt-0 pt-0">
		<div class="col-2 border-end border-dark-subtle"></div>
			
		<div class="col">
			<div class="row">
				<div class="col-1"></div>
				<div class="col-6">
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
					<div class="row border-top border-2 border-black pb-2">
						<div class="col"></div>
					</div>
					
					
					<div class="row border-bottom pb-2">
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
									<div class="fw-bold" style="font-size:1.0em; color: red;">출석</div>
								</div>
							</div>
						</div>
					</div>							
					
					<c:forEach items="${groupCounselDetail.studentInfoList}" var="list">
					
					<div class="row border-bottom py-2">
						<div class="col-4 text-center">
							<div style="font-size:0.9em;">${list.departmentCategoryDto.name }</div>
						</div>
						<div class="col-2 text-center">
							<div style="font-size:0.9em;">${list.studentInfoDto.name }</div>
						</div>
						<div class="col-2 text-center">
							<div style="font-size:0.9em;">${list.studentInfoDto.gender }</div>
						</div>
						<div class="col-4 text-center">
							<div class="row">
								<div class="col-9">
									<div style="font-size:0.9em;">${list.studentInfoDto.phone }</div>
								</div>
								<div class="col px-0">
									<c:if test="${list.groupCounselReservationDto.isAttend=='N'}">
										<a href="./studentIsAttendCheckProcess?id=${list.groupCounselReservationDto.id}&group_counsel_id=${groupCounselDetail.groupCounselDto.id}"><i class="bi bi-check-square" style="color:black;"></i></a>
									</c:if>
									<c:if test="${list.groupCounselReservationDto.isAttend=='Y'}">
										<a href="./studentIsAttendCheckProcess?id=${list.groupCounselReservationDto.id}&group_counsel_id=${groupCounselDetail.groupCounselDto.id}"><i class="bi bi-check-square-fill" style="color:red;"></i></a>
									</c:if>
								</div>
							</div>
						</div>
					</div>					
				
					</c:forEach>
				</div>
				<div class="col-1"></div>
			</div>
			y
			<div class="row mt-5">
				<div class="col-7"></div>
				<div class="col-4 ms-5">
					<div class="row pb-5 mb-2">
						<div class="col">
							<div class="fw-bold" style="font-size:1.9em; color: #07355e;">상담원 정보</div>
						</div>
						<div class="col-2 pt-1 text-end">
							<a href="./counselorAddPage?group_counsel_id=${groupCounselDetail.groupCounselDto.id }"><i class="bi bi-plus-square" style="font-size:1.6em; color:black;"></i></a>
						</div>
					</div>
					<div class="row border-top border-2 border-black pb-2">
						<div class="col"></div>
					</div>
					
					
					<div class="row border-bottom pb-2">
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
					
					<c:forEach items="${groupCounselDetail.counselorList}" var="list">
					
					<div class="row border-bottom py-2">
						<div class="col-4 text-center">
							<div style="font-size:0.9em;"></div>
						</div>
						<div class="col-2 text-center">
							<div style="font-size:0.9em;">${list.counselorDto.name }</div>
						</div>
						<div class="col-2 text-center">
							<div style="font-size:0.9em;">${list.counselorDto.gender}</div>
						</div>
						<div class="col-4 text-center">
							<div style="font-size:0.9em;">${list.counselorDto.phonenumber }</div>
						</div>
					</div>					
					</c:forEach>
				</div>
				<div class="col-1"></div>
			</div>
			
			
		</div>
	</div>
	
	

	
	
	
	
	
	
	<div class="row" style="height:20em;"></div>
</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>