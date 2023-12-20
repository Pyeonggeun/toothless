<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<div class="col mx-0 px-0" style="height: 35em;">
			<img class="banner img-fluid" src="/toothless/resources/img/groupCounsel/fff.jpg" style="width:100%; height: 100%;">
		
			<div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height:100%; position: relative; bottom: 100%;"></div>
			<!-- 
			<div class="title-text fw-bold" style="font-size: 3.5em; color: white; top: 70%;">Mk University | 상담센터</div>
			<!--<div class="title-text" style="font-size: 1.5em; color: white; top: 42%;"></div> -->
			<div style="color: white; position: relative; font-size: 4em; bottom: 148%; transform: translate(-50%, -50%); text-align: center; left: 18.5%;">MKU 온라인 상담센터</div>
			<div style="color: white; position: relative; font-size: 5em; bottom: 154%; transform: translate(-50%, -50%); text-align: center; left: -18%; border-top:1px; border-top-style: solid; border-top-color: white;"></div>
			<div style="color: white; position: relative; font-size: 1.4em; bottom: 148%; transform: translate(-50%, -50%); text-align: center; left: 19.6%;">너와 나 그리고 우리를 위한 마음을 위한 치료</div>
			<div style="color: white; position: relative; font-size: 1.4em; bottom: 147%; transform: translate(-50%, -50%); text-align: center; left: 24.3%;">마음도 관리가 필요합니다</div>		
			<div style="height:13em; width:14em; border-radius: 0px 50px 0px 0px; background-color: #679467; opacity:0.9; position: relative; font-size: 1.4em; bottom: 155.2%; transform: translate(-50%, -50%); text-align: center; left: 86.7%;"></div>				
			<div style="font-weight:900; color: #464646; position: relative; font-size: 1.5em; bottom: 225%; transform: translate(-50%, -50%); text-align: center; left: 84%;">Contact Us</div>
			<div style="font-weight:900; color: white; position: relative; font-size: 2.8em; bottom: 212%; transform: translate(-50%, -50%); text-align: center; left: 86.3%;">1544-3054</div>
			<div style="color: white; position: relative; font-size: 0.9em; bottom: 215%; transform: translate(-50%, -50%); text-align: center; left: 85.5%;">E-mail. mkmk@naver.com</div>
			<div style="color: white; position: relative; font-size: 0.9em; bottom: 214%; transform: translate(-50%, -50%); text-align: center; left: 84.5%;">Tel. 010-4097-3054</div>
		</div>
	</div>
	
	
	
	
	
	<div class="row">
		<div class="col-1"></div>
		<div class="col-2">
			<div class="row mt-5">
				<div class="col border-bottom border-dark py-3 rounded d-flex justify-content-center d-flex align-items-center" style="background-color: darkgreen; color: beige; font-size: 1.2em; font-weight: bold;">
					상담안내
				</div>
			</div>
			<div class="row">
				<div class="col border-bottom py-1 rounded d-flex justify-content-center d-flex align-items-center" style="font-size: 1.1em; text-align: center; background-color: beige;">
					<a class="link-dark link-offset-2 link-underline link-underline-opacity-0" href="#">내 상담</a>
				</div>
			</div>
			<div class="row">
				<div class="col border-bottom py-1 rounded d-flex justify-content-center d-flex align-items-center" style="font-size: 1.1em; text-align: center; background-color: beige;">
					<a class="link-dark link-offset-2 link-underline link-underline-opacity-0" href="#">심리검사</a>
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
			<div class="row">
				<div class="col mt-5 pt-5">
					<img src="../../resources/img/onlineCounsel/doctor.png" width= "100%" height= "auto" style="border-radius: 10px;">
				</div>
			</div>

		</div>
		<div class="col">
			<div class="row">
				<div class="col-1"></div>
				<!-- <div class="col d-flex align-items-center" style="font-weight: bold; font-size: 1.5em;">
					온라인상담
				</div> -->
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
					&nbsp;&nbsp; <span style="font-weight: bold;">온라인상담</span>
				</div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col">
					<hr>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-1"></div>
				<div class="col ms-3" style="font-size: 1.2em;">
					<span style="color: green; font-size: 2.0em;"><i class="bi bi-check-lg"></i></span>&nbsp;&nbsp;이런 경우 <span style="color: green;">상담</span>이 필요해요&nbsp;&nbsp;!
				</div>
			</div>
		<div class="container text-center">
			<div class="row mt-3 g-2">
				<div class="col-1"></div>
				<div class="col">
					<div class="p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">자기이해</div>
				</div>
				<div class="col">
					<div class="p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">마음이 불안할 때</div>
				</div>
				<div class="col">
					<div class="p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">실패감, 의욕상실을 느낄 때</div>
				</div>
			</div>
			<div class="row mt-1 g-2">
				<div class="col-1"></div>
				<div class="col">
					<div class="p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">적성, 전공, 진로가 고민이 될 때</div>
				</div>
				<div class="col">
					<div class="p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">자신감이 없을 때</div>
				</div>
				<div class="col">
					<div class="p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">자살 등의 죽음을 생각하게 될 때</div>
				</div>
			</div>
			<div class="row mt-1 g-2">
				<div class="col-1"></div>
				<div class="col">
					<div class="p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">대인관계가 힘들 때</div>
				</div>
				<div class="col">
					<div class="p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">학업에 집중하기 힘들 때</div>
				</div>
				<div class="col">
					<div class="p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">무언가에 집착하고 통제가 안될 때</div>
				</div>
			</div>
			<div class="row mt-3 pt-5">
				<div class="col" style="font-weight: bold; font-size: 1.5em;'">
					상담 신청 및 진행과정
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-1"></div>
				<div class="col" style="background-color: whitesmoke;">
					<div class="row mx-1 fw-bold">
						<div class="col mt-5">
							<div class="p-1" style=" border: medium solid red; border-radius: 0.5em; font-size: 0.9em; background-color: white;">STEP 01</div>
						</div>
						<div class="col mt-5">
							<div class="p-1" style=" border: medium solid navy; border-radius: 0.5em; font-size: 0.9em; background-color: white;">STEP 02</div>
						</div>
						<div class="col mt-5">
							<div class="p-1" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em; background-color: white;">STEP 03</div>
						</div>
						<div class="col mt-5">
							<div class="p-1" style=" border: medium solid green; border-radius: 0.5em; font-size: 0.9em; background-color: white;">STEP 04</div>
						</div>
					</div>
					<div class="row mx-1 my-2 pt-2 pb-4 fw-bold">
						<div class="col my-3">
							<div class="p-3" style=" border: medium solid red; border-radius: 0.5em; font-size: 0.85em; background-color: white;">온라인상담센터 접속</div>
						</div>
						<div class="col my-3">
							<div class="p-3" style=" border: medium solid darkblue; border-radius: 0.5em; font-size: 0.85em; background-color: white;">상담 작성 버튼 누르기</div>
						</div>
						<div class="col my-3">
							<div class="p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.85em; background-color: white;">전문 상담사의 답변 확인하기</div>
						</div>
						<div class="col my-3">
							<div class="p-3" style=" border: medium solid green; border-radius: 0.5em; font-size: 0.85em; background-color: white;">온라인 상담 완료</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-1"></div>
	</div>
	<div class="row mt-5">
		<div class="col-5"></div>
		<div class="col text-center">
			<a href="./writeOnlineCounselPage" class="link-light link-offset-2 link-underline link-underline-opacity-0 btn d-grid btn-success">상담 작성</a>
		</div>
		<div class="col-3"></div>
	</div>
	<div class="row mt-5">
		<div class="col">
			<hr>
		</div>
	</div>
	<div class="row mt-5" style="background-color: #5a5a5a; height: 14em;">
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

</body>
</html>



			

		<!-- <div class="col">
			<div class="row">
				
			</div>
			<div class="row">
				<div class="col" style="font-size: 1.4em; text-align: center; ">개인상담</div>			
			</div>
			<div class="row">
				<div class="col" style="font-size: 1.4em; text-align: center; ">집단상담</div>			
			</div>
			<div class="row">
				<div class="col" style="font-size: 1.4em; text-align: center; ">워크숍</div>
			</div>
		</div> -->



<%-- <div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col"></div>
		</div>
		<div class="row mt-5">
			<div class="col" style="font-weight: bold; text-align: center; font-size: 2.2em; background-color: darkgreen; color: beige;">내 상담</div>
			<div class="col-9"></div>
			<div class="col">
				<div class="row" style="font-size: 0.8em; font-weight: bold">
					<div class="col"><i class="bi bi-check-lg" style="color: red;"></i> : 만족도 조사 요망</div>
				</div>
				<div class="row" style="font-size: 0.8em; font-weight: bold">
					<div class="col"><i class="bi bi-check-lg" style="color: orange;"></i> : 답변 대기</div>
				</div>
				<div class="row" style="font-size: 0.8em; font-weight: bold">
					<div class="col"><i class="bi bi-check-lg" style="color: green;"></i> : 만족도 조사 완료</div>
				</div>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col border border-primary border-3;"></div>
		</div>
		<div class="row">
			<div class="col" style="text-align: center;">
				<table class="table">
				<thead>
				<tr>
					<th scope="col">No</th>
					<th scope="col">작성자</th>
					<th scope="col">카테고리</th>
					<th scope="col">제목</th>
					<th scope="col">작성시간</th>
				</tr>
				</thead>
				<tbody>
					<C:forEach items="${counselList}" var="counselList">
					<tr>
						<td>${counselList.onlineCounselBoardDto.id }</td>
						<td>${counselList.studentDto.name }</td>
						<td>${counselList.category.name }</td>
						<td>
							<C:if test="${counselList.replyCount == 0 }">
								<i class="bi bi-check-lg" style="color: orange;"></i>
							</C:if>
							<C:if test="${counselList.replyCount > 0 }">
								<C:choose>
									<C:when test="${counselList.isSurveyed == 0 }">
										<i class="bi bi-check-lg" style="color: red;"></i>
									</C:when>
									<C:otherwise>
										<i class="bi bi-check-lg" style="color: green;"></i>
									</C:otherwise>
								</C:choose>
							</C:if>
							<a href="./readCounselPage?counsel_pk=${counselList.onlineCounselBoardDto.id }" class="link-dark link-offset-2 link-underline link-underline-opacity-0">
					      		${counselList.onlineCounselBoardDto.title }
								<C:if test="${counselList.replyCount != 0 }">
									<span style="color: blue;">[${counselList.replyCount }]</span>
								</C:if>
					      	</a>
				      	</td>
						<td> <fmt:formatDate value="${counselList.onlineCounselBoardDto.created_at }" pattern="yy.MM.dd"/></td>
					</tr>
				    </C:forEach>
				</tbody>
			</table>
		</div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col d-flex justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item">
						<a class="page-link" href="#" aria-label="Next">
				        	<span aria-hidden="true">&raquo;</span>
						</a>
						</li>
					</ul>
				</nav>
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row" style="font-weight: bold; font-size: 1.4em; text-align: center;">
			<div class="col-10"></div>
			<div class="col">
				<a class="btn btn-dark" href="./writeOnlineCounselPage" class="link-dark link-offset-2 link-underline link-underline-opacity-0">상담 작성</a>
			</div>
		</div>
	</div> --%>