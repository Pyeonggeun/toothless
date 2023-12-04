<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
	<!-- c:if로 로그인한 사람만 들어올 수 있게 제한 걸기 -->
	<!-- 글로벌 메인 바 들어갈 자리 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/staffManagePage.jsp"></jsp:include>
			</div>
		</div>
		<%-- 전체 크기 --%>
		<div class="row">
			<%-- 왼쪽 여백--%>
			<div class="col-1"></div>
			<%-- 취업팀 메뉴 바 --%>
			<div class="col-1 me-5">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			<%-- 가운데 여백--%>	
			<div class="col-1 border-start"></div>
			<%-- 채용공고 등록 양식 --%>
			<div class="col">
				<!-- 채용공고 -->
				<div class="row"></div>
				<!-- 공고 제목 -->
				<div class="row"></div>
				<!-- 구인직무 -->
				<div class="row"></div>
				<!-- 채용내용 -->
				<div class="row"></div>
				<!-- 우대사항 -->
				<div class="row"></div>
				<!-- 채용내용 -->
				<div class="row"></div>
				<!-- 채용인원 -->
				<div class="row"></div>
				<!-- 채용마감일 -->
				<div class="row"></div>
			</div>
			<%-- 오른쪽 --%>	
			<div class="col"></div>	
		</div>
	
	</div>



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>