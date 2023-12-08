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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&amp;family=Gowun+Dodum&amp;family=Quicksand:wght@300&amp;display=swap" rel="stylesheet">
<style type="text/css">
	*{
	/* font-family: 'Dongle', sans-serif; */
	font-family: 'Gowun Dodum', sans-serif;
	/* font-family: 'Quicksand', sans-serif; */
	}

</style>


<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col"></div>
			<div class="col"></div>
			<div class="col"><div class="title-font" style="font-size:3em;">공지사항</div></div>
			<div class="col"></div>
			<div class="col">
				<div class="row">
					<c:choose>
						<c:when test="${!empty sessionStaffInfo }">
							<div class="col mt-3 fs-5">${sessionStaffInfo.name }님</div>
						</c:when>
						<c:otherwise>
							<div class="col mt-3 fs-5">${sessionStudentInfo.name }님</div>
						</c:otherwise>
					</c:choose>
					<div class="col mt-3 fs-5"><a href="./logoutProcess"><i class="bi bi-box-arrow-right"></i></a></div>
					<c:if test="${!empty sessionStaffInfo }">
						<div class="col mt-3 fs-5">
							<a href="./writeNoticeArticlePage">글쓰기</a>
						</div>
					</c:if>
				</div>
			</div>
		</div>
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
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>