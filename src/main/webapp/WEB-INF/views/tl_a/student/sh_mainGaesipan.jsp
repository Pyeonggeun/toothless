<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>

	<jsp:include page="../commons/student/topNavi.jsp"></jsp:include>
    <div class="row">
        <div class="col">
            <img src="../../resources/img/dormitory/studentMainLogo.jpg">
        </div>
    </div>
	
	<div class="container">
		<div class="row my-4">
			<div class="col fs-3 border-bottom">기숙사 자유게시판</div>
		</div>
		<div class="row fw-bold my-3">
			<div class="col">글 번호</div>
			<div class="col-8">제목</div>
			<div class="col">작성자</div>
			<div class="col">작성일</div>
		</div>
		<c:forEach items="${list }" var="map">
			<div class="row border-bottom my-1">
				<div class="col">${map.dormFreeboardDto.dorm_freeboard_pk}</div>
				<div class="col-8"><a href="./readGasipan?id=${map.dormFreeboardDto.dorm_freeboard_pk}">${map.dormFreeboardDto.title}</a></div>
				<div class="col">${map.studentInfoDto.name}</div>
				<div class="col"><fmt:formatDate value="${map.dormFreeboardDto.created_at}" pattern="yy.MM.dd" /></div>
			</div>
		</c:forEach>
		
		<div class="row mt-3">
			<div class="col">
				<nav aria-label="...">
				  <ul class="pagination mb-0">
				    <li class="page-item disabled">
				      <a class="page-link">Previous</a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item active" aria-current="page">
				      <a class="page-link" href="#">2</a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
				  </ul>
				</nav>				
			</div>
			<c:if test="${!empty sessionStudentInfo}">
			
			<div class="col-3 ms-auto d-grid">
				<a class="btn btn-primary" href="./writeGasipan">글쓰기</a>
			</div>
			</c:if>
		</div>
		
	</div>

	<pre>
	
	
	
	
	
	
	
	
	
	
	
	</pre>


<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
	
</body>
</html>
