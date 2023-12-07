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
	<div class="container">
		
		<c:forEach items="${counselorList}" var="list">
		
		
		<div class="row">
			<div class="col">
				<a href="./counselorAddProcess?counselor_id=${list.id }&group_counsel_id=${group_counsel_id }">${list.name }</a>		
			</div>		
		</div>
		</c:forEach>	
	
	</div>
	
	
	
</body>
</html>