<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./writeProcess" method="post">
	작성자:<input name="name"type="text">
	제목:<input name="board_title"type="text"><br>
	내용:<textarea name="board_contents"rows="10" cols="60"></textarea><br>
	답변:<textarea name="board_answer"rows="10" cols="60"></textarea>
	 <input type="submit" value="글쓰기">
</form>
</body>
</html>
</body>
</html>