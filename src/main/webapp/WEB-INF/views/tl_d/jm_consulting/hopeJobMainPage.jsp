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


	<div class="row text-center mt-5">
		<div class="col">
			<span style="font-size:3em;">구직희망 페이지</span>
		</div>
	
	
	
	</div>
	
	<div class="row mt-5">
		<div class="col border mx-2 my-2" >
			<div class="row py-3">
				<div class="col">
					내 온라인 상담 목록
				</div>
			</div>
			<div class="row pb-3">
				<div class="col">
					<div class="row">
						<div class="col">
							<c:choose>
								<c:when test="${onConsultingList3==null}">
									상담 내역이 없습니다.
								</c:when>
								<c:otherwise>
									<c:forEach items="${onConsultingList3}" var="e">
										<div class="row">
											<div class="col">

												<a href="./onlineConsultingViewPage?on_consulting_pk="${e.onlineConsultingDto.on_consulting_pk}>이름 : ${e.studentInfoDto.name}</a>
																																	
											</div>
										</div>
										<div class="row">
											<div class="col">
												<a href="./onlineConsultingViewPage?on_consulting_pk="${e.onlineConsultingDto.on_consulting_pk}>
													문의 날짜 : <fmt:formatDate value="${e.onlineConsultingDto.created_at}" pattern="yyyy-MM-dd"/>
													<c:choose>
														<c:when test="${not e.onlineConsultingReplyDto}">
															<span class="badge text-bg-primary ms-2"> 미답변</span>
					
														</c:when>
														<c:otherwise>
															<span class="badge text-bg-primary">답변</span>
					
														</c:otherwise>
													</c:choose>	
												</a>																								
											</div>
										</div>

									</c:forEach>
								</c:otherwise>
							
							</c:choose>							
						</div>
					</div>

				</div>
			</div>
			<div class="row">
				<div class="col" style="font-size:0.6em;">
					전체보기 >
				</div>
			</div>			
		</div>
		
		<div class="col mx-2 my-2 border">
			<div class="row">
				<div class="col pt-2 pb-3" style="font-size:2em;">
					만족도 조사
				</div>
			</div>
			<div class="row">
				<div class="col pt-5 pb-1" style="font-size:0.6em;">
					바로가기 >
				</div>
			</div>		
		</div>
	</div>
	
	
	
	
	<div class="row">
		<div class="col border mx-2 my-2">
			<div class="row">
				<div class="col py-3" style="font-size:1em;">
					구직관심 분야 등록
				</div>
			</div>
			<div class="row">
				<div class="col px-3" style="font-size:0.6em;">
					바로가기 >
				</div>
			</div>
		</div>
		<div class="col border mx-2 my-2">
			<div class="row">
				<div class="col py-3">
					내 구직희망 프로그램 정보
				</div>
			</div>
			<div class="row">
				<div class="col px-3" style="font-size:0.6em;">
					바로가기 >
				</div>
			</div>		
		</div>
	</div>
	
	
	
</div>









<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>