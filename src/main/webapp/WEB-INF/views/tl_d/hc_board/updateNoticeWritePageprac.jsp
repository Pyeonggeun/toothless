<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글쓰기 수정</h1>
	<form action="./noticeUpdateProcess" method="post">	
	제목:<input name="notice_title"type="text" value="${qwer.noBoardDto.notice_title }"><br>
	내용:<br>
	<textarea name="notice_contents" rows="10" cols="60">${qwer.noBoardDto.notice_contents }</textarea>
	<input name="notice_board_pk" type="hidden" value="${qwer.noBoardDto.notice_board_pk}">	
	<br>
	<input type="submit" value="글 수정">
	</form>		
</body>
</html>