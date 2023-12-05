<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>기업 목록,관리 페이지</title>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<!-- 취업팀 상단 네비 바 -->
			<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			<div class="col-1"></div>
			<!-- 취업팀 메뉴 바 -->
			<div class="col-1 me-5 border-right mt-4 pb-0">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			
			<div class="col">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<div class="row mb-2 mt-4 border-bottom border-3 border-bs-border pb-3 mb-3 fw-bold fs-4">기업 관리</div>
						<div class="row">
							<table class="table m-2">
							  <thead>
							    <tr>
							      <th scope="col" class="col-1  text-center">기업번호</th>
							      <th scope="col" class="col text-center">기업명</th>
							      <th scope="col" class="col-3 text-center">담당자명</th>
							      <th scope="col" class="col-2 text-center">가족기업 여부</th>
							    </tr>
							  </thead>
							  <tbody class="table-group-divider">
							  	<c:forEach items="${companyList}" var="list">
								  	<tr>
									     <th scope="col" class="col-1 text-center pt-3">${list.companyDto.com_pk}</th>
									     <td><a class="btn ms-4" href="./companyViewDetailsPage?companyPK=${list.companyDto.com_pk}">${list.companyDto.com_name}</a></td>
									     <td class="text-center pt-3">${list.companyManagerDto.com_manager_name}</td>
									     <td class="text-center pt-3">${list.companyDto.is_family_company}</td>
								   </tr>
							  	</c:forEach> 
							   
							  </tbody>
							</table>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
			</div>
		</div>
	</div>
	


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>