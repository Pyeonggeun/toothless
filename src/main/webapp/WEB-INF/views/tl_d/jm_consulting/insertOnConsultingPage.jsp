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

<div class="container">


	<div class="row">
		<div class="col">
			<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
		</div>
	</div>
	
	
	
	
	
	<div class="row">
		<div class="col-3">
			<jsp:include page="../common/studentMenu.jsp"></jsp:include>			
		</div>
		

		
		
		
		
		<div class="col-9">
			<div class="row mt-4">
				<div class="col">
					<c:if test="${not isOnelineConsulting}">
						<span class="text-danger">이미 대기중인 온라인 상담 이 있습니다!</span>
					</c:if>				
				</div>
		   </div>
			
			<div class="row mt-5">
				<div class="col fw-bold" style="font-size:1.5em;">
					온라인 상담페이지
				</div>
			</div>
			
			
			<div class="row mt-5">
				<div class="col fw-bold">
					상담내용
				</div>
			</div>
			
			<div class="row mt-2">
				<div class="col">
					<form action="onlineConsultingProcess" method="post">
					
					
						<textarea class="border" name="on_consulting_contents" style="border:none; outline:none; width:100%; height:100%;" rows="4" cols="60"></textarea>
						<c:choose>
							<c:when test="${isOnelineConsulting}">
								<button class="btn btn-primary" type="submit">제출</button>
							</c:when>
							<c:otherwise>
								<button disabled class="btn btn-primary" type="submit">제출</button>
							</c:otherwise>
						</c:choose>								
										
					</form>
				</div>
			</div>
		</div>
	</div>



</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>