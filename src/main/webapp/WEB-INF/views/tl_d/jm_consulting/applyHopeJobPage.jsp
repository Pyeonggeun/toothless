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
	<div class="row text-center" style="align-itesm:center;">
		<div class="col">
			<div class="row mt-5">
				<div class="col">구직 희망 신청서</div>
			</div>
			<c:if test="${checkOverlapHopejob}">
				<div class="row mt-5">
					<div class="col" style="color:red">
						이미 구직희망 프로그램을 신청 하셨습니다!
					</div>
				</div>
			</c:if>
			
			<form action="hopeJobApplyProcess" method="post">
			<div class="row mt-5 border">
				<div class="col">
					
					
					<div class="row border py-2">
						<%--작성자(학생) 이름표기 --%>
						<div class="col-3 border-end">
							작성자
						</div>
						<div class="col-9">
							${sessionStudentInfo.name}
						</div>						
					</div>
					<%-- 희망연봉 입력칸 --%>
					<div class="row">
						<div class="col-3 py-5 border-end">
							희망 연봉
						</div>
						<div class="col-9">
							<input type="number" name="hope_salary" style="width:100%; height:100%; border:none;" class="px-0 py-0">
						</div>						
					</div>
					<div class="row border-top">
						<div class="col-3 py-5 border-end">
							희망 지역
						</div>
						<div class="col-9">
							<input type="text" name="hope_area" style="width:100%; height:100%; border:none;" class="px-0 py-0">
						</div>						
					</div>
					<div class="row border-top">
						<div class="col-3 py-5 border-end">
							요구사항
						</div>
						<div class="col-9">
							<input type="text" name="requierments"  style="width:100%; height:100%; border:none;" class="px-0 py-0">
							<input type="hidden" name="is_end_hope_job" value="N">
						</div>						
					</div>				
																							

				</div>
			</div>
			<div class="row mt-3 text-center">
				<div class="col">
					<input type="submit" value="제출">
				</div>
			</div>
			</form>	
		</div>
	</div>



</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>