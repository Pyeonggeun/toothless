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
	<h1>상담</h1><br>
	작성자: ${targetCounselDto.studentInfo.name }<br>
	제목: ${targetCounselDto.counselDto.title }<br>
	카테고리: ${targetCounselDto.category.name }<br>
	내용: ${targetCounselDto.counselDto.text }

</body>
</html>