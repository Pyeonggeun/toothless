<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<h1>이력서 관리 페이지</h1>
	
	
		<div class="container">
			<div class="row">
				<div class="col">
				
					<div class="row">
						<div class="col">
						
							<table class="table table-striped table-hover text-center">
								<thead>
									<tr>
										<th scope="col">메인 이력서</th>
										<th scope="col">제목</th>
										<th scope="col">작성일</th>
										<th scope="col">공개여부</th>
									</tr>
								</thead>
								<tbody>			
									<tr>					
										<th scope="col" >${resumeDto.resume_pk }</th>
										<th scope="col">
											<a href="./updateResumePage?resume_pk=${resumeDto.resume_pk }" style="color: black; text-decoration: none;">${resumeDto.resume_title }</a>
										</th>
										<th scope="col">
											<fmt:formatDate value="${resumeDto.created_at}" pattern="yyyy-MM-dd"/>
										</th>
						    		</tr>		
								</tbody>
							</table>	
							<br><br>
						
						
						
							<table class="table table-striped table-hover text-center">
								<thead>
									<tr>
										<th scope="col">이력서 번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성일</th>
										<th scope="col">메인 이력서 설정</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${resumeList }" var="list">
										<tr>					
											<th scope="col">${list.resume_pk }</th>
											<th scope="col">
												<a href="./updateResumePage?resume_pk=${list.resume_pk }" style="color: black; text-decoration: none;">${list.resume_title }</a>
											</th>
											<th scope="col">
												<fmt:formatDate value="${list.created_at}" pattern="yyyy-MM-dd"/>
											</th>
							    		</tr>
								    </c:forEach>			
								</tbody>
							</table>						
						
						
						
						
						
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	
	
		
			
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>			
</body>
</html>