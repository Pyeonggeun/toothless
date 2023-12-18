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
<title>BasePage</title>
</head>
<body>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			<div class="col-1"></div>
			<div class="col-1 me-5">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			<div class="col-1 border-start"></div>
			<%-- 내용 시작 --%>
			<div class="col">
		<div class="row border">
					<div class="col">
				<div class="row border-bottom border-4 border-dark mb-5 pt-3">
					<div class="col fw-bold fs-3">공지글</div>
				</div>
				
				<div class="row">
					<div class="col my-1">
						작성자:${hoho.staffInfoDto.name}
					</div>
				</div>
				
				<div class="row">
					<div class="col">제목</div>
				</div>
				<div class="row">
					<div class="col-start">
						<div class="form-floating">
  							<textarea name="notice_title"class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
  							<label for="floatingTextarea">${hoho.noBoardDto.notice_title }</label>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col">내용</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="form-floating">
  							<textarea name="notice_contents"class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
  							<label for="floatingTextarea2">${hoho.noBoardDto.notice_contents }</label>
						</div>
					</div>
				</div>
				
			
				<div class="row  mt-3">
				<c:choose>
					<c:when test="${sessionStaffInfo.staff_pk == hoho.staffInfoDto.staff_pk }">	
						<div class="col text-end">
						<i class="bi bi-list"></i><a class="navbar-brand" href="./noticeMainPage">목록</a>
						</div>
						<div class="col text-end">
							<a class="navbar-brand" href="./deleteNoticeProcess?notice_board_pk=${hoho.noBoardDto.notice_board_pk }">삭제</a>
							<a class="navbar-brand" href="./updateNoticeWritePage?notice_board_pk=${hoho.noBoardDto.notice_board_pk }">수정</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="col text-center">
							<i class="bi bi-list"></i>
							<a class="navbar-brand" href="./noticeMainPage">목록</a>
						</div>
						
					</c:otherwise>	
				</c:choose>
				</div>
				
		  </div>
		</div>
				
				
				
			</div>
			
			<div class="col-2"></div>
		</div>
			
	</div>
	
	<div class="container">
		<div style="height: 200px;"></div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>