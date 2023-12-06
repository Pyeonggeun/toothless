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

		<div class="row">
			<div class="col-3">`</div>
			<div class="col-3">`</div>
			<div class="col-3">`</div>
			<div class="col-3">`</div>			
		</div>
		

		<div class="row">
			<div class="col-3">`</div>
			<div class="col-3">`</div>
			<div class="col-3">`</div>
			<div class="col-3">`</div>			
		</div>
		
		
		<div class="row">
		
			<div class="col-1"></div>
		
			<div class ="col-3 m-3">
		
					<div class="card border-black shadow mb-3">
					  <div class="card-body text">
						    <h5 class="card-title fw-bold">부산광역시 산학연계 현장실습 지원사업</h5>
						    <p class="card-text">부산광역시와 (재)부산테크노파크(TP)는 지자체-기업-대학 간 협력을 통해 기업 실무형 인재양성과 우수인재 발굴·채용 등 
						    학생-기업 간 선순환 채용 환경을 조성하고자‘2022년 2학기 산학연계 현장실습 지원사업을 시행합니다.</p>
					  </div>
					  <div class="card-footer text-bg-dark border">부산광역시 산학연계 사업원</div>
					</div>
			
			</div>
			
			<div class ="col-3 m-3">
		
					<div class="card border-black shadow mb-3">
					  <div class="card-body text">
						    <h5 class="card-title fw-bold">부산광역시 산학연계 현장실습 지원사업</h5>
						    <p class="card-text">부산광역시와 (재)부산테크노파크(TP)는 지자체-기업-대학 간 협력을 통해 기업 실무형 인재양성과 우수인재 발굴·채용 등 
						    학생-기업 간 선순환 채용 환경을 조성하고자‘2022년 2학기 산학연계 현장실습 지원사업을 시행합니다.</p>
					  </div>
					  <div class="card-footer text-bg-dark border">부산광역시 산학연계 사업원</div>
					</div>
			
			</div>
			
			<div class ="col-3 m-3">
		
					<div class="card border-black shadow mb-3">
					  <div class="card-body text">
						    <h5 class="card-title fw-bold">부산광역시 산학연계 현장실습 지원사업</h5>
						    <p class="card-text">부산광역시와 (재)부산테크노파크(TP)는 지자체-기업-대학 간 협력을 통해 기업 실무형 인재양성과 우수인재 발굴·채용 등 
						    학생-기업 간 선순환 채용 환경을 조성하고자‘2022년 2학기 산학연계 현장실습 지원사업을 시행합니다.</p>
					  </div>
					  <div class="card-footer text-bg-dark border">부산광역시 산학연계 사업원</div>
					</div>
			
			</div>
			
			
		</div>
		
	<div class="row">
		
			<div class="col-1"></div>
		
			<div class ="col-3 m-3">
		
					<div class="card border-black shadow mb-3">
					  <div class="card-body text">
						    <h5 class="card-title fw-bold">부산광역시 산학연계 현장실습 지원사업</h5>
						    <p class="card-text">부산광역시와 (재)부산테크노파크(TP)는 지자체-기업-대학 간 협력을 통해 기업 실무형 인재양성과 우수인재 발굴·채용 등 
						    학생-기업 간 선순환 채용 환경을 조성하고자‘2022년 2학기 산학연계 현장실습 지원사업을 시행합니다.</p>
					  </div>
					  <div class="card-footer text-bg-dark border">부산광역시 산학연계 사업원</div>
					</div>
			
			</div>
			
			<div class ="col-3 m-3">
		
					<div class="card border-black shadow mb-3">
					  <div class="card-body text">
						    <h5 class="card-title fw-bold">부산광역시 산학연계 현장실습 지원사업</h5>
						    <p class="card-text">부산광역시와 (재)부산테크노파크(TP)는 지자체-기업-대학 간 협력을 통해 기업 실무형 인재양성과 우수인재 발굴·채용 등 
						    학생-기업 간 선순환 채용 환경을 조성하고자‘2022년 2학기 산학연계 현장실습 지원사업을 시행합니다.</p>
					  </div>
					  <div class="card-footer text-bg-dark border">부산광역시 산학연계 사업원</div>
					</div>
			
			</div>
			
			<div class ="col-3 m-3">
		
					<div class="card border-black shadow mb-3">
					  <div class="card-body text">
						    <h5 class="card-title fw-bold">부산광역시 산학연계 현장실습 지원사업</h5>
						    <p class="card-text">부산광역시와 (재)부산테크노파크(TP)는 지자체-기업-대학 간 협력을 통해 기업 실무형 인재양성과 우수인재 발굴·채용 등 
						    학생-기업 간 선순환 채용 환경을 조성하고자‘2022년 2학기 산학연계 현장실습 지원사업을 시행합니다.</p>
					  </div>
					  <div class="card-footer text-bg-dark border">부산광역시 산학연계 사업원</div>
					</div>
			
			</div>
			
			
		</div>
		
			
			
		</div>
		
		
		
				
	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>