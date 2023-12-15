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
		
	</style>






</head>
<body>

<div class="container-fluid">

	<div class="row pb-3 border-bottom border-dark-subtle">
		<div class="col-2 pt-3">
			<div class="row">
				<div class="col-3 pe-0 me-0">
					<img class="img-fluid" style="width: 60px; height: 60px; color:blue;" src="../../../resources/img/groupCounsel/logo_black.png">
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
				<div class="col"></div>
				<div class="col-2">
					<div class="row" style="height: 1.4em;"></div>
					<div class="row">
						<div class="col-6 pt-2 text-center">
							<div class="fw-bold" style="font-size: 1.2em;">[${sessionStaffInfo.name}]님</div>
						</div>
						<div class="col-6 pt-1">
							<i class="bi bi-box-arrow-right" style="font-size:1.6em;"></i>						
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
	
	
	
	
	<div class="row">
		
		<div class="col-2 border-end border-dark-subtle">
			<div class="row">
				<div class="col-1"></div>
				<div class="col border-bottom border-0 border-secondary-subtle">
					<div class="row">
						<div class="col pt-4 pb-3">
							<div class="fw-bold text-black" style="font-size:2em;">상담 신청</div>
						</div>
					</div>
					<div class="row">
						<div class="col pb-3">
							<div class="text-secondary fw-bold" style="font-size:1em;">온라인 상담</div>
						</div>
					</div>
					<div class="row">
						<div class="col pb-3">
							<div class="text-secondary fw-bold" style="font-size:1em;">오프라인 상담</div>
						</div>
					</div>
					<div class="row">
						<div class="col pb-4">
							<a href="./groupCounselListPage" style="text-decoration: none;"><div class="text-secondary fw-bold" style="font-size:1em;">집단 상담</div></a>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>

			<div class="row">
				<div class="col-1"></div>
				<div class="col border-bottom border-0 border-secondary-subtle">
					<div class="row">
						<div class="col pt-4 pb-3">
							<div class="fw-bold text-black" style="font-size:2em;">예약 조회</div>
						</div>
					</div>
					<div class="row">
						<div class="col pb-3">
							<div class="text-secondary fw-bold" style="font-size:1em;">온라인 상담</div>
						</div>
					</div>
					<div class="row">
						<div class="col pb-3">
							<div class="text-secondary fw-bold" style="font-size:1em;">오프라인 상담</div>
						</div>
					</div>
					<div class="row">
						<div class="col pb-4">
							<div class="text-secondary fw-bold" style="font-size:1em;">집단 상담</div>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>

			<div class="row">
				<div class="col-1"></div>
				<div class="col border-bottom border-0 border-secondary-subtle">
					<div class="row">
						<div class="col pt-4 pb-3">
							<div class="text-secondary fw-bold" style="font-size:1em;">공지사항</div>
						</div>
					</div>
					<div class="row">
						<div class="col pb-3">
							<div class="text-secondary fw-bold" style="font-size:1em;">자유게시판</div>
						</div>
					</div>
					<div class="row">
						<div class="col pb-3">
							<div class="text-secondary fw-bold" style="font-size:1em;">상담원 정보</div>
						</div>
					</div>
					<div class="row">
						<div class="col text-center pt-2 pb-0">
							<div class="fw-bold text-black" style="font-size:1.5em;">
								1544-7942
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col text-center pb-4">
							<div class=" text-secondary" style="font-size:0.8em;">
								평일 9~18시(점심 12~13시)
							</div>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
			
			<div class="row">
				<div class="col-1"></div>
				<div class="col">
					<div class="row">
						<div class="col pt-5 mt-2 text-center">
							<div class="text-secondary" style="font-size:0.8em;">농협 302-1054-7722-11</div>
						</div>
					</div>
					<div class="row">
						<div class="col text-center">
							<div class="text-secondary" style="font-size:0.8em;">(주)중앙정보처리학원</div>
						</div>
					</div>
					<div class="row">
						<div class="col text-center">
							<div class="text-secondary" style="font-size:0.8em;">rjal3054@naver.com</div>
						</div>
					</div>
					<div class="row">
						<div class="col pb-4 text-center">
							<div class="text-secondary" style="font-size:0.8em;">TEL) 010-4097-3054</div>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
		
		
		
		<div class="col">
		
			<div class="row mb-0 pb-0">
				<div class="col ps-0 ms-0 pb-0 mb-1">
					<div class="row pt-3 ms-0 ps-0">
						<div class="col">
							<div class="row">
								<div class="col-11"></div>
								<div class="col"></div>
							</div>
						</div>
						<div class="col-10"></div>
					</div>				
					<div class="row ms-0 ps-0">
						<div class="col ms-0 ps-3 pt-2">
							<div class="fw-bold" style="font-size: 3.5em; color:#07355e;">집단 상담</div>
						</div>
						<div class="col-9"></div>
					</div>
					<div class="row ms-0 ps-0">
						<div class="col ms-0 ps-3 pt-2 pb-2">
							<div class="fw-bold" style="font-size: 0.8em; color:#07355e;">&nbsp;&nbsp;<i class="bi bi-house-door-fill"></i> / 상담 신청 / 집단 상담</div>
						</div>
						<div class="col-10"></div>
					</div>
					<div class="row pb-4 ms-4 ps-0">
						<div class="col">
							<div class="row">
								<div class="col border-top border-4 border-secondary"></div>
							</div>
						</div>
						<div class="col-10"></div>					
					</div>
				</div>	
			</div>					
		
				
			<div class="row my-0">
				<div class="col my-0 py-4"></div>
			</div>
					
		
			<c:forEach items="${groupCounselList}" var="list">
			
			
			<div class="row pt-3">
				<!-- 상담 리스트 -->
				<div class="col ps-5">
				
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10">
							<div class="row">
								<div class="col mx-0 px-5 border-top border-black border-3"></div>
							</div>
						</div>
						<div class="col-1"></div>
					</div>
					
					<div class="row">
						<div class="col-1"></div>
						<div class="col-5 pt-2">
							<div class="row">
								
								<div class="col">
									<div class="row">
										<div class="col">
											<div class="fw-bold" style="font-size: 1.4em;">[<fmt:formatDate value="${list.groupCounselDto.start_apply_date }" pattern="yy.MM.dd"/>] ${list.groupCounselDto.title}</div>
										</div>
									</div>
									<div class="row pt-3">
										<div class="col" style="height:3.5em;">
											<div class="text-secondary fw-bold" style="font-size: 0.9em;">${list.groupCounselDto.text}</div>
										</div>
									</div>
									<div class="row py-5"></div>
									<div class="row pt-3">
										<div class="col-3">
											<div class="fw-bold text-black" style="font-size:1.2em; text-decoration: underline;">신청 인원</div>
										</div>
										<div class="col">
											<div class="fw-bold text-secondary" style="font-size:1.1em;">${list.reservationCount} / ${list.groupCounselDto.amount }</div>
										</div>
									</div>
									<div class="row pt-3">
										<div class="col-3">
											<div class="fw-bold text-black" style="font-size:1.2em; text-decoration: underline;">신청 일자</div>
										</div>
										<div class="col">
											<div class="fw-bold text-secondary" style="font-size:1.1em;"><fmt:formatDate value="${list.groupCounselDto.start_apply_date }" pattern="yy.MM.dd"/>~<fmt:formatDate value="${list.groupCounselDto.end_apply_date }" pattern="yy.MM.dd"/></div>
										</div>
									</div>
									<div class="row pt-3">
										<div class="col-2">
											<div class="fw-bold text-black" style="font-size:1.2em; text-decoration: underline;"> 장소</div>
										</div>
										<div class="col-1"></div>
										<div class="col">
											<div class="fw-bold text-secondary" style="font-size:1.1em;">${list.groupCounselDto.location }</div>
										</div>
										<div class="col-2 text-end">
											<c:if test="${list.count==0}">
												<input class="btn btn-secondary" type="button" value="신청" onClick="location.href='./groupCounselReservationProcess?group_counsel_id=${list.groupCounselDto.id }&student_pk=${sessionStudentInfo.student_pk}'">
											</c:if>
											<c:if test="${list.count==1}">
												<input class="btn btn-secondary" type="button" value="마감" onClick="location.href='./groupCounselReservationProcess?group_counsel_id=${list.groupCounselDto.id }&student_pk=${sessionStudentInfo.student_pk}'">
											</c:if>
											
										</div>
									</div>
									<div class="row pt-4">
										<div class="col-10"></div>
										<div class="col text-center">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-3 text-end pt-2">
							<img class="img-fluid" style="width: 80%;" src="/uploadFiles/${list.groupCounselDto.posterImage }">
						</div>
						<div class="col-2 border-start border-end border-secondary border-1 pt-2">
						
						</div>
					</div>
					
					<div class="row">
						<div class="col-1"></div>
						<div class="col-10">
							<div class="row">
								<div class="col mx-0 px-5 border-top border-secondary border-1"></div>					
							</div>
						</div>
						<div class="col-1"></div>
					</div>			
					
				</div>
			</div>
			</c:forEach>		
		</div>
	</div>
	
	
	
	<div class="row" style="height:10em;"></div>
</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>