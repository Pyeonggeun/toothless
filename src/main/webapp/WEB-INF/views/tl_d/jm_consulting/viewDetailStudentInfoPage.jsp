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

<script>


	//취업상담 내용 등록
	function insertConsulting(){
		const templeteWrapper = document.querySelector("#templeteWrapper");
		const consulting_contents = templeteWrapper.querySelector(".consulting_contents").value;
		const consulting_date = templeteWrapper.querySelector(".consulting_date").value;
		const hope_job_pk = templeteWrapper.querySelector(".hope_job_pk").value;
		if(consulting_contents=="" || consulting_date==""){
			
			alert("값을 입력해 주세요!");
			return;
		}
		
		
		
		url = "./insertConsulting?hope_job_pk=" + hope_job_pk +"&consulting_contents=" + consulting_contents +"&consulting_date=" + consulting_date ;
		fetch(url)
		.then(response => response.json())
		.then(response =>{
			
			
		});	
	}




</script>
	






</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col">
			<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
		</div>
	</div>
	<div class="row">
		<div class="col-2 border-end pb-0">
			<div class="row">
				<div class="col">
					<jsp:include page="../common/staffMenu.jsp"></jsp:include>				
				</div>
			</div>
		</div>
		
		<div class="col mt-5">
			<div class="row">
				<div class="col-1"></div>
				<div class="col">
					
					<div class="row">
						<div class="col mt-1 border-bottom border-3 border-secondary-subtle pb-3 mb-3 fw-bold fs-4">
							학생 정보 페이지
						</div>
					</div>
				
				
					<div class="row mt-3">
						<div class="col py-3">				
							<div class="row mt-2 fw-bold" style="font-size:1.2em;">
								<div class="col">
									학생정보
								</div>						
							</div>
							<div class="row mt-3 pt-4 border-top border-black">
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
					
					<div class="row mt-3">
						<div class="col py-3">				
							<div class="row mt-2 fw-bold" style="font-size:1.2em;">
								<div class="col">
									구직희망정보
								</div>						
							</div>
							<div class="row mt-3 pt-4 border-top border-black">
								<div class="col-3 fw-bold">
									희망연봉
								</div>	
								<div class="col-9">
									${viewStudentDetailPageStats.hopeJobDto.hope_salary } <span style="font-size:0.9em;">원</span>
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
									관심 채용 분야
								</div>	
								<div class="col-9">
									<div class="row">
										
										
										<c:if test="${getHopeJobCategoryList.size()==0}">
											<span class="fw-bold">관심 분야가 없습니다!</span>
										</c:if>
										
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
		
					<div class="row mt-3">
						<div class="col pt-3">				
							<div class="row mt-2 fw-bold" style="font-size:1.2em;">
								<div class="col">
									상담 및 내역
								</div>						
							</div>
							<div class="row mt-3 pt-4 border-top border-black">
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
							<div class="row mt-3 pb-3">
								<div class="col-3 fw-bold">
									미응답 만족도조사 내역
								</div>	
								<div class="col">
									${viewStudentDetailPageStats.countUnAnsweredFeedback} 건
								</div>																	
							</div>																																		
						</div>			
					</div>	
					
					<div class="fw-bold" style="text-align:right; color:blue">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
						  취업상담 내용 등록
						</button>
					</div>						
					
					<div class="row mt-5">
						<div class="col fw-bold">
						<a class="navbar-brand" href="./viewStudentListPage">
							<button type="button" class="btn btn-primary">목록</button>
						</a>	
						</div>
					</div>		
				</div>
				<div class="col-1"></div>
				
			</div>
			
			
			
			
			
		</div>		
	</div>

	<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
	<!-- futter -->
	<div class="row">
		<div class="col">
			<jsp:include page="../common/futter.jsp"></jsp:include>
		</div>
	</div>	
	
	
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">취업상담 내용 등록</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      
        <div id="templeteWrapper" class="row mt-3">
						<div class="col">
							<div class="row">
								<div class="col-3 fw-bold">
									교직원 이름
								</div>
								<div class="col-9 staff_name">
									${sessionStaffInfo.name}
								</div>								
							</div>
							
							<form action="insertConsultingProcess" method="post">
							<div class="row">
								<div class="col">
									<div class="row mt-3">
										<div class="col fw-bold">
											상담내용
										</div>
									</div>
		
									<div class="row mt-1">
										<div class="col border ms-3" style="height:10em;" >
											<textarea class="consulting_contents" style="border:none; width:100%; height:100%; outline:none;" name="consulting_contents"></textarea>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="row mt-3">
								<div class="col-4 fw-bold">
									상담날짜
								</div>
								<div class="col-6 border">
									<input class="consulting_date" style="border:none; outline:none; width:100%; height:100%" type="date" name="consulting_date">
								</div>		
								
								<div class="col">
									
								</div>															
							</div>								
							
							<div class="row mt-3">
								<div class="col">
									<input class="hope_job_pk" name="hope_job_pk" type="hidden" value="${viewStudentDetailPageStats.hopeJobDto.hope_job_pk}">
									
																	
								</div>							
							</div>	
							</form>						
						</div>
					</div>
					
					
					
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button onclick="insertConsulting()" data-bs-dismiss="modal" type="button"  class="btn btn-primary"> 등록 </button>	
      </div>
    </div>
  </div>
</div>

<%--
<div class="d-none" id="insertConsultingTemplete">

					<div id="templeteWrapper" class="row mt-3">
						<div class="col">
							<div class="row">
								<div class="col-3 fw-bold">
									교직원 이름
								</div>
								<div class="col-9 staff_name">
									${sessionStaffInfo.name}
								</div>								
							</div>
							
							<form action="insertConsultingProcess" method="post">
							<div class="row">
								<div class="col">
									<div class="row mt-3">
										<div class="col fw-bold">
											상담내용
										</div>
									</div>
		
									<div class="row mt-1">
										<div class="col border ms-3" style="height:10em;" >
											<textarea class="consulting_contents" style="border:none; width:100%; height:100%; outline:none;" name="consulting_contents"></textarea>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="row mt-3">
								<div class="col-2 fw-bold">
									상담날짜
								</div>
								<div class="col-6 border">
									<input class="consulting_date" style="border:none; outline:none; width:100%; height:100%" type="date" name="consulting_date">
								</div>		
								
								<div class="col-4">
									
								</div>															
							</div>								
							
							<div class="row mt-3">
								<div class="col">
									<input class="hope_job_pk" name="hope_job_pk" type="hidden" value="${viewStudentDetailPageStats.hopeJobDto.hope_job_pk}">
									
									
									<input type="submit" value="등록">
								</div>							
							</div>	
							</form>						
						</div>
					</div>


</div>

 --%>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>