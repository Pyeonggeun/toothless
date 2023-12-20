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
						<c:choose>
							<c:when test="${getMyOnlineConsultingListNumFive.size()==0}">
								<span class="fw-bold mt-3 text-center">상담이력이 없습니다!</span>
							</c:when>
							
							<c:when test="${getMyOnlineConsultingListNumFive==null}">
								<span class="fw-bold mt-3 text-center">상담이력이 없습니다!</span>
							</c:when>							
							
							<c:otherwise>
								<c:forEach items="${getMyOnlineConsultingListNumFive }" var="e">
									
									<div class="row my-3 border-bottom">
										<div class="col">
											<!-- 상담 번호 -->
											<div class="row pb-2">
												<div class="col-3 ms-2">No.<span class="fw-bold">${e.onlineConsultingDto.on_consulting_pk}</span></div>
												<div class="col ms-2">
												</div>
												<div class="col ms-2">
													<c:choose>
														<c:when test="${e.onlineConsultingReplyDto==null}">
															<span class="badge text-bg-danger">미답변</span>
														</c:when>
														<c:otherwise>
															<a href="../jm_consulting/myOnlineConsultingPage?on_consulting_pk=${e.onlineConsultingDto.on_consulting_pk}"><span class="badge text-bg-primary">답변완료</span></a>
														</c:otherwise>
													</c:choose>		
												</div>
												<div class="col-2">
													<fmt:formatDate pattern="yyyy-MM-dd" value="${e.onlineConsultingDto.created_at}"/>
												</div>			
											</div>
											<!-- 이름 -->
										
										</div>
									</div>
								  </c:forEach>																
							</c:otherwise>
							
						</c:choose>
						













						
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
<%-- --%>
<!--  -->
