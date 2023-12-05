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
		<div class="col ps-5 pt-4 pb-5">
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
		<div class="col">
			<!-- 반복문 -->
			<div class="row row-cols-4 pt-5 ps-5 ms-5">
			
				<c:forEach items="${groupCounselList}" var="list">
				<div class="col mb-5 pb-5">
					<div class="row">
						<div class="col text-center">
							<img class="img-fluid" style="width: 90%;" src="/uploadFiles/${list.posterImage }">
						</div>
					</div>
					<div class="row mb-2 mt-3">
						<div class="col-1"></div>
						<div class="col border-top border-black"></div>
						<div class="col-2"></div>
					</div>
					<div class="row pt-1">
						<div class="col ps-4">
							<div class="fw-bold" style="font-size: 0.9em;"><a style="color:black;" href="./groupCounselReservationPage?id=${list.id }">[${list.title }]</a></div>
						</div>
					</div>
					<div class="row pt-1">
						<div class="col-4 ps-4 pe-0 me-0">
							<div class="fw-bold" style="font-size:0.7em; color:red;">신청인원</div>
						</div>
						<div class="col ms-0 ps-0">
							<div style="font-size:0.7em;">16/${list.amount }</div>
						</div>
					</div>
					<div class="row pt-1">
						<div class="col-4 ps-4 pe-0 me-0">
							<div class="fw-bold" style="font-size:0.7em; color:red;">신청일자</div>
						</div>
						<div class="col ms-0 ps-0">
							<div style="font-size:0.7em;"><fmt:formatDate value="${list.start_apply_date }" pattern="yy.MM.dd"/>~<fmt:formatDate value="${list.end_apply_date }" pattern="yy.MM.dd"/></div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-1"></div>
						<div class="col-5 border-bottom border-black"></div>
						<div class="col-4"></div>
						<div class="col-2"></div>
					</div>
				</div>
				</c:forEach>
				
			</div>
		</div>
		<div class="col-1"></div>	
	</div>




</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>