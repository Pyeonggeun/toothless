<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="col"></div>
		<div class="col-9 mt-2" style="text-align: center; font-weight: bold; font-size: 2.2em;" >상담 센터</div>
		<div class="col mt-4" style="text-align: center; font-size: 1.2em; font-weight: bold">
				${sessionStudentInfo.name }학생
		</div>
	</div>
	<div class="row align-items-center fw-bold" style="font-size: 1.2em; text-align: center; background-color: orange;" >	
		<div class="col-1"></div>
		<div class="col">
			<a href="./writeOnlineCounselPage" class="link-dark link-offset-2 link-underline link-underline-opacity-0">상담신청</a>
		</div>
		<div class="col">공지사항</div>
		<div class="col">자유게시판</div>
		<div class="col">상담원 정보</div>
		<div class="col">
			<div class="dropdown">
				<button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    	<span style="font-size: 1.3em; font-weight: bold;">내 정보</span>
				</button>
				<ul class="dropdown-menu" style="background-color: #333;">
					<li><a class="dropdown-item" href="#" style="color: orange">답변 완료 상담</a></li>
					<li><a class="dropdown-item" href="#" style="color: orange">채택 된 상담</a></li>
					<li><a class="dropdown-item" href="./logoutProcess" style="color: orange" class="link-dark link-offset-2 link-underline link-underline-opacity-0">로그아웃</a></li>
				</ul>
			</div>
		</div>
		<div class="col-1"></div>
	</div>
	<div class="container">
		<div class="row mt-5">
			<div class="col-2" style="font-weight: bold; text-align: center; font-size: 2.2em;">내 상담</div>
			<div class="col"></div>
		</div>
		<div class="row mt-5">
			<div class="col" style="text-align: center;">
				<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">No</th>
				      <th scope="col">작성자</th>
				      <th scope="col">카테고리</th>
				      <th scope="col">제목</th>
				      <th scope="col">작성시간</th>
				    </tr>
				  </thead>
				  <tbody>
				<C:forEach items="${counselList}" var="counselList">
				    <tr>
				      <td>${counselList.onlineCounselBoardDto.id }</td>
				      <td>${counselList.studentDto.name }</td>
				      <td>${counselList.category.name }</td>
				      <td><a href="./readCounselPage?counsel_pk=${counselList.onlineCounselBoardDto.id }" class="link-dark link-offset-2 link-underline link-underline-opacity-0">${counselList.onlineCounselBoardDto.title }</a></td>
				      <td>${counselList.onlineCounselBoardDto.created_at }</td>
				    </tr>
			    </C:forEach>
				  </tbody>
				</table>
			</div>
		</div>
		<div class="row mt-2" style="font-weight: bold; font-size: 1.4em; text-align: center;">
			<div class="col-10"></div>
			<div class="col">
				<a class="btn btn-dark" href="./writeOnlineCounselPage" class="link-dark link-offset-2 link-underline link-underline-opacity-0">상담 작성</a>
			</div>
		</div>
	</div>
</body>
</html>