<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function formSubmit(){
			const formText = document.getElementById("formText");
			
			const inputTitle = document.getElementById("inputTitle");
			const inputTitleRegex =/^([a-zA-Z0-9_-]{2,})$/;
			if(!inputTitleRegex.test ==(inputTitle.value)){
				alert("게시글의 제목을 두글자 이상 입력하셔야 합니다.");
				inputTitle.focus();
				return;
			}
				
			const inputText = document.getElementById("inputText");
			const inputTextRegex =/^([a-zA-Z0-9_-]{2,})$/;
			if(!inputTextRegex.test ==(inputText.value)){
				alert("내용을 두 글자 이상 입력하셔야 합니다.")
				inputText.focus();
				return;
			}
						
			formText.submit(); 
			
		}
	
	</script>



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>

<jsp:include page="../commons/studentTopArea.jsp"></jsp:include>

<!-- 전체 컨테이너 시작-->
	<div class="container-fluid">
	
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
		<div class="col" >
		
			<div class="row"> 
				<div class="col">
					<span class="fs-4">상담센터</span> <span class="fs-4"> > 자유게시판 </span>  <span class="fs-3 fw-bold"> > 게시물 작성 </span>
				</div> 
			</div>
			
			
			
			<!-- 안내문 -->
			<div class="row">
			
				<div class="col-1"></div>
			
				<!-- 중간 안내문 -->
				
					<div class="col">
						<div class="row border border-2 border-black py-4 my-2">
			
							<div class="col-1 fs-1 text-center">
								<i class="bi bi-exclamation-circle"></i>
							</div>	
						
							<div class="col">
							자유게시판은 학생들의 글과 의견을 자유롭게 제시할 수 있는 게시판입니다.<br>
							상업성광고, 정치적 목적 게시물, 특정단체나 개인의 명예훼손 게시물, 음란물 등 미풍양속에 어긋나는 게시물 게시자는 <br>
							<span class="fw-bold text-danger">학사 징계</span>와 함께 <span class="fw-bold text-danger">민형사상 불이익</span>을 받을 수 있으니 게시판 성격에 맞는 내용만 게시하시기 바랍니다.
							</div>
				
						</div>
					</div>
				
				<div class="col-1"></div>
			</div>
			
			<!-- 안내문 글작성 내용 들어가는 공간 시작 -->
			<div class="row"> 
				<div class="col">
				
			<!-- 여기에서 부터  -->	
			<!--내용을 제외한 주요 정보들 -->
			
			<!-- 폼 액션 시작 -->
			<form id="formText" action="./createFreeboardPostsProcess" method=post enctype="multipart/form-data">
			<input name="student_pk" type="hidden" value="${sessionStudentInfo.student_pk}">
			
				<div class="row">
					<div class="col">
					
					<!-- 글 작성자 -->
					<div class="row border-top border-3 border-black py-1 px-3 mt-2"> 
						<div class="col fs-5 text-start">
						 	<i class="bi bi-person-vcard"></i> ${sessionStudentInfo.name} 님께서 상담센터 자유게시판에 게시글을 작성중입니다
						</div> 
					</div>
						
					<!-- 제목 입력 받을 칸 (향후에 손보기-->
					<div class="row fs-5 border border-start-0 border-end-0 border-2 border-black py-2 px-3"> 
						
						 	<input id="inputTitle" name="title" type="text" placeholder="이 공간에 제목을 입력하시면 됩니다...">
					
					</div>
					
				<!--내용을 제외한 주요 정보들 끝-->	
					</div>	
				</div>
				
				<!-- 글 내용 -->
				<div class="row pt-3">
					<div class="col text-center">
						<textarea id="inputText" name = "text" cols=160 rows=20 placeholder="이 공간에 원하는 내용을 입력하시면 됩니다..."></textarea>
					</div>
				</div>
				
				<!-- 글 내용과 작성완료 버튼 사이에 파일 업로드 위한 공간  -->
				<div class="row">
					<input name="imgFiles" type="file" accept="image/*" multiple>
					
				</div>
			
				<div class="row py-2">
					<div class="col-5"></div>
					<div class="col text-center"><input type="button" onclick="formSubmit()" class="btn text-white py-1 rounded" style="background-color:#133369;" value="글 작성 완료"></div>
					<div class="col-5"></div>
				</div>
			<!-- 폼액션 끝 -->
			</form>
			
			<!-- 안내문 글작성 내용 들어가는 공간 끝 -->
			</div>
		</div>
		
	<!-- 중요 내용 들어가는 핵심 col 끝 -->
	</div>
	
	<!-- 오른쪽 공간 주는 col -->
		<div class="col-2"></div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script> 
</body>
</html>