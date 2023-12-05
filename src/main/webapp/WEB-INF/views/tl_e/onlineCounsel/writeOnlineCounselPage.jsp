<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>온라인 상담</h1><br>
	<form action="./writeOnlineCounselProcess">
		제목 : <input name="title" type="text"><br>
		작성자 : ${sessionStudentInfo.name }<br>
		카테고리 : <C:forEach items="${category }" var="category">
					<input name="type_category_id" type="radio" value="${category.id }">${category.name }
				</C:forEach>
		<br>
		내용 : <textarea name="text" rows="5" cols="15"></textarea>
		<input name="student_id" type="hidden" value="${sessionStudentInfo.student_pk }">
		<input type="submit" value="작성">
	</form>
	<br>
	<a href="./onlineCounselMainPage">메인페이지</a>
</body>
</html>