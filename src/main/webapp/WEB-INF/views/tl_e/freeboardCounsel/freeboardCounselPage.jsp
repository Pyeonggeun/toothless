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
	<br><br><br>
	
	<h1>자유게시판</h1>
	
	<br><br>
	
	<table border=1>
		<tr>
			<td>글번호</td>
			<td>학번</td>
			<td>제목</td>
			<td>내용</td>
			<td>조회수</td>
			<td>시간</td>
		</tr>
		
		<c:forEach items="${combinedFreeboardList}" var="List">
			<tr>
				<td>${List.elementFreeboardDto.id}</td>
				<td>${List.studentInfo.student_id}</td>
				<td>${List.elementFreeboardDto.title}</td>
				<td>${List.elementFreeboardDto.text}</td>
				<td>${List.elementFreeboardDto.read_count}</td>
				<td>${List.elementFreeboardDto.created_at}</td>
			</tr>
		</c:forEach>
		
	</table>

	
	
	
	<br><br>
	

	
	<br><br>
	<a href="./createFreeboardPostsPage">글 작성 하기</a>
	
</body>
</html>