<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>

<c:forEach items="${getMyOnlineConsultingListNumFive }" var="e">

	<div class="row my-3 border-bottom">
		<div class="col-4">
			<!-- 상담 번호 -->
			<div class="row">
				<div class="col ms-2">No.<span class="fw-bold">${e.onlineConsultingDto.on_consulting_pk}</span></div>
				<div class="col ms-2">
					${sessionStudentInfo.name}				
				</div>
				<div class="col ms-2">
					<c:choose>
						<c:when test="${e.onlineConsultingReplyDto==null}">
							<span class="badge text-bg-danger">미답변</span>
						</c:when>
						<c:otherwise>
							<a href="myOnlineConsultingPage?on_consulting_pk=${e.onlineConsultingDto.on_consulting_pk}"><span class="badge text-bg-primary">답변</span></a>
						</c:otherwise>
					</c:choose>		
				</div>			
			</div>
			<!-- 이름 -->
		
		</div>
	</div>
</c:forEach>







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>