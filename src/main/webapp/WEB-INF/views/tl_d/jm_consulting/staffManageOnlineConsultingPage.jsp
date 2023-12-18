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
			
				<div class="col-9">
					<div class="row mt-3">
						<div class="col">
						 	온라인 상담 관리 페이지
						</div>
					</div>
					
					<div class="row mt-3">
						<div class="col">
							<c:choose>
								<c:when test="${onlineConsultingInfo.staffInfoDto == null}">
									<span class="badge text-bg-danger">미답변</span>
								</c:when>
								
								<c:otherwise>
									<span class="badge text-bg-primary">답변 완료</span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					
					<div class="row">
						<div class="col">
							<div class="row py-1">
								<%--
								<div class="col" style="font-size:0.8em;">
									상담번호:${onlineConsultingInfo.onlineConsultingDto.on_consulting_pk}
								</div>
								 --%>
							</div>
							<div class="row py-1">
								<div class="col">
									<span style="font-size:0.8em;">상담자</span> <span class="fw-bold">${onlineConsultingInfo.studentInfoDto.name}</span> 
								</div>
								
								<div class="col">
									<span style="font-size:0.8em;">학번</span> <span class="fw-bold"">${onlineConsultingInfo.studentInfoDto.student_id}</span>
								</div>
								
								<div class="col-8"></div>
							</div>
							
							<div class="row mt-3 pt-3 border-top">
								<div class="col fw-bold" style="font-size:0.8em;">
									상담내용 <fmt:formatDate value="${onlineConsultingInfo.onlineConsultingDto.created_at}" pattern="yyyy-MM-dd"/>
								</div>
							</div>
							<div class="row py-2 pb-2">
								<div class="col">
									${onlineConsultingInfo.onlineConsultingDto.on_consulting_contents}
								</div>
							</div>														
						</div>
					</div>
					
					
					<div class="row mt-2 pt-3 border-top">
						<div class="col">					
					<c:choose>
						<c:when test="${onlineConsultingInfo.staffInfoDto == null}">
							<div class="row">
								<div class="col">
									<div class="row">
										<div class="col fw-bold" style="font-size:0.8em;">
											담당자 : ${sessionStaffInfo.name}
										</div>
									</div>
								</div>
							</div>
							<div class="row mt-3">
							
								<form action="./insertOnlineConsultingReply">
								<div class="col">
									<div class="row">
										<div class="col">
											<textarea name="on_contents_reply" style="width:100%"></textarea>	
										</div>
									</div>
									
									<div class="row text-end">
										<div class="col">
											<input type="hidden" name="staff_pk" value="${sessionStaffInfo.staff_pk}">
											<input type="hidden" name="on_consulting_pk" value="${onlineConsultingInfo.onlineConsultingDto.on_consulting_pk}">
											<input type="submit" value="등록">										
										</div>
									</div>																												
								</div>
								</form>
								
							</div>								
						</c:when>
					
						<c:otherwise>
							<div class="row">
								<div class="col">

									<div class="row">
										<div class="col">
											<div class="row">
												<div class="col" style="font-size:0.8em;">
													담당자 : <span class="fw-bold">${onlineConsultingInfo.staffInfoDto.name}</span>
												</div>
											</div>
											<div class="row pt-2">
												<div class="col">
													 ${onlineConsultingInfo.onlineConsultingReplyDto.on_contents_reply}
												</div>
											</div>											
										</div>
									</div>									
								</div>
							</div>
						</c:otherwise>
					
					</c:choose>
						</div>
					</div>
					
					<div class="row mt-3" style="font-size:0.8em;">
						<div class="col">
							<a href="./staffViewOnlineConsultingPage">목록으로</a>
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