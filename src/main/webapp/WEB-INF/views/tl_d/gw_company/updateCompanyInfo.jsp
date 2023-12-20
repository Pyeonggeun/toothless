<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>산업체 정보 수정</title>
</head>
<body>

<div class="containar">
	<div class="row">
		<!-- 취업팀 상단 네비 바 -->
		<div class="col">
			<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
		</div>
	</div>
	<div class="row">
		<!-- 취업팀 메뉴 바 -->
		<div class="col-2 me-5 border-end">
			<jsp:include page="../common/staffMenu.jsp"></jsp:include>
		</div>
		
		
		<div class="col">
			<div class="row border-bottom border-3 border-bs-border mt-5 mb-3 pb-3 fs-4 fw-bold">
				<div class="col-3">기업 정보 수정</div>
			</div> 
			
			
			<div class="row fs-5 mt-5 mb-3 fw-bold">회사 상세 정보</div>
			
			<!-- 회사 정보 수정 -->
			<form action="./updateCompanyInfoProcess" method="post">
				<div class="row  border-top border-bottom border-bs-border">
					<div class="col"> 
						<input type="hidden" name="com_pk" value="${companyMap.companyDto.com_pk}">
						<div class="row border-top border-bottom py-3">
							<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">회사명</div>
							<div class="col p-1 ps-4">
								<input type="text" name="com_name" value="${companyMap.companyDto.com_name}">
							</div>
						</div>
						<div class="row border-bottom py-3">
							<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">사업자등록번호</div>
							<div class="col p-1 ps-4">
								<input type="text" name="business_number" value="${companyMap.companyDto.business_number}">
							</div>
						</div>
						<div class="row border-bottom py-3">
							<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">대표자 명</div>
								<div class="col p-1 ps-4">
								<input type="text" name="com_bossname" value="${companyMap.companyDto.com_bossname}">
							</div>
							<div class="col-2 border-start border-end border-bs-border p-1 ps-2 fw-bold">기업규모</div>
							<div class="col p-1 ps-4">
								<!-- 기업 규모 입력 -->
								<div class="row "> 
									<select class="form-select" name="com_scale_category_pk" >
									  <option selected value="${companyMap.companyDto.com_scale_category_pk}">${companyMap.comScaleCategoryDto.com_scale_category_name}</option>
									  <c:forEach items="${comScaleList}" var="scale">
									  	<option value="${scale.com_scale_category_pk}">${scale.com_scale_category_name}</option>
									  </c:forEach>
									</select>
								</div>
							</div>
							
						</div>
						<div class="row border-bottom py-3">
							<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">기업 주소</div>
							<div class="col p-1 ps-4">
								<textarea class="d-grid" rows="2" cols="30" name="com_address">${companyMap.companyDto.com_address}</textarea>
								
							</div>
						</div>
						<div class="row border-bottom py-3">
							<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">가족기업여부</div>
							<div class="col p-1 ps-4">${companyMap.companyDto.is_family_company}</div>
						</div>
					</div>
				</div>
				<div class="row mt-5 mb-3 fs-5 fw-bold">담당자 정보</div>
				<div class="row border-top border-bottom border-bs-border mt-3">
					<div class="col">
						<input type="hidden" name="com_pk" value="${companyMap.companyManagerDto.com_manager_pk}">
						<div class="row border-top border-bottom py-3">
							<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">담당자 명</div>
							<div class="col p-1 ps-4">
								<input type="text" name="com_manager_name" value="${companyMap.companyManagerDto.com_manager_name}">
							</div>
						</div>
						<div class="row border-bottom py-3">
							<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">이메일</div>
							<div class="col p-1 ps-4">
								<textarea class="d-grid" rows="1" cols="25" name="com_manager_email">${companyMap.companyManagerDto.com_manager_email}</textarea>
								
							</div>
						</div>
						<div class="row border-bottom py-3">
							<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">부서</div>
							<div class="col p-1 ps-4">
								<input type="text" name="com_manager_department" value="${companyMap.companyManagerDto.com_manager_department}">
							</div>
						</div>
						<div class="row border-bottom py-3">
							<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">직위</div>
							<div class="col p-1 ps-4">
								<input type="text" name="com_manager_position" value="${companyMap.companyManagerDto.com_manager_position}">
							</div>
						</div>
						<div class="row border-bottom py-3">
							<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">회사 번호</div>
							<div class="col p-1 ps-4">
								<input type="text" name="com_direct_number" value="${companyMap.companyManagerDto.com_direct_number}">
							</div>
						</div>
						<div class="row border-bottom py-3">
							<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">담당자 번호</div>
							<div class="col p-1 ps-4">
								<input type="text" name="com_manager_phone" value="${companyMap.companyManagerDto.com_manager_phone}">
							</div>
						</div>
					</div>
				</div>
					
				<!-- 버튼들 여따 -->
				
				<div class="row mt-4 mb-5"> 
					<!-- 여백용 -->
					<div class="col"></div>
					<div class="col text-end">
						<input class="btn btn-primary" type="submit" value="기업정보 수정하기">
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