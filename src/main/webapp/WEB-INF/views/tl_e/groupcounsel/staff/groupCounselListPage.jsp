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
							<div class="fw-bold" style="font-size: 1.2em;">[${sessionStudentInfo.name}]님</div>
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
		<div class="col ps-0 ms-0 pt-4 pb-5 mb-3">
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
				<div class="col">
				
					<div class="row py-3 border-top border-bottom border-2 border-black">
						<div class="col-3">
							<div class="fw-bold text-center" style="font-size:1.1em;">상담 제목</div>
						</div>
						<div class="col-2">
							<div class="fw-bold text-center" style="font-size:1.1em;">신청 인원</div>
						</div>
						<div class="col-2">
							<div class="fw-bold text-center" style="font-size:1.1em;">장소</div>
						</div>						
						<div class="col-2">
							<div class="fw-bold text-center" style="font-size:1.1em;">상담 일자</div>	
						</div>
						<div class="col-2">
							<div class="fw-bold text-center" style="font-size:1.1em;">신청 기간</div>
						</div>
						<div class="col-1">
							<div class="fw-bold text-center" style="font-size:1.1em;">상담 관리</div>
						</div>
					</div>
				
					<div class="row py-3 border-bottom border-1">
						<div class="col-3">
							<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">금연 상담 프로그램</div>
						</div>
						<div class="col-2">
							<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">16/20</div>
						</div>
						<div class="col-2">
							<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">강남역 2번 출구</div>
						</div>						
						<div class="col-2">
							<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">2023.03.02</div>	
						</div>
						<div class="col-2">
							<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">2023.03.02~2023.03.02</div>
						</div>
						<div class="col-1">
							<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">상담 관리</div>
						</div>
					</div>				
				
				
				
				</div>
				<div class="col-1"></div>
			</div>
			
			
			
		</div>
		
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	<div class="row" style="height:10em;"></div>
</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>