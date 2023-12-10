<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육프로그램 신청</title>
</head>
<body>
	<h1>프로그램 신청 페이지입니다</h1>
	<form action="./eduApplyProcess" method="get">
	
		프로그램명 ${name}<br>
		신청자 ${sessionStudentInfo.name}<br>
		학번 ${sessionStudentInfo.student_id}<br>
		학과 ${sessionStudentInfo.department_pk}<br>
		전화번호 ${sessionStudentInfo.phone}<br>
		<input name="edu_pk" type="hidden" value="${edu_pk}" >
		<!-- 내용:<br>
		<textarea name="content" rows="10" cols="60"></textarea><br>
		포스터: <input name="img_link" type="file" accept="image/*" multiple><br>
		신청시작일: <input name="apply_start_date" type="date"><br>
		신청종료일: <input name="apply_end_date" type="date"><br>
		교육일시: <input name="edu_date" type="date"><br>
		장소: <input name="place" type="text"><br>
		수강인원: <input name="capacity" type="number" value="1" min="1"><br> -->
		<input type="submit" value="프로그램 신청">
	</form>
	
</body>
</html>