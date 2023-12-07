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
		
		<!-- 중요 내용 들어가는 핵심 col -->
		<div class="col">
		
			<div class="row"> 
				<div class="col fs-4">
					상담센터 <span class="fs-4"> > 자유게시판 </span>  <span class="fs-5 fw-bold"> > 게시물 상세 </span>
				</div> 
			</div>
			
			<div class="row"><div class="col">빈공간</div></div>	
			
			<!-- 안내문 -->
			<div class="row">
			
				<div class="col-1"></div>
			
				<!-- 중간 안내문 -->
				
					<div class="col">
						<div class="row border border-2 border-black py-4">
			
							<div class="col-1 fs-1 text-center">
								<i class="bi bi-exclamation-circle"></i>
							</div>	
						
							<div class="col">
							자유게시판은 학생들의 글과 의견을 자유롭게 제시할 수 있는 게시판입니다.<br>
							상업성광고, 정치적 목적 게시물, 특정단체나 개인의 명예훼손 게시물, 음란물 등 미풍양속에 어긋나는 게시물 게시자는 <br>
							<span class="fw-bold text-danger">학사 징계</span>와 함게 <span class="fw-bold text-danger">민형사상 불이익</span>을 받을 수 있으니 게시판 성격에 맞는 내용만 게시하시기 바랍니다.
							</div>
				
						</div>
					</div>
				
				<div class="col-1"></div>
			</div>
			
			<div class="row"> 
				<div class="col">
				
				
			<!--내용을 제외한 주요 정보들 -->
			<div class="row">
				<div class="col">
				
				<!-- 제목 -->
				<div class="row border-top border-3 border-black py-3 mt-4 "> 
				
					<div class="col-2">
						<i class="bi bi-list"></i> ${pickpostMap.freeboardPost.id}
					</div>
				
					<div class="col text-center fs-3 ">
					 	${pickpostMap.freeboardPost.title}
					</div> 
					
					
						<div class="col-2 text-end">
							<c:if test="${pickpostMap.freeboardPost.student_pk == sessionStudentInfo.student_pk}">
								<a class="btn btn-sm text-white" role="button"  href="./updateFreeboardPostPage?id=${pickpostMap.freeboardPost.id}" style="background-color: #133369;">글 수정</a>
								<a class="btn btn-sm btn-outline-warning" role="button" href="./deleteFreeboardPostProcess?id=${pickpostMap.freeboardPost.id}" >글 삭제</a>
							</c:if>
						</div>
					</div>
					
				
				<!-- 글쓴이 -->
				<div class="row border border-start-0 border-end-0 border-2 border-black "> 
					<div class="col-2 fs-5 text-center">
					 	<i class="bi bi-person-vcard"></i> ${pickpostMap.studentInfo.name}
					</div> 
					
					<div class="col"></div>
					 
					<div class="col-4 fs-5">
					 	<i class="bi bi-eye"></i>${pickpostMap.freeboardPost.read_count}
					 	<i class="bi bi-clock"></i> ${pickpostMap.freeboardPost.created_at}
					</div> 
				</div>
				
			<!--내용을 제외한 주요 정보들 끝-->	
				</div>	
			</div>
			
			<!-- 글 내용 -->
			<div class="row py-3">
				${pickpostMap.freeboardPost.text }
			</div>
			
			<div class="row text-center py-1">
				<div class="col"></div>
				<div class="col"></div> 
			</div>
			
			<!-- 글수정 삭제 글목록 돌아가기 버튼 -->
			<div class="row py-2 border-top border-secondary">
				
				<div class="col-1 border border-secondary rounded text-center"> 공감 추가 예정</div>
				
				<div class="col"></div>
				
				<div class="col-2 text-end">
					<a role="button" class="btn text-white" style="background-color: #133369;" type="button" href="./freeboardCounselPage"> 글 목록 </a>
				</div>
				
			
			<!-- 글수정 삭제 글목록 돌아가기 버튼 끝 -->	
			</div>
			
			<div class="row text-center">
				향후 댓글 추가 예정
			</div>
			
			<div class="row">
			
			</div>
			
				
				
				
				
		
				
		
				
				
				</div> 
			</div>
			
			<div class="row"> <div class="col"></div> </div>
			
			
		<!-- 중요 내용 들어가는 핵심 col 끝-->
		</div>
		
		
		
		
		
		
		<!-- 오른쪽 공간 주는 col -->
		<div class="col-2">오른쪽</div>
		
	
	
	
	<!--중요 내용 들어갈 row 끝-->
	</div>

	
	
	
	
	
	
	
	
	
	
	
	
	</div>
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>