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
<title> AJDKS TEMPLATE FOR PROFESSOR </title>
<style>
	/*교수좌측메뉴바설정*/
	.professorleftmenubar input {
	    display: none;
	}
	
	.professorleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.professorleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.professorleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.professorleftmenubar input + label + .content {
	    display: none;
	}
	
	.professorleftmenubar input:checked + label + .content {
	    display: block;
	}	

</style>
</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

	<div class="row">
		<div class="col">
			<jsp:include page="../../common/ajdksHighestMenubar.jsp"></jsp:include>
		</div>
	</div>
	<div class="row">
		<jsp:include page="../../common/ajdksTemplateForProfessor.jsp"></jsp:include>
		
		
		
		<!-- 본문 :  자유롭게 이용하세요 화이팅 -->
		<div class="col">
			<!-- 안내문구 -->
			<div class="row py-2" style="box-shadow: 1.5px 1.5px 1.5px gray;">
				<div class="col ms-2" style="font-size: 0.9em;">
					<span>&#035;&nbsp;${sessionProfessorInfo.name} 님 환영합니다</span>
				</div>	
			</div>
			<div class="row">
				<div class="col ms-4 me-4">
					
					<div class="row mt-4 pb-3 border-bottom border-dark border-3">
						<div class="col fw-semibold fs-5">담당 학과생 조회</div>
					</div>
					<div class="row">
						<div class="col">
							
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