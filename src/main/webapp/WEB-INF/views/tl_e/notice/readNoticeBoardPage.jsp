<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div class="col">
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
	</div>
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>