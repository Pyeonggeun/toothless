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
<title>프로그램 리뷰</title>
</head>
<body>
	<!-- 학생용 페이지 -->
	<div class="container-fluid">
		<div class="row">
			<!-- 학생 상단 네비 바 -->
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			<!-- 학생용 메뉴 바 -->
			<div class="col-2 border-end pb-0">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			
			<div class="col">
				
				<div class="row mt-5 mb-2">
					<div class="col-2"></div>
					<div class="col fw-bold fs-3 pb-2 border-2 border-bottom border-light-subtle">프로그램 만족도 작성</div>
					<div class="col-3"></div>
				</div>
		
				<form action="./programReviewProcess" method="post">
					<div class="row">
						<div class="col-2"></div>
						
						<div class="col mt-3">
							<input type="hidden" name="program_apply_pk" value="${program.programApplyDto.program_apply_pk}">
							<!-- 프로그램 수용인원 입력 -->
							<div class="row mt-3">
								<div class="col">
									<div class="row mb-1">
										프로그램 평점 (1~5점)
									</div>
									<div class="row mb-3">
										<input class="form-control form-control-sm" name="prg_score" type="text">
									</div>
								</div>
							</div> 
							
							<!-- 프로그램 장소 입력 -->
							<div class="row mt-3">
								<div class="col">
									<div class="row mb-1">
										프로그램에 하고싶은 말 
									</div>
									<div class="row mb-3"> 
										<textarea class="form-control" rows="15" name="prg_comment" placeholder="내용을 입력해주세요."></textarea>
									</div>
								</div>
							</div>
							
							
							
						</div>
						
						
						<div class="col-3"></div>
					</div>
					
					<div class="row mt-3 mb-2"> 
					
						<div class="col-2"></div>
						<div class="col d-grid"><input class="btn btn-primary d-grid" type="submit" value="등록하기"></div>
						<div class="col-3"></div>
						
					</div>
					
				</form>
					
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
	


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>