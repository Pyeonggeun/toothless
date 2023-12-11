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
		
		<div class="col-9">
			<div class="row mt-4" style="font-size:0.9em;">
				<form action="updateHopeJobProcess" method="post">
				<div class="col">
					<div class="row pt-3">
						<div class="col-2 pe-0 border-end">
							&nbsp;학생이름
						</div>
						<div class="col-2 ps-4">
							${map.studentInfoDto.name}
						</div>						
						<div class="col-8"></div>	
					</div>	
					<div class="row pt-3">
						<div class="col-2 pe-0 border-end">
							&nbsp;희망 연봉
						</div>
						<div class="col-2 ms-4 border">
							<input type="number" name="hope_salary" value="${map.hopeJobDto.hope_salary}" style="width:100%; border:none; outline:none;">
						</div>	
						<div class="col-8"></div>				
					</div>
					<div class="row pt-3">
						<div class="col-2 pe-0 border-end">
							&nbsp;희망지역
						</div>
						<div class="col-2 ms-4 border">
							<input type="text" name="hope_area" placeholder="${map.hopeJobDto.hope_area}" style="width:100%; border:none; outline:none;">
						</div>				
						<div class="col-8"></div>			
					</div>
					<div class="row pt-3">
						<div class="col">
							<div class="row">
								<div class="col">
								 	 &nbsp;요구사항
								</div>
							</div>
							<div class="row border mx-2 my-2 px-1 py-1">
								<div class="col">
									<textarea name="requierments" rows="4" cols="60" placeholder="${map.hopeJobDto.requierments}" style="width:100%; border:none; outline:none;"></textarea>
								</div>
							</div>							
						</div>						
					</div>																	
				</div>
				<div class="row">
					<div class="col">
						&nbsp;<input type="submit" value="제출" style="border:none; outline:none;">
						<input type="hidden" name="hope_job_pk" value="${map.hopeJobDto.hope_job_pk}">
						<input type="hidden" name="student_pk" value="${map.studentInfoDto.student_pk}">
					</div>
				</div>
				</form>
			</div>
			
			<div class="row mt-5">
				<div class="col">
					
					<a href="./endHopeJobProcess?hope_job_pk=${map.hopeJobDto.hope_job_pk}">
					<button type="button" class="btn btn-danger">
					구직희망 종료하기
					</button>
					</a>
				</div>
			</div>
			
		</div>
		
	</div>


</div>
</body>
</html>