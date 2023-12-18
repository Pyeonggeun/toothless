<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<title>ResumeUpdatePage</title>
</head>
<body>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			
			<div class="col-2">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			<div class="col-1 border-start"></div>
			<%-- 내용 시작 --%>
			<div class="col">
				<form action="./resumeUpdateProcess" method="post">
					<input type="hidden" name="resume_pk" value="${resumeDto.resume_pk }">
					<div class="row">
						<div class="col fs-5 fw-bold mt-5">이력서 수정</div>
					</div>
					
					<div class="row border-bottom border-dark"></div>
					<div class="row border border-top">
						<div class="col p-3 ms-2">
							<div class="row border">
								<div class="col">
									<div class="row border-bottom border-gray">
										<div class="col p-1 ms-2 fs-3">이력서 제목</div>
									</div>
									<div class="row mt-2">
										<div class="col p-2 ms-2 fs-3">
											<input name="resume_title" type="text" value="${resumeDto.resume_title }">
										</div>
									</div>
								</div>	
							</div>
							
							<div class="row mt-4 border border-top">
								<div class="col p-3 ms-2">
									<div class="row border-bottom border-gray">
										<div class="col fs-3">자소서</div>
									</div>
									<div class="row mt-2">
										<div class="col">
										<textarea name="cover_letter" rows="10" cols="100"> ${resumeDto.cover_letter }</textarea>
										</div>
									</div>
									<div class="row mt-2">
										<div class="col"></div>
										<div class="col-2">
											<button type="submit" class="btn btn-primary">수정완료</button>
											
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
					</form>
					
					<div class="row mt-2">
						<div class="col"></div>
						<div class="col-2">
							<form action="./resumeDetailPage" method="post">
								<input type="hidden" name="resume_pk" value="${resumeDto.resume_pk}">
								<button type="submit" class="btn btn-secondary">돌아가기</button>
							</form>
						</div>
					</div>
				
				
			</div>
			
			<div class="col-2"></div>
		</div>
			
	</div>
	
	<div class="container">
		<div style="height: 200px;"></div>
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>