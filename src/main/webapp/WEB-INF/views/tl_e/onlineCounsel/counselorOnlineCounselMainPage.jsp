<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<jsp:include page="../commons/staffTopArea.jsp"></jsp:include>
	<div class="container">	
		<div class="row mt-5" >
			<div class="col" style="font-weight: bold; font-size: 2.0em;">
				상담 목록
			</div>
			<div class="col-9"></div>
			<div class="col">
				<div class="row" style="font-size: 0.8em; font-weight: bold">
					<div class="col">
						<div class="col"><i class="bi bi-check-lg" style="color: red;"></i> : 만족도 조사 미완료</div>
					</div>
				</div>
				<div class="row" style="font-size: 0.8em; font-weight: bold">
					<div class="col">
						<div class="col"><i class="bi bi-check-lg" style="color: orange;"></i> : 답변 대기</div>
					</div>
				</div>
				<div class="row" style="font-size: 0.8em; font-weight: bold">
					<div class="col">
						<div class="col"><i class="bi bi-check-lg" style="color: green;"></i> : 만족도 조사 완료</div>
					</div>
				</div>
			</div>
		</div>		
		<div class="row mt-4">
			<div class="col border border-primary border-3;"></div>
		</div>
		<div class="row mt-2 text-center" style="font-size: 1.2em; font-weight: bold; color: dark;">
			<div class="col-1">No.</div>
			<div class="col-2">작성자</div>
			<div class="col-3">카테고리</div>
			<div class="col">제목</div>
			<div class="col">작성일</div>
		</div>
		<div class="row mt-2">
			<div class="col border border-primary-emphasis"></div>
		</div>
		<C:forEach items="${counselList }" var="list">
			<C:forEach items="${list}" var="mapList">
				<div class="row mt-1 text-center">
					<div class="col-1">
						${mapList.onlineCounselBoardDto.id}
					</div>
					<div class="col-2">
						${mapList.studentInfoDto.name }
					</div>
					<div class="col-3">
						${mapList.typeCategoryDto.name}
					</div>
					<div class="col">
						<C:if test="${mapList.replyCount ==0 }">
							<i class="bi bi-check-lg" style="color: orange;"></i>
						</C:if>
						<C:if test="${mapList.replyCount > 0 }">
							<C:choose>
								<C:when test="${mapList.isSurveyed == 0 }">
									<i class="bi bi-check-lg" style="color: red;"></i>
								</C:when>
								<C:otherwise>
									<i class="bi bi-check-lg" style="color: green;"></i>
								</C:otherwise>
							</C:choose>
						</C:if>
						<a style="color: black !important; text-decoration: none !important;" class="link-secondary link-offset-2 link-underline link-underline-opacity-0" href="./counselorOnlineCounselReadCounselPage?counsel_pk=${mapList.onlineCounselBoardDto.id }">
							${mapList.onlineCounselBoardDto.title }
							<C:if test="${mapList.replyCount != 0}">
								[${mapList.replyCount }]
							</C:if>
						</a> 
					</div>
					<div class="col">
						<fmt:formatDate value="${mapList.onlineCounselBoardDto.created_at }" pattern="yy.MM.dd"/> 
					</div>
				</div>
				<div class="row mt-1">
					<div class="col border border-primary-emphasis"></div>
				</div>
			</C:forEach>
		</C:forEach>
		<div class="row mt-5">
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
	</div>	
</body>
</html>