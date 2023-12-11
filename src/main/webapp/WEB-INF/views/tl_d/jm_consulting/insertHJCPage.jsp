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
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>			
		</div>
	</div>

	<div class="row">
	
		<div class="col-3">
			<jsp:include page="../common/staffMenu.jsp"></jsp:include>	
		</div>
		<div class="col-9 border-end border-start px-2 py-2">
		
			<div class="row">
				<div class="col fw-bold" style="font-size:1.5em;">
					내 구직 관심 분야 관리
				</div>
			</div>
		
				
			<div class="row mt-5">
				<div class="col fw-bold">
					추가 관심 분야 등록
				</div>
			</div>
			<div class="row mt-4">
				<form action="./insertHopeJobCategory" method="post">
					<div class="col">
						<div class="row">						 <!--  disabled -->													
							<c:forEach items="${jobFieldCategoryDtoList}" var="e">
								<div class="col mx-1">														
									<input type="checkbox" name="job_field_category_pk" 
									value="${e.jobFieldCategoryDto.job_field_category_pk}"
									${e.isBoolean ? 'disabled' : ''}>
									${e.jobFieldCategoryDto.job_field_category_name}																																						
								</div>								
							</c:forEach>						
						</div>
						<div class="row mt-3 mb-3">
							<div class="col">
								<input class="btn btn-outline-dark" style="font-size:0.7em;" type="submit" value="등록">
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<div class="row border-top">
				<div class="col fw-bold mt-3">
					삭제 분야
				</div>
			</div>
			<div class="row mt-3">
				<div class="col">
					
					<c:choose>
						<c:when test="${getHopeJobCategoryList.size()==0 }">
							현재 관심 분야가 없습니다. 
						</c:when>
					
						<c:otherwise>
							<form action="deleteHopeJobCategory" method="post">
								<div class="row">								
									<div class="col">
										<c:forEach items="${getHopeJobCategoryList}" var="e">
											<input class="pe-2" type="checkbox" name="deleteHopeJobCategoryList" value="${e.hopeJobCategoryDto.hope_job_category_pk}">${e.jobFieldCategoryDto.job_field_category_name}
										</c:forEach>
									</div>
								</div>
								<div class="row mt-4">
									<div class="col">
										<input style="font-size:0.7em;" class="btn btn-outline-dark" type="submit" value="삭제">
									</div>
								</div>								
							</form>
						</c:otherwise>
					
					</c:choose>
					
				</div>
			</div>	
			<div class="row mt-5">
				<div class="col">
					<a href="./hopeJobConsultingPage"><button type="button" class="btn btn-primary">목록</button></a>
				</div>
			</div>							
		</div>
	</div>
	

</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>