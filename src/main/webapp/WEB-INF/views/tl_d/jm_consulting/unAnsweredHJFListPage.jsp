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
			
			<div class="row">
				<div class="col">
					설문 가능한 만족도 조사
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col">
						
							<c:choose>
								<c:when test="${hopeJobDtoList == false}">
									미응답 만족도 조사가 음서용
								</c:when>
							
								<c:otherwise>
									<table class="table">
									  <thead>
									    <tr>
									      <th scope="col">신청번호</th>
									      <th scope="col">구직희망신청일</th>
									      <th scope="col"> </th>
									    </tr>
									  </thead>
									  <tbody>
									  	<c:forEach items="${hopeJobDtoList}" var="e">
										    <tr>
										      <th scope="row">${e.hope_job_pk}</th>
										      <td>${e.created_at}</td>
										      <td><a href="./insertHJFPage?hope_job_pk=${e.hope_job_pk}">바로가기 ></a></td>
										    </tr>							  		
									  	</c:forEach>
		
									  </tbody>
									</table>								
								</c:otherwise>
							
							</c:choose>					
																				
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>








<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>