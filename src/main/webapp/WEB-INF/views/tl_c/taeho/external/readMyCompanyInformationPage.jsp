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
<title> AJDKS TEMPLATE FOR COMPANY </title>
<style>
	/*산업체좌측메뉴바설정*/
	.companyleftmenubar input {
	    display: none;
	}
	
	.companyleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #22212E;
	    transition: ease .1s;
	}
	
	.companyleftmenubar label:hover {
	    background: #22212E;
	    opacity: 50%;
	}
	
	.companyleftmenubar .content {
	    background: #1C1C26;
   	    transition: ease .5s;    
	}
	
	.companyleftmenubar input + label + .content {
	    display: none;
	}
	
	.companyleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

</style>
</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<div class="row">

	<!-- 좌측메뉴바 : col-2 -->
	<jsp:include page="../../common/ajdksTemplateForCompany.jsp"></jsp:include>
	
	<!-- 메인화면 -->
	<div class="col">
		<!-- 안내문구 -->
		<div class="row py-2" style="box-shadow: 2px 2px 2px gray; font-size: 0.9em;">
			<div class="col ps-2">
				<span>&#035;&nbsp;${ajdksCompanyInfoDto.company_name } 님 환영합니다</span>
			</div>	
			<div class="col pe-2 text-end nolinenoblue">
				<a href="../../taeho/external/ajdksCompanyLogoutProcess">로그아웃</a>
			</div>	
		</div>
		
		<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
		<div class="row">
			<div class="col mx-5">
			
			
				<div class="row pt-5 pb-3">
					<div class="col fw-bold ps-0" style="font-size: 1.5em;">
						<i class="bi bi-check2-square fs-4"></i>&nbsp;기업정보 조회
					</div>
				</div>
			
				<div class="row" style="border-style: none none double none; border-color: #dee2e6;">
					<div class="col py-2 text-center" style="background-color: #F6F8FB;">
						내 기업 정보		
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-2 border-end py-3 text-center" style="background-color: #F6F8FB;">
						기업명		
					</div>
					<div class="col py-3 text-center">
						${companyInformationMap.COMPANY_NAME }
					</div>
					<div class="col-2 border-end py-3 text-center" style="background-color: #F6F8FB;">
						대표자명		
					</div>
					<div class="col py-3 text-center">
						${companyInformationMap.COMPANY_CEO }
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-2 border-end py-3 text-center" style="background-color: #F6F8FB;">
						업종분류		
					</div>
					<div class="col py-3 text-center">
						${companyInformationMap.COMPANY_CATEGORY }
					</div>
					<div class="col-2 border-end py-3 text-center" style="background-color: #F6F8FB;">
						사업자등록번호		
					</div>
					<div class="col py-3 text-center">
						${companyInformationMap.COMPANY_ID }
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-2 border-end py-3 text-center" style="background-color: #F6F8FB;">
						전화번호		
					</div>
					<div class="col py-3 text-center">
						${companyInformationMap.COMPANY_PHONE }
					</div>
					<div class="col-2 border-end py-3 text-center" style="background-color: #F6F8FB;">
						홈페이지주소		
					</div>
					<div class="col py-3 text-center">
						${companyInformationMap.COMPANY_URL }
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-2 border-end py-3 text-center" style="background-color: #F6F8FB;">
						주소		
					</div>
					<div class="col py-3 text-center">
						${companyInformationMap.COMPANY_ADDRESS }
					</div>
				</div>

			
				<div class="row mt-5" style="border-style: none none double none; border-color: #dee2e6;">
					<div class="col py-2 text-center" style="background-color: #F6F8FB;">
						담당 교직원 정보
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-3 border-end py-3 text-center" style="background-color: #F6F8FB;">
						담당자명		
					</div>
					<div class="col py-3 ps-5">
						${companyInformationMap.STAFF_NAME }
					</div>
				</div>

				<div class="row border-bottom">
					<div class="col-3 border-end py-3 text-center" style="background-color: #F6F8FB;">
						연락처		
					</div>
					<div class="col py-3 ps-5">
						${companyInformationMap.STAFF_PHONE }
					</div>
				</div>
				<div class="row border-bottom">
					<div class="col-3 border-end py-3 text-center" style="background-color: #F6F8FB;">
						이메일		
					</div>
					<div class="col py-3 ps-5">
						${companyInformationMap.STAFF_EMAIL }
					</div>
				</div>

				<div class="row pt-4 pb-5 mt-3 mb-4">
					<div class="col"></div>
					<div class="col"></div>
					<div class="col me-1 text-center rounded py-2" style="color: #4A3D73; border-style: solid; border-color: #4A3D73; border-width: 0.5px; cursor: pointer;" onclick="location.href='./companyMainPage'">메인으로</div>
					<div class="col ms-1 text-center text-white border border-white rounded py-2" style="background-color: #4A3D73; cursor: pointer;" onclick="location.href='./updateMyCompanyInformationPage'">수정하기</div>
					<div class="col"></div>
					<div class="col"></div>
				</div>
									
			</div>
		</div>
		
	<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>		
		
		
	</div>
	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>