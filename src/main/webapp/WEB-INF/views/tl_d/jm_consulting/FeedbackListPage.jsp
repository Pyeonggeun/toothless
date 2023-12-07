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
			<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>	
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<div class="row">
				<div class="col-3">
					<jsp:include page="../common/staffMenu.jsp"></jsp:include>	
				</div>
				
				<div class="col-9" style="font-size:0.8em;">
					<div class="row mt-5">
						<div class="col fw-bold" style="font-size:1.4em;">
							만족도 조사
						</div>
					</div>
					<div class="row mt-5 border pt-3 pb-3">
						<div class="col fw-bold">
							평균 평점
						</div>
						<div class="col" style="text-align:left">
							<c:choose>
								<c:when test="${avgScore==null }">
									완료된 만족도 조사가 없습니다.
								</c:when>
								
								<c:otherwise>
									<span>${avgScore}점</span>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-3"></div>
						<div class="col-5">
							<form action="">
							<div class="row">
								<div class="col">
									<input type="radio" name="sortHJFScore" value="sortLow"${sortHJFScore == 'sortLow' ? 'checked' : null }>평점 낮은순
								</div>
								<div class="col"> 
									<input type="radio" name="sortHJFScore" value="sortHigh" ${sortHJFScore == 'sortHigh' ? 'checked' : null }>평점 높은순
								</div>
								<div class="col">
									<button type="submit" style="border:none; background:none; cursor:pointer;"><i class="bi bi-search"></i></button>
								</div>																
							</div>
							</form>
						</div>																		
					</div>
					
					<div class="row mt-5 border-top">
						<div class="col">
							<div class="row">
								<div class="col">
									<table class="table">
									  <thead>
									    <tr>
									      <th scope="col">만족도조사번호</th>
									      <th scope="col">학생 이름</th>
									      <th scope="col">점수</th>
									      <th scope="col">설문일</th>
									    </tr>
									  </thead>
									  <tbody>
									  	
									  	<c:forEach items="${list}" var="e">
									  	
									    <tr>
									    
									   <%--  <th scope="row"> <a href="./detailFeedbackPage?hjf_pk=${e.hopeJobFeedbackDto.hope_job_feedback_pk}">1</a></th> --%>
									      <td><a href="./detailFeedbackPage?hjf_pk=${e.hopeJobFeedbackDto.hope_job_feedback_pk}">${e.hopeJobFeedbackDto.hope_job_feedback_pk }</a></td>
									      <td><a href="./detailFeedbackPage?hjf_pk=${e.hopeJobFeedbackDto.hope_job_feedback_pk}">${e.studentInfoDto.name }</a></td>
									      <td><a href="./detailFeedbackPage?hjf_pk=${e.hopeJobFeedbackDto.hope_job_feedback_pk}">${e.hopeJobFeedbackDto.hjf_score}</a></td>									    
									      <td><a href="./detailFeedbackPage?hjf_pk=${e.hopeJobFeedbackDto.hope_job_feedback_pk}">
									      <fmt:formatDate pattern="yyyy-MM-dd" value="${e.hopeJobFeedbackDto.created_at}"/> </a></td>
									    
									    </tr>
									   	
									  	</c:forEach>

									  </tbody>
									</table>									
								</div>
							</div>
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