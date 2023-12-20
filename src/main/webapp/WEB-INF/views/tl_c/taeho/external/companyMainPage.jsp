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
				<a href="./ajdksCompanyLogoutProcess">로그아웃</a>
			</div>	
		</div>
		
		<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
		<div class="row">
			<div class="col">
			
			<!-- 좌측 화면 : 문구 -->
			<div class="row mt-4">
				<div class="col">
	
					<!-- 큰 문구 -->
					<div class="row">
						<div class="col ps-5">
							<div class="row mt-5">
								<div class="col">
									<span style="font-size: 2.5em; font-weight: 900; color: #635199;">학습과 실습의 연계</span><span style="font-size: 2.4em;">를 통한</span>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<span style="font-size: 2.4em;">산학 간</span>&nbsp;<span style="font-size: 2.5em; font-weight: 900; color: #423666;">균형 있는 성장</span>
								</div>
							</div>						
						</div>
					</div>

					<!-- 작은 문구 -->
					<div class="row mt-3">
						<div class="col ps-5">
							<div class="row">
								<div class="col ps-3">
									산업과 학업 간 <span class="fw-bold" style="color: #423666;">긴밀한 협력 프로세스</span>를 통하여
								</div>
							</div>
							<div class="row">
								<div class="col ps-3">
									학생과 기업의 <span class="fw-bold" style="color: #423666;">상호 발전</span>을 이룩합니다.
								</div>
							</div>						
						</div>
					</div>
					
					<!-- 무언가 버튼 -->
					<div class="row ps-5 pt-5">
						<div class="col ps-1">
							<span class="text-center text-white border border-white rounded px-3 py-3" style="background-color: #635199; cursor: pointer;">현장실습과정 신청&nbsp;<i class="bi bi-caret-right-fill"></i></span>
						</div>
					</div>
				
				</div>
				
				<!-- 우측 화면 : 이미지 -->
				<div class="col mt-5 me-4 px-5 py-5">
					<img src="../../../resources/img/companyImage/externalCompanyImage.jpg">
				</div>

			</div>

			<!-- 회색 띠 배경 -->
			<div class="row mt-4 px-5 py-2" style="background-color: #F6F8FB;">
			
				<div class="col px-4 py-5">
					<div class="row border rounded bg-white border-white px-2 py-4" style="font-size: 1.1em; cursor: pointer;">
						<div class="col">
							<div class="row">
								<div class="col" style="color: #423666;">
									현장실습제도
								</div>
							</div>
							<div class="row">
								<div class="col" style="color: #423666;">
									소개
								</div>
							</div>
							<div class="row">
								<div class="col ps-3 pt-2">
									<i class="bi bi-arrow-right-circle fs-3" style="color: #c5c2d3;"></i>
								</div>
								<div class="col text-end">
									<i class="bi bi-book fs-2" style="color: #423666;"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			
				<div class="col px-4 py-5">
					<div class="row border rounded bg-white border-white px-1 py-4" style="font-size: 1.1em; cursor: pointer;">
						<div class="col">
							<div class="row">
								<div class="col" style="color: #423666;">
									현장실습관리시스템
								</div>
							</div>
							<div class="row">
								<div class="col" style="color: #423666;">
									안내
								</div>
							</div>
							<div class="row">
								<div class="col ps-3 pt-2">
									<i class="bi bi-arrow-right-circle fs-3" style="color: #c5c2d3;"></i>
								</div>							
								<div class="col text-end">
									<i class="bi bi-gear-wide-connected fs-2" style="color: #423666;"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			
				<div class="col px-4 py-5">
					<div class="row border rounded bg-white border-white px-2 py-4" style="font-size: 1.1em; cursor: pointer;">
						<div class="col">
							<div class="row">
								<div class="col" style="color: #423666;">
									현장실습과정
								</div>
							</div>
							<div class="row">
								<div class="col" style="color: #423666;">
									조회
								</div>
							</div>
							<div class="row">
								<div class="col ps-3 pt-2">
									<i class="bi bi-arrow-right-circle fs-3" style="color: #c5c2d3;"></i>
								</div>							
								<div class="col text-end">
									<i class="bi bi-card-list fs-2" style="color: #423666;"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			
				<div class="col px-4 py-5">
					<div class="row border rounded bg-white border-white px-2 py-4" style="font-size: 1.1em; cursor: pointer;">
						<div class="col">
							<div class="row">
								<div class="col" style="color: #423666;">
									출근부 관리
								</div>
							</div>
							<div class="row">
								<div class="col">
									<br>
								</div>
							</div>
							<div class="row">
								<div class="col ps-3 pt-2">
									<i class="bi bi-arrow-right-circle fs-3" style="color: #c5c2d3;"></i>
								</div>							
								<div class="col text-end">
									<i class="bi bi-pencil-square fs-2" style="color: #423666;"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			
				<div class="col px-4 py-5">
					<div class="row border rounded bg-white border-white px-2 py-4" style="font-size: 1.1em; cursor: pointer;">
						<div class="col">
							<div class="row">
								<div class="col" style="color: #423666;">
									대학홈페이지
								</div>
							</div>
							<div class="row">
								<div class="col" style="color: #423666;">
									바로가기
								</div>
							</div>
							<div class="row">
								<div class="col ps-3 pt-2">
									<i class="bi bi-arrow-right-circle fs-3" style="color: #c5c2d3;"></i>
								</div>							
								<div class="col text-end">
									<i class="bi bi-bank fs-2" style="color: #423666;"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<!-- 하단 여백 -->
			<div class="row">
				<div class="col">
					<!-- 하이루 -->				
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