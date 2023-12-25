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
							학생 취업 상담 리스트
						</div>
					</div>
					
					
					
					
				
					<div class="row mt-3">
						<div class="col py-3">				
							<div class="row mt-2 fw-bold" style="font-size:1.2em;">
								<div class="col">
									 <i class="bi bi-file-earmark-text" style="font-size:1.3em;"></i> 취업 상담 정보
								</div>													
							</div>
							
							
							<div class="row">
								<div class="col">
									<div id="row1" class="row  mt-3 pt-4 border-top border-black">
										<div class="col-5 fw-bold">
											학생 이름
										</div>	
										<div class="col">
											${map.studentInfoDto.name }
										</div>												
									</div>
									<div class="row mt-3">
										<div class="col-5 fw-bold">
											담당 교직원
										</div>	
										<div class="col">															
											${map.staffInfoDto.name }
										</div>
									</div>									
								</div>
								<div class="col">
									<div id="row1" class="row mt-3 pt-4 border-top border-black">								
										<div class="col-5 fw-bold">
											학생 전화번호
										</div>	
										<div class="col">
											${map.studentInfoDto.phone }
										</div>																														
									</div>
									<div class="row mt-3">
										<div class="col-5 fw-bold">
											상담일
										</div>	
										<div class="col">
											<fmt:formatDate value="${map.consultingDto.consulting_date}" pattern="yyyy.MM.dd"/>
										</div>												
									</div>
								</div>								
							</div>
							
							<div class="row mt-5">
								<div class="col">
									<div class="row">
										<div class="col fw-bold">
											상담 내용
										</div>
									</div>
									<div class="row mt-2">
										<div class="col">
											${map.consultingDto.consulting_contents}
										</div>
									</div>									
								</div>
							</div>
							
																																				
						</div>
					</div>
					
					<div class="row mt-5 text-end">
						<div class="col">
							<a href="./viewDetailStudentInfoPage?hope_job_pk=${map.consultingDto.hope_job_pk}">
							<button type="button" class="btn btn-primary">목록으로</button>
							</a>
						</div>
					</div>
					
			
			
			
			
			
			
			
			
			
				</div>
			</div>
		</div>
		<div class="col-2"></div>				
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>