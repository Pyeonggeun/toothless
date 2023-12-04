<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이력서 수정 관리 페이지</h1>
	
	
	<form>
	
	이력서 제목 :<input type="text" value="${resumeDto.resume_title }"><br>
	자소서 내용 : <br>
	<textarea rows="10" cols="60">${resumeDto.cover_letter }</textarea>
	<br><br>
	경력 추가 : <br>
	<input type="text"><br>
	
	자격증 추가 : <br> 
	<input type="text"><br>
	
	<input type="submit">
	</form>
	
	
	
	
</body>
</html>