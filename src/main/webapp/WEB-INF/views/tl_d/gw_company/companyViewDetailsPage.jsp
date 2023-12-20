<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>회사 상세</title>
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
		
		<div class="col-1"></div>
		<div class="col">
			<!-- 여백용 --> 
			<div class="row">
				<div class="col p-3">
				</div>
			</div>	
			
			<div class="row border-bottom border-3 border-bs-border mt-5 mb-3 pb-3 fs-4 fw-bold">
				<div class="col-3">기업 상세정보</div>
				<div class="col text-end">
					<c:if test="${companyMap.companyDto.is_family_company=='N'}">
						<a class="btn btn-primary" href="./changeFamilyCompanyProcess?com_pk=${companyMap.companyDto.com_pk}" role="button">가족기업으로 변환하기</a>
					</c:if>
					<c:if test="${companyMap.companyDto.is_family_company=='Y'}">
						<a class="btn btn-primary" href="./changeGeneralCompanyProcess?com_pk=${companyMap.companyDto.com_pk}" role="button">일반기업으로 변환하기</a>
					</c:if>
				</div>
			</div> 
			<div class="row fs-5 mt-5 mb-3 fw-bold">회사 상세 정보</div>
			<div class="row  border-top border-bottom border-bs-border">
				<div class="col"> 
					<div class="row border-top border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">회사명</div>
						<div class="col p-1 ps-4">${companyMap.companyDto.com_name}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">사업자등록번호</div>
						<div class="col p-1 ps-4">${companyMap.companyDto.business_number}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">대표자 명</div>
						<div class="col p-1 ps-4">${companyMap.companyDto.com_bossname}</div>
						<div class="col-2 border-start border-end border-bs-border p-1 ps-2 fw-bold">기업규모</div>
						<div class="col p-1 ps-4">${companyMap.comScaleCategoryDto.com_scale_category_name}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">기업 주소</div>
						<div class="col p-1 ps-4">${companyMap.companyDto.com_address}</div>
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
					<div class="row border-top border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">담당자 명</div>
						<div class="col p-1 ps-4">${companyMap.companyManagerDto.com_manager_name}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">이메일</div>
						<div class="col p-1 ps-4">${companyMap.companyManagerDto.com_manager_email}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">부서</div>
						<div class="col p-1 ps-4">${companyMap.companyManagerDto.com_manager_department}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">직위</div>
						<div class="col p-1 ps-4">${companyMap.companyManagerDto.com_manager_position}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">회사 번호</div>
						<div class="col p-1 ps-4">${companyMap.companyManagerDto.com_direct_number}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">담당자 번호</div>
						<div class="col p-1 ps-4">${companyMap.companyManagerDto.com_manager_phone}</div>
					</div>
				</div>
			</div>
				
			<!-- 버튼들 여따 -->
			
			<div class="row mt-4 mb-5"> 
				
				<div class="col-2 mx-0 text-start">
					<a class="btn btn-primary" href="./updateCompanyInfo?com_pk=${companyMap.companyDto.com_pk}" role="button">기업 정보 수정</a>
				</div>
				<div class="col-2 mx-0 text-start">
					<a class="btn btn-outline-primary" href="./deleteCompanyInfoProcess?com_pk=${companyMap.companyDto.com_pk}&com_manager_pk=${companyMap.companyManagerDto.com_manager_pk}&external_pk=${companyMap.companyManagerDto.external_pk}" role="button">기업 정보 삭제</a>
				</div> 
				<!-- 여백용 -->
				<div class="col"></div>
				<div class="col text-end">
					<a class="btn btn-primary" href="./companyManagementPage" role="button">기업 목록으로</a>
				</div>
			</div>
			
			<!-- 여백용 -->
			<div class="row">
				<div class="col p-5">
				</div>
			</div>	
		
		</div>
		
		<div class="col-2"></div>
		
	</div>
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