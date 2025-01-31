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
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		
		<div class="row">
			<!-- 학생용 메뉴 바 -->
			<div class="col-2 border-end pb-0">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			<div class="col">
				<div class="row">
					<div class="col-1"></div>
						<div class="col">
							<div class="row mb-2 mt-5 border-bottom border-3 border-bs-border pb-3 mb-3 fw-bold fs-4">관심기업 목록</div>
							<div class="row border-bottom border-2 border-black pb-3 mb-3 mt-5">
								  <div class="col-1 text-center fw-bold">기업번호</div>
							      <div class="col text-center fw-bold">기업명</div>
							      <div class="col-3 text-center fw-bold">담당자명</div>
							      <div class="col-2 text-center fw-bold">가족기업 여부</div>
							</div>
							
							
								<c:forEach items="${studentInterestCompanyList }" var="list">
									<c:if test="${sessionStudentInfo.student_pk==list.interestCompanyDto.student_pk}">
										<div class="row border-bottom border-bs-border pb-3 mb-3">
											<div class="col-1 text-center fw-bold pt-1">${list.companyDto.com_pk}</div>
											<div class="col"><a class="btn ms-4" href="./studentViewDetailCompanyPage?com_pk=${list.companyDto.com_pk}">${list.companyDto.com_name}</a></div>
											<div class="col-3 ps-0 text-center pt-1">${list.companyManagerDto.com_manager_name}</div>
											<div class="col-2 text-center pt-1">${list.companyDto.is_family_company}</div>
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