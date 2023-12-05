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

	상담 자유게시판 게시글 수정 페이지 
	<br><br>
	<form action="./updateFreeboardPostProcess" method=post>
		제목<input name = "title" type="text">
		<br>
		<input name="student_pk" type="hidden" value="${sessionStudentInfo.student_pk}">
		<input name="id" type="hidden" value="${pickpostMap.freeboardPost.id}">
		<br>
		내용<br>
		<textarea name = "text" cols=50 rows=50 ></textarea>
		
		<input type="submit" value="글 작성 완료">
	</form>
	
</body>
</html>