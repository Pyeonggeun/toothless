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
	
	
	<!-- 상단배너 이미지 넣는  로우 시작 -->
	<div class= "row">
		<div class="col d-grid p-0 m-0"> 추후 이미지 클래스 추가 예정 </div>
	<!-- 상단배너 이미지 넣는  로우 끝 -->
	</div>

	<!-- 중요한 내용이 들어가는 로우와 콜 시작 > 상시 변동 가능 -->
	<div class="row">
		<!-- 왼쪽 공간 주는 col -->
		<div class="col-2"></div>
		
		<!-- 중요한 내용이 들어가는 로우와 콜 시작 > 상시 변동 가능 -->
		<div class="col">
	
			<div class="row"> <div class="col fs-3"> 상담센터 <span class="fs-4  fw-bold" > > 자유게시판 </span> </div> </div>
			<div class="row"> <div class="col">베스트 글</div> </div>
			<div class="row"> <div class="col">빈 col</div> </div>
			<div class="row"> <div class="col">검색</div> </div>
			<div class="row"> <div class="col">빈 col</div> </div>
			<div class="row"> <div class="col"></div> </div>
			<div class="row"> <div class="col">총 게시물 페이지당 목록 리스팅형태</div> </div>
			<div class="row"> <div class="col">게시글</div> </div>
			<div class="row"> <div class="col">페이징과 글쓰기</div> </div>
	
	
			
			<a href="#"> 아직은 작동 안하는)학사정보시스템 메인으로 돌아가기</a>
			
			<a href="#"> 아직은 작동 안하는) 상담 학생페이지 메인으로 돌아가기</a>
			
		
			<table border=1>
				<tr>
					<td>글번호</td>
					<td>이름</td>
					<td>제목</td>
					<td>내용</td>
					<td>조회수</td>
					<td>시간</td>
				</tr>
				
				<c:forEach items="${combinedFreeboardList}" var="List">
					<tr>
						<td>${List.elementFreeboardDto.id}</td>
						<td>${List.studentInfo.name}</td>
						<td><a href="./readFreeboardPostPage?id=${List.elementFreeboardDto.id}">${List.elementFreeboardDto.title}</a>	</td>
						<td>${List.elementFreeboardDto.text}</td>
						<td>${List.elementFreeboardDto.read_count}</td>
						<td>${List.elementFreeboardDto.created_at}</td>
					</tr>
				</c:forEach>
				
			</table>
			
			<a href="./createFreeboardPostsPage">글 작성 하기</a>
	
	
	

	
			
		<!-- 중요한 내용이 들어가는 로우와 콜 시작 > 상시 변동 가능 -->
		</div>
		
		<!-- 오른쪽 공간 주는 col -->
		<div class="col-2"></div>
	<!-- 중요한 내용이 들어가는 로우와 콜 시작 > 상시 변동 가능 -->
	</div>










	<!-- 전체 컨테이너 끝-->
	</div>

	

	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>