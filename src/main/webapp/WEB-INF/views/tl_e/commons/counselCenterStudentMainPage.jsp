<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
	
	<div class="container-fluid">
	
		<div class="row">
			<div class="col-10"></div>
			<div class="col py-2 me-0 pe-0 text-center dropdown nav-item">
			  <a class="nav-link pt-2 dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    <span class="fw-bold">학생아이디</span>님
			  </a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">정보 수정</a></li>
			    <li><a class="dropdown-item" href="#">마이페이지</a></li>
			    <li><hr class="dropdown-divider"></li>
			    <li><a class="dropdown-item" href="#"><span><i class="bi bi-power"></i></span>&nbsp;로그아웃</a></li>
			  </ul>
			</div>
		</div>
	
		<div class="row fw-bold" style="background-color: rgb(231, 231, 226);">
			<div class="col ms-5">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle text-dark" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">상담신청</a>
				    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">온라인 상담신청</a></li>
                        <li><a class="dropdown-item" href="#">오프라인 상담신청</a></li>
                        <li><a class="dropdown-item" href="#">집단 상담신청</a></li>
                    </ul>
				  </li>
				</ul>
			</div>
			<div class="col">
				<ul class="nav nav-pills">
				  <li>
				    <a class="nav-link text-dark" href="../notice/noticeMainPage" role="button" aria-expanded="false">공지사항</a>
				  </li>
				</ul>
			</div>
			<div class="col">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link text-dark" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">자유게시판</a>
				  </li>
				</ul>
			</div>
			<div class="col">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link text-dark" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">상담원 정보</a>
				  </li>
				</ul>
			</div>
			<div class="col">
				<ul class="nav nav-pills">
				  <li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle text-dark" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">마이페이지</a>
				    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">예약 조회</a></li>
                        <li><a class="dropdown-item" href="#">상담이력 조회</a></li>
                    </ul>
				  </li>
				</ul>
			</div>
		</div>
	

	
	
	
	</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>