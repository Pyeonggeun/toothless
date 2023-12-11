<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>

<!-- 전체 컨테이너 시작-->
<div class="container-fluid">

	<!-- 첫번째 로우 시작 메뉴창과 학교로고+로그인 상태 창을 포함하는 -->
	<div class = "row">
		<!-- 첫번째 콜 시작 메뉴창과 학교로고+로그인 상태 창을 포함하는 -->
		<div class = "col">
		
			<!-- 안쪽 첫번째 로우 - 왼 학교로고 오른쪽 로그인 정보  -->
			<div class="row py-1">
				<div class="col-3">
						<div class="fw-bold py-3 fs-3" ><img class="img-fluid" style="width: 60px; height: 60px" src="../../resources/img/groupCounsel/logo_black.png"> <a href="./goStudentMainPage" class="link-dark link-underline link-underline-opacity-0"><span class="text-start py-3 fw-bold fs-4"> Mk University </span></a> <a href="./goCounselStudentPage" class="link-dark link-underline link-underline-opacity-0"><span class="text-start py-3 fw-bold fs-4"> Counseling center </span></a> </div>
				</div>
				<!-- 중간 공란 -->	
				<div class="col"></div>
				
				<!-- 안쪽에서 오른쪽 정보 -->	
				<div class="col-3 my-auto"> 
					<div class="row">
						
						<!-- 학생이름 -->
						<div class="col">	
							<div class="fw-bold text-end" >${sessionStudentInfo.name}님 로그인 상태입니다.</div> 
						</div>
						
						<!-- 나중에 링크 연결할 아이콘들 -->
						<div class="col-3">	
							<div class="row">
								<div class="col p-0 "> <i class="bi bi-bell"></i> </div>
								<div class="col p-0 "> <a href="./logoutProcess"> <i class="bi bi-box-arrow-right"></i> </a></div>
								<div class="col ps-0 pd-1 "> <i class="bi bi-gear-fill"></i> </div>
							</div>
						</div>
					
				<!-- 안쪽에서 오른쪽 정보 -->
					</div>				
				</div>
			<!-- 안쪽 첫번째 로우 - 왼 학교로고 오른쪽 로그인 정보 끝 -->
			</div>
				
				
			
			<!-- 안쪽 첫번째 로우 끝  -->
			</div>
			
			<!-- 안쪽 두번째로우  - 전체 메뉴창 -->
			<div class="row fw-bold py-2 fs-5" style= "background-color: #133369;">
				<div class="col text-center text-light">상담신청</div>
				<div class="col text-center text-light">공지사항</div>
				<div class="col text-center text-light">자유게시판</div>
				<div class="col text-center text-light">상담원정보</div>
				<div class="col text-center text-light">마이페이지</div>
			<!-- 안쪽 두번째로우 끝-->
			</div>
			
			<!-- 첫번째 콜 끝 메뉴창과 학교로고+로그인 상태 창을 포함하는 -->
		</div>	
	<!-- 첫번째 로우 끝 메뉴창과 학교로고+로그인 상태 창을 포함하는 -->
	</div>
	
	<!-- 상단배너 이미지 넣는  로우 시작 -->
	<div class= "row">
		<div class="col d-grid p-0 m-0"> 추후 이미지 클래스 추가 예정 </div>
	<!-- 상단배너 이미지 넣는  로우 끝 -->
	</div>
	
	<!-- 중요부분 시작 -->
	<div class="row">
	
		<!-- 좌측공란 -->
		<div class="col-2"></div>
	
		<!-- 중간 중요 내용공간 시작 -->
		<div class="col">
		
			<div class="row"> 
				<div class="col fs-4">
					상담센터 <span class="fs-4"> > 자유게시판 </span>  <span class="fs-3 fw-bold"> > 게시물 작성 </span>
				</div> 
			</div>
		
		
			<div class="row py-3">
				<div class="col text-center ">
					<span class="fw-bold fs-2">글 작성이 완료됐습니다.</span>
				</div>
			</div>
		
		
			<div class="row py-3">
				<div class="col-1 fs-1 text-end">
					<i class="bi bi-exclamation-circle"></i>
				</div>
				<div class="col fs-5 text-conter">
					상업성광고, 정치적 목적 게시물, 특정단체나 개인의 명예훼손 게시물, 음란물 등 미풍양속에 어긋나는 게시물 게시자는
					<span class="fw-bold text-danger">학사 징계</span>와 함께 <span class="fw-bold text-danger">
					민형사상 불이익</span>을 받을 수 있습니다
				</div>
			</div>
		
			<div class="row py-3">
				<div class="col text-center ">
					<a class="btn text-white" role="button" href="freeboardCounselPage" style="background-color: #133369 ;">글 목록으로 돌아가기</a>
				
				</div>
				
				
			</div>
			
		<!-- 중간 중요 내용공간 끝 -->
		</div>
			
		<!-- 우측공란 -->
		<div class="col-2"></div>
	<!-- 중요부분 끝 -->	
	</div>



<!-- 전체 컨테이너 끝-->
</div>	





</div>

















<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>