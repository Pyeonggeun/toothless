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
	<div class="container">
		<div class="row">
			<div class="col mt-2 mb-3">
				${list.noticeBoardDto.title }
			</div>
		</div>
		<div class="row">
			<c:forEach items="${list.noticeImageList }" var="list">
				<div class="col-3"></div>
				<div class="col-6 ">
					<div style="overflow: hidden;">
						<img class="img-fluid" src="/uploadFiles/detailImage/${list.notice_image_link }" style="width: 30em">
					</div>		
				</div>
				<div class="col-3"></div>
			</c:forEach>
		</div>	
		<div class="row">
			<div class="col">
				${list.noticeBoardDto.text }
			</div>
		</div>
		<c:if test="${empty list.noticeImageList }">
			<div class="row" style="height: 500px"></div>
		</c:if>
		<div class="row">
			<div class="col">
				<a href="./noticeMainPage">목록으로..</a>
			</div>
		</div>
		<div class="row">
			<c:if test="${!empty sessionStaffInfo&&sessionStaffInfo.staff_pk==list.noticeBoardDto.staff_pk}">
				<div class="col">
					<a href="./deleteNoticeArticleProcess?id=${list.noticeBoardDto.id }">삭제</a>
					<a href="./updateNoticeArticlePage?id=${list.noticeBoardDto.id }">수정</a>
				</div>
			</c:if>
		</div>
	</div>
	<div class="container">
		<div class="row border">
			<div class="col">댓글번호</div>
			<div class="col">글</div>
			<div class="col">작성자</div>
			<div class="col">작성일</div>
		</div>
		<c:forEach items="${cList }" var="cList">
			<div class="row">
				<div class="col">${cList.noticeCommentDto.id }</div>
				<div class="col">${cList.noticeCommentDto.text }</div>
				<div class="col">${cList.studentInfoDto.name }</div>
				<div class="col"><fmt:formatDate value="${cList.noticeCommentDto.created_at }" pattern="yyyy-MM-dd hh-mm"/> </div>
				<c:if test="${sessionStudentInfo.student_pk==cList.noticeCommentDto.student_pk }">
					<a href="./deleteNoticeArticleCommentProcess?id=${cList.noticeCommentDto.id }&notice_id=${cList.noticeCommentDto.notice_id}">삭제</a>
				</c:if>
			</div>
		</c:forEach>
		<c:if test="${!empty sessionStudentInfo }">
			<form action="./writeNoticeCommentProcess" method="post">
				<div class="row">
					<div class="col-9">
						<input name="text" type="text" style="width:100%; height: 2em">
						<input name="notice_id" type="hidden" value="${list.noticeBoardDto.id }">
						<input name="student_pk" type="hidden" value="${sessionStudentInfo.student_pk }">
					</div>
					<div class="col">
						<input type="submit" style="width:100%; height: 2em" value="댓글띠">
					</div>
				</div>
			</form>
		</c:if>
		<div class="row"></div>
		<div class="row"></div>
		<div class="row"></div>
	</div>
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>