<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	<title>집단 상담 디테일 페이지</title>
</head>
<body>

	<div class="container-fluid">
		
		<!-- 상단 메뉴 -->
		<div class="row border-bottom">
			<!-- 좌측 여백 -->
			<div class="col-1"></div>
			<div class="col-2 py-4">
				<div class="fw-bold" style="font-size: 1.1em;">학사관리시스템</div>
			</div>
			<div class="col"></div>
			<!-- 우측 여백 -->
			<div class="col-1"></div>
		</div>
		
		
		<div class="row border-bottom bg-primary" style="background-image: url('../../../resources/img/groupCounsel/Logo.jpg'); height: 15em">
			<!-- 좌측 여백 -->
			<div class="col-1"></div>
			
			<!-- 나중에 카테고리 형식으로 디자인 -->
			<div class="col-2">
				<div class="row" style="height: 100%;">
					<div class="col">
						<div class="row" style="height: 40%;"></div>
						<div class="row" style="height: 60%;">
							<div class="col" style="background-color: gray; opacity: 0.6;">
								<div class="fw-bold text-white pt-4 ps-2" style="font-size: 1.5em;">집단 상담</div>
							</div>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
			</div>
			
			<!-- 집단상담/상담 등록, 이미지 -->
			<div class="col pt-5 pb-4">
				<div class="row">
					<div class="col-4">
						<div class="row" style="height: 6.2em;"></div>
						<div class="row">
							<div class="col">
								<div class="fw-bold" style="font-size: 1.9em; color: #f08080 ;">상담 등록</div>						
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="fw-bold" style="font-size: 0.8; color: #7b68ee"><i class="bi bi-house-door-fill"></i> / 집단 상담 / 상담 등록</div>
							</div>
						</div>
					</div>
					<!-- 이미지?? 가능하면 -->
					<div class="col"></div>
				</div>
			</div>
		
			<!-- 우측 여백 -->
			<div class="col-1"></div>
		</div>
		
	
		
		<div class="row mt-0">
			<!-- 왼쪽 여백 -->
			<div class="col-1"></div>
			<!-- 카테고리 -->
			<div class="col-2">
				<div class="row">
					<div class="col">
						<div class="row" style="background-color: gray; opacity: 0.6;">
							<div class="col-1"></div>
							<div class="col py-4 border-bottom border-white">
								<div class="text-white" style="font-size: 1.1em;">상담 등록</div>
							</div>
							<div class="col-1"></div>
						</div>
						<div class="row" style="background-color: gray; opacity: 0.6;">
							<div class="col-1"></div>
							<div class="col py-4">
								<div class="text-white" style="font-size: 1.1em;">등록 현황</div>
							</div>
							<div class="col-1"></div>
						</div>					
					</div>
					<div class="col-1"></div>
				</div>
				<div class="row"></div>
			</div>
			<div class="col">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<div class="row mt-5"></div>
						
						<div class="row">
							<div class="col-5">
								<img class="img-fluid" style="height:36em ; width:100%" src="/uploadFiles/${groupCounselDto.posterImage}">
							</div>
							
							<div class="col">
								<div style="position: sticky; top: 100px;">
									<div class="row">
										<div class="col">
											<div class="fw-bold mb-2" style="font-size: 1.2em;">[${groupCounselDto.title}]</div>
										</div>
									</div>

									<div class="row">
										<div class="col">
											<div class="text-black" style="font-size: 0.8em;">${groupCounselDto.text}</div>
										</div>
									</div>
									<div class="row my-3"></div>
									<div class="row">
										<div class="col">
											<div class="text-primary-secondary mb-1" style="font-size: 0.6em;">신청 인원 ${groupCounselDto.amount}</div>
											<div class="text-primary-secondary mb-1" style="font-size: 0.6em;">상담 일자 ${groupCounselDto.counsel_date}</div>
											<div class="text-primary-secondary mb-1" style="font-size: 0.6em;">신청 일자 ${groupCounselDto.start_apply_date}~${groupCounselDto.end_apply_date}</div>
										</div>
									</div>
								</div>								
							</div>
						</div>
						<!-- 임시 하단 여백 -->
						<div class="row mb-5 pb-5"></div>
					</div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		
		
		
		
		
	
	</div>
	




	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>