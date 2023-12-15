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
				<form action="./ajdksRegistedCompanyPageCCCC" method="get">
				<div class="row mt-5">
					<div class="col-4 mt-2">
						<div class="form-check">
							<c:forEach items="${categoryList}" var="CL">
								<input name="searchType" type="checkbox" value="${CL.company_category_pk}">${CL.company_category_name}
							</c:forEach>
						</div>
					</div>
					<div class="col-5">
						<input name="searchWord" type="text" class="form-control">
					</div>
					<div class="col">
						<button class="btn btn-secondary">검색</button>
					</div>
					<div class="col"></div>
				</div>
				</form>
				<div class="row mt-4">
					<div class="col border border-1 border-dark"></div>
				</div>
				<div class="row mt-3 pb-3 border-bottom border-2 text-center fw-bold" style="font-size: 0.9em;">
					<div class="col-1">No</div>
					<div class="col-2">카테고리</div>
					<div class="col-2">업체명</div>
					<div class="col-1">대표</div>
					<div class="col">주소</div>
					<div class="col-2">전화번호</div>
				</div>
					<c:forEach items="registedCompanyList" var="cList">
						 <div class="row">
					 		<div class="col-1">${cList.ajdksCompanyInfoDto.company_pk}</div>
							<div class="col-2">${cList.ajdksCompanyCategoryDto.company_category_name}</div>
							<div class="col-2">${cList.ajdksCompanyInfoDto.company_name}</div>
							<div class="col-1">${cList.ajdksCompanyInfoDto.ceo_name}</div>
							<div class="col">${cList.ajdksCompanyInfoDto.address}</div>
							<div class="col-2">${cList.ajdksCompanyInfoDto.phone}</div>
						 </div>
					</c:forEach> 
			
				
				<div class="row mt-2">
					<div class="col"></div>
					<div class="col-1">
						<a class="btn btn-secondary" href="./ajdksStaffMainPage">메인</a>
					</div>
				</div>
				
						 
		
				
			</div>
		</div>
	</div>
	
</div>

</div><!-- 전체 container 출구 -->
				
			
				
											
				
				
				<!-- 리스트 템플릿
				<div id="templete" class="d-none">
					<div class="companyListWrapper row">
						<div class="col">
							<div class="row mt-3 text-center" style="font-size: 0.8em;">
								<div class="companyPk col-1">ㄹ먀ㅐㄷㄹ매ㅑㅗ래ㅑㅁㄷ졸</div>
								<div class="companyCategoryName col-2">ㅁ랴더ㅑㅁ러댜ㅓㄹ</div>
								<div class="companyName col-2">ㄹ매댜저래ㅑ덜</div>
								<div class="ceoName col-1">이름 나오는 공간</div>
								<div class="compamyAddress col">주소...</div>
								<div class="companyPhone col-2">ㄹ댜댜댜더ㅓ러</div>
							</div>
							<div class="row mt-3">
								<div class="col border border-secondary-subtle"></div>
							</div>
						</div>
					</div>
				</div> 
 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
