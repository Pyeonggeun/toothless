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
	<h1>공지사항</h1>
	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		<c:forEach items="${noticelist }" var="no">
		<tr>
			<td><a href="./readNoticePage?id=${no.noticeStaffBoardDto.notice_board_pk }">${no.noticeStaffBoardDto.notice_title }</a></td>
			<td>${no.noticeStaffBoardDto.notice_contents }</td>
			<td>${no.noticeStaffBoardDto.created_at}</td>
			<td>${no.staffInfoDto.name}</td>
		</tr>
		
		
		</c:forEach>	
	</table>
	
	<a href="./noticeWritePage">글쓰기</a>
</body>
</html>