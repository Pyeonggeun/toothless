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
		<div class="col-3">
			<div class="row">
				<div class="col">
					<jsp:include page="../common/staffMenu.jsp"></jsp:include>				
				</div>
			</div>
		</div>
		
		<div class="col-9">
			<div class="row border pt-2 mt-2">
				<div class="col">				
					<div class="row mt-2 fw-bold" style="font-size:1.2em;">
						<div class="col">
							학생정보
						</div>						
					</div>
					<div class="row mt-3 pt-2 border-top">
						<div class="col-3 fw-bold">
							학번
						</div>	
						<div class="col-9">
							${viewStudentDetailPageStats.studentInfoDto.student_pk }
						</div>												
					</div>
					<div class="row mt-3">
						<div class="col-3 fw-bold">
							이름
						</div>	
						<div class="col-9">
							${viewStudentDetailPageStats.studentInfoDto.name }
						</div>												
					</div>
					<div class="row mt-3">
						<div class="col-3 fw-bold">
							성별
						</div>	
						<div class="col-9">
							${viewStudentDetailPageStats.studentInfoDto.gender }
						</div>												
					</div>
					<div class="row mt-3">
						<div class="col-3 fw-bold">
							전화번호
						</div>	
						<div class="col-9">
							${viewStudentDetailPageStats.studentInfoDto.phone }
						</div>												
					</div>																													
				</div>
			</div>
			
			<div class="row border pt-2 mt-2">
				<div class="col">				
					<div class="row mt-2 fw-bold" style="font-size:1.2em;">
						<div class="col">
							구직희망정보
						</div>						
					</div>
					<div class="row mt-3 pt-2 border-top">
						<div class="col-3 fw-bold">
							희망연봉
						</div>	
						<div class="col-9">
							${viewStudentDetailPageStats.hopeJobDto.hope_salary }
						</div>												
					</div>
					<div class="row mt-3">
						<div class="col-3 fw-bold">
							희망지역
						</div>	
						<div class="col-9">
							${viewStudentDetailPageStats.hopeJobDto.hope_area }
						</div>												
					</div>
					<div class="row mt-3">
						<div class="col-3 fw-bold">
							요구사항
						</div>	
						<div class="col-9">
							${viewStudentDetailPageStats.hopeJobDto.requierments }
						</div>												
					</div>
					<div class="row mt-3">
						<div class="col-3 fw-bold">
							신청일
						</div>	
						<div class="col-9">
							<fmt:formatDate value="${viewStudentDetailPageStats.hopeJobDto.created_at}" pattern="yyyy-MM-dd"/> 
						</div>												
					</div>
					<div class="row mt-3">
						<div class="col-3 fw-bold">
							구직관심 분야 리스트
						</div>	
						<div class="col-9">
							<div class="row">
								
								<c:forEach items="${getHopeJobCategoryList}" var="e">
									<div class="col">
										${e.jobFieldCategoryDto.job_field_category_name} 
									</div>
								</c:forEach>
									<div class="col-8">
									</div>
								
							</div>
						</div>												
					</div>																																		
				</div>
			</div>			

			<div class="row border pt-2 mt-2">
				<div class="col">				
					<div class="row mt-2 fw-bold" style="font-size:1.2em;">
						<div class="col">
							상담 및 내역
						</div>						
					</div>
					<div class="row mt-3 pt-2 border-top">
						<div class="col-3 fw-bold">
							<a href="./insertConsultingPage?hope_job_pk=${viewStudentDetailPageStats.hopeJobDto.hope_job_pk}"> 취업상담 내용 등록하기</a>
						</div>												
					</div>
					<div class="row mt-3">
						<div class="col-3 fw-bold">
							취업상담내역
						</div>	
						<div class="col-9">
							${viewStudentDetailPageStats.countConsultingByHopeJobPk} 건
						</div>												
					</div>
					<div class="row mt-3">
						<div class="col-3 fw-bold">
							온라인상담 내역
						</div>	
						<div class="col-9">
							${viewStudentDetailPageStats.countOnConsultingByHopeJobPk} 건
						</div>												
					</div>
					<div class="row mt-3">
						<div class="col-3 fw-bold">
							미응답 만족도조사 내역
						</div>	
						<div class="col-9">
							${viewStudentDetailPageStats.countUnAnsweredFeedback} 건
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