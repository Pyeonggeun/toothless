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
<title>관심기업 등록한 학생 리스트</title>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/companyTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col-2"></div>
						<div class="col">
							<div class="row mb-2 mt-5 border-bottom border-3 border-bs-border pb-3 mb-3 fw-bold fs-4">관심기업을 추가한 학생</div>
							<div class="row border-bottom border-2 border-black pb-3 mb-3 mt-5">
								      <div class="col-1 text-center fw-bold">이름</div>
								      <div class="col-2 text-center fw-bold">생년월일</div>
								      <div class="col"></div>
								      <div class="col-1 text-center fw-bold">성별</div>
								      <div class="col-3 text-center fw-bold">이메일</div>
								      <div class="col-1 text-center fw-bold">졸업여부</div>
							</div>
							
							
								<c:forEach items="${studentInterestCompanyList }" var="list">
									<c:if test="${company.companyDto.com_pk==list.interestCompanyDto.com_pk}">
										<div class="row border-bottom border-bs-border pb-3 mb-3">
											 <div class="col-1 text-center">${list.studentInfoDto.name }</div>
										     <div class="col-2 text-center"><fmt:formatDate value="${list.studentInfoDto.birth }" pattern="yy.MM.dd"/> </div>
										     <div class="col"></div>
										     <div class="col-1 text-center">${list.studentInfoDto.gender }</div>
										     <div class="col-3 text-center">${list.studentInfoDto.email }</div>
										     <div class="col-1 text-center">
												<c:choose>
													<c:when test="${list.studentInfoDto.student_pk != list.graduationInfoDto.student_pk }">N</c:when>
													<c:when test="${list.studentInfoDto.student_pk == list.graduationInfoDto.student_pk }">Y</c:when>
												</c:choose>
											</div>
										</div>
									</c:if>
								</c:forEach>
							
							
						</div>
						<div class="col-2"></div>
					</div>
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