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
<div class="container-fluid">


	<div class="row">
		<div class="col">
			<div class="row">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>			
		</div>
	</div>


	<div class="row">
		<div class="col-2">
			<jsp:include page="../common/studentMenu.jsp"></jsp:include>
		</div>
		<div class="col-1 border-start"></div>
		<div class="col">
			<div class="row my-5">
				<div class="col fw-bold" style="font-size:1.5em;">
					<span>내 온라인 상담 내역</span>
				</div>
			</div>
			
			<div class="row">
							
				<div class="col">
				
				
					<div class="row">
						<div class="col">
							<i class="bi bi-pen text-start"> </i> 상담 내용
						</div>
						
						<div class="col-2 text-end" style="font-size:0.8em; color:gray">
							<fmt:formatDate value="${onlineConsultingInfo.onlineConsultingDto.created_at}" pattern="yyyy-MM-dd"/>
						</div>												
					</div>				
													
					<div class="row mt-1 border-top">
						<div class="col">						
							<div class="row mt-2">							
								<div class="col">
									${onlineConsultingInfo.onlineConsultingDto.on_consulting_contents}
								</div>						
							</div>
						</div>
					</div>
					<%-- 답글 --%>
					<div class="row mt-5">
						<div class="col fw-bold text-secondary ">
								<i class="bi bi-envelope-open"> </i> 상담 답변 
						</div>					
						
						<div class="col-2 text-end" style="color:gray; font-size:0.8em;">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${onlineConsultingInfo.onlineConsultingReplyDto.created_at}"/> 
						</div>														
					</div>
					

					<div class="row mt-2 border-top">
						<div class="col">

							<c:choose>
								
								<c:when test="${onlineConsultingInfo.onlineConsultingReplyDto == null}">

									<div class="row mt-2">
										<div class="col fw-bold ">
											아직 답변이 등록되지 않았습니다!
										</div>
									</div>

								</c:when>
							
								<c:otherwise>						
										<div class="row">
											<div class="col mt-3">
												${onlineConsultingInfo.onlineConsultingReplyDto.on_contents_reply}
											</div>					
										</div>	
										<div class="row mt-4">		
											<div class="col-8">
												
											</div>																			
											<div class="col text-right" style=" text-align:right">
												<span class="fw-bold ">답변인</span> ${onlineConsultingInfo.staffInfoDto.name }
											</div>																	
										</div>																	
								</c:otherwise>	
							
							</c:choose>											
						</div>	
					</div>		
					
					<div class="row mt-5">
						<div class="col text-end">
							<a href="./myOnlineConsultingListPage"><button type="button" class="btn btn-primary ">목록으로</button>
							</a>
						</div>
					</div>												
				</div>
			</div>	
		</div>
		<div class="col-2"></div>
		</div>
		<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
		<!-- futter -->
		<div class="row">
			<div class="col">
				<jsp:include page="../common/futter.jsp"></jsp:include>
			</div>
		</div>	
</div>
</body>
</html>