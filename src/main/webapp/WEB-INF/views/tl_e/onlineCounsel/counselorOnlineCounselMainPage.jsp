<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	* {
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gowun+Dodum&family=Quicksand:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../commons/counselorTopArea.jsp"></jsp:include>
	
	<div class="row">
	    <div class="col mx-0 px-0" style="height: 35em; position: relative;">
			<img class="banner img-fluid" src="/toothless/resources/img/groupCounsel/fff.jpg" style="width: 100%; height: 100%;">
			
			<div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height: 100%; position: absolute; bottom: 0; left: 0;"></div>
			
			<div class="title-text" style="font-size: 4em; color: white; position: absolute; bottom: 48%; left: 20.5%; transform: translate(-50%, 50%);">상담사 </div>
			
			<div style="color: white; position: absolute; font-size: 5em; bottom: 36%; transform: translate(-50%, -50%); text-align: center; left: -8%; border-top: 1px; border-top-style: solid; border-top-color: white; width: 80%;"></div>
			
			<div style="color: white; position: absolute; font-size: 1.4em; bottom: 24.5%; transform: translate(-50%, -50%); text-align: center; left: 19.6%;">당신의 말 한 마디가</div>
			
			<div style="color: white; position: absolute; font-size: 1.4em; bottom: 17.5%; transform: translate(-50%, -50%); text-align: center; left: 24.2%;">누군가의 희망이됩니다 </div>
			
			<div style="height: 17em; width: 18em; border-radius: 0px 50px 0px 0px; background-color: #679467; opacity: 0.9; position: absolute; bottom: -24.2%; transform: translate(-50%, -50%); text-align: center; left: 85%;"></div>
			
			<div style="font-weight: 900; color: #464646; position: absolute; font-size: 1.5em; bottom: 34%; transform: translate(-50%, -50%); text-align: center; left: 82%;">Contact Us</div>
			
			<div style="font-weight: 900; color: white; position: absolute; font-size: 2.6em; bottom: 10%; transform: translate(-50%, -50%); text-align: center; left: 84%;">1544-3054</div>
			
			<div style="color: white; position: absolute; font-size: 0.9em; bottom: 8%; transform: translate(-50%, -50%); text-align: center; left: 83.5%;">E-mail. mkmk@naver.com</div>
			
			<div style="color: white; position: absolute; font-size: 0.9em; bottom: 3%; transform: translate(-50%, -50%); text-align: center; left: 82.5%;">Tel. 010-4097-3054</div>
	    </div>
	</div>	
	
	
	

		
		<!-- 상담사 Tip -->
	<div class="row">
		<div class="col-1"></div>
		<div class="col">
			<hr>
		</div>
	</div>
	<div class="row mt-3">
		<div class="col-1"></div>
		<div class="col ms-3" style="font-size: 1.2em;">
			<span style="color: green; font-size: 2.0em;"><i class="bi bi-check-lg"></i></span>&nbsp;&nbsp;상담&nbsp;&nbsp;<span style="color: red; font-weight: bold;">Tip</span>&nbsp;&nbsp;!
		</div>
	</div>
	<div class="row mt-3 text-center">
		<div class="col-1"></div>
		<!-- 팁1 -->
		<div class="col" style="background-color: beige;">
			<div class="row p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">
				<div class="col" style="min-height: 4em;">
					<div class="row">
						<div class="col" style="font-weight: bold; font-size: 1.2em; text-align: center;">존중과 이해</div>
					</div>
					<div class="row mt-1">
						<div class="col" style="font-size: 0.9em; max-width: 100%;">
							<div>피상담자를 존중하고 감정을 이해하는 데 중점을 둬야 합니다. </div>
							<div>상대방의 맥락과 감정을 이해하고 공감할 준비가 되었는지 확인해보세요!</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 팁2 -->
		<div class="col ms-1" style="background-color: beige;">
			<div class="row p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">
				<div class="col">
					<div class="row">
						<div class="col" style="font-weight: bold; font-size: 1.2em; text-align: center;">균형있는 언어 사용</div>
					</div>
					<div class="row mt-1">
						<div class="col" style="font-size: 0.9em;">
							<div>피상담자에게 친절하고 공감할 수 있는 언어를 사용하세요. </div>
							<div>억압적이거나 비판적인 언어는 피해야 합니다.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 팁3 -->
		<div class="col ms-1" style="background-color: beige;">
			<div class="row p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">
				<div class="col">
					<div class="row">
						<div class="col" style="font-weight: bold; font-size: 1.2em; text-align: center;">열린 마음으로 듣기</div>
					</div>
					<div class="row mt-1">
						<div class="col" style="font-size: 0.9em;">
							<div>피상담자의 이야기를 들을 때 열린 마음으로 수용하고 이해하려 노력하세요. </div>
							<div>미리 판단하지 말고 그들의 맥락과 감정을 이해하려고 노력해야 합니다!</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-1"></div>
	</div>
	<div class="row mt-1 text-center">	
		<div class="col-1"></div>
		<!-- 팁4 -->
		<div class="col" style="background-color: beige;">
			<div class="row p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">
				<div class="col">
					<div class="row">
						<div class="col" style="font-weight: bold; font-size: 1.2em; text-align: center;">비언어적 신호 주의</div>
					</div>
					<div class="row mt-1">
						<div class="col" style="font-size: 0.9em;">
							<div>상담사는 피상담자의 비언어적인 신호를 주의깊게 관찰해야 합니다.</div>
							<div>언어 외적인 요소들도 이해하는 데 도움이 됩니다.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 팁5 -->
		<div class="col ms-1" style="background-color: beige;">
			<div class="row p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">
				<div class="col">
					<div class="row">
						<div class="col" style="font-weight: bold; font-size: 1.2em; text-align: center;">공감과 이해 표현</div>
					</div>
					<div class="row mt-1">
						<div class="col" style="font-size: 0.9em;">
							<div>피상담자의 이야기에 공감과 이해를 표현하는 것이 중요!</div>
							<div>"이해했다"는 신호를 보내는 것이 아니라, 이해와 공감을 표현하세요!</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 팁6 -->
		<div class="col ms-1" style="background-color: beige;">
			<div class="row p-3" style=" border: medium solid lightblue; border-radius: 0.5em; font-size: 0.9em;">
				<div class="col">
					<div class="row">
						<div class="col" style="font-weight: bold; font-size: 1.2em; text-align: center;">질문을 통한 깊은 이해</div>
					</div>
					<div class="row mt-1">
						<div class="col" style="font-size: 0.9em;">
							<div>개방형 질문을 통해 피상담자의 이야기를 깊이 있게 이해하고, </div>
							<div>그들이 더 많은 정보를 공유할 수 있도록 도와주세요!</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-1"></div>
	</div>

	
		<!-- 하단 -->			
	<div class="container">
		<div class="row">
			<div class="col">
				<hr>
			</div>
		</div>
		<div class="row">
			<!-- 3사분면 -->
			<div class="col">
				<div class="row">
					<div class="col border-bottom">
						상담
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="row" style="font-weight: bold; font-size: 0.9em;">
							<div class="col-1">상태</div>
							<div class="col-2">작성자</div>
							<div class="col-3">카테고리</div>
							<div class="col">제목</div>
							<div class="col-2">작성일</div>				
						</div>
					</div>
					<div class="row">
						<div class="col">
							<c:forEach items="${counselList }" var="mapList">
								<c:forEach items="${mapList }" var="list">
								<c:set var="title" value="${list.onlineCounselBoardDto.title }"></c:set>
									<div class="row">
										<div class="col-1">
											<c:choose>
												<c:when test="${ list.isSurveyed == 0}">
													<i class="bi bi-check-lg" style="color: orange;"></i>
												</c:when>
												<c:otherwise>
													<i class="bi bi-check-lg" style="color: green;"></i>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="col-2">
											${list.studentInfoDto.name }
										</div>
										<div class="col-3">
											${list.typeCategoryDto.name }
										</div>
										<div class="col">
											<c:choose>
												<c:when test="${fn:length(title) > 9 }">
													<c:set var="cuttedTitle" value="${fn:substring(title, 0, 9)}"></c:set>
														<a href="./counselorOnlineCounselReadCounselPage?counsel_pk=${list.onlineCounselBoardDto.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;"> 
															${cuttedTitle }...
														</a>
												</c:when>
												<c:otherwise>
													${title }													
												</c:otherwise>
											</c:choose>
										</div>
										<div class="col-2">
											${list.onlineCounselBoardDto.created_at }
										</div>
									</div>									
								</c:forEach>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		
	
	
		<!-- 4사분면 -->
			<div class="col ms-1">
				<div class="row border-bottom">
					<div class="col">
						답변 한 상담
					</div>
				</div>
				<div class="row">
					<div class="col">
					</div>
				</div>
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

	
	
	

				<!-- <div class="col-10"></div>
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
					</div> -->