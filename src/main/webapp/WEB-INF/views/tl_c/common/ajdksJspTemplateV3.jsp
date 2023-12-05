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
<title> AJDKS TEMPLATE V3 </title>
<style>
	/*좌측메뉴바*/
	input {
	    display: none;
	}
	
	label {
	    display: block;    
	    cursor: pointer;
	    background: #22212E;
	    transition: ease .1s;
	}
	
	label:hover {
	    background: #22212E;
	    opacity: 50%;
	}
	
	.content {
	    background: #1C1C26;
   	    transition: ease .5s;    
	}
	
	input + label + .content {
	    display: none;
	}
	
	input:checked + label + .content {
	    display: block;
	}	


</style>
</head>
<body>
<div class="container-fluid"><!-- container 입구 -->
<div class="row">
<div class="col-2 px-0" style="background-color: #22212E; color: #E2E2E4; height: 120dvh; box-shadow: 2px 2px 2px gray;">

	<!-- 좌측메뉴바 -->
	<div class="row pt-2 pb-4" style="font-size: 1.1em;">
		<div class="col text-white text-center fw-bold">
			MKU 현장실습관리시스템
		</div>
	</div>

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
	
	<div class="row" style="color: #20212F;">
		<div class="col">
			<span>우재은비태호후영건택서영여기잠들다</span>
		</div>
	</div>

</div>

<!-- 메인화면: 안내문구 + 본문 -->
<div class="col">
	
	<!-- 안내문구 -->
	<div class="row py-2" style="box-shadow: 2px 2px 2px gray;">
		<div class="col" style="font-size: 0.9em;">
			<span>&#035;&nbsp;중앙정보기술인재개발원 님 환영합니다</span>
		</div>	
	</div>

	<!-- 본문 -->
	<div class="row">
		<div class="col">
			여기가 바로 본문		
		</div>	
	</div>

</div><!-- 메인화면 출구 -->
</div>
</div><!-- container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>