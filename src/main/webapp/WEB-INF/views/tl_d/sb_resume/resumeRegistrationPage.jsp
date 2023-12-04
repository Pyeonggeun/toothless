<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<h1> 이력서 등록 페이지</h1>
	
	<form action="./resumeRegisterProcess" method="post">
	<input name="student_pk" type="hidden" value="${sessionStudentInfo.student_pk }"><br>
	이력서 제목 : <input name="resume_title" type="text"><br>
	자소서 내용 :<br> 
	<textarea name="cover_letter" rows="10" cols="60"></textarea> <br>
	메인 이력서 여부  <br>
	<input name="main_resume" type="radio" value="Y"> 메인이력서
	<input name="main_resume" type="radio" value="N"> 추가이력서 <br>
	
	<input name="is_public" type="hidden" value="N"><br>
	
	
	<input type="submit" value="등록">
	
	</form>
	
	
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>