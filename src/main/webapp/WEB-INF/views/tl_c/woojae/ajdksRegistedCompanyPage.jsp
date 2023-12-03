<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>산업체 등록 내역</h1> <br>
	<c:forEach items="${list}" var="registedCompanyList">
		${registedCompanyList.company_name}|
		${registedCompanyList.ceo_name}|
		${registedCompanyList.address}|
		${registedCompanyList.phone}
		<br>
	</c:forEach>
</body>
</html>