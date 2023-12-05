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

	<br><br>
	상담 자유게시판 상세 글 읽기 페이지
	<br><br>
	제목  ${pickpostMap.freeboardPost.title}<br>
	학번 ${pickpostMap.studentInfo.name}<br>
	조회수  ${pickpostMap.freeboardPost.read_count}<br>
	내용 <br>
	${pickpostMap.freeboardPost.text }<br> 
	<br>
	<a href="./freeboardCounselPage">글 목록으로 돌아가기</a>
	
	<c:if test="${pickpostMap.freeboardPost.student_pk == sessionStudentInfo.student_pk}">
		<a href="./updateFreeboardPostPage?id=${pickpostMap.freeboardPost.id}">현재 글 수정하기</a>
		<a href="./deleteFreeboardPostProcess?id=${pickpostMap.freeboardPost.id}">현재 글 삭제하기</a>
	</c:if>
	

</body>
</html>