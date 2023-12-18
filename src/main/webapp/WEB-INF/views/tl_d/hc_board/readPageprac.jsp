<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글</h1>
	
	제목:${roman.qnABoardDto.board_title}<br>
	작성자:${roman.staffInfoDto.staff_pk}<br>
	내용:<br>
		${roman.qnABoardDto.board_contents}<br>
		
		<br><br>
	<a href="./QnABoardPage">목록으로</a>	
	
	<a href="./deleteProcess?board_pk=${roman.qnABoardDto.board_pk}">삭제</a>
	<a href="./updatePage?board_pk=${roman.qnABoardDto.board_pk}">수정</a>
	
</body>
</html>