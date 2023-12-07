<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>여기가 글쓰기 페이지여</h1>
	
	<form action="./writeNoticeArticleProcess" method="post" enctype="multipart/form-data">
		${sessionStaffInfo.name } 님 글 등록중<br>
		<input name="staff_pk" type="hidden" value="${sessionStaffInfo.staff_pk }">
		<input name="title" type="text"><br>
		<textarea name="text" rows="10" cols="60"></textarea><br>
		<input name="imageFiles" type="file" accept="image/*" multiple="multiple">
		<input type="submit" value="글 등록">
	</form>
</body>
</html>