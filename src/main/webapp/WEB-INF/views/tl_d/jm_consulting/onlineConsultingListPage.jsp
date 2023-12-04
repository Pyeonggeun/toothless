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
					<div class="row my-5">
						<div class="col" style="font-size:1.5em;">
							내 상담 내역
						</div>
					</div>
					<form action="아 ㄹㅇ 하기실다" method="post">
					<div class="row border-top mt-4 py-2">
					
						<div class="col-7">
							아직 검색 미구현
						</div>						
					
						<div class="col-2 px-1 mx-0 text-center">
							<input type="radio" name="isReply" value="Y"> 답변 완료 상담
						</div>
						<div class="col-2 px-1 mx-0 text-center">
							<input type="radio" name="isReply" value="Y"> 미답변 상담
						</div>
						<div class="col-1" style="text-size:0.7em; width:0.8em;">
							<input type="submit" value="검색">
						</div>	
														
					</div>
					</form>	
					<div class="row border-top pt-3">
						<div class="col">
						
							<c:forEach items="${list}" var="e">
								
								<div class="row pt-2">
									<div class="col-2" style="width:10%;">
										<a href="./onlineConsultingViewPage?on_consulting_pk=${e.onlineConsultingDto.on_consulting_pk }">상담번호</a>
									</div>
									<div class="col-1 border-end">
										${e.onlineConsultingDto.on_consulting_pk}
									</div>
									
									<div class="col-2 text-center">
										<fmt:formatDate value="${e.onlineConsultingDto.created_at}" pattern="yyyy-MM-dd"/>
									</div>
									
									<div class="col-1 px-0">
										<div class="row">
											<c:choose>
											
												<c:when test="${not e.onlineConsultingReplyDto}">
									
												<div class="col px-0">
													<span class="badge text-bg-primary ms-2"> 미답변 </span>
												</div>										
												</c:when>
											
												<c:otherwise>
												<div class="col ps-0">
													<span class="badge text-bg-primary ms-2"> 답변등록</span>
												</div>	
												<div class="col">
													<span class="badge text-bg-primary ms-2"> 담당자: ${e.staffInfoDto.name}</span>
												</div>											
												</c:otherwise>
											
											</c:choose>											
										</div>
									</div>
									
									<div class="col-6">
									
									</div>

	
								</div>
								
							</c:forEach>
							
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