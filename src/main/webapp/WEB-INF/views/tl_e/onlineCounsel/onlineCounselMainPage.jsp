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
	<div class="row mt-2">
		<div class="col-11"></div>
		<div class="col">
			<span class="fw-bold" style="font-size: 0.8em;" >학생아이디</span>님
		</div>
	</div>
	<div class="row bg-warning fw-bold py-2 text-center" style="font-size: 1.2em;" >	
		<div class="col"></div>
		<div class="col">상담신청</div>
		<div class="col">공지사항</div>
		<div class="col">자유게시판</div>
		<div class="col">상담원 정보</div>
		<div class="col">마이페이지</div>
		<div class="col"></div>
	</div>

</body>
</html>
<%-- 	<h1>온라인 상담 페이지</h1><br>
	<C:forEach items="${counselList}" var="counselList">
		<tr>
			<td>No. ${counselList.onlineCounselBoardDto.id }<br></td>
			<td>작성자 : ${counselList.studentDto.name }<br></td>
			<td>카테고리 : ${counselList.category.name }<br></td>
			<td>제목 : <a href="./readCounselPage?counsel_pk=${counselList.onlineCounselBoardDto.id }">${counselList.onlineCounselBoardDto.title }</a><br></td>
		</tr>
			========================<br>			
	</C:forEach>
	<a href="./writeOnlineCounselPage">온라인상담 신청</a> --%>