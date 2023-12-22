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

	<script>
	
	function showModal(){
		
		const writeModal = bootstrap.Modal.getOrCreateInstance("#writeModal");
		
		writeModal.show();
		
	}	
	
	</script>





</head>
<body>

<jsp:include page="../../commons/counselorTopArea.jsp"></jsp:include>



<div class="container-fluid">


	

	
	<div class="row">
		
		<!-- 내용 -->
		<div class="col">

				
			<div class="row" style="height:8em;"></div>
			
			<div class="row mt-0 pt-0">
					
				<div class="col">
					<div class="row mb-5">
						<div class="col-1"></div>
						<div class="col rounded-4" style="width:100%; height: 25em; background-color: gray; opacity: 0.1;"></div>
						<div class="col-1"></div>
					</div>
					<div class="row pt-5">
						<div class="col-1"></div>
						<div class="col">
							<div class="row border-top border-2 border-black text-bg-light">
								<div class="col"></div>
							</div>
						
							<div class="row py-3 border-bottom border-1 text-bg-light">
								<div class="col-3">
									<div class="fw-bold text-center" style="font-size:1.2em;">상담 제목</div>
								</div>
								<div class="col-2">
									<div class="fw-bold text-center" style="font-size:1.2em;">신청 인원</div>
								</div>
								<div class="col-2">
									<div class="fw-bold text-center" style="font-size:1.2em;">장소</div>
								</div>						
								<div class="col-2">
									<div class="fw-bold text-center" style="font-size:1.2em;">상담 일자</div>	
								</div>
								<div class="col-2">
									<div class="fw-bold text-center" style="font-size:1.2em;">신청 기간</div>
								</div>
								<div class="col-1">
									<div class="fw-bold text-center" style="font-size:1.2em;">상담 현황</div>
								</div>
							</div>
							
							<c:forEach items="${groupCounselList}" var="list">
							<div class="row pt-3 pb-2 border-bottom border-1">
								<div class="col-3">
									<div class="fw-bold text-black text-center" style="font-size:1.0em;"><a href="./groupCounselDetailPage?id=${list.groupCounselDto.id}" style="color:black;">${list.groupCounselDto.title}</a></div>
								</div>
								<div class="col-2">
									<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">${list.count} / ${list.groupCounselDto.amount}</div>
								</div>
								<div class="col-2">
									<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">${list.groupCounselDto.location}</div>
								</div>						
								<div class="col-2">
									<div class="fw-bold text-secondary text-center" style="font-size:0.9em;"><fmt:formatDate value="${list.groupCounselDto.counsel_date}" pattern="yy.MM.dd"/></div>	
								</div>
								<div class="col-2">
									<div class="fw-bold text-secondary text-center" style="font-size:0.9em;"><fmt:formatDate value="${list.groupCounselDto.start_apply_date }" pattern="yy.MM.dd"/>~<fmt:formatDate value="${list.groupCounselDto.end_apply_date }" pattern="yy.MM.dd"/></div>
								</div>
								<div class="col-1">
									<c:if test="${today > list.groupCounselDto.counsel_date}">
										<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">상담 완료</div>									
									</c:if>
									<c:if test="${today >= list.groupCounselDto.start_apply_date && today <= list.groupCounselDto.end_apply_date}">
										<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">모집 중</div>									
									</c:if>
									<c:if test="${today <= list.groupCounselDto.counsel_date && today > list.groupCounselDto.end_apply_date}">
										<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">모집 마감</div>									
									</c:if>
									<c:if test="${today < list.groupCounselDto.start_apply_date}">
										<div class="fw-bold text-secondary text-center" style="font-size:0.9em;">모집 대기</div>									
									</c:if>																											
								</div>
							</div>				
							</c:forEach>
						</div>
						<div class="col-1"></div>
					</div>
				</div>
			</div>		
		</div>
	</div>
	
	
	<div class="row" style="height:8em;"></div>
	<div class="row">
		<div class="col text-center fw-bold">
			<hr>
		</div>
	</div>
	<div class="row" style="background-color: #686868; height: 11.3em;">
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

	
</div>














<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>