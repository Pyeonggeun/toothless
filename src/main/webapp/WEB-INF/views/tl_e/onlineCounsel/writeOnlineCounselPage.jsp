<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../commons/studentTopArea.jsp"></jsp:include>

	<div class="row">
		<div class="col">
		 	<hr>
		</div>
	</div>
	<div class="row">
	    <div class="col mx-0 px-0" style="height: 35em; position: relative;">
			<img class="banner img-fluid" src="/toothless/resources/img/groupCounsel/fff.jpg" style="width: 100%; height: 100%;">
			
			<div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height: 100%; position: absolute; bottom: 0; left: 0;"></div>
			
			<div class="title-text" style="font-size: 4em; color: white; position: absolute; bottom: 48%; left: 20%; transform: translate(-50%, 50%);">온라인 상담 신청</div>
			
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


	<div class="container">
	
		<div class="row">

		<!-- 좌측 메뉴  -->
			<div class="col-2">
				<div class="row mt-5">
					<div class="col border-bottom border-dark py-3 rounded d-flex justify-content-center d-flex align-items-center" style="background-color: #679467; color: white; font-size: 1.2em; font-weight: bold;">
						상담안내
					</div>
				</div>
				<div class="row">
					<div class="col border-bottom py-1 rounded d-flex justify-content-center d-flex align-items-center" style="font-size: 1.1em; text-align: center; background-color: beige;">
						<a class="link-dark link-offset-2 link-underline link-underline-opacity-0" href="./studentMyCounselPage">내 상담</a>
					</div>
				</div>
				<div class="row">
					<div class="col border-bottom py-1 rounded d-flex justify-content-center d-flex align-items-center" style="font-size: 1.1em; text-align: center; background-color: beige;">
						<a class="link-dark link-offset-2 link-underline link-underline-opacity-0" href="./writeOnlineCounselPage">상담 작성</a>
					</div>
				</div>
				<div class="row">
					<div class="col border-bottom py-1 rounded d-flex justify-content-center d-flex align-items-center" style="font-size: 1.1em; text-align: center; background-color: beige;">
						<a class="link-dark link-offset-2 link-underline link-underline-opacity-0" href="#">집단상담</a>
					</div>
				</div>
				<div class="row">
					<div class="col"></div>
				</div>
				
				
				<!-- 의사 이미지 -->
				<div class="row">
					<div class="col mt-5 pt-5">
						<img src="../../resources/img/onlineCounsel/doctor.png" width= "100%" height= "auto" style="border-radius: 10px;">
					</div>
				</div>
			</div>
		
			<div class="col">
			
			<!-- 미니 로케이션 바 -->
			
				<div class="row">
					<div class="col-1"></div>
				</div>
				<div class="row mt-4" style="font-size: 0.9em; color: gray;">
					<div class="col-1"></div>
					<div class="col">
						<span style="font-size: 1.3em;">
							<a href="/toothless/another/student/mainPage" class="link-dark link-offset-2 link-underline link-underline-opacity-0"><i class="bi bi-house"></i></a>
						</span>
						&nbsp;&nbsp;
						<span style="font-weight: bold;">&gt;</span>
						&nbsp;&nbsp; <a href="/toothless/tl_e/commons/counselCenterStudentMainPage" class="link-dark link-offset-2 link-underline link-underline-opacity-0">상담센터&nbsp;&nbsp;</a>
						<span style="font-weight: bold;">&gt;</span>
						&nbsp;&nbsp; <a href="/toothless/tl_e/onlineCounsel/onlineCounselMainPage" class="link-dark link-offset-2 link-underline link-underline-opacity-0">온라인 상담&nbsp;&nbsp;</a>
						<span style="font-weight: bold;">&gt;</span>
						&nbsp;&nbsp; <span style="font-weight: bold;">내 상담</span>
					</div>
				</div>
				
				
				
				
				
				<!-- 상담 작성 -->
				<div class="row">
					<div class="col-1"></div>
					<div class="col mt-3" style="font-weight: bold; font-size: 1.4em;">
						상담 작성
					</div>
				</div>
				
				
				
				<div class="row mt-3">
					<div class="col-1"></div>
					<div class="col mt-3" style="text-align: justify-content; font-size: 1.1em;">
						<i class="bi bi-person-arms-up" style="color: #679467;"></i>${sessionStudentInfo.name } 학생
					</div>
				</div>
				<form action="./writeOnlineCounselProcess" method="post">
					<div class="row mt-3" >
						<div class="col-1"></div>
						<div class="col">
							<i style="color: orange;" class="bi bi-caret-right-fill"></i><span>&nbsp;카테고리</span>
						</div>
						<C:forEach items="${category }" var="category">
							<div class="col">
								<div class="form-check">
									<input class="form-check-input" name="type_category_id" type="radio" value="${category.id }">${category.name }
									 <label class="form-check-label" for="flexRadioDefault1">
									</label>
								</div>
							</div>
						</C:forEach>
						
					</div>		
					<div class="row mt-4">
						<div class="col-1"></div>
						<div class="col mt-1">
							<input name="title" type="text" class="form-control" placeholder="제목">
						</div>
					</div>
					<div class="row mt-4">
						<div class="col-1"></div>
						<div class="col">
							<textarea name="text" class="form-control" placeholder="상담 내용" id="floatingTextarea2" style="height: 300px; "></textarea>
						</div>
					</div>
					<input name="student_id" type="hidden" value="${sessionStudentInfo.student_pk }">
					<div class="row mt-3">
						<div class="col-5"></div>
						<div class="col-5"></div>
						<div class="col" style="text-align: right;">
							<input class="btn" type="submit" value="Done" style=" background-color: #679467; color: beige;">
							<a class="btn" href="./onlineCounselMainPage" class="link-dark link-offset-2 link-underline link-underline-opacity-0" style=" background-color: #679467; color: beige;">Back</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
		
		
		
	<!-- 풋터 -->
	<div class="row mt-5" style="background-color: #5a5a5a;">
		<div class="col-1"></div>
		<div class="col">
			<div class="row" style="height: 3em;"></div>
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
</body>
</html>