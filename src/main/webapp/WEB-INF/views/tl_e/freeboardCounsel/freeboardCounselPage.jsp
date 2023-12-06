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
								<div class="col p-0 "> <i class="bi bi-door-open"></i> </div>
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

	<!-- 중요한 내용이 들어가는 로우와 콜 시작 > 상시 변동 가능 -->
	<div class="row">
	
		<!-- 왼쪽 공간 주는 col -->
		<div class="col-2 border-end"></div>
		
		<!-- 중간에 중요한 내용이 들어가는 로우와 콜 시작 > 상시 변동 가능 -->
		<div class="col">
	
			<div class="row"> <div class="col fs-3"> 상담센터 <span class="fs-4  fw-bold" > > 자유게시판 </span> </div> </div>
			<div class="row"> <div class="col">추후 조회수 또는 좋아요 베스트 글 추가 예정</div> </div>
			<div class="row"> <div class="col">빈공간</div> </div>
			<div class="row"> <div class="col">추후 검색 기능 추가 예정</div> </div>
			<div class="row"> <div class="col">빈공간</div> </div>
			<div class="row"> <div class="col"></div> </div>
			<div class="row"> <div class="col">총 게시물 페이지당 목록 리스팅형태</div> </div>
			
			<!-- 글 목록이 리스팅 되는 로우 시작 -->
			<div class="row"> 
				<!-- 글 목록이 리스팅 되는 콜 시작 -->
				<div class="col">
				
					<!-- 글번호부터 작성일까지 목차 -->
					<div class="row  text-white text-center fw-bold my-1 px-1 p-1 rounded-1  border-2 border-bottom" style= "background-color: #133369;">
						<div class="col-1">글번호</div>
						<div class="col-2">글제목</div>
						<div class="col-4">내용</div>
						<div class="col-1">조회수</div>
						<div class="col-2">작성자</div>
						<div class="col-2">작성일</div>
					</div>
				<!-- 글 목록이 리스팅 되는 콜 끝 -->
				</div>
			
					<!-- 목차에 맞춘 진짜 글 리스팅 되는 로우 시작 -->
					<c:forEach items="${combinedFreeboardList}" var="List">
						<div class="row text-center my-1 mx-1 p-1 fw-bold border-bottom border-dark-subtle">
							<div class="col-1">${List.elementFreeboardDto.id}</div>
							<div class="col-2"><a href="./readFreeboardPostPage?id=${List.elementFreeboardDto.id}">${List.elementFreeboardDto.title}</a></div>
							<div class="col-4">${List.elementFreeboardDto.text}</div>
							<div class="col-1">${List.elementFreeboardDto.read_count}</div>
							<div class="col-2">${List.studentInfo.name}</div>
							<div class="col-2">${List.elementFreeboardDto.created_at}</div>
						
						<!-- 목차에 맞춘 진짜 글 리스팅 되는 로우 끝 -->
						</div>
					</c:forEach>
					
			
			<!-- 글 목록이 리스팅 되는 공간 끝 -->
			</div>
			
			<div class="row"> <div class="col">빈 공간</div> </div>
			
			<!--주요내용 마지막 페이징과 글작성버튼  -->
			<div class="row"> 
				<div class="col-2">빈공간 </div> 
				<div class="col-8">페이징 예정 공간</div> 
				<div class="col-2 "> <a class="btn  text-white text-center fw-bold" role="button"  href="./createFreeboardPostsPage" style="background-color:#133369;">글 작성 하기</a> </div> 
			</div>
	
	
			
			<a href="#"> 학사정보시스템 메인으로 복귀 버튼 예정</a>
			
			<a href="#"> 상담 학생페이지 메인으로 복귀 버튼 예정</a>
		
		
		
		<!-- 중간에 중요한 내용이 들어가는 로우와 콜 시작 > 상시 변동 가능 -->
		</div>
		
		<!-- 오른쪽 공간 주는 col -->
		<div class="col-2"></div>
		
		<!-- 중요한 내용이 들어가는 로우와 콜 끝 > 상시 변동 가능 -->
	</div>










	<!-- 전체 컨테이너 끝-->
	</div>

	

	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>