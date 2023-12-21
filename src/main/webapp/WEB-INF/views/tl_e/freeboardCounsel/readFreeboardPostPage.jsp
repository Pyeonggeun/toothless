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
<jsp:include page="../../another/commons/studentNaviLogo.jsp"></jsp:include>
<jsp:include page="../commons/studentTopArea.jsp"></jsp:include>

	<!-- 전체 컨테이너 시작-->
	<div class="container-fluid">
	
			<!-- 상단배너 이미지 넣는  로우 시작 -->
			<div class="row">
             <div class="col mx-0 px-0" style="height: 35em; position: relative;">
                 <img class="banner img-fluid" src="/toothless/resources/img/groupCounsel/fff.jpg" style="width: 100%; height: 100%;">
         
                 <div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height: 100%; position: absolute; bottom: 0; left: 0;"></div>
         
                 <div class="title-text" style="font-size: 4em; color: white; position: absolute; bottom: 48%; left: 20.5%; transform: translate(-50%, 50%);">MKU 상담센터 </div>
         
                 <div style="color: white; position: absolute; font-size: 5em; bottom: 36%; transform: translate(-50%, -50%); text-align: center; left: -8%; border-top: 1px; border-top-style: solid; border-top-color: white; width: 80%;"></div>
         
                 <div style="color: white; position: absolute; font-size: 1.5em; bottom: 24.5%; transform: translate(-50%, -50%); text-align: center; left: 19.6%;">자유게시판</div>
         
                 <div style="color: white; position: absolute; font-size: 1.4em; bottom: 17.5%; transform: translate(-50%, -50%); text-align: center; left: 24.2%;"></div>
         
                 <div style="height: 17em; width: 18em; border-radius: 0px 50px 0px 0px; background-color: #679467; opacity: 0.9; position: absolute; bottom: -24.2%; transform: translate(-50%, -50%); text-align: center; left: 85%;"></div>
         
                 <div style="font-weight: 900; color: #464646; position: absolute; font-size: 1.5em; bottom: 34%; transform: translate(-50%, -50%); text-align: center; left: 82%;">Contact Us</div>
         
                 <div style="font-weight: 900; color: white; position: absolute; font-size: 2.6em; bottom: 10%; transform: translate(-50%, -50%); text-align: center; left: 84%;">1544-3054</div>
         
                 <div style="color: white; position: absolute; font-size: 0.9em; bottom: 8%; transform: translate(-50%, -50%); text-align: center; left: 83.5%;">E-mail. mkmk@naver.com</div>
         
                 <div style="color: white; position: absolute; font-size: 0.9em; bottom: 3%; transform: translate(-50%, -50%); text-align: center; left: 82.5%;">Tel. 010-4097-3054</div>
             </div>
         	</div>
		
		<div class="row py-2"><div class="col"><!-- 맨 위 여유공간 --></div></div>
		
		<div class="row">
			<div class="col-2"><!--왼쪽 공간 --></div>
			
			<!-- 양 사이드 공간 있는 상태에서 중요내용 들어가는 콜 시작-->
			<div class="col">
				<!-- 제목 -->
				<div class="row py-2">
					<div class="col-1"><i class="bi bi-list fs-5"></i> ${pickpostMap.freeboardPost.id}</div>
					<div class="col-11 text-end"> <i class="bi bi-eye"></i> ${pickpostMap.freeboardPost.read_count} <i class="bi bi-clock"></i> <fmt:formatDate value="${pickpostMap.freeboardPost.created_at}" pattern="yyyy-MM-dd hh:mm"/></div>
				</div>
				<div class="row border-top border-bottom" style:"border-color: #dcdcdc;">
					<div class="col-2"></div>
					<div class="col-8 text-center fw-bold py-2 fs-3">${pickpostMap.freeboardPost.title}</div>
					<div class="col-2 text-end pt-3 fs-5"><i class="bi bi-person-vcard"></i> ${pickpostMap.studentInfo.name}</div>
				</div>
				<div class="row"></div>
				
				<!-- 로딩된 첨부 이미지파일과 글 내용 -->
				<div class="row">
					<div class="col">
						<c:forEach items="${freeboardImageDtoList}" var="image">
							<div class="row">
								<div class="col"><img class="img-fluid" src="/uploadFiles/${image.freeboard_image_link}"></div>
							</div>
						</c:forEach>
					</div>
				</div>
				
				<!-- 본문 시작 -->
				<div class="row py-2">
					<div class="col fs-5">${pickpostMap.freeboardPost.text}</div>
				<!-- 본문 끝 -->
				</div>
				<!-- 공감 시작-->
				<div class="row border-bottom pb-2" style="border-color: #8FBC8;">
					
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
										<button class= "bi bi-hand-thumbs-up rounded fs-5" type="submit" style="background: none;">
									</form>
								</c:when>
								<c:otherwise>
									<form action="./deleteEmpathyByIdAndPk" method=post>
										<input name="freeboard_id" type="hidden" value="${pickpostMap.freeboardPost.id}">
										<button class="bi bi-hand-thumbs-up-fill rounded fs-5" type="submit" style="background: none;">
									</form>
								</c:otherwise>
							</c:choose>
							<div class="row"><div class="col text-center">${pickpostMap.selectdeEmpathyCount}</div></div>
					
						<!-- 공감 따봉칸 끝 -->
						</div>
				<!-- 공감 끝-->	
				</div>
				
				<!-- 글수정 글삭제 글목록 버튼 로우 시작 -->
				<div class="row py-2">
						<div class="col text-end">
							<c:if test="${pickpostMap.freeboardPost.student_pk == sessionStudentInfo.student_pk}">
								<a class="btn btn-sm border" role="button"  href="./updateFreeboardPostPage?id=${pickpostMap.freeboardPost.id}" style="border-color: #8FBC8F; color: #8FBC8F;">글 수정</a>
								<a class="btn btn-sm btn-outline-warning" role="button" href="./deleteFreeboardPostProcess?id=${pickpostMap.freeboardPost.id}" >글 삭제</a>
							</c:if>
							<a role="button" class="btn  btn-sm text-white" style="background-color: #8FBC8F;" type="button" href="./freeboardCounselPage"> 글 목록 </a>
						</div>
				<!-- 글수정 글삭제 글목록 버튼 로우 끝 -->
				</div>
				
				<div class="row"><!-- 여유공간 --></div>
				
				<!-- 댓글입력창 +버튼 기타 시작 -->
				<div class="row py-2">
					<div class="col-1"><!-- 여유공간 --></div>	
								
					<div class="col border-bottom" style="border-color: #8FBC8F;"> 
					
					<!-- 댓글작성 시작-->
					<form id="formComment" action="./insertFreeboardComment" method=post>
							<div class="row py-2">
								<div class="col text-start"> 
									<span class="text-danger">주의</span>) 상대방을 모욕하거나 불법 행위, 상업 행위 등과 관련된 댓글은 작성해서는 안 됩니다. 
								</div>
							</div>
							<div class="row pb-2">
								<div class="col-10 text-start">
									<input id="inputComment" name="text" type="text" class="form-control" style="width:100%; height:2.2em;" maxlength="300" placeholder="최대 100글자까지 작성가능합니다.">
									<input name="freeboard_id" type="hidden" value="${pickpostMap.freeboardPost.id } ">									
								</div>
								<div class="col-2 text-center"> 
									<input class="form-control text-white fw-bold py-0" type="button" onclick="formSubmit()" style="width:100%; height:2.2em; background-color: #8FBC8F;" value="댓글 달기">
								</div>
							</div>
							
							
							
						</form>
				<!-- 댓글입력창 +버튼 기타 끝 -->
					</div>
					
					<div class="col-1"><!-- 여유공간 --></div>	
				</div>

				<!-- 댓글리스트 시작 -->
				<div class="row">	
					<div class="col-1"><!-- 여유공간 --></div>
						<div class="col-10">
						<c:forEach items="${selectFreeboardCommentList}" var="comment">
							<c:if test="${pickpostMap.freeboardPost.id == comment.elementFreeboardCommentDto.freeboard_id}">
								<div class="row border-bottom " style="border-color: #8FBC8F;">
									<div class="col">
							
										<!-- 이름과 생성일 날짜 나오게  -->
										<div class="row ps-1 text-start pt-1"> 
											<div class="col-4 ps-1 "> <span class="fs-5"> <i class="bi bi-person-vcard"></i> ${comment.studentInfo.name} </span> <i class="bi bi-clock"></i> <fmt:formatDate value="${comment.elementFreeboardCommentDto.created_At}" pattern="yyyy-MM-dd hh:mm"/></div>
										
											<div class="col"></div>
										</div>
										
										<!-- 위 row에 정보 나온 글쓴이가 쓴 댓글 -->
										<div class="row ps-2 fs-5">${comment.elementFreeboardCommentDto.text}</div>
									</div>
								</div>	
							</c:if>
						</c:forEach>
						
						</div>
						
						<div class="col-1"><!-- 여유공간 --></div>
					<!-- 댓글리스트 끝 -->
					</div>
				
		
				<div class="row py-3"></div>
				
			<!-- 양 사이드 공간 있는 상태에서 중요내용 들어가는 콜 끝-->
			</div>
			
			<div class="col-2"><!--오른쪽 공간 --></div>
		</div>
		
		
	<!-- 전체 컨테이너 끝 -->	
	</div>	
	
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>