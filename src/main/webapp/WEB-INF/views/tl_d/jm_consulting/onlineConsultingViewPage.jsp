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
			<div class="row my-5">
				<div class="col text-center" style="font-size:1.5em;">
					<span>내 온라인 상담 내역</span>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<div class="row mt-3 border-top">
						<div class="col">
						
							<div class="row">
								<div class="col fw-bold">
									내 상담 내역						
								</div>							
							</div>
						
							<div class="row mt-2">							
								<div class="col">
									상담내용
								</div>
								<div class="col">
									${onlineConsultingInfo.onlineConsultingDto.on_consulting_contents}
								</div>						
							</div>
							<div class="row">
								<div class="col">
									문의 날짜
								</div>
								<div class="col">
									<fmt:formatDate value="${onlineConsultingInfo.onlineConsultingDto.created_at}" pattern="yyyy-MM-dd"/>
								</div>						
							</div>
						</div>
					</div>
					<%-- 답글 --%>
					<div class="row mt-3">
						<div class="col">
							
							<c:choose>
								
								<c:when test="${onlineConsultingReplyDto == null}">
									<div class="row border-top pt-3">
										<div class="col">
											아직 답변이 등록되지 않았습니다.
										</div>
									</div>
								</c:when>
							
								<c:otherwise>
										<div class="row border-top">
											<div class="col fw-bold">
												교직원 답변
											</div>								
										</div>
								
								
										<div class="row mt-2">								
											<div class="col">
												담당 교직원 : 
											</div>
											<div class="col">
												번호키 뽑아오기
											</div>						
										</div>
										<div class="row">
											<div class="col">
												답변 내용
											</div>
											<div class="col">
												${onlineConsultingInfo.onlineConsultingReplyDto.on_contents_reply}
											</div>						
										</div>
										<div class="row">
											<div class="col">
												답변 일자
											</div>
											<div class="col">
												${onlineConsultingInfo.onlineConsultingReplyDto.created_at}
											</div>																	
										</div>								
								</c:otherwise>	
							
							</c:choose>	
								
								

								
								
								
						</div>	
					</div>														
				</div>
			</div>
			
					
			
		</div>
	</div>
</div>
</body>
</html>