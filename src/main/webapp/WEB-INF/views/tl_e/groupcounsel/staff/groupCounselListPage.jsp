<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	<title>집단 상담 현황</title>
</head>
<body>


	<div class="container-fluid">
		
		<!-- 상단 메뉴 -->
		<div class="row border-bottom">
			<!-- 좌측 여백 -->
			<div class="col-1"></div>
			<div class="col-2 py-4">
				<div class="fw-bold" style="font-size: 1.3em;"><img class="img-fluid" style="width: 50px; height: 50px" src="../../../resources/img/groupCounsel/logo_black.png"> Mk University</div>
			</div>
			<div class="col"></div>
			<!-- 우측 여백 -->
			<div class="col-1"></div>
		</div>
		
		
		<div class="row border-bottom" style="background-color: #C0C0C0">
			
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
			<div class="col-4 pt-5 pb-4">
				<div class="row">
					<div class="col">
						<div class="row pb-4"></div>
						<div class="row py-2">
							<div class="col">
								<div class="fw-bold" style="font-size: 1.9em;">상담 등록</div>						
							</div>
						</div>
						<div class="row pb-0 mb-0">
							<div class="col">
								<div class="text-secondary" style="font-size: 0.8"><i class="bi bi-house-door-fill"></i> / 집단 상담 / 상담 등록</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 이미지?? 가능하면 -->
			<div class="col py-0">
				<img class="img-fluid" style="opacity: 0.5; width: 80%; height: 200px;" src="../../../resources/img/groupCounsel/groupCounselLogo.png">
			</div>
		
			<!-- 우측 여백 -->
			<div class="col-1"></div>
		</div>
		
	
	
		<!-- 상담 등록 화면 -->		
		<form action="./groupCounselRegisterProcess" method="post" enctype="multipart/form-data">
		
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
				<div class="row mt-5">
					<div class="col-1"></div>
					<div class="col">
						<table width="100%">
							<tr class="mb-3">
								<th style="border-bottom:solid 1px #000;border-collapse:collapse; padding-bottom:20px;"><div class="text-body-secondary" style="font-size: 0.7em;">제목</div></th>
								<th style="border-bottom:solid 1px #000;border-collapse:collapse; padding-bottom:20px;"><div class="text-body-secondary" style="font-size: 0.7em;">인원</div></th>
								<th style="border-bottom:solid 1px #000;border-collapse:collapse; padding-bottom:20px;"><div class="text-body-secondary" style="font-size: 0.7em;">상담일자</div></th>
								<th style="border-bottom:solid 1px #000;border-collapse:collapse; padding-bottom:20px;"><div class="text-body-secondary" style="font-size: 0.7em;">신청일자</div></th>
							</tr>
							<c:forEach items="${groupCounselList}" var="list">
							<tr>
								<td style="width: 160px; border-bottom:solid 1px #000;border-collapse:collapse; padding-bottom:25px; padding-top:25px;"><div class="text-body-secondary" style="font-size: 0.7em;"><a href="./groupCounselDetailPage?id=${list.id}">${list.title}</a></div></td>
								<td style="width: 40px; border-bottom:solid 1px #000;border-collapse:collapse; padding-bottom:25px; padding-top:25px;"><div class="text-body-secondary" style="font-size: 0.7em;">${list.amount}</div></td>
								<td style="width: 30px; border-bottom:solid 1px #000;border-collapse:collapse; padding-bottom:25px; padding-top:25px;"><div class="text-body-secondary" style="font-size: 0.7em;"><fmt:formatDate value="${list.counsel_date}" pattern="yy.MM.dd"/></div></td>
								<td style="width: 60px; border-bottom:solid 1px #000;border-collapse:collapse; padding-bottom:25px; padding-top:25px;"><div class="text-body-secondary" style="font-size: 0.7em;"><fmt:formatDate value="${list.start_apply_date}" pattern="yy.MM.dd"/>~<fmt:formatDate value="${list.end_apply_date}" pattern="yy.MM.dd"/></div></td>
							</tr>										
							</c:forEach>
						</table>
					</div>	
					<div class="col-2"></div>				
				</div>
			</div>
			
			
			
			
			
			
			
			
			
			<div class="col-1"></div>
		</div>
		
		</form>
		
	
	</div>
	









	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>