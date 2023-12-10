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
<title> AJDKS TEMPLATE FOR STAFF </title>
<style>
	/*교직원좌측메뉴바설정*/
	.staffleftmenubar input {
	    display: none;
	}
	
	.staffleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.staffleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.staffleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.staffleftmenubar input + label + .content {
	    display: none;
	}
	
	.staffleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

</style>

<script>
	
	
	
	function reloadCompanyList() {
		const url = "getCompanyListByCategoryPk?company_category_pk=" + companyCategoryPk;
	}

</script>
</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<div class="row">
	<div class="col">
		<jsp:include page="../../common/ajdksHighestMenubarForStaff.jsp"></jsp:include>
	</div>
</div>
<div class="row">

	<!-- 좌측메뉴바 -->
	<jsp:include page="../../common/ajdksSideMenubarForStaff.jsp"></jsp:include>
	
	<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
	<div class="col">
		<div class="row">
			<div class="col mx-4">
			
			<!-- 본문작성공간 -->
				<div class="row mt-5">
					<div class="col fw-bold">
						산업체 등록 내역
					</div>
				</div>
				<div class="row mt-3">
					<div class="col border border-2"></div>
				</div>
				<div class=" mt-5 btn-group">
				  <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
				    카테고리
				  </button>
				  <ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="./ajdksRegistedCompanyPage?company_category_pk=0">전체</a></li>
				  <c:forEach items="${categoryList}" var="categoryList">
				    <li><a class="dropdown-item" href="./ajdksRegistedCompanyPage?company_category_pk=${categoryList.company_category_pk}">${categoryList.company_category_name}</a></li>
				  </c:forEach>
				  </ul>
				</div>
				<div class="row mt-4">
					<div class="col border border-1 border-dark"></div>
				</div>
				<div class="row mt-3 text-center fw-bold" style="font-size: 0.9em;">
					<div class="col-1">No</div>
					<div class="col-2">카테고리</div>
					<div class="col-2">업체명</div>
					<div class="col-1">대표</div>
					<div class="col">주소</div>
					<div class="col-2">전화번호</div>
				</div>
				<div class="row mt-3">
					<div class="companyListBox col border border-secondary-subtle"></div>
				</div>
				<c:choose>
					<c:when test="${empty getCompanyListByCategoryPk}">
						<c:forEach items="${registedCompanyList}" var="registedCompanyList">
							<div class="row mt-3 text-center" style="font-size: 0.8em;">
								<div class="col-1">${registedCompanyList.ajdksCompanyInfoDto.company_pk}</div>
								<div class="col-2">${registedCompanyList.ajdksCompanyCategoryDto.company_category_name}</div>
								<div class="col-2">${registedCompanyList.ajdksCompanyInfoDto.company_name}</div>
								<div class="col-1">${registedCompanyList.ajdksCompanyInfoDto.ceo_name}</div>
								<div class="col">${registedCompanyList.ajdksCompanyInfoDto.address}</div>
								<div class="col-2">${registedCompanyList.ajdksCompanyInfoDto.phone}</div>
							</div>
							<div class="row mt-3">
								<div class="col border border-secondary-subtle"></div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<%-- <c:forEach items="${getCompanyListByCategoryPk}" var="getCompanyListByCategoryPk">
							<div class="row mt-3 text-center" style="font-size: 0.8em;">
								<div class="col-1">${getCompanyListByCategoryPk.ajdksCompanyInfoDto.company_pk}</div>
								<div class="col-2">${getCompanyListByCategoryPk.ajdksCompanyCategoryDto.company_category_name}</div>
								<div class="col-2">${getCompanyListByCategoryPk.ajdksCompanyInfoDto.company_name}</div>
								<div class="col-1">${getCompanyListByCategoryPk.ajdksCompanyInfoDto.ceo_name}</div>
								<div class="col">${getCompanyListByCategoryPk.ajdksCompanyInfoDto.address}</div>
								<div class="col-2">${getCompanyListByCategoryPk.ajdksCompanyInfoDto.phone}</div>
							</div>
							<div class="row mt-3">
								<div class="col border border-secondary-subtle"></div>
							</div>
						</c:forEach> --%>
					</c:otherwise>
				</c:choose>
				<div class="row mt-2">
					<div class="col"></div>
					<div class="col-1">
						<a class="btn btn-secondary" href="./ajdksStaffMainPage">메인</a>
					</div>
				</div>
				
				<div id="templete">
					<div class="companyListWrapper row">
						<div class="col">
							<div class="row mt-3 text-center" style="font-size: 0.8em;">
								<div class="companyPk col-1">${getCompanyListByCategoryPk.ajdksCompanyInfoDto.company_pk}</div>
								<div class="companyCategoryName col-2">${getCompanyListByCategoryPk.ajdksCompanyCategoryDto.company_category_name}</div>
								<div class="companyName col-2">${getCompanyListByCategoryPk.ajdksCompanyInfoDto.company_name}</div>
								<div class="ceoName col-1">${getCompanyListByCategoryPk.ajdksCompanyInfoDto.ceo_name}</div>
								<div class="compamyAddress col">${getCompanyListByCategoryPk.ajdksCompanyInfoDto.address}</div>
								<div class="companyPhone col-2">${getCompanyListByCategoryPk.ajdksCompanyInfoDto.phone}</div>
							</div>
							<div class="row mt-3">
								<div class="companyBorder col border border-secondary-subtle"></div>
							</div>
						</div>
					</div>
				</div>
		
				
			</div>
		</div>
	</div>
	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>

<%--
	<c:if test="${!empty sessionStaffInfo}">
	
	</c:if>
 --%>