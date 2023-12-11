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
			<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
		</div>
	</div>
	<div class="row">
		<div class="col-3">
			<jsp:include page="../common/studentMenu.jsp"></jsp:include>
		</div>
		<div class="col-9">
		
					<div class="row">
						<div class="col">
							
							<form action="./insertHJFProcess" method="post">
							
							
								<div class="row mt-5">
									<div class="col">
										<span class="fw-bold">작성자 </span> ${sessionStudentInfo.name} 
									</div>
								</div>
							
								<div class="row pt-3">
									<div class="col" style="font-size:0.8em;">
										0~5점까지 구직희망 프로그램에 대해 평가 해주세요
									</div>							
								</div>	
								<div class="row pt-1">
									<div class="col">
										<input class="border" type="number" min="0" max="5" name="hjf_score" style="width:10%; height:100%; border:none; outline:none;">									
									</div>
								</div>						

								<div class="row mt-5">
									<div class="col" style="font-size:0.8em;">
										기타 의견이나 불만사항이 있으면 가감없이 적어주세요
									</div>
								</div>
								<div class="row">
									<div class="col">
										<textarea class=" border" name="hjf_comment" rows="4" cols="50" style="width:100%; height:100%; border:none; outline:none;"></textarea>
										<input type="hidden" name="hope_job_pk" value="${hope_job_pk}" > 
									</div>
								</div>
								
								<div class="row pt-3">
									<div class="col">
										<button type="submit" class="btn btn-primary">제출</button>
									</div>
								</div>
									
							</form>	
																		
						</div>
					</div>

			</div>
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>