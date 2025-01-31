<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
		function formSubmit(){
			
			console.log("실행됨")
			const search = document.getElementById("search");
			
			const inputWord = document.getElementById("inputWord");
			const inputWordRegex =/^([a-zA-Z0-9_-]{2,})$/; 
			if(!inputWordRegex.test ==(inputWord.value)){
				alert("검색란에 검색어를 입력하셔야 검색이 진행됩니다.");
				inputWord.focus();
				return;
			}
						
			search.submit(); 
			
		}
		
	</script>
	<style>
		*{
		font-family: 'Gowun Dodum', sans-serif;
		}
	</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gowun+Dodum&family=Quicksand:wght@300&display=swap" rel="stylesheet">
</head>
<body>

<jsp:include page="../commons/studentTopArea.jsp"></jsp:include>

<!-- 전체 컨테이너 시작 -->
<div class="container-fluid">
	<!--컨테이너 안에서 감싸는 로우, 콜 시작  -->
	<div class="row">
		<div class="col">
		
			<!-- 상단배너 이미지 넣는  로우 시작 -->
			<div class="row">
             <div class="col mx-0 px-0" style="height: 35em; position: relative;">
                 <img class="banner img-fluid" src="/toothless/resources/img/groupCounsel/fff.jpg" style="width: 100%; height: 100%;">
         
                 <div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height: 100%; position: absolute; bottom: 0; left: 0;"></div>
         
			     <div class="title-text" style="font-size: 4em; color: white; position: absolute; bottom: 48%; left: 20.5%; transform: translate(-50%, 50%);">자유게시판</div>
         
                 <div style="color: white; position: absolute; font-size: 5em; bottom: 36%; transform: translate(-50%, -50%); text-align: center; left: -8%; border-top: 1px; border-top-style: solid; border-top-color: white; width: 80%;"></div>
         
                 <div style="color: white; position: absolute; font-size: 1.4em; bottom: 24.5%; transform: translate(-50%, -50%); text-align: center; left: 19.6%;">너와 나 그리고 우리를 위한 마음을 위한 치료</div>
			
			     <div style="color: white; position: absolute; font-size: 1.4em; bottom: 17.5%; transform: translate(-50%, -50%); text-align: center; left: 24.2%;">마음도 관리가 필요합니다</div>
         
                 <div style="height: 17em; width: 18em; border-radius: 0px 50px 0px 0px; background-color: #679467; opacity: 0.9; position: absolute; bottom: -24.2%; transform: translate(-50%, -50%); text-align: center; left: 85%;"></div>
         
                 <div style="font-weight: 900; color: #464646; position: absolute; font-size: 1.5em; bottom: 34%; transform: translate(-50%, -50%); text-align: center; left: 82%;">Contact Us</div>
         
                 <div style="font-weight: 900; color: white; position: absolute; font-size: 2.6em; bottom: 10%; transform: translate(-50%, -50%); text-align: center; left: 84%;">1544-3054</div>
         
                 <div style="color: white; position: absolute; font-size: 0.9em; bottom: 8%; transform: translate(-50%, -50%); text-align: center; left: 83.5%;">E-mail. mkmk@naver.com</div>
         
                 <div style="color: white; position: absolute; font-size: 0.9em; bottom: 3%; transform: translate(-50%, -50%); text-align: center; left: 82.5%;">Tel. 010-4097-3054</div>
             </div>
         	</div>
		
			<!-- 상단 배너 다음으로 오는 로우와 콜 (주류 내용을 모두 감싼다) 시작-->
			<div class="row">
			
				<div class="col-1 border-end"><!-- 왼쪽 여백 --></div>
			
				<!-- 양쪽 여백을 준 뒤 중요 내용 들어가는 콜 (안에서 로우 주기) 시작 -->
				<div class="col">
				
					<div class="row py-4"><div class="col"><!-- 패딩과 마진으로 공간 벌리기 --></div></div>
					
					<!-- 양옆으로 갈리는...?  -->
					<div class="row">
						<!-- 왼쪽 콜 시작 -->
						<div class="col-4"> 
						
							<div class="row pt-2 pb-3"><div class="col"></div></div>
						
							<!-- 정보창 2 시작 -->
							<div class="row">
								<div class="col-1"><!-- 왼쪽 사이드 여백 --></div>
								<div class="col">
								
									<!-- 조회수 기준 베스트 게시물 -->
										<div class="row">
											<div class="col">
											
												<div class="row pt-0 pb-3"> <div class="col"> <span class="fs-4 fw-bold">인기 게시물</span> <span style="font-size: 1.2em; color: #8FBC8F">Popular posts</span></div></div>
												
													
													
													
												<div class="row border-top style="border-color:#dcdcdc;">
													<div class="col">
													
													<div class="row py-2 mb-2"><div class="col"> </div></div>
													
													<c:forEach items="${bestFreeboardPostList}" var="best">
														<div class="row text-center py-2 rounded-1"> 
								
															<div class="col-4 text-truncate text-start pe-0 me-0"><a class="link-dark link-underline link-underline-opacity-0" href="./readFreeboardPostPage?id=${best.elementFreeboardPost.id}">${best.elementFreeboardPost.title}</a><span class=""></span></div>
															<div class="col-2 ps-0 pt-1 ms-0 text-start text-secondary" style="font-size: small;">[${best.elementFreeboardPost.read_count}]</div>
															<div class="col-3">${best.studentInfo.name}</div>
															<div class="col-2"><fmt:formatDate value="${best.elementFreeboardPost.created_at}" pattern="yyyy.MM.dd"/> </div>
														</div>
														</c:forEach>
													</div>
												</div>			
														
														
												</div>
											<!--조회수 기준 베스트 게시물 끝-->
											</div>
								</div>
								<div class="col-1"><!-- 오른쪽 사이드 여백 --></div>
								
								
							<!-- 정보창 2 끝 -->
							</div>
							
							<div class="row py-5"><div class="col"><!-- 패딩과 마진으로 공간 벌리기 --></div></div>
							
							<!-- 정보창 3 시작 -->
							<div class="row">
								<div class="col-1"><!-- 왼쪽 사이드 여백 --></div>
								<div class="col">
									<div class="row">
										<div class="col">
															<div class="row pb-2">
																<div class="col">
																	<span class="fs-4 fw-bold">검색</span> <span style="font-size: 1.2em; color: #8FBC8F">Search</span>
																</div>
															</div>	
															
															<div class="row border style="border-color:#dcdcdc;"><div class="col"></div></div>
										
															<form id="search" action="./freeboardCounselPage" method="get">
																<div class="row text-center py-3"> <!--검색-->
																	<div class="col-4"> 
																		<select name="searchType" class="form-select">   
																			<option selected value="title">글 제목</option>
																			<option value="text">글내용</option>
																			<option value="id">글번호</option>
																			<option value="name">작성자</option>
																		</select>
																	</div>
																	<div class="col-5 px-0 mx-0 d-grid"> 
																		<input id="inputWord" name ="searchWord" type ="text" class="form-control">
																	</div>
																	<div class="col-3 d-grid px-3 mx-0"> 
																		<input class="btn btn-dark" type="button" onclick="formSubmit()" value="검색">
																	</div>
																</div>
															</form>
										</div>
									</div>	
								</div>
								<div class="col-1"><!-- 오른쪽 사이드 여백 --></div>
							<!-- 정보창 3 끝 -->
							</div>
							
							<div class="row py-5"><div class="col"><!-- 패딩과 마진으로 공간 벌리기 --></div></div>
							
							<!-- 정보창1 시작  -->
							<div class="row">
								<div class="col">
									<div class="row">
										<div class="col-1"><!-- 왼쪽 사이드 여백 --></div>
										<!-- 정보창 1의 중요 부분 시작(제목과 내용) 시작-->
										<div class="col">
											<div class="row ">
												<div class="col border-1 border-bottom  pb-2"><span class="fs-4 fw-bold">기록</span> <span style="font-size: 1.2em; color: #8FBC8F">Record</span></div>
											</div>
											
											<div class="row">
												<div class="col-4"></div>
												<div class="col-4 text-center"> <br> <span class="text-danger fs-3"> ${countedPost}</span> <br> <span class="fs-6">총 게시글 수</span></i></div>
												<div class="col-4">
												</div>												
											</div>
										<!-- 정보창 1의 중요 부분 시작(제목과 내용) 끝-->
										</div>
										<div class="col-1"><!-- 오른쪽 사이드 여백 --></div>
									</div>
								</div>
							<!-- 정보창1 끝  -->
							</div>
							
							<div class="row"><div class="col py-4"><!-- 패딩과 마진으로 공간 벌리기 --></div></div>
							
							
						<!-- 왼쪽 콜 끝 -->
						</div>
						
						<!-- 오른쪽 콜 시작 -->
						<div class="col-8"> 
							<div class="row">
								<div class="col">
								
									<!-- 전체 게시글 리스팅 되는 곳 -->
									<div class="row">
									
										<!-- 왼쪽 여백 -->
										<div class="col-1"></div>
										
										<!-- 중간 시작 -->
										<div class="col">
											<div class="row ps-2">
												<div class="col-9 pt-4"> <span class="fw-bold fs-4">자유게시판 전체 글 목록 </span> <span style="font-size: 1.2em; color: #8FBC8F;">List of freeboard</span></div>
												<div class="col-3 text-center" style="color: #8FBC8F;"> <a class="btn text-center py-0 my-0" role="button" href="./createFreeboardPostsPage"><i class="bi bi-keyboard-fill fs-3"></i> <br> <span class="fw-bold">게시글 작성하기</span></a></div>
											</div>
											
											<div class="row pb-2"><div class="col"><!-- 여백 --></div></div>
											
											<!-- 오버플로우 주기 위함 -->
											<div class="row border-top mt-0" style="border-color:#dcdcdc;">
												<div class="col overflow-auto" style="width: 10em; height: 40em;">									
													<!-- 목차에 맞춘 진짜 글 리스팅 되는 로우 시작 -->
													<c:forEach items="${combinedFreeboardList}" var="List">
														
														<div class="row py-3">
															<div class="col-2 text-center">${List.elementFreeboardDto.id}</div>
															<div class="col-5 text-truncate fw-bold text-start">
																<c:forEach items="${newPostList}" var="brand">
																	<c:choose>
																		<c:when test="${brand.id == List.elementFreeboardDto.id }">
																			<i class="bi bi-check2-square fs-5 text-warning"></i>
																		</c:when>
																	</c:choose>
																</c:forEach>
																<a class="link-dark link-underline link-underline-opacity-0" href="./readFreeboardPostPage?id=${List.elementFreeboardDto.id}">
																${List.elementFreeboardDto.title}
																</a><span class="fw-light"> [${List.countPostComment}]</span></div>
					
														
																<div class="col-2 text-end">${List.studentInfo.name}</div>
																<div class="col-2 text-end me-1"><fmt:formatDate value="${List.elementFreeboardDto.created_at}" pattern="yy.MM.dd"/> </div>
														
														<!-- 목차에 맞춘 진짜 글 리스팅 되는 로우 끝 -->
														</div>
													</c:forEach>
												</div>
												
											<!-- 오버플로우 주기 위함 끝-->	
											</div>
										
										<!-- 중간 끝 -->
										</div>
										
										<!-- 오른쪽 여백 -->
										<div class="col-1"></div>
									</div>
								
								</div>
							</div>
							
						<!-- 오른쪽 콜 끝 -->
						</div>
					</div>
				<!-- 양쪽 여백을 준 뒤 중요 내용 들어가는 콜 (안에서 로우 주기) 끝 -->
				</div>
				
				<div class="col-1 border-start"><!-- 오른쪽 여백 --></div>
				
				
				
			<!-- 상단 배너 다음으로 오는 로우와 콜 (주류 내용을 모두 감싼다) 끝-->
			</div>
			
			<div class="row"><div class="col py-4"><!-- 패딩과 마진으로 공간 벌리기 --></div></div>
			
			<!-- 바텀 -->
			<div class="row" style="background-color: #5a5a5a; height: 14em;">
					<div class="col-1"></div>
					<div class="col">
						<div class="row" style="height: 4em;"></div>
						<div class="row">
							<div class="col">
								<span style="font-size: 1.4em; color: #FF8200; font-weight: 500;">개인정보처리방침</span>
								<span style="font-size: 1.2em; color: white; font-weight: 500;">▪</span>
								<span style="font-size: 1.2em; color: white; font-weight: 500;">이메일무단수집거부</span>
							</div>
						</div>
						<div class="row pt-4">
							<div class="col">
								<div class="fw-bold" style="color:#d2d2d2; font-size: 0.9em;">서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층) / 대표자:정현경 / 사업자등록번호:220-90-07535 / 통신판매번호:제 강남-8062호 / TEL:02-561-1911 / FAX:02-538-2613</div>
							</div>
						</div>
						<div class="row pt-2">
							<div class="col">
								<div class="fw-bold" style="color:#d2d2d2; font-size: 0.9em;">©2023 MK NATIONAL UNIVERSITY. ALL RIGHTS RESERVED.</div>
							</div>
						</div>
						<div class="row pt-4" style="border-bottom-style: solid; border-bottom-color: gray; border-bottom-width: 1px;"></div>
					</div>
					<div class="col-1"></div>
				</div>
			
		
		
		
	<!--컨테이너 안에서 감싸는 로우, 콜 끝  -->	
		</div>
	</div>
<!-- 전체 컨테이너 끝 -->
</div>








	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>