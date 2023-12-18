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
	#headerSize {
    	font-size: 0.8em;
    }
	
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../commons/counselorTopArea.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<form action="./noticeMainPage_Staff" method="get">
							<div class="row mb-3">
								<div class="col-2">
									<select name="searchType" class="form-select">
										<option value="title" selected>제목</option>
										<option value="text">내용</option>
										<option value="name">작성자</option>
									</select>
								</div>
								<div class="col-8">
									<input name="searchWord" type="text" class="form-control">
								</div>
								<div class="col-2 d-grid">
									<button class="btn btn-light">검색</button>
								</div>
							</div>
						</form>	
						<div class="row fw-bold border-bottom">
							<div class="col-1"><i class="bi bi-chat-square-text-fill"></i>&nbsp;&nbsp;글번호</div>
							<div class="col-8"><i class="bi bi-emoji-expressionless-fill"></i>&nbsp;&nbsp;제목</div>
							<div class="col-1"><i class="bi bi-emoji-heart-eyes-fill"></i>&nbsp;&nbsp;조회수</div>
							<div class="col-1"><i class="bi bi-person-arms-up"></i>&nbsp;&nbsp;작성자</div>
							<div class="col-1"><i class="bi bi-calendar-heart-fill"></i>&nbsp;&nbsp;작성일</div>
						</div>
						<c:forEach items="${list }" var="list">
							<div class="row mt-2 mb-2">
								<div id="headerSize" class="col-1">${list.noticeBoardDto.id }</div>
								<div class="col-8 border-bottom">
									<div class="row">
										<div class="col-10">
											<a class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;" href="./readNoticeBoardPage_Student?id=${list.noticeBoardDto.id }">${list.noticeBoardDto.title }</a>
											<c:if test="${list.commentCount > 0 }">
												<span style="font-size: 0.7em; color: red; font-weight: bold;">[${list.commentCount }]</span> 
											</c:if>
											<c:if test="${list.imageCount > 0 }">
												<i class="bi bi-card-image"></i>
											</c:if>
										</div>
										<div class="col-1">
											<span class="badge text-bg-light" style="font-size: 0.7em; color: red;">추천[${list.likeCount }]</span>
										</div>
										<div class="col-1">
											<span class="badge text-bg-light" style="font-size: 0.7em;">비추[${list.disLikeCount }]</span>
										</div>
									</div>
								</div>
								<div id="headerSize" class="col-1">${list.noticeBoardDto.read_count }</div>
								<div id="headerSize" class="col-1">${list.staffInfoDto.name }</div>
								<div id="headerSize" class="col-1"><fmt:formatDate value="${list.noticeBoardDto.created_at }" pattern="yy.MM.dd"/></div>
							</div>
						</c:forEach>
					</div>	
					<div class="col-1"></div>	
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>