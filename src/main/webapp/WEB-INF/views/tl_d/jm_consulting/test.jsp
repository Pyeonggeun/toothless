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


						<div class="col me-3 text-center border rounded-3"   style="background-color:lightgray">
							<div class="row">
								<div class="col pt-3">
									<span style="font-size:3em;">
										<i class="bi bi-emoji-smile"></i>
									</span>
								</div>						
							</div>
							<div class="row">
						
								<div class="col">
								
										
									<div class="row">
										<div class="col">
											<span class="fw-bold pt-2" style="font-size:1.2em;">
												미응답 만족도 조사
											</span>		
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span class="fw-bold pt-2">
												종료된 구직희망 프로그램에 대해 
											</span>		
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span class="fw-bold pt-2" style="font-size:1.2em;">
												*
											</span>		
										</div>
									</div>																										
								</div>						
							</div>
							<div class="row pt-2">
								<div class="col pt-1 pb-3" style="font-size:0.8em;">
								
								
									<c:choose>
										<c:when test="${countUnAnsweredHJF==0}">
											<button disabled type="button" class=" btn btn-outline-secondary">
												<span class="fw-bold" style="font-size:1.2em;">${countUnAnsweredHJF}</span> 건
											</button>	
										
										</c:when>
										
										<c:otherwise>
										
										
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#myUnAnsweredHJF">
										  <span class="fw-bold" style="font-size:1.2em;">${countUnAnsweredHJF}</span> 건
										</button>
										
										<!-- Modal -->
										<div class="modal fade" id="myUnAnsweredHJF" tabindex="-1" aria-hidden="true">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h1 class="modal-title fs-5" id="exampleModalLabel">미응답 만족도 조사 리스트</h1>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body">
										        <div class="row">
										        	<div class="col">
										        		<div class="row fw-bold border-2 border-bottom pb-3">
										        			<div class="col">
										        				신청번호
										        			</div>
										        			<div class="col">
										        				구직 희망 신청일
										        			</div>
										        			<div class="col">
										        				만족도 조사하기
										        			</div>										        													        			
										        		</div>
										        		<div class="row pt-2">
										        			<div class="col">
										        				<c:forEach items="${hopeJobDtoList}" var="e">
										        					<div class="row py-3">
										        						<div class="col">
										        							${e.hope_job_pk}
										        						</div>
										        						<div class="col">
										        							<fmt:formatDate value="${e.created_at}" pattern="yyyy-MM-dd"/>
										        						</div>
										        						<div class="col">
										        							<a href="./insertHJFPage?hope_job_pk=${e.hope_job_pk}" style="text-decoration: none;"> 바로가기 ></a>
										        						</div>										        																        																        						
										        					</div>										        				
										        				</c:forEach>
										        			</div>
										        		</div>
										        	</div>
										        </div>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>										        
										      </div>
										    </div>
										  </div>
										</div>																																																							
										</c:otherwise>													
									</c:choose>
								
								
								</div>						
							</div>										
						</div>
				

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>







