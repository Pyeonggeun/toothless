<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../commons/studentTopArea.jsp"></jsp:include>


	<div class="container">
		<div class="row mt-5">
			<div class="col" style="font-weight: bold; text-align: center; font-size: 2.2em;">내 상담</div>
			<div class="col-9"></div>
			<div class="col">
				<div class="row" style="font-size: 0.8em; font-weight: bold">
					<div class="col"><i class="bi bi-check-lg" style="color: red;"></i> : 만족도 조사 요망</div>
				</div>
				<div class="row" style="font-size: 0.8em; font-weight: bold">
					<div class="col"><i class="bi bi-check-lg" style="color: orange;"></i> : 답변 대기</div>
				</div>
				<div class="row" style="font-size: 0.8em; font-weight: bold">
					<div class="col"><i class="bi bi-check-lg" style="color: green;"></i> : 만족도 조사 완료</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col border border-primary border-3;"></div>
		</div>
		<div class="row">
			<div class="col" style="text-align: center;">
				<table class="table">
				<thead>
				<tr>
					<th scope="col">No</th>
					<th scope="col">작성자</th>
					<th scope="col">카테고리</th>
					<th scope="col">제목</th>
					<th scope="col">작성시간</th>
				</tr>
				</thead>
				<tbody>
					<C:forEach items="${counselList}" var="counselList">
					<tr>
						<td>${counselList.onlineCounselBoardDto.id }</td>
						<td>${counselList.studentDto.name }</td>
						<td>${counselList.category.name }</td>
						<td>
							<C:if test="${counselList.replyCount == 0 }">
								<i class="bi bi-check-lg" style="color: orange;"></i>
							</C:if>
							<C:if test="${counselList.replyCount > 0 }">
								<C:choose>
									<C:when test="${counselList.isSurveyed == 0 }">
										<i class="bi bi-check-lg" style="color: red;"></i>
									</C:when>
									<C:otherwise>
										<i class="bi bi-check-lg" style="color: green;"></i>
									</C:otherwise>
								</C:choose>
							</C:if>
							<a href="./readCounselPage?counsel_pk=${counselList.onlineCounselBoardDto.id }" class="link-dark link-offset-2 link-underline link-underline-opacity-0">
					      		${counselList.onlineCounselBoardDto.title }
								<C:if test="${counselList.replyCount != 0 }">
									<span style="color: blue;">[${counselList.replyCount }]</span>
								</C:if>
					      	</a>
				      	</td>
						<td> <fmt:formatDate value="${counselList.onlineCounselBoardDto.created_at }" pattern="yy.MM.dd"/></td>
					</tr>
				    </C:forEach>
				</tbody>
			</table>
		</div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col d-flex justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item">
						<a class="page-link" href="#" aria-label="Next">
				        	<span aria-hidden="true">&raquo;</span>
						</a>
						</li>
					</ul>
				</nav>
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row" style="font-weight: bold; font-size: 1.4em; text-align: center;">
			<div class="col-10"></div>
			<div class="col">
				<a class="btn btn-dark" href="./writeOnlineCounselPage" class="link-dark link-offset-2 link-underline link-underline-opacity-0">상담 작성</a>
			</div>
		</div>
	</div>
</body>
</html>