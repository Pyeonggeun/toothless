<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기</h1><br>
	<form action="./noticeWriteProcess" method="post">
	작성자:${sessionStaffInfo.name}<br>
	제목:<input name="notice_title"type="text"><br>
	내용:<br>
	<textarea name="notice_contents" rows="10" cols="60"></textarea>
	<input name="staff_pk" type="hidden" value="${sessionStaffInfo.staff_pk}">
	${qwer.noBoardDto.notice_board_pk}
	<input type="submit" value="글 등록">
	</form>		
</body>
</html>