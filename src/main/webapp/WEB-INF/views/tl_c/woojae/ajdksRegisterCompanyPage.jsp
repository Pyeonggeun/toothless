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
	<h1>산업체 등록 페이지</h1>
	<br>
	<c:if test="${!empty sessionStaffInfo}">
		<form action="./registerCompanyProcess">
		업종 : <c:forEach items="${list}" var="companyCategoryList">
			<input name="company_category_pk" type="radio" value="${companyCategoryList.company_category_pk}">
			${companyCategoryList.company_category_name}
		</c:forEach>
		<input name="staff_pk" type="hidden" value="${sessionStaffInfo.staff_pk}"> <br>
		사업자등록번호: <input name="company_id" type="text"> <br>
		산업체명: <input name="company_name" type="text"> <br>
		대표자명: <input name="ceo_name" type="text"> <br>
		주소: <input name="address" type="text"> <br>
		전화번호: <input name="phone" type="text"> <br>
		홈페이지 주소: <input name="url" type="text"> <br>
		산업체 아이디: <input name="external_id" type="text"> <br>
		산업체 비밀번호: <input name="password" type="text"> <br>
		<input type="submit" value="등록하기">
	</form>
	</c:if>
</body>
</html>
