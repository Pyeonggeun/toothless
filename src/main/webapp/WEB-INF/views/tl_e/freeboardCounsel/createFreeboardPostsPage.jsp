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
			
			<div class="row py-3"><div class="col"> <!--공간주는--> </div></div>
			
			<!-- 메인이 되는 내용(두개로 쪼갤 예정) -->
			<div class="row">
			
				<div class="col-1"><!-- 왼쪽 빈공간 주는 콜 --></div>
			
				<!-- 메인이 되는 콜 -->			
				<div class="col">
				
					<!-- 경고창 로우 -->
					<div class="row">
					
					<div class="col-1"></div>
					
						<div class="col">
							<div class="row border-botttom border-black py-4 my-2">
			
								<div class="col-1 text-center">
									<i class="bi bi-exclamation-circle fs-1"></i>
								</div>	
							
								<div class="col-11 fs-5">
								자유게시판은 학생들의 글과 의견을 자유롭게 제시할 수 있는 게시판입니다.
								상업성광고, 정치적 목적 게시물, 특정단체나 개인의 명예훼손 게시물, 음란물 등 미풍양속에 어긋나는 게시물 게시자는 
								<span class="fw-bold text-danger">학사 징계</span>와 함께 <span class="fw-bold text-danger">민형사상 불이익</span>을 받을 수 있으니 게시판 성격에 맞는 내용만 게시하시기 바랍니다.
								</div>
				
							</div>
						</div>
						
						<div class="col-1"></div>
					<!--경고창 로우 끝  -->
					</div>	
					
					<div class="row py-2"><div class="col"> <!--공간주는--> </div></div>
					<div class="row"><div class="col text-center"> -현재 상담자유게시판에 <span class="fw-bold">게시글을 작성</span> 하는 페이지 입니다. - </div></div>
					<div class="row py-2"><div class="col"> <!--공간주는--> </div></div>
					
					<!-- 두개로 쪼개질 로우 왼쪽은 제목과 비용 오른쪽은 각종 버튼 + 폼 액션으로 감쌀 예정 -->
					<form id="formText" action="./createFreeboardPostsProcess" method=post enctype="multipart/form-data">
					<input name="student_pk" type="hidden" value="${sessionStudentInfo.student_pk}">
					<div class="row">
						<!--제목과 내용 입력칸  -->
						
						<div class="col-9">
							<div class="row"><div class="col">	<input id="inputTitle" name="title" type="text" placeholder="이 공간에 제목을 입력하시면 됩니다..."> </div></div>
							<div class="row"><div class="col"> <textarea id="inputText" name = "text" cols=160 rows=20 placeholder="이 공간에 원하는 내용을 입력하시면 됩니다..."></textarea> </div></div>
						</div>
						
						<!-- 각종 버튼  -->
						<div class="col-3">
						
							<div class="row py-3"><div class="col"> <!--공간주는--> </div></div>
						
							<div class="row">
								<div class="col-3 text-end"> 
									<i class="bi bi-person-vcard fs-1"></i>   
								</div>
								<div class="col-9"> 
									<span class="fs-6">현재 작성자</span> <br> 
									<span class="fs-3">${sessionStudentInfo.name} 님</span>
								</div>
							</div>
							<div class="row py-3"><div class="col"> <!--공간주는--> </div></div>
							<div class="row"><div class="col"> <i> <input class="bi bi-person-vcard" name="imgFiles" type="file" accept="image/*" multiple></i> </div></div>
							<div class="row py-3"><div class="col"> <!--공간주는--> </div></div>
							<div class="row"><div class="col"> <i class="bi bi-floppy"></i> <input type="button" onclick="formSubmit()" class="btn fs-3 py-1 rounded" value="글 작성 완료"> </div></div>
						</div>
					</div>
					<!-- 폼액션 끝 -->
					</form>
					
				<!-- 메인이 되는 콜 끝 -->		
				</div>
				
				<div class="col-1"><!-- 오른쪽 빈공간 주는 콜 --></div>
			</div>
			
			<div class="row py-3"><div class="col"> <!--공간주는--> </div></div>
			
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
			
			
	<!-- 전체 컨테이너 끝 -->	
	</div>
			
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script> 
</body>
</html>