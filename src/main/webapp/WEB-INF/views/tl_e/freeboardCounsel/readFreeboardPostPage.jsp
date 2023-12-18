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
			const formComment = document.getElementById("formComment");
			
			const inputComment = document.getElementById("inputComment");
			const inputCommentRegex =/^([a-zA-Z0-9_-]{2,})$/;
			if(!inputCommentRegex.test ==(inputComment.value)){
				alert("댓글란이 비어있습니다. 내용을 작성해주세요");
				inputComment.focus();
				return;
			}
						
			formComment.submit(); 
			
		}
	
	</script>


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
	
			<!-- 상단 이미지 배너 -->
			<div class="row mx-0 px-0">
				<div class="col mx-0 px-0">
						<div class="row">
							<div class="col mx-0 px-0" style="height: 35em;">
								<img class="banner img-fluid" src="./../../resources/img/groupCounsel/fff.jpg" style="width:100%; height: 100%;">
							
								<div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height:100%; position: relative; bottom: 100%;"></div>
								<!-- 
								<div class="title-text fw-bold" style="font-size: 3.5em; color: white; top: 70%;">Mk University | 상담센터</div>
								<!--<div class="title-text" style="font-size: 1.5em; color: white; top: 42%;"></div> -->
								<div style="color: white; position: relative; font-size: 4em; bottom: 148%; transform: translate(-50%, -50%); text-align: center; left: 18.5%;">MKU 상담센터</div>
								<div style="color: white; position: relative; font-size: 5em; bottom: 154%; transform: translate(-50%, -50%); text-align: center; left: -18%; border-top:1px; border-top-style: solid; border-top-color: white;"></div>
								<div style="color: white; position: relative; font-size: 1.4em; bottom: 148%; transform: translate(-50%, -50%); text-align: center; left: 19.6%;">상담센터 자유게시판</div>
								<div style="color: white; position: relative; font-size: 1.4em; bottom: 147%; transform: translate(-50%, -50%); text-align: center; left: 24.3%;"></div>		
								<div style="height:13em; width:14em; border-radius: 0px 50px 0px 0px; background-color: #679467; opacity:0.9; position: relative; font-size: 1.4em; bottom: 155.2%; transform: translate(-50%, -50%); text-align: center; left: 86.7%;"></div>				
								<div style="font-weight:900; color: #464646; position: relative; font-size: 1.5em; bottom: 225%; transform: translate(-50%, -50%); text-align: center; left: 84%;">Contact Us</div>
								<div style="font-weight:900; color: white; position: relative; font-size: 2.8em; bottom: 212%; transform: translate(-50%, -50%); text-align: center; left: 86.3%;">1544-3054</div>
								<div style="color: white; position: relative; font-size: 0.9em; bottom: 215%; transform: translate(-50%, -50%); text-align: center; left: 85.5%;">E-mail. mkmk@naver.com</div>
								<div style="color: white; position: relative; font-size: 0.9em; bottom: 214%; transform: translate(-50%, -50%); text-align: center; left: 84.5%;">Tel. 010-4097-3054</div>
							</div>
						</div>
					</div>
			<!-- 상단배너 이미지 넣는  로우 끝 -->
			</div>

	<!--중요 내용 들어갈 row 시작  -->
	<div class="row"> 
	
		<!-- 왼쪽 공간 주는 col -->
		<div class="col-2">왼쪽</div>
		
		<!-- 중요 내용 들어가는 핵심 col -->
		<div class="col">
		
			<div class="row"> 
				<div class="col fs-4">
					상담센터 <span class="fs-4"> > 자유게시판 </span>  <span class="fs-3 fw-bold"> > 게시물 상세 </span>
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
					 	<i class="bi bi-eye"></i> ${pickpostMap.freeboardPost.read_count}
					 	<i class="bi bi-clock"></i> <fmt:formatDate value="${pickpostMap.freeboardPost.created_at}" pattern="yyyy-MM-dd hh:mm"/>
					</div> 
				</div>
				
			<!--내용을 제외한 주요 정보들 끝-->	
				</div>	
			</div>
			
			<!-- 로딩된 첨부 이미지파일과 글 내용 -->
			<div class="row">
				<div class="col">
				
					<c:forEach items="${freeboardImageDtoList}" var="image">
						<div class="row">
							<div class="col">
								<img class="img-fluid" src="/uploadFiles/${image.freeboard_image_link}">
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="row py-3 fs-4">
				${pickpostMap.freeboardPost.text }
			</div>
			
			<div class="row text-center py-1">
				<div class="col"></div>
				<div class="col"></div> 
			</div>
			
			<!-- 공감 /  글목록 돌아가기 버튼 -->
			<div class="row py-2 border-top border-secondary">
			
			<!-- 공감버튼 중간에 오게 하기 위한  -->
			<div class="col-5"></div>
				
				<!-- 공감 -->
				<div class="col-2"> 
					<!-- 공감 두개칸 전체 시작 -->
					<div class="row">
					
						<!-- 공감 따봉칸 시작 -->
						<div class="col text-center bg-opicity-0">
							<!-- freeboard_id와 student_pk를 넘겨주는 폼 액션 이를 통해 조건에 맞는 공감dto 가져온다 -->
							<form action="./submitAndSelectEmpathy" method=post>
								<input name="freeboard_id" type="hidden" value="${pickpostMap.freeboardPost.id}">
							</form>
							
							<!-- 0이면 공감 누를 수 있게 1이면 삭제하게 하기   -->
							
							
							<c:choose>
								<c:when test="${countedEmpathy.countedEmpathy == 0}">
								<!--	<a href="./insertEmpathy?freeboard_id=${pickpostMap.freeboardPost.id}"><i bi bi-hand-thumbs-up rounded fs-5></i></a>-->
									 <form action="./insertEmpathy" method=post>
										<input name="freeboard_id" type="hidden" value="${pickpostMap.freeboardPost.id}">
										<button class= "bi bi-hand-thumbs-up rounded fs-5" type="submit" >
									</form>
								</c:when>
									
								<c:otherwise>
								
								<form action="./deleteEmpathyByIdAndPk" method=post>
									<input name="freeboard_id" type="hidden" value="${pickpostMap.freeboardPost.id}">
									<button class="bi bi-hand-thumbs-up-fill rounded fs-5" type="submit" >
								</form>
								</c:otherwise>
							</c:choose>
							<div class="row"><div class="col text-center">${pickpostMap.selectdeEmpathyCount}</div></div>
						
						

					
						<!-- 공감 따봉칸 끝 -->
						</div>
						
						<!-- 공감 수량 카운트 칸 -->
						<div class="row"><div class="col"></div></div>
						
					<!-- 공감 두개칸 전체 끝 -->
					</div>
				</div>
				
				<!-- 공감버튼 중간에 오게 하기 위한 -->
				<div class="col-3"></div>
				
				<!-- 글 목록 돌아가기 -->
				<div class="col-2 text-end">
					<a role="button" class="btn text-white" style="background-color: #133369;" type="button" href="./freeboardCounselPage"> 글 목록 </a>
				</div>
				
			
			<!-- 글수정 삭제 글목록 돌아가기 버튼 끝 -->	
			</div>
			
			<!-- 댓글창 -->
			<div class="row text-center">
			
			<!-- 댓글창 내에서 좌측 공간주는 col -->
			<div class="col-1"></div>
			
			<!-- 본 댓글창 col -->
				<div class="col">
				
				<!-- 댓글입력창 +버튼 기타 시작 -->
					<div class="row">
						<div class="col border border-black rounded"> 
						
						<!-- 댓글작성 시작-->
						<form id="formComment" action="./insertFreeboardComment" method=post>
								<div class="row pt-2">
									<div class="col-8 text-start ms-1 "> 
										댓글을 남겨주세요
									</div>
									<div class="col text-end me-1"> 
										<input class="form-controller" type="button" onclick="formSubmit()" value="댓글 달기">
									</div>
								</div>
								<div class="row m-1">
									<input id="inputComment" name="text" type="text" placeholder="최대 100글자까지 작성가능합니다.">
									<input name="freeboard_id" type="hidden" value="${pickpostMap.freeboardPost.id } ">									
								</div>
								
								
								
							</form>
					<!-- 댓글입력창 +버튼 기타 끝 -->
						</div>
					</div>
					
					
					<!-- 댓글 리스팅 창 -->
					<div class="row">
						<div class="col">
						
						<div class="row pt-1"> <div class="col text-start"> <i class="bi bi-list-ul"></i> 향후 댓글 수 카운팅해올 예정 </div></div>
							
						<div class="row">	
							<c:forEach items="${selectFreeboardCommentList}" var="comment">
								<c:if test="${pickpostMap.freeboardPost.id == comment.elementFreeboardCommentDto.freeboard_id}">
									<div class="row border-bottom border-dark ">
										<div class="col">
								
											<!-- 이름과 생성일 날짜 나오게  -->
											<div class="row ps-1 text-start pt-1"> 
												<div class="col-4 ps-1 "> <span class="fs-5"> <i class="bi bi-person-vcard"></i> ${comment.studentInfo.name} </span> <i class="bi bi-clock"></i> <fmt:formatDate value="${comment.elementFreeboardCommentDto.created_At}" pattern="yyyy-MM-dd hh:mm"/></div>
											
												<div class="col"></div>
											</div>
											
											<!-- 위 row에 정보 나온 글쓴이가 쓴 댓글 -->
											<div class="row ps-2 fs-4">${comment.elementFreeboardCommentDto.text}</div>
										</div>
									</div>	
								</c:if>
							</c:forEach>
						</div>
						
						<div class="row py-2"></div>
							
						</div>
					</div>
					
					
	
				
				<!-- 댓글창 끝 -->
				</div>
				
				<!-- 댓글창 내에서 우측 공간주는 col -->
				<div class="col-1"></div>
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