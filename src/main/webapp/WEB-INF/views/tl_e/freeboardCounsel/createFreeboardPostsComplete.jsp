<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	window.addEventListener("beforeunload", function(event) {
	});
	
	function beforeunload() {
		// 중복 업로드를 방지할 요소의 disabled 속성을 true로 설정
		document.querySelector(".doubleclick").setAttribute("disabled", "true");
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
	
	<!-- 중요부분 시작 -->
	<div class="row">
	
		<!-- 좌측공란 -->
		<div class="col-2"></div>
	
		<!-- 중간 중요 내용공간 시작 -->
		<div class="col">
		
			<div class="row"><div class="col py-4"></div></div>
		
		
			<div class="row py-3">
				<div class="col text-center ">
					<span class="fw-bold fs-3">상담센터 자유게시판에 게시물 작성이 완료됐습니다.</span>
				</div>
			</div>
		
		
			<div class="row py-3">
				<div class="col text-center">
					<i class="bi bi-check-circle" style="font-size: 5em; font-color: #8FBC8F;"></i>
				</div>
			</div>
		
			<div class="row py-3">
				<div class="col text-center ">
					<a class="btn fw-bold text-white doubleclick" role="button" href="freeboardCounselPage" style="background-color:#8FBC8F; font-size: 1.5em;">글 목록으로 돌아가기</a>
				</div>
			</div>
			
			<div class="row"><div class="col py-4"></div></div>
			
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