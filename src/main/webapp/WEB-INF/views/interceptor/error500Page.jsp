<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div class="col" style="height: 2em;"></div>
		</div>
		<div class="row">
			<div class="col-4"></div>
			<div class="col ps-5">
				<img class="img-fluid" src="../../resources/img/errorPage/500error.gif">
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row mt-3">
			<div class="col-4"></div>
			<div class="col fs-1 fw-bold">
				죄송합니다. Internet Server Error
			</div>
			<div class="col-3"></div>
		</div>
		<div class="row mt-3">
			<div class="col-4"></div>	
			<div class="col fs-5">
				서비스 이용에 불편을 드려 죄송합니다.<br>
				시스템 에러가 발생하여 페이지를 표시할 수 없습니다.<br>
				관리자에게 문의하시거나 잠시 후 다시 시도해주세요.
			</div>
			<div class="col-3"></div>
		</div>
		<div class="row mt-5">
			<div class="col-4"></div>
			<div class="col text-start pe-0">
				<c:choose>
					<c:when test="${!empty sessionStaffInfo }">
						<a href="/toothless/another/staff/loginPage"><button class="btn btn-dark rounded-pill py-3" style="background-color: #055160;">로그인페이지로 돌아가기</button></a>
					</c:when>
					<c:when test="${!empty sessionProfessorInfo }">
						<a href="/toothless/another/professor/loginPage"><button class="btn btn-dark rounded-pill py-3" style="background-color: #055160;">로그인페이지로 돌아가기</button></a>
					</c:when>
					<c:when test="${!empty sessionExternalInfo }">
						<a href="/toothless/another/external/loginPage"><button class="btn btn-dark rounded-pill py-3" style="background-color: #055160;">로그인페이지로 돌아가기</button></a>
					</c:when>
					<c:otherwise>
						<a href="/toothless/another/student/loginPage"><button class="btn btn-dark rounded-pill py-3" style="background-color: #055160;">로그인페이지로 돌아가기</button></a>
					</c:otherwise>
					
				</c:choose>
			</div>
			<div class="col-4"></div>
		</div>
	</div>
</body>
</html>