<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지사항 상세글 수정이요</h1>
	<form action="./updateNoticeArticleProcess" method="post">
		${sessionStaffInfo.name } 님 글 수정중<br>
		<input name="id" type="hidden" value="${list.noticeBoardDto.id }">
		<input name="staff_pk" type="hidden" value="${sessionStaffInfo.staff_pk }">
		<input name="title" type="text" value="${list.noticeBoardDto.title }"><br>
		<textarea name="text" rows="10" cols="60">${list.noticeBoardDto.text }</textarea><br>
		
		<input type="submit" value="글 등록">
	</form>
	
	
</body>
</html>