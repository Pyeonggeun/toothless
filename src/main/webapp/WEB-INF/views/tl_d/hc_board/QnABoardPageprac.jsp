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
	<h1>qna게시판</h1>	
	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
		<c:forEach items="${list }" var="map">
		<tr>
			<td>${map.qnaBoardDto.board_pk }</td>
			<td><a href="./readPage?board_pk=${map.qnaBoardDto.board_pk }">${map.qnaBoardDto.board_title }</a></td>
			
			<td>${map.qnaBoardDto.created_at }</td>
		</tr>
		</c:forEach>		
		
	</table>
	
	
	
	<a href="./BoardWritePage">글쓰기</a>
	
	
	
</body>
</html>