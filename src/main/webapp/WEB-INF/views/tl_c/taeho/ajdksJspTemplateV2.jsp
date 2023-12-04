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
<title> AJDKS TEMPLATE V2 </title>
<style>
	/*좌측메뉴바*/
	input {
	    display: none;
	}
	
	label {
	    display: block;    
	    cursor: pointer;
	    background: #303134;
	    transition: ease .1s;
	}
	
	label:hover {
	    background: #303134;
	    opacity: 50%;
	}
	
	.content {
	    background: #27282B;
   	    transition: ease .5s;    
	}
	
	input + label + .content {
	    display: none;
	}
	
	input:checked + label + .content {
	    display: block;
	}	

	/*a태그밑줄색상제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #e9ecef;
	}

	/*dropdown-menu설정*/
	.dropdown-menu {
		--bs-dropdown-link-active-bg: #dee2e6;
		--bs-dropdown-border-radius: 0%;
	} 
	
	/*dropdown화살표제거*/
	.dropdown-toggle::after {
		content: none;
	}

</style>
</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<!-- 최상단정보바 : 사이트 및 session 정보 -->
<div class="row py-1">
	<div class="col text-start">
		MKU
	</div>
	<div class="col text-center">
		MK UNIVERSITY 사이트 로고
	</div>
	<div class="col text-end">
		김바덕 님 환영합니다 | 로그아웃
	</div>
</div>

<!-- 상단메뉴바 : 다른 팀으로 이동하는 메뉴-->
<div class="row py-2 fw-bold" style="background-color: #3B3C40; color: #e9ecef; box-shadow: 2px 2px 2px gray;">

	<div class="col-2"></div><!-- 그냥좌측여백 -->

	<div class="col text-center">	
		<div class="dropdown-center nolinenoblue">	
			<a class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">상단메뉴</a>
			<ul class="dropdown-menu text-center">
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			</ul>
		</div>
	</div>

	<div class="col text-center">	
		<div class="dropdown-center nolinenoblue">	
			<a class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">상단메뉴</a>
			<ul class="dropdown-menu text-center">
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			</ul>
		</div>
	</div>

	<div class="col text-center">	
		<div class="dropdown-center nolinenoblue">	
			<a class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">상단메뉴</a>
			<ul class="dropdown-menu text-center">
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			</ul>
		</div>
	</div>

	<div class="col text-center">	
		<div class="dropdown-center nolinenoblue">	
			<a class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">상단메뉴</a>
			<ul class="dropdown-menu text-center">
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			</ul>
		</div>
	</div>

	<div class="col text-center">	
		<div class="dropdown-center nolinenoblue">	
			<a class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">상단메뉴</a>
			<ul class="dropdown-menu text-center">
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			</ul>
		</div>
	</div>

	<div class="col text-center">	
		<div class="dropdown-center nolinenoblue">	
			<a class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">상단메뉴</a>
			<ul class="dropdown-menu text-center">
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			  <li><a class="dropdown-item" href="#">하위메뉴</a></li>
			</ul>
		</div>
	</div>

	<div class="col-2"></div><!-- 그냥우측여백 -->

</div>

<!-- 메인화면 : 좌측메뉴바 + 본문 -->
<div class="row">
<!-- 좌측메뉴바 -->
<div class="col-2 px-0" style="background-color: #303134; box-shadow: 2px 2px 2px gray; color: #e9ecef;">

	<!-- 접속자 정보 묶음 -->
	<div class="row text-center my-3">
		<div class="col">
			<!-- 접속자 사진 -->
			<div class="row">
				<div class="col">
					<i class="bi bi-person-circle" style="font-size: 5em;"></i>
				</div>	
			</div>
			<!-- 접속자 정보 -->
			<div class="row mt-2">
				<div class="col" style="font-size: 0.9em;">
					간단한 접속자 정보
				</div>
			</div>
		</div>	
	</div>

	<!-- 검색창 -->
	<div class="row px-4 mt-4 mb-3">
		<div class="col border-bottom border-white py-1">
			<div class="row">
				<div class="col" style="font-size: 0.9em;">검색창</div>
				<div class="col text-end"><i class="bi bi-search" style="font-size: 0.9em; cursor: pointer;"></i></div>
			</div>
		</div>
	</div>
	
	<!-- 메뉴리스트 -->
	<div class="row">
		<div class="col">
			<input type="checkbox" id="title1"/>
			<label class="pt-3 pb-2 ps-3" for="title1"><i class="bi bi-list"></i>&nbsp;큰메뉴1</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴1</span>
					</div>
				</div>
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴2</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴3</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title2"/>
			<label class="pt-3 pb-2 ps-3" for="title2"><i class="bi bi-list"></i>&nbsp;큰메뉴2</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴1</span>
					</div>
				</div>
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴2</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴3</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title3"/>
			<label class="pt-3 pb-2 ps-3" for="title3"><i class="bi bi-list"></i>&nbsp;큰메뉴3</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴1</span>
					</div>
				</div>
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴2</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴3</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title4"/>
			<label class="pt-3 pb-2 ps-3" for="title4"><i class="bi bi-list"></i>&nbsp;큰메뉴4</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴1</span>
					</div>
				</div>
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴2</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴3</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title5"/>
			<label class="pt-3 pb-2 ps-3" for="title5"><i class="bi bi-list"></i>&nbsp;큰메뉴5</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴1</span>
					</div>
				</div>
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴2</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴3</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title6"/>
			<label class="pt-3 pb-2 ps-3" for="title6"><i class="bi bi-list"></i>&nbsp;큰메뉴6</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴1</span>
					</div>
				</div>
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴2</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴3</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title7"/>
			<label class="pt-3 pb-2 ps-3" for="title7"><i class="bi bi-list"></i>&nbsp;큰메뉴7</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴1</span>
					</div>
				</div>
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴2</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴3</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title8"/>
			<label class="pt-3 pb-2 ps-3" for="title8"><i class="bi bi-list"></i>&nbsp;큰메뉴8</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴1</span>
					</div>
				</div>
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴2</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴3</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title9"/>
			<label class="pt-3 pb-2 ps-3" for="title9"><i class="bi bi-list"></i>&nbsp;큰메뉴9</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴1</span>
					</div>
				</div>
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴2</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴3</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title10"/>
			<label class="pt-3 pb-2 ps-3" for="title10"><i class="bi bi-list"></i>&nbsp;큰메뉴10</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴1</span>
					</div>
				</div>
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴2</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;작은메뉴3</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row" style="color: #323232;">
		<div class="col">
			<span>우재은비태호후영건택서영여기잠들다</span>
		</div>
	</div>
	
</div><!-- 좌측메뉴바 출구 -->

<!-- 본문 :  자유롭게 이용하세요 화이팅 -->
<div class="col">
	여기가 바로 본문
</div>

</div><!-- 메인화면 출구 -->

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>