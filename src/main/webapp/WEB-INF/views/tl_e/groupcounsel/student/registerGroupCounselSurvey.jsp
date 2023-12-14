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
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gowun+Dodum&family=Quicksand:wght@300&display=swap" rel="stylesheet">

</head>
<body>

<div class="container">
	
	<form action="./registerGroupCounselProcess" method="post">
	
	
	<div class="row my-3">
		<div class="col-2 text-center">
			<div class="fw-bold" style="font-size: 1.0em;">평점</div>
		</div>
		<div class="col">
			<input type="number" name="score" class="form-control">
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
			<input type="hidden" name="group_reservation_id" value="${group_reservation_id}">
			<input class="form-control" type="submit" value="등록">
		</div>
	</div>	
	
	</form>
	
</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>