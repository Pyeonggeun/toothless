<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글</h1>
	제목:${hoho.noBoardDto.notice_title }<br>
	작성자:${hoho.staffInfoDto.name}<br>
	
	내용:<br>
		${hoho.noBoardDto.notice_contents }<Br>
		<br><Br>
		<a href="./noticeMainPage">목록으로</a>
		
		<a href="./deleteNoticeProcess?notice_board_pk=${hoho.noBoardDto.notice_board_pk }">삭제</a>
		<a href="./updateNoticePage?notice_board_pk=${hoho.noBoardDto.notice_board_pk }">수정</a>
</body>
</html>