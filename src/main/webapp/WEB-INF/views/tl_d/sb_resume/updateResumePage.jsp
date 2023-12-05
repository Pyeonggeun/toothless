<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<h1>이력서 수정 관리 페이지</h1>
	
	
	
	
	이력서 제목 :<input type="text" value="${resumeDto.resume_title }"><br>
	자소서 내용 : <br>
	<textarea rows="10" cols="60">${resumeDto.cover_letter }</textarea>
	<br><br>
		<table class="table table-striped table-hover text-center">
			<thead>
				<tr>
					<th scope="col">경력 카테고리</th>
					<th scope="col">경력 내용</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${careerList}" var="career">
					<tr>					
						<th scope="col">${career.careerName.career_category_name }</th>
						<th scope="col">${career.careerDto.career_contents }</th>
						<th scope="col">
							<fmt:formatDate value="${career.careerDto.created_at}" pattern="yyyy-MM-dd"/>
						</th>
						<th scope="col">
							<form action="./updateCareerPage">
								<input type="hidden" name="career_pk" value="${career.careerDto.career_pk }">
								<input type="hidden" name="resume_pk" value="${career.careerDto.resume_pk }">
								<button type="submit">수정</button>
							</form>
							
							<form action="./careerDeleteProcess">
								<input type="hidden" name="career_pk" value="${career.careerDto.career_pk }">
								<input type="hidden" name="resume_pk" value="${career.careerDto.resume_pk }">
								<button type="submit">삭제</button>
							</form>
						
						</th>
		    		</tr>
			    </c:forEach>			
			</tbody>
		</table>				

	경력 추가  <br>
	<form action="./careerRagistrationProcess" method="post">
		<input name="resume_pk" type="hidden" value="${resumeDto.resume_pk }">
		<select name="career_category_pk" class="form-select" aria-label="경력 카테고리">
			<option selected>경력 선택</option>
			<c:forEach items="${careerCategoryList }" var="careercategory">
				<option  value="${careercategory.career_category_pk }">${careercategory.career_category_name }</option>
			</c:forEach>
		</select><br>
		경력 내용<br>
		<textarea name="career_contents" rows="10" cols="60"></textarea>
		<br>
		<button type="submit">추가</button>
	</form>
	
	자격증 추가 : <br> 
	<input type="text"><br>
	
	<input type="submit">
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>