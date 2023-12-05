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
					만족도 조사
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col">
							
							<form action="./insertHJFProcess" method="post">
								<div class="row">
									<div class="col">
										0~5점까지 구직희망 프로그램에 대해 평가 해주세요
									</div>
								</div>							
								<div class="row">
									<div class="col">
										<input type="number" min="0" max="5" name="hjf_score">
									</div>
								</div>
								<div class="row">
									<div class="col">
										기타 의견이나 불만사항이 있으면 가감없이 적어주세요
									</div>
								</div>
								<div class="row">
									<div class="col">
										<textarea name="hjf_comment" rows="4" cols="50"></textarea>
										<input type="hidden" name="hope_job_pk" value="${hope_job_pk}"> 
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