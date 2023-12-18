<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시글 수정</h1>
<form action="./updateProcess" method="post">
	제목:<input name="board_title"type="text"><br>
	내용:<textarea name="board_contents"rows="10" cols="60"></textarea><br>
	답변:<textarea name="board_answer"rows="10" cols="60"></textarea>
	 
	 <input type="hidden" name="board_pk" value="${soso.qnABoardDto.board_pk}">
	 
	 <input name="staff_pk"type="hidden" value="21">
	 
	 <input type="submit" value="글 수정">
</form>

</body>
</html>