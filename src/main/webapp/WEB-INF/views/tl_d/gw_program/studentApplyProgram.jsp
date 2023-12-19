<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>프로그램 신청하기</title>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<!-- 학생용 상단 네비 바 -->
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
		<div class="row">
			
			<!-- 학생용 메뉴 바 -->
			<div class="col-2 pb-0 me-5 border-end">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			
			<!-- 신청 서식 -->
			<div class="col">
				<div class="row mt-5 mb-2">
					<div class="col-2"></div>
					<div class="col fw-bold fs-3 pb-2 border-bottom border-light-subtle">프로그램 신청하기</div>
					<div class="col-3"></div>
				</div>
		
				<form action="./studentApplyProcess?program_pk=${program.programDto.program_pk}&student_pk=${sessionStudentInfo.student_pk}" method="post">
					<div class="row">
						<div class="col-2"></div>
							
						<div class="col mt-3">
							<div class="row">
								${program.programDto.prg_name} 
							</div>
							
							<!-- 프로그램 기간 입력 -->
							<div class="row mt-3">
								<div class="col">
									<div class="row mb-1">
										연락처
									</div>
									<div class="row d-grid">
										<input type="text" name="prg_student_phone" class="form-control">
									</div>
								</div>
							</div>
							 
					
							<div class="row mt-3 mb-2"> 
							
								<div class="col-3"></div>
								<div class="col d-grid"><input class="btn btn-primary" type="submit" value="신청하기"></div>
								<div class="col-4"></div>
								
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<div class="col-1"></div>
			
		</div>
		<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
		<!-- futter -->
		<div class="row">
			<div class="col">
				<jsp:include page="../common/futter.jsp"></jsp:include>
			</div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>