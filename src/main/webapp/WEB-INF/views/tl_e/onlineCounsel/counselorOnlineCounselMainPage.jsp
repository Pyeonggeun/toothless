<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<c:forEach items="${counselDto }" var="counselDto">
		No. ${counselDto.onlineCounselBoardDto.id }<br>
		작성자 : ${counselDto.studentDto.student_id }<br>
		카테고리 : ${counselDto.category.name}<br>
		제목 : ${counselDto.onlineCounselBoardDto.title }<br>
	</c:forEach>
	 --%>
	<c:forEach items="${counselDto }" var="counselDto">
		No. ${counselDto.onlineCounselBoardDto.id }
	</c:forEach>
	
	
	
	
	<h1>상담원 메인페이지</h1>
</body>
</html>