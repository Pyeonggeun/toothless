<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>기업등록 완료</title>
</head>
<body>

	<div class="container-fluid">
	 
		<div class="row">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>	
		</div>
		
		<div class="row">
			<!-- 취업팀 메뉴 바 -->
			<div class="col-2 border-end pb-0">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			 
			<div class="col-2"></div>
			<div class="col">
				<div class="row p-5 m-5"></div>
				<div class="row p-2 m-2"></div>
				<div class="row">
					<div class="col p-3">
						<div class="row text-center mt-4 fs-4 fw-bold pb-2 mb-2 border-bottom border-2"> 
							<div class="col text-center">
								기업 등록 완료
							</div> 
						</div> 
						<div class="row text-center mt-4 mb-3">  
						 	<div class="col"> 
						 		기업등록이 완료되었습니다, 기업에 가입완료를 안내해 주세요.
						 	</div>
						 	 
						</div>
						<div class="row text-center mt-3 mb-4">  
						 	<div class="col"> 
						 		<a class="btn btn-primary px-5" href="./companyManagementPage">기업목록 페이지로 이동</a>
						 	</div>
						 	 
						</div>
					</div>
				 		
				</div>
				
				
			</div>
			<div class="col-3"></div>
		</div>
		
		<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
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