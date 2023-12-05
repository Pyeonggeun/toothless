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
					등록 하고싶은 분야를 선택해 주세요!
				</div>
			</div>
			<div class="row">
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
					</div>
					<div class="col">
						<input type="submit" value="제출ㅋㅋ">
					</div>
				</form>
			</div>
			
			<div class="row">
				<div class="col">
					내 관심분야에서 삭제 하고싶은 분야를 선택해 주세요!
				</div>
			</div>
			<div class="row">
				<div class="col">
					
					<c:choose>
						<c:when test="${getHopeJobCategoryList.size()==0 }">
							어 돌아가~ 
						</c:when>
					
						<c:otherwise>
							<form action="deleteHopeJobCategory" method="post">
								<div class="row">								
									<div class="col">
										<c:forEach items="${getHopeJobCategoryList}" var="e">
											<input type="checkbox" name="deleteHopeJobCategoryList" value="${e.hopeJobCategoryDto.hope_job_category_pk}">${e.jobFieldCategoryDto.job_field_category_name}
										</c:forEach>
									</div>
									<div class="col">
										<input type="submit" value="삭제">
									</div>
								</div>
							</form>
						</c:otherwise>
					
					</c:choose>
					
				</div>
			</div>					
		</div>
	</div>
</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>