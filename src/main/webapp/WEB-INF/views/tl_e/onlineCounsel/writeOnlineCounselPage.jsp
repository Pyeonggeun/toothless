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

	<jsp:include page="../commons/studentTopArea.jsp"></jsp:include>
	
	<div class="container">
		<div class="row mt-4">
			<div class="col border border-primary border-1"></div>
		</div>
		<div class="row">
			<div class="col mt-4" style="font-weight: bold; font-size: 1.9em; text-align: center;">
				상담 신청
			</div>
		</div>
		<div class="row mt-3">
			<div class="col" style="text-align: justify-content; font-weight: bold; font-size: 1.2em;">
				작성자 : ${sessionStudentInfo.name }
			</div>
		</div>
		<form action="./writeOnlineCounselProcess" method="post">
			<div class="row mt-4" >
				<div class="col">
					<span style="font-weight: bold;">카테고리</span>
				</div>
				<C:forEach items="${category }" var="category">
					<div class="col">
					<div class="form-check">
						<input class="form-check-input" name="type_category_id" type="radio" value="${category.id }">${category.name }
						 <label class="form-check-label" for="flexRadioDefault1">
						</label>
					</div>
					</div>
				</C:forEach>
				<div class="col-3"></div>
			</div>		
			<div class="row mt-4">
				<div class="col">
					<div class="form-floating">
						<textarea name="title" class="form-control" placeholder="제목을 입력하세요" id="floatingTextarea" style="font-weight: bold;" ></textarea>
						<label for="floatingTextarea">제목</label>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col">
					<div class="form-floating">
					  <textarea name="text" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px; font-weight: bold;"></textarea>
					  <label for="floatingTextarea2">상담 작성</label>
					</div>
				</div>
			</div>
			<input name="student_id" type="hidden" value="${sessionStudentInfo.student_pk }">
			<div class="row mt-3">
				<div class="col-5"></div>
				<div class="col-5"></div>
				<div class="col" style="text-align: right;">
					<input class="btn btn-dark" type="submit" value="Done">
					<a class="btn btn-dark" href="./onlineCounselMainPage" class="link-dark link-offset-2 link-underline link-underline-opacity-0">Back</a>
				</div>
			</div>
		</form>
		<div class="row"></div>
	</div>

	
</body>
</html>



<%-- 	<form action="./writeOnlineCounselProcess">
		제목 : <input name="title" type="text"><br>
		작성자 : ${sessionStudentInfo.name }<br>
		카테고리 : <C:forEach items="${category }" var="category">
					<input name="type_category_id" type="radio" value="${category.id }">${category.name }
				</C:forEach>
		<br>
		내용 : <textarea name="text" rows="5" cols="15"></textarea>
		<input name="student_id" type="hidden" value="${sessionStudentInfo.student_pk }">
		<input type="submit" value="작성">
		<a href="./onlineCounselMainPage">메인페이지</a>
	</form> --%>