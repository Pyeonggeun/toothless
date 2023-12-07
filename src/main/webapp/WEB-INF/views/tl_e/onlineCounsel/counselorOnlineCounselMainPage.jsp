<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<div class="col text-center" style="font-size: 2.5em; color: orange; font-weight: bold">상담 페이지</div>
		<div class="col-2 mt-3 d-flex justify-content-around">
			<span class="fw-bold" style="font-size: 1.3em;"> 상담사 ${sessionExternalInfo.external_id }님</span>
		</div>
	</div>
	<div class="row mt-2 text-center" style="font-weight: bold; font-size: 2.3em; background-color: orange;"  >
		<div class="col-1"></div>		
		<div class="col">
			Home
		</div>
		<div class="col">
			공지사항
		</div>
		<div class="col">
			상담
		</div>
		<div class="col">
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle mb-2" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    	내 정보
				</button>
				<ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="#">답변 완료 상담</a></li>
				    <li><a class="dropdown-item" href="#">채택 된 상담</a></li>
				</ul>
			</div>
		</div>
		<div class="col-1"></div>
	</div>
	<div class="container">	
		<div class="row mt-5" >
			<div class="col" style="font-weight: bold; font-size: 2.0em;">
				상담 목록
			</div>
		</div>	
		<div class="row mt-5">
			<div class="col-8">
				<div class="row fw-bold" style="font-size: 1.2em; color: gray;" >
					<div class="col">전체</div>
					<div class="col">문학</div>
					<div class="col">경제 경영</div>
					<div class="col">자기계발</div>
					<div class="col">경영 혁신</div>
					<div class="col">컴퓨터</div>
					<div class="col">소설</div>
					<div class="col">예술</div>
					<div class="col">건강</div>
				</div>
			</div>
			<div class="col"></div>
		</div>	
		<div class="row mt-4">
			<div class="col border border-2" style="color: black;">
			</div>
		</div>
		<div class="row mt-2 text-center" style="font-size: 1.2em; font-weight: bold; color: gray;">
			<div class="col-1" style="color: red;" >No.</div>
			<div class="col-2" style="color: blue;" >작성자</div>
			<div class="col-3">카테고리</div>
			<div class="col" style="color: brown;" >제목</div>
		</div>
		<div class="row mt-2">
			<div class="col border" style="color: black;"></div>
		</div>
		<C:forEach items="${counselList }" var="list">
			<C:forEach items="${list}" var="mapList">
				<div class="row mt-1 text-center">
					<div class="col-1">
						${mapList.onlineCounselBoardDto.id}
					</div>
					<div class="col-2">
						${mapList.studentInfoDto.name }
					</div>
					<div class="col-3">
						${mapList.typeCategoryDto.name}
					</div>
					<div class="col">
						${mapList.onlineCounselBoardDto.title }
					</div>
				</div>
				<div class="row mt-1">
					<div class="col border" style="color: black;"></div>
				</div>
			</C:forEach>
		</C:forEach>
	</div>	
</body>
</html>