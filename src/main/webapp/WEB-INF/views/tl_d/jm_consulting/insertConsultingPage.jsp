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
					<div class="row mt-4">
						<div class="col fw-bold" style="font-size:1.2em;">
							취업 상담 내용 등록
						</div>
					</div>
					
					
					
					
					<div class="row mt-3">
						<div class="col">
							<div class="row">
								<div class="col-3 fw-bold">
									교직원 이름
								</div>
								<div class="col-9">
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
											<textarea style="border:none; width:100%; height:100%; outline:none;" name="consulting_contents"></textarea>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="row mt-3">
								<div class="col-2 fw-bold">
									상담날짜
								</div>
								<div class="col-6 border">
									<input style="border:none; outline:none; width:100%; height:100%" type="date" name="consulting_date">
								</div>		
								
								<div class="col-4">
									
								</div>															
							</div>								
							
							<div class="row mt-3">
								<div class="col">
									<input name="staff_pk" type="hidden" value="${sessionStaffInfo.staff_pk}">
									<input name="hope_job_pk" type="hidden" value="${hope_job_pk}">
									
									<input type="submit" value="등록">
								</div>							
							</div>	
							</form>						
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