<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	상담 자유게시판 상세 게시물 작성 페이지
	<br>
	
	<form action="./createFreeboardPostsProcess" method=post>
		제목<input name = "title" type="text">
		<br>
		<input name="student_pk" type="hidden" value="${sessionStudentInfo.student_pk}">
		<br>
		내용<br>
		<textarea name = "text" cols=50 rows=50 ></textarea>
		
		<input type="submit" value="글 작성 완료">
	</form>
	 
</body>
</html>