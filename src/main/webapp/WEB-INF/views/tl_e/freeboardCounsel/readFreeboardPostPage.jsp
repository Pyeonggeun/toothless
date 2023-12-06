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
					<div class="fw-bold py-3 fs-5" ><img class="img-fluid" style="width: 50px; height: 50px" src="../../resources/img/groupCounsel/logo_black.png"> Mk University</div>
				</div>
				<div class="col"></div>
				<div class="col-3 my-auto"> 
					<div class="fw-bold text-end" >${sessionStudentInfo.name}님 로그인 상태입니다.</div> 
				</div>
			
			<!-- 안쪽 첫번째 로우 끝  -->
			</div>
			
			<!-- 안쪽 두번째로우  - 전체 메뉴창 -->
			<div class="row fw-bold py-2" style= "background-color: #133369;">
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
	
	<div class="row"> <div class="col"> 추후 이미지 클래스 추가 예정 </div> </div>

	<!--중요 내용 들어갈 row 시작  -->
	<div class="row"> 
	
		<!-- 왼쪽 공간 주는 col -->
		<div class="col-2">왼쪽</div>
		
		
		<div class="col">
		
			<div class="row"> 
				<div class="col fs-4">
					상담센터 <span class="fs-4"> > 자유게시판 </span>  <span class="fs-5 fw-bold"> > 게시물 상세 </span>
				</div> 
			</div>
			
			<div class="row"> 
				<div class="col">
					제목  ${pickpostMap.freeboardPost.title}<br>
					작성자 이름 ${pickpostMap.studentInfo.name}<br>
					조회수  ${pickpostMap.freeboardPost.read_count}<br>
					내용 <br>
					${pickpostMap.freeboardPost.text }<br> 
					<br>
					<a href="./freeboardCounselPage">글 목록으로 돌아가기</a>
					
					<c:if test="${pickpostMap.freeboardPost.student_pk == sessionStudentInfo.student_pk}">
						<a href="./updateFreeboardPostPage?id=${pickpostMap.freeboardPost.id}">현재 글 수정하기</a>
						<a href="./deleteFreeboardPostProcess?id=${pickpostMap.freeboardPost.id}">현재 글 삭제하기</a>
					</c:if>
				</div> 
			</div>
			
			<div class="row"> <div class="col"></div> </div>
			
			
		
		</div>
		
		
		
		
		
		
		<!-- 오른쪽 공간 주는 col -->
		<div class="col-2">오른쪽</div>
		
	
	
	
	<!--중요 내용 들어갈 row 끝-->
	</div>

	
	
	
	
	
	
	
	
	
	
	
	
	</div>
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>