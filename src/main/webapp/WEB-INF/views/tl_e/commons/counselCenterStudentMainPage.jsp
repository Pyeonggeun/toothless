<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집단 상담 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gowun+Dodum&family=Quicksand:wght@300&display=swap" rel="stylesheet">


<style>
	*{
		font-family: 'Gowun Dodum', sans-serif;
	}
	
	.title-text{
		position: absolute;
		left: 23%;
		width: 100%;
		transform: translate(-50%, -50%);
		text-align: center;
	
	}
	

	.tp-borderx{
		border-width: 4px 4px 4px 4px;
		border-style: solid;
		border-color: #CEBEE1;
		border-radius: 15px;
	
	}
	
	.circle-border{
		
		border-width: 3px 3px 3px 3px; 
		border-style: solid; 
		border-radius: 50%;	
		border-bottom-color: #dcdcdc;
		
	}
	
	.banner{
	  image-rendering: -moz-crisp-edges; /* firefox */
	  image-rendering: -o-crisp-edges; /* opera */
	  image-rendering: -webkit-optimize-contrast; /* chrome(비표준) */
	  image-rendering: crisp-edges;
	}	
	
	
	
	
</style>





	

</head>
<body>

<div class="container-fluid">

	<!-- 네비바 -->
	<div class="row pb-3" style="border-top-style: solid; border-top-width: 7px; border-top-color: #8FBC8F">
		<div class="col-2 pt-3">
			<div class="row">
				<div class="col-3 pe-0 me-0">
					<img class="img-fluid" style="width: 60px; height: 60px; color:blue;" src="./../../resources/img/groupCounsel/logo_black.png">
				</div>
				<div class="col">
					<div class="row" style="height: 0.55em;"></div>
					<div class="row">
						<div class="col ps-0 ms-0">
							<div class="fw-bold" style="font-size: 1.7em;"> Mk University</div>						
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="row">
				<div class="col">
					<div class="row" style="height: 2em;"></div>
					<div class="row">
						<div class="col-2"></div>
						<div class="col">
							<div class="row">
								<div class="col-2"></div>
								<div class="col text-center">
									<div class="dropdown">
										<a class="dropdown-toggle fw-bold" data-bs-toggle="dropdown" style="font-size: 1.2em; text-decoration-line: none; color: black">상담 신청</a>
									  <ul class="dropdown-menu">
									    <li><a class="dropdown-item" href="#">온라인 상담</a></li>
									    <li><a class="dropdown-item" href="#">오프라인 상담</a></li>
									    <li><a class="dropdown-item" href="#">집단 상담</a></li>
									  </ul>
									</div>
								</div>
								<div class="col text-center">
									<div class="dropdown">
										<a class="dropdown-toggle fw-bold" data-bs-toggle="dropdown" style="font-size: 1.2em; text-decoration-line: none; color: black">상담 이력</a>
									  <ul class="dropdown-menu">
									    <li><a class="dropdown-item" href="#">온라인 상담</a></li>
									    <li><a class="dropdown-item" href="#">오프라인 상담</a></li>
									    <li><a class="dropdown-item" href="#">집단 상담</a></li>
									  </ul>
									</div>
								</div>
								<div class="col text-center">
									<div class="dropdown">
										<a class="dropdown-toggle fw-bold" data-bs-toggle="dropdown" style="font-size: 1.2em; text-decoration-line: none; color: black">공지사항</a>
									  <ul class="dropdown-menu">
									    <li><a class="dropdown-item" href="#">온라인 상담</a></li>
									    <li><a class="dropdown-item" href="#">오프라인 상담</a></li>
									    <li><a class="dropdown-item" href="#">집단 상담</a></li>
									  </ul>
									</div>
								</div>
								<div class="col text-center">
									<div class="dropdown">
										<a class="dropdown-toggle fw-bold" data-bs-toggle="dropdown" style="font-size: 1.2em; text-decoration-line: none; color: black">자유게시판</a>
									  <ul class="dropdown-menu">
									    <li><a class="dropdown-item" href="#">온라인 상담</a></li>
									    <li><a class="dropdown-item" href="#">오프라인 상담</a></li>
									    <li><a class="dropdown-item" href="#">집단 상담</a></li>
									  </ul>
									</div>
								</div>
								<div class="col text-center">
									<div class="dropdown">
										<a class="dropdown-toggle fw-bold" data-bs-toggle="dropdown" style="font-size: 1.2em; text-decoration-line: none; color: black">상담원 정보</a>
									  <ul class="dropdown-menu">
									    <li><a class="dropdown-item" href="#">온라인 상담</a></li>
									    <li><a class="dropdown-item" href="#">오프라인 상담</a></li>
									    <li><a class="dropdown-item" href="#">집단 상담</a></li>
									  </ul>
									</div>
								</div>									
							</div>
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="row">
						<div class="col-6 text-center">
							<div class="row" style="height: 2em;"></div>
							<div class="row">
								<div class="col">
									<div class="fw-bold" style="font-size: 1.2em;">[${sessionStudentInfo.name}]님</div>
								</div>
							</div>
						</div>
						<div class="col-6">
							<div class="row" style="height: 1.7em;"></div>
							<div class="row">
								<div class="col">
									<i class="bi bi-box-arrow-right" style="font-size:1.6em;"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	
	

	<div class="row">
		<div class="col">
			<div class="row">
				<div class="col mx-0 px-0" style="height: 35em;">
					<img class="banner img-fluid" src="./../../resources/img/groupCounsel/fff.jpg" style="width:100%; height: 100%;">
				
					<div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height:100%; position: relative; bottom: 100%;"></div>
					<!-- 
					<div class="title-text fw-bold" style="font-size: 3.5em; color: white; top: 70%;">Mk University | 상담센터</div>
					<!--<div class="title-text" style="font-size: 1.5em; color: white; top: 42%;"></div> -->
					<div style="color: white; position: relative; font-size: 4em; bottom: 148%; transform: translate(-50%, -50%); text-align: center; left: 20.5%;">MKU 상담센터</div>
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
				<div class="col-6 px-3" style="border-width: 0px 2px 0px 2px; border-style: solid; border-color: #dcdcdc;">
					<div class="row" style="height: 5em;"></div>
					<div class="row">
						<div class="col-1"></div>
						<div class="col pb-3" style="border-bottom-width: 2px; border-bottom-style: solid; border-color: #dcdcdc;">
							<div class="row">
								<div class="col">
									<span class="fw-bold" style="font-size: 1.5em;">상담일정</span>
									&nbsp
									<span class="fw-bold" style="font-size: 1.2em; color: #8FBC8F;">Schedule</span>								
								</div>
								<div class="col-2 text-end">
									<i style="font-size: 1.5em;" class="bi bi-three-dots"></i>
								</div>
							</div>
						</div>
						<div class="col-1"></div>
					</div>
					<div class="row pt-5">
						<div class="col-1"></div>
						<div class="col">
							<div class="row row-cols-3">
								<c:forEach items="${groupCounselReservationList}" var="list">
								<div class="col">
									<div class="row">
										<div class="col">
											<img style=" border-style: solid; border-width: 3px; border-color: #8FBC8F" class="img-fluid rounded-3" src="/uploadFiles/${list.POSTERIMAGE }">
										</div>
									</div>
									<div class="row pt-2">
										<div class="col ps-3">
											<div class="fw-bold" style="font-size: 0.9em; color: black;">[${list.TITLE }]</div>
										</div>
										<div class="col-3 text-center ps-0 ms-0">
											<div class="fw-bold text-secondary" style="font-size: 0.8em;"><fmt:formatDate value="${list.COUNSEL_DATE}" pattern="yy.MM.dd"/></div>
										</div>
									</div>
									<div class="row pt-1">
										<div class="col text-start ps-3">
											<div class="fw-bold" style="font-size: 1.3em; color: #0A6E0A;">D-${list.D_DAY }</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
						<div class="col-1"></div>
					</div>
				</div>
				<div class="col-4 px-3" style="border-width: 0px 2px 0px 0px; border-style: solid; border-color: #dcdcdc;">
					<div class="row" style="height: 5em;"></div>
					<div class="row">
						<div class="col-1"></div>
						<div class="col pb-3" style="border-bottom-width: 2px; border-bottom-style: solid; border-color: #dcdcdc;">
							<div class="row">
								<div class="col">
									<span class="fw-bold" style="font-size: 1.5em;">공지사항</span>
									&nbsp
									<span class="fw-bold" style="font-size: 1.2em; color: #8FBC8F;">Notice</span>								
								</div>
								<div class="col-2 text-end">
									<i style="font-size: 1.5em;" class="bi bi-three-dots"></i>
								</div>
							</div>
						</div>		
						<div class="col-1"></div>
					</div>
					<div class="row pt-3">
						<div class="col-1"></div>
						<div class="col">
							<c:forEach items="${noticeList}" var="list">
							<div class="row pt-3 pb-2">
								<div class="col-1">
									<div class="text-center" style="font-size:1.2em; color: #8FBC8F;">☘︎</div>
								</div>
								<div class="col-7 ms-0 ps-0">
									<span class="text-black text-start" style="font-size:1.2em;">${list.noticeBoardDto.title}</span>
									&nbsp
									<c:if test="${list.countNoticeComment != 0}">
										<span class="fw-bold" style="font-size:0.9em; color: red;">[${list.countNoticeComment}]</span>															
									</c:if>
								</div>
								<div class="col-2 text-end">
									<div class="text-secondary" style="font-size:1.1em;">${list.staffInfoDto.name}</div>	
								</div>
								<div class="col-2 text-end">
									<div class="text-secondary" style="font-size:1.1em;"><fmt:formatDate value="${list.noticeBoardDto.created_at}" pattern="yy.MM.dd"/></div>	
								</div>
							</div>														
							</c:forEach>												
						</div>
						<div class="col-1"></div>
					</div>	
					<div class="row pt-5 mt-5">
						<div class="col-1"></div>
						<div class="col pb-3" style="border-bottom-width: 2px; border-bottom-style: solid; border-color: #dcdcdc;">
							<div class="row">
								<div class="col">
									<span class="fw-bold" style="font-size: 1.5em;">웹 메일</span>
									&nbsp
									<span class="fw-bold" style="font-size: 1.2em; color: #8FBC8F;">Mail</span>								
								</div>
								<div class="col-2 text-end">
									<i style="font-size: 1.5em;" class="bi bi-three-dots"></i>
								</div>
							</div>
						</div>
						<div class="col-1"></div>
					</div>
					<div class="row pt-5">
						<div class="col-1"></div>
						<div class="col">
							<div class="row">
								<div class="col text-center">
									<div style="font-size:4.0em;"><i class="bi bi-envelope-paper"></i></div>
								</div>
								<div class="col-2 text-center">
									<div style="font-size: 4em; color: gray; opacity: 0.5;">|</div>
								</div>
								<div class="col text-center">
									<div style="font-size:4.0em;"><i class="bi bi-envelope-x"></i></div>
								</div>
							</div>
							<div class="row pt-3">
								<div class="col text-center">
									<span class="fw-bold" style="font-size:1.2em;">받은메일</span><span class="fw-bold" style="font-size:1.4em; color: red;"> 26</span><span class="fw-bold" style="font-size:1.2em;">건</span>
								</div>
								<div class="col-2">
								</div>
								<div class="col text-center">
									<span class="fw-bold" style="font-size:1.2em;">미확인메일</span><span class="fw-bold" style="font-size:1.4em; color: red;"> 20</span><span class="fw-bold" style="font-size:1.2em;">건</span>
								</div>
							</div>	
						</div>
						<div class="col-1"></div>
					</div>						
					<div class="row" style="height: 4em;"></div>
				</div>
				<div class="col-1"></div>
			</div>
			
			<div class="row" style="height: 42em; background-color: rgba(0, 0, 0, 0.05);">
				<div class="col-1"></div>
				<div class="col">
					<div class="row">
						<div class="col ps-5">
							<div class="row" style="height: 5em;"></div>
							<div class="row">
								<div class="col">
									<span class="fw-bold" style="font-size:3em; color: black;">상담 예약</span>
									&nbsp
									<span class="fw-bold" style="font-size:1.5em; color: #8FBC8F;">Counsel Reservation</span>
								</div>							
							</div>						
						</div>
					</div>
					<div class="row pt-5">
						<div class="col">
							<div class="row">
								<div class="col-1"></div>
								<div class="col" style="height: 23em; width: 80%; background-color: white; border-style: solid; border-width: 4px; border-color: #8FBC8F">
									<div class="row" style="height: 3em;"></div>
									<div class="row">
										<div class="col text-center">
											<img style="width: 7em; height: 7em;" src="./../../resources/img/groupCounsel/online.png">
										</div>
									</div>
									<div class="row">
										<div class="col text-center pt-5">
											<div class="fw-bold" style="font-size: 1.7em;">온라인 상담</div>
										</div>
									</div>
									<div class="row">
										<div class="col text-center pt-3">
											<div class="text-secondary fw-bold" style="font-size: 1.1em;">MK대학교는 늘 최선을 다하며</div>
											<div class="text-secondary fw-bold" style="font-size: 1.1em;">학생들을 위한 학교가 되겠습니다.</div>
										</div>
									</div>
								</div>
								<div class="col-1"></div>
							</div>
						</div>
						<div class="col">
							<div class="row">
								<div class="col-1"></div>
								<div class="col" style="height: 23em; width: 80%; background-color: white;">
									<div class="row" style="height: 3em;"></div>
									<div class="row">
										<div class="col text-center">
											<img style="width: 7em; height: 7em;" src="./../../resources/img/groupCounsel/offline.png">
										</div>
									</div>
									<div class="row">
										<div class="col text-center pt-5">
											<div class="fw-bold" style="font-size: 1.7em;">오프라인 상담</div>
										</div>
									</div>
									<div class="row">
										<div class="col text-center pt-3">
											<div class="text-secondary fw-bold" style="font-size: 1.1em;">MK대학교는 늘 최선을 다하며</div>
											<div class="text-secondary fw-bold" style="font-size: 1.1em;">학생들을 위한 학교가 되겠습니다.</div>
										</div>
									</div>								
								</div>
								<div class="col-1"></div>
							</div>
						</div>
						<div class="col">
							<div class="row">
								<div class="col-1"></div>
								<div class="col" style="height: 23em; width: 80%; background-color: white;">
									<div class="row" style="height: 3em;"></div>
									<div class="row">
										<div class="col text-center">
											<img style="width: 7em; height: 7em;" src="./../../resources/img/groupCounsel/group.png">
										</div>
									</div>
									<div class="row">
										<div class="col text-center pt-5">
											<div class="fw-bold" style="font-size: 1.7em;">집단 상담</div>
										</div>
									</div>
									<div class="row">
										<div class="col text-center pt-3">
											<div class="text-secondary fw-bold" style="font-size: 1.1em;">MK대학교는 늘 최선을 다하며</div>
											<div class="text-secondary fw-bold" style="font-size: 1.1em;">학생들을 위한 학교가 되겠습니다.</div>
										</div>
									</div>								
								</div>
								<div class="col-1"></div>
							</div>
						</div>
						<div class="col">
							<div class="row">
								<div class="col-1"></div>
								<div class="col" style="height: 23em; width: 80%; background-color: white;">
									<div class="row" style="height: 3em;"></div>
									<div class="row">
										<div class="col text-center">
											<img style="width: 7em; height: 7em;" src="./../../resources/img/groupCounsel/online.png">
										</div>
									</div>
									<div class="row">
										<div class="col text-center pt-5">
											<div class="fw-bold" style="font-size: 1.7em;">자가진단검사</div>
										</div>
									</div>
									<div class="row">
										<div class="col text-center pt-3">
											<div class="text-secondary fw-bold" style="font-size: 1.1em;">MK대학교는 늘 최선을 다하며</div>
											<div class="text-secondary fw-bold" style="font-size: 1.1em;">학생들을 위한 학교가 되겠습니다.</div>
										</div>
									</div>								
								</div>
								<div class="col-1"></div>
							</div>
						</div>
					</div>
					<div class="row"></div>
				</div>
				<div class="col-1"></div>
			</div>
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
			
			
			
			<!-- -------------------------------------------------------- -->
			
			<div class="row" style="height: 20em;"></div>
			
			
			<div class="row">
				<div class="col">
					<div class="row" style="height: 3em;"></div>
					<div class="row mb-5">
						<div class="col-1"></div>
						<div class="col">
						</div>
					</div>
					<div class="row">
						<div class="col-1">
						</div>
						<div class="col rounded-4" style="height: 100%;">
							<div class="row mb-3">
								<div class="col-6">
									<div class="row">
										<div class="col py-4 tp-border me-3" style="height: 20em;">
											<div class="row pb-3">
												<div class="col">
													<div class="fw-bold" style="font-size: 1.5em;">나의 상담 일정</div>
												</div>
												<div class="col-2 text-end">
													<div style="font-size: 1.5em;"><i class="bi bi-three-dots"></i></div>
												</div>
											</div>										
											<div class="row">
												<div class="col">
													<c:forEach items="${groupCounselReservationList}" var="list">
													<div class="row pt-3 pb-2">
														<div class="col-2 text-center">
															<button type="button" class="btn btn-danger pt-0" style="height: 1.2em; width: 60%;">
																<div class="fw-bold" style="font-size: 0.8em;">D-${list.D_DAY}</div>
															</button>
														</div>
														<div class="col-7 ps-0">
															<div class="text-black text-start" style="font-size:1.2em;">${list.TITLE}</div>
														</div>
														<div class="col">
														<div class="text-secondary text-center" style="font-size:1.2em;"><fmt:formatDate value="${list.COUNSEL_DATE}" pattern="yy.MM.dd"/></div>	
														</div>
													</div>				
													</c:forEach>												
												</div>
											</div>
										</div>
									</div>								
								</div>
								<div class="col">
									<div class="row">
										<div class="col tp-border py-4 me-3" style="height: 20em;">
											<div class="row pb-3">
												<div class="col">
													<div class="fw-bold" style="font-size: 1.5em;">공지사항</div>
												</div>
												<div class="col-2 text-end">
													<div style="font-size: 1.5em;"><i class="bi bi-three-dots"></i></div>
												</div>
											</div>
											<div class="row">
												<div class="col">
													<c:forEach items="${noticeList}" var="list">
													<div class="row pt-3 pb-2">
														<div class="col-1">
															<div class="text-black text-center" style="font-size:1.2em;">⚬</div>
														</div>
														<div class="col-5 ms-0 ps-0">
															<span class="text-black text-start" style="font-size:1.2em;">${list.noticeBoardDto.title}</span>
															&nbsp
															<c:if test="${list.countNoticeComment != 0}">
																<span class="fw-bold" style="font-size:0.9em; color: red;">[${list.countNoticeComment}]</span>															
															</c:if>
														</div>
														<div class="col-2 text-end">
															<div class="text-secondary" style="font-size:1.2em;">${list.staffInfoDto.name}</div>	
														</div>
														<div class="col-2 text-center">
															<div class="text-secondary" style="font-size:1.2em;">${list.noticeBoardDto.read_count}</div>	
														</div>																												
														<div class="col-2 text-start">
															<div class="text-secondary" style="font-size:1.2em;"><fmt:formatDate value="${list.noticeBoardDto.created_at}" pattern="yy.MM.dd"/></div>	
														</div>
													</div>														
													</c:forEach>												
												</div>
											</div>
										</div>
									</div>	
								</div>
								<div class="col">
						
								</div>
							</div>
							<div class="row">
								<div class="col">
									<!-- 학생 정보 -->
									<div class="row">
										<div class="col py-4 rounded-3 me-3" style="height: 20em; background-color: #50508C;">
											<div class="row">
												<div class="col text-center">
													<i class="bi bi-person" style="font-size: 7em;"></i>
												</div>
											</div>
											<div class="row">
												<div class="col text-center">
													<div class="fw-bold" style="font-size: 1.2em; color: white;">천평근(202001356)</div>
												</div>
											</div>
											<div class="row">
												<div class="col text-center">
													<div class="fw-bold" style="font-size: 1.0em; color: white;">산업경영공학과</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="col">
									<div class="row">
										<div class="col tp-border py-4 me-3" style="height: 20em;">
											<div class="row pb-5">
												<div class="col">
													<div class="fw-bold" style="font-size: 1.5em;">웹 메일</div>
												</div>
											</div>
											<div class="row">
												<div class="col text-center">
													<div style="font-size:4.0em;"><i class="bi bi-envelope-paper"></i></div>
												</div>
												<div class="col-2 text-center">
													<div style="font-size: 4em; color: gray; opacity: 0.5;">|</div>
												</div>
												<div class="col text-center">
													<div style="font-size:4.0em;"><i class="bi bi-envelope-x"></i></div>
												</div>
											</div>
											<div class="row pt-3">
												<div class="col text-center">
													<span class="fw-bold" style="font-size:1.2em;">받은메일</span><span class="fw-bold" style="font-size:1.4em; color: red;"> 26</span><span class="fw-bold" style="font-size:1.2em;">건</span>
												</div>
												<div class="col-2">
												</div>
												<div class="col text-center">
													<span class="fw-bold" style="font-size:1.2em;">미확인메일</span><span class="fw-bold" style="font-size:1.4em; color: red;"> 20</span><span class="fw-bold" style="font-size:1.2em;">건</span>
												</div>
											</div>											
										</div>
									</div>									
								</div>
								<div class="col">
									<div class="row">
										<div class="col tp-border py-4 me-3" style="height: 20em;">
											<div class="row pb-4">
												<div class="col">
													<div class="fw-bold" style="font-size: 1.5em;">자기진단검사</div>
												</div>
											</div>
											<div class="row">
												<div class="col-1"></div>
												<div class="col">
													<div class="row">
														<div class="col mx-1 mb-1 pt-3 text-center circle-border" style="height: 5em; border-top-color: #64CD3C; border-left-color: #64CD3C; border-right-color: #64CD3C">
															<div class="fw-bold" style="font-size:1.0em;">지식탐구</div>
															<div class="fw-bold" style="font-size:1.2em; color: #64CD3C;">12</div>
														</div>
														<div class="col mx-1 mb-1 pt-3 text-center circle-border" style="height: 5em; border-top-color: #008C8C; border-left-color: #008C8C; border-right-color: #008C8C">
															<div class="fw-bold" style="font-size:1.0em;">의사소통</div>
															<div class="fw-bold" style="font-size:1.2em; color: #008C8C;">12</div>
														</div>
														<div class="col mx-1 mb-1 pt-3 text-center circle-border" style="height: 5em; border-top-color: #B90000; border-left-color: #B90000; border-right-color: #B90000">
															<div class="fw-bold" style="font-size:1.0em;">문제해결</div>
															<div class="fw-bold" style="font-size:1.2em; color: #B90000;">20</div>
														</div>													
													</div>
												</div>
												<div class="col-1"></div>
											</div>
											<div class="row">
												<div class="col-1"></div>
												<div class="col">
													<div class="row">
														<div class="col mx-1 pt-3 text-center circle-border" style="height: 5em; border-top-color: #D2691E; border-left-color: #D2691E; border-right-color: #D2691E">
															<div class="fw-bold" style="font-size:1.0em;">창의융합</div>
															<div class="fw-bold" style="font-size:1.2em; color: #D2691E;">14</div>
														</div>
														<div class="col mx-1 pt-3 text-center circle-border" style="height: 5em; border-top-color: #AE5E1A; border-left-color: #AE5E1A; border-right-color: #AE5E1A">
															<div class="fw-bold" style="font-size:1.0em;">협업인성</div>
															<div class="fw-bold" style="font-size:1.2em; color: #AE5E1A;">10</div>
														</div>
														<div class="col mx-1 pt-3 text-center circle-border" style="height: 5em; border-top-color: #9400D3; border-left-color: #9400D3; border-right-color: #9400D3">
															<div class="fw-bold" style="font-size:1.0em;">도전창조</div>
															<div class="fw-bold" style="font-size:1.2em; color: #9400D3;">12</div>
														</div>													
													</div>
												</div>
												<div class="col-1"></div>
											</div>
											<div class="row pt-4">
												<div class="col text-end">
													<span class="fw-bold" style="font-size: 1.0em;">나의 점수 </span>
													<span class="fw-bold" style="font-size: 1.3em; color: red;">80</span><span class="fw-bold" style="font-size: 1.0em;">점</span>
												</div>
												<div class="col-1"></div>
											</div>
										</div>
									</div>								
								</div>
								<div class="col">
										
								</div>															
							</div>
						</div>
						<div class="col-1"></div>
					</div>
				</div>			
			</div>
		</div>
	</div>


	
	<div class="row" style="height:20em;"></div>
	
	
</div>


















<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>