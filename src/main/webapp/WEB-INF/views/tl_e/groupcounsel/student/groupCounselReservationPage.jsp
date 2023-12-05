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

	<div class="row pt-2 pb-2 border-bottom border-dark-subtle">
		<div class="col-2">
			<div class="fw-bold" style="font-size: 1.1em;"><img class="img-fluid" style="width: 50px; height: 50px; color:blue;" src="../../../resources/img/groupCounsel/logo_black.png"> Mk University</div>
		</div>
		<div class="col">
			<div class="row">
				<div class="col"></div>
				<div class="col-2">
					<div class="row">
						<div class="col-6 pt-2 text-center">
							<div class="fw-bold" style="font-size: 1.0em;">[${sessionStudentInfo.name}]님</div>
						</div>
						<div class="col-6 pt-1	">
							<i class="bi bi-box-arrow-right" style="font-size:1.4em;"></i>						
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	<div class="row mb-0 pb-0">
		<div class="col-2 border-end border-dark-subtle"></div>
		<div class="col ps-5 pt-4 pb-5 mb-3">
			<div class="row pt-5Zx"></div>
			<div class="row">
				<div class="col">
					<div class="fw-bold" style="font-size: 3.5em;">집단 상담</div>
				</div>
			</div>
			<div class="row">
				<div class="col pt-2">
					<div class="text-secondary fw-bold" style="font-size: 0.8em;">&nbsp;&nbsp;<i class="bi bi-house-door-fill"></i> / 집단 상담 / 상담 신청</div>
				</div>
			</div>
			<div class="row pb-4"></div>
		</div>	
	</div>
	<div class="row mt-0 pt-0">
		<!-- 메뉴바 ?? -->
		<div class="col-2 border-end border-dark-subtle"></div>
		<!-- 상담 리스트 -->
		<div class="col ps-5">
			
			<div class="row">
				<div class="col-5">
					<img class="img-fluid" style="width: 100%;" src="/uploadFiles/${groupCounselDto.posterImage }">
				</div>
				<div class="col-5">
					<div class="row">
						<div class="col-1"></div>
						<div class="col">
							<div class="row">
								<div class="col">
									<div class="fw-bold" style="font-size: 1.4em;">[<fmt:formatDate value="${groupCounselDto.start_apply_date }" pattern="yy.MM.dd"/>] ${groupCounselDto.title}</div>
								</div>
							</div>
							<div class="row pt-2">
								<div class="col">
									<div class="text-secondary fw-bold" style="font-size: 0.9em;">${groupCounselDto.text}</div>
								</div>
							</div>
							<div class="row py-5">
							<div class="row pt-3">
								<div class="col">
									<div class="fw-bold" style="1.1em;">신청인원 : ${groupCounselDto.amount }</div>
								</div>
							</div>
							<div class="row pt-3">
								<div class="col">
									<div class="fw-bold" style="1.1em;">신청 일자 : <fmt:formatDate value="${groupCounselDto.start_apply_date }" pattern="yy.MM.dd"/>~<fmt:formatDate value="${groupCounselDto.end_apply_date }" pattern="yy.MM.dd"/></div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div><fmt:formatDate value="${groupCounselDto.counsel_date }" pattern="yy.MM.dd"/></div>
								</div>
							</div>
							<div class="row"></div>
						</div>
					</div>
				</div>
				<div class="col-2"></div>
			</div>
			
		</div>
		<div class="col-1"></div>	
	</div>
	
	<div class="row" style="height:10em;"></div>
	
	
</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>