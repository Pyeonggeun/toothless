<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	<title>집단 상담 등록 페이지</title>
</head>
<body>

	<div class="container-fluid">
		
		<!-- 상단 메뉴 -->
		<div class="row border-bottom">
			<!-- 좌측 여백 -->
			<div class="col-1"></div>
			<div class="col-2 py-4">
				<div class="fw-bold" style="font-size: 1.3em;">학사관리시스템</div>
			</div>
			<div class="col"></div>
			<!-- 우측 여백 -->
			<div class="col-1"></div>
		</div>
		
		
		<div class="row border-bottom bg-success bg-opacity-25">
			
			<!-- 좌측 여백 -->
			<div class="col-1"></div>
			
			<!-- 나중에 카테고리 형식으로 디자인 -->
			<div class="col-2">
				<div class="row" style="height: 100%;">
					<div class="col-1"></div>
					<div class="col">
						<div class="row" style="height: 30%;"></div>
						<div class="row" style="height: 70%;">
							<div class="col" style="background-color: MediumBlue; opacity: 0.6;">
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
						<div class="row py-2">
							<div class="col">
								<div class="fw-bold" style="font-size: 1.9em;">상담 등록</div>						
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="text-secondary" style="font-size: 0.8"><i class="bi bi-house-door-fill"></i> / 집단 상담 / 상담 등록</div>
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
		
	
	
		<!-- 상담 등록 화면 -->		
		<form action="./groupCounselRegisterProcess" method="post">
		
		<div class="row mt-0">
			<!-- 왼쪽 여백 -->
			<div class="col-1"></div>
			<!-- 카테고리 -->
			<div class="col-2">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<div class="row" style="background-color: MediumBlue; opacity: 0.6;">
							<div class="col-1"></div>
							<div class="col py-4 border-bottom border-white">
								<div class="text-white" style="font-size: 1.1em;">상담 등록</div>
							</div>
							<div class="col-1"></div>
						</div>
						<div class="row" style="background-color: MediumBlue; opacity: 0.6;">
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
						<!-- 제목, 내용 -->
						<div class="row mt-5">
							<div class="col border-top border-black border-2">
								<div class="row my-3">
									<div class="col-2 text-center">
										<div class="fw-bold" style="font-size: 1.0em;">제목</div>
									</div>
									<div class="col">
										<input type="text" name="title" class="form-control">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-2 text-center">
										<div class="fw-bold" style="font-size: 1.0em;">내용</div>
									</div>
									<div class="col">
										<textarea class="form-control" name="text" style="width:100%; height: 300px;"></textarea>
									</div>
								</div>
							</div>
						</div>
						<!-- 신청인원, 일시, 장소, 신청 시작일, 신청 종료일 -->
						<div class="row">
							<div class="col border-top border-black border-2">
								<div class="row my-3">
									<div class="col-2 text-center">
										<div class="fw-bold" style="font-size: 1.0em;">상담 인원</div>
									</div>
									<div class="col">
										<input type="number" name="amount" class="form-control">
									</div>
									<div class="col-2 text-center">
										<div class="fw-bold" style="font-size: 1.0em;">상담 일시</div>
									</div>
									<div class="col">
										<input type="date" name="counsel_date" class="form-control">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-2 text-center">
										<div class="fw-bold" style="font-size: 1.0em;">장소</div>
									</div>
									<div class="col">
										<input type="text" name="location" class="form-control">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-2 text-center">
										<div class="fw-bold" style="font-size: 1.0em;">신청 시작 일자</div>
									</div>
									<div class="col">
										<input type="date" name="start_apply_date" class="form-control">
									</div>
									<div class="col-2 text-center">
										<div class="fw-bold" style="font-size: 1.0em;">신청 종료 일자</div>
									</div>
									<div class="col">
										<input type="date" name="end_apply_date" class="form-control">
									</div>								
								</div>
							</div>
						</div>
						<!-- 이미지 추가 -->
						<div class="row"></div>
						<!-- 상담원 등록?? -->
						<div class="row"></div>
						
						<!-- 등록 버튼 -->
						<div class="row mt-5">
							<div class="col-10"></div>
							<div class="col">
								<input type="submit" class="form-control btn btn-secondary" value="등록">						
							</div>
						</div>
						<!-- 임시 하단 여백 -->
						<div class="row mb-5 pb-5"></div>
					</div>
					<div class="col-3"></div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		
		</form>
		
		
		
		
	
	</div>
	




	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>