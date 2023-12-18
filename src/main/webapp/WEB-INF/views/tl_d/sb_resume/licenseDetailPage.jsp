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
<title>licenseDetailPage</title>
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
				
				<div class="row">
						<div class="col fs-5 fw-bold mt-5">자격증</div>
						
						<div class="row border-bottom border-dark"></div>
						<div class="row border border-top">
							<div class="col">
								<div class="row  border-bottom">
									<div class="col-3 fs-5">자격증 명</div>
									<div class="col-2 fs-5 text-center">취득 년도</div>
									<div class="col-2 fs-5 text-center">취득 월</div>
									<div class="col-3 fs-5 text-center">발급 기관</div>
									<div class="col"></div>
								</div>
								
								<c:forEach items="${licenseList }" var="list">
									<div class="row">
										<div class="col-3">${list.lic_name }</div>
										<div class="col-2 text-center">${list.lic_gain_year } 년</div>
										<div class="col-2 text-center">${list.lic_gain_month } 월</div>
										<div class="col-3 text-center">${list.lic_center }</div>
										
										<div class="col">
											<div class="row p-1">
												<div class="col border-start">
													<form action="./licenseUpdatePage">
														<input type="hidden" name="license_pk" value="${list.license_pk }">
														<input type="hidden" name="resume_pk" value="${list.resume_pk }">
														<button type="submit">수정</button>
													</form>
												</div>
												<div class="col">
													<form action="./licenseDeleteProcess">
														<input type="hidden" name="license_pk" value="${list.license_pk }">
														<input type="hidden" name="resume_pk" value="${list.resume_pk}">
														<button type="submit">삭제</button>
													</form>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								
								
								
							</div>
						</div>
						
						<div class="row">
								<div class="col fs-5 fw-bold mt-5">자격증 추가</div>
						</div>
						<div class="row border-bottom border-dark"></div>
						<div class="row  border border-top">
							<div class="col">
							
								<div class="row  border-bottom">
									<div class="col-3 fs-5">자격증 명</div>
									<div class="col-2 fs-5 text-center">취득 년도</div>
									<div class="col-2 fs-5 text-center">취득 월</div>
									<div class="col-3 fs-5 text-center">발급 기관</div>
									<div class="col"></div>
								</div>
								
								<form action="./licenseRagistrationProcess" method="post">
								<input name="resume_pk" type="hidden" value="${licenseDto.resume_pk }">
								
								<div class="row">
									<div class="col-3">
										<input type="text" name="lic_name">
									</div>
									<div class="col-2 text-center">
										<input type="text" name="lic_gain_year" size="12">
									</div>
									<div class="col-2 text-center">
										<input type="text" name="lic_gain_month" size="12">
									</div>	
									<div class="col-3 text-center">
										<input type="text" name="lic_center">
									</div>
									<div class="col"><button type="submit">추가</button></div>
									
								</div>
								</form>
								
							</div>
						</div>
							
				</div>
				
				<div class="row mt-2">
					<div class="col"></div>
					<div class="col-2">
						<form action="./resumeDetailPage" method="post">
							<input type="hidden" name="resume_pk" value="${licenseDto.resume_pk}">
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