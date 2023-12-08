<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-2"></div>
		<div class="col text-center" style="font-size: 2.7em; font-weight: bold; color: green;">상담페이지</div>
		<div class="col-2 mt-3 d-flex justify-content-around" style="font-weight: bold; font-size: 1.3em;">상담사 ${sessionExternalInfo.external_id }님</div>
	</div>
	<div class="row" style="background: orange; font-size: 2.0em; font-weight: bold;">
		<div class="col"></div>
		<div class="col">Home</div>
		<div class="col">공지사항</div>
		<div class="col">상담</div>
		<div class="col">
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle mb-2" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    	내 정보
				</button>
				<ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="#">답변 완료 상담</a></li>
				    <li><a class="dropdown-item" href="#">채택 된 상담</a></li>
				    <li><a class="dropdown-item" href="./logoutProcess">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col border border-danger border-2">
		</div>
	</div>
	<div class="container">
		<div class="row my-2">
			<div class="col"></div>
		</div>
		<div class="row">
			<div class="col mt-2" style="font-size: 1.9em; font-weight: bold; text-align: center; ">작성자 : ${targetCounselDto.studentInfo.name } </div>
			<div class="col-2"></div>
			<div class="col-2"></div>
			<div class="col-3"></div>
			<div class="col mt-4" style="font-size: 1.2em; font-weight: bold; text-align: right; ">
				작성시간 : <fmt:formatDate value="${targetCounselDto.counselDto.created_at}" pattern="yy.MM.dd"/>	
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row">
			<div class="col mt-5" style="font-size: 1.2em; font-weight: bold;">카테고리 : ${targetCounselDto.category.name }</div>
		</div>
		<div class="row">
			<div class="col mt-5" style="font-size: 1.2em; font-weight: bold;" >제목 : ${targetCounselDto.counselDto.title }</div>
		</div>
		<div class="row">
			<div class="col mt-4"> <span style="font-size: 1.2em; font-weight: bold;"> 상담 내용 : </span></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col mt-3">
					<span style="font-size: 1.4em;">
						${targetCounselDto.counselDto.text }
					</span>
			</div>
		</div>
	</div>

</body>
</html>



<%-- 	<h1>상담</h1><br>
	작성자: ${targetCounselDto.studentInfo.name }<br>
	제목: ${targetCounselDto.counselDto.title }<br>
	카테고리: ${targetCounselDto.category.name }<br>
	내용: ${targetCounselDto.counselDto.text } --%>