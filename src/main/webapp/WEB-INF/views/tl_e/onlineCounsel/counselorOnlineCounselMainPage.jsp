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
		<div class="col" style="background-color:  rgb(244, 244, 241);">
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
		<div class="col ms-1" style="background-color:  rgb(244, 244, 241);">
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
		<div class="col ms-1" style="background-color:  rgb(244, 244, 241);">
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
		<div class="col" style="background-color:  rgb(244, 244, 241);">
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
		<div class="col ms-1" style="background-color:  rgb(244, 244, 241);">
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
		<div class="col ms-1" style="background-color:  rgb(244, 244, 241);">
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
	
	
		<!-- 검색창 -->
		<div class="row">
			<div class="col">
				<div class="row pt-5">
					<div class="col fs-3 fw-bold">
						상담 조회
					</div>
				</div>
				<div class="row pt-4">
					<div class="col">
						<div class="row border" style="background-color: rgb(244, 244, 241);">
							<div class="col">
								<div class="row pt-3 pb-3 align-items-center border-bottom">
									<div class="col-1 fw-bold">
										상담번호
									</div>
									<div class="col-3">
										<input class="form-control" type="number">
									</div>
									<div class="col-1 fw-bold">
										상담종류
									</div>
									<div class="col-3">
										<select class="form-select">
										 	<c:forEach items="${counselList }" var="mapList">
										 		<c:forEach items="${mapList }" var="list">
										 			<option value=${list.typeCategoryDto.id }>${list.typeCategoryDto.name }</option>
										 		</c:forEach>
										 	</c:forEach>
										</select>								
									</div>
									<div class="col-1"></div>
								</div>
								<div class="row py-3 align-items-center border-bottom">
									<div class="col-1 fw-bold">
										이름
									</div>
									<div class="col-3">
										<input class="form-control" type="text">
									</div>
									<div class="col-1 fw-bold">
										상담상태
									</div>
									<div class="col-3">
										<select class="form-select">
										  <option value="1" selected>전체</option>
										  <option value="2">신청</option>
										  <option value="3">완료</option>
										  <option value="4">취소</option>
										  <option value="5">노쇼</option>
										</select>								
									</div>
									<div class="col-1"></div>
								</div>
								<div class="row pt-3 pb-3 border-bottom">
									<div class="col-1 fw-bold pt-1">
										일자
									</div>
									<div class="col-2">
										<select class="form-select">
										  <option selected>일자</option>
										  <option value="1">상담신청일</option>
										  <option value="2">상담예약일</option>
										</select>								
									</div>
									<div class="col-3 ps-5">
										<input class="form-control" type="date">
									</div>
								</div>
								<div class="row py-3">
									<div class="col-4"></div>
									<div class="col-2 d-grid">
										<input class="btn btn-outline-success" type="submit" value="초기화" style="background-color: black; color: white;">
									</div>
									<div class="col-2 d-grid rounded" style="background-color:black;">
										<input class="btn" style="color: white;" type="submit" value="검색">
									</div>
									<div class="col-4"></div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-7"></div>
					<div class="col">
						<div class="row">
							<div class="col"></div>
							<div class="col-4">
								<div class="row" style=" font-size: 0.8em; font-weight: bold">
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
					</div>
				</div>
			</div>
				<div class="row pt-3 pb-3 border-bottom border-dark fw-bold" style="background-color: rgb(244, 244, 241);">
					<div class="col-1 text-center">
						상담번호
					</div>
					<div class="col-2 text-center">
						상담종류
					</div>
					<div class="col-2 text-center">
						이름
					</div>
					<div class="col">
						제목
					</div>
					<div class="col-1 text-center">
						상담상태
					</div>
					<div class="col-2 text-center">
						등록일자
					</div>
				</div>
				<div class="row">
					<div id="reservationListBox" class="col">
						
					</div>
				</div>
				
				<div class="row">
						<div class="col">
							<c:forEach items="${counselList }" var="mapList">
								<c:forEach items="${mapList }" var="list">
								<c:set var="title" value="${list.onlineCounselBoardDto.title }"></c:set>
									<div class="row mt-3">
										<div class="col-1 text-center">
											${list.onlineCounselBoardDto.id }
										</div>
										<div class="col-2 text-center">
											${list.typeCategoryDto.name }
										</div>
										<div class="col-2 text-center">
											${list.studentInfoDto.name }
										</div>
										<div class="col">
											<c:choose>
												<c:when test="${fn:length(title) > 15 }">
													<c:set var="cuttedTitle" value="${fn:substring(title, 0, 15)}"></c:set>
														<a href="./counselorOnlineCounselReadCounselPage?counsel_pk=${list.onlineCounselBoardDto.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;"> 
															${cuttedTitle }...
														</a>
												</c:when>
												<c:otherwise>
													<a href="./counselorOnlineCounselReadCounselPage?counsel_pk=${list.onlineCounselBoardDto.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;"> 
															${title }...
														</a>
																										
												</c:otherwise>
											</c:choose>
										</div>
										<div class="col-1 text-center">
											<c:if test="${ list.isSurveyed == 0 && list.replyCount != 0 }">
												<i class="bi bi-check-lg" style="color: red;"></i>
											</c:if>
											<c:if test="${list.replyCount == 0 }">
												<i class="bi bi-check-lg" style="color: orange;"></i>
											</c:if>
											<c:if test="${  list.isSurveyed != 0 && list.replyCount != 0}">
												<i class="bi bi-check-lg" style="color: green;"></i>
											</c:if>
										</div>
										<div class="col-2 text-center">
											${list.onlineCounselBoardDto.created_at }
										</div>
									</div>									
								</c:forEach>
							</c:forEach>
						</div>
					</div>
					<div class="row my-2">
						<div class="col-10"></div>
						<div class="col">
							<select class="form-select">
							  <option selected>전체</option>
							  <option value="1">오름차순</option>
							  <option value="2">내림차순</option>
							</select>								
						</div>
					</div>
				
				
				
				
				
				<div class="row pt-5">
					<div class="col">
						<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
						    <li class="startPageNumli page-item">
						      <a class="startPageNumber page-link text-dark">&lt;</a>
						    </li>
						    
						    <li class="endPageNumli page-item">
						      <a class="endPageNumber page-link text-dark">&gt;</a>
						    </li>
						  </ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	
	
	
	
	
		

			
			
<!-- footer start -->
	<div class="row mt-5" style="background-color: #686868; height: 11.3em;">
		<div class="col-1"></div>
		<div class="col">
			<div class="row" style="height: 2.5em;"></div>
			<div class="row">
				<div class="col">
					<span style="font-size: 1.1em; color: #FF8200; font-weight: 500;">개인정보처리방침</span>
					<span style="font-size: 0.9em; color: white; font-weight: 500;">▪</span>
					<span style="font-size: 0.9em; color: white; font-weight: 500;">이메일무단수집거부</span>
				</div>
			</div>
			<div class="row pt-4">
				<div class="col">
					<div style="color:#d2d2d2; font-size: 0.9em;">서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층) / 대표자:정현경 / 사업자등록번호:220-90-07535 / 통신판매번호:제 강남-8062호 / TEL:02-561-1911 / FAX:02-538-2613</div>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col">
					<div style="color:#d2d2d2; font-size: 0.9em;">©2023 MK NATIONAL UNIVERSITY. ALL RIGHTS RESERVED.</div>
				</div>
			</div>
		</div>
		<div class="col-1"></div>
	</div>
		<!-- footer end -->
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