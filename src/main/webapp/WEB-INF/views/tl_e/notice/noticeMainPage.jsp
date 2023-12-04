<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<title>Insert title here</title>
</head>
<body>
	<h1>*공지사항</h1>
	<c:if test="${!empty sessionStaffInfo }">
		<a href="./writeNoticeArticlePage">글쓰기</a>
	</c:if>
	<div class="table-responsive small">
		<table class="table table-striped table-sm">
			<thead>
			  <tr>
			    <th scope="col">글번호</th>
			    <th scope="col">제목</th>
			    <th scope="col">작성자</th>
			    <th scope="col">조회수</th>
			    <th scope="col">작성일</th>
			  </tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="list">
					<tr>
						<td>${list.noticeBoardDto.id }</td>
						<td><a href="./readNoticeBoardPage?id=${list.noticeBoardDto.id }">${list.noticeBoardDto.title }</a></td>
						<td>${list.staffInfoDto.name }</td>
						<td>${list.noticeBoardDto.read_count }</td>
						<td><fmt:formatDate value="${list.noticeBoardDto.created_at }" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>