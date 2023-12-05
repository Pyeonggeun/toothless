<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 부트스트랩 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<%-- 부트스트랩 아이콘 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<%-- 구글폰트(Quicksand, Dongle, Gowun Dodum --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gowun+Dodum&family=Quicksand:wght@300&display=swap" rel="stylesheet">
<style>
*{
	/* font-family: 'Dongle', sans-serif; */
	font-family: 'Gowun Dodum', sans-serif;
	/* font-family: 'Quicksand', sans-serif; */
}
</style>
<title>상담원 상세정보</title>
</head>
<body>
	
	<div class="container">
	
		<div class="row border-bottom">
			<div class="col-10"></div>
			<div class="col py-2 me-0 pe-0 text-center dropdown nav-item">
			  <a class="nav-link pt-2 dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    <span class="fw-bold">${sessionStaffInfo.name}</span>님
			  </a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">정보 수정</a></li>
			    <li><a class="dropdown-item" href="#">마이페이지</a></li>
			    <li><hr class="dropdown-divider"></li>
			    <li><a class="dropdown-item" href="#"><span><i class="bi bi-power"></i></span>&nbsp;로그아웃</a></li>
			  </ul>
			</div>
		</div>

		<div class="row"></div>
		<div class="row">
			<div class="col ms-4">
				<div class="row pt-5">
					<div class="col fw-bold fs-3">
						<a href="../commons/counselCenterStaffMainPage" role="button" class="btn btn-white">
							<span class="fw-bold fs-3">MENU</span>
						</a>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col fs-5">
						<div class="dropend">
							<button class="btn btn-white dropdown-toggle navbar-brand" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							상담원 관리
							</button>
							<ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="../registerCounselor/registerPage">상담원 등록</a></li>
						   		<li><a class="dropdown-item" href="../registerCounselor/counselorInfo">상담원 조회</a></li>
						   		<li><a class="dropdown-item" href="#">상담원 뭐시기</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row pt-4">
					<div class="col fs-5">
						<a class="navbar-brand" href="#">공지사항</a>
					</div>
				</div>
				<div class="row pt-4">
					<div class="col fs-5">
						<a class="navbar-brand" href="#">집단상담</a>
					</div>
				</div>
			</div>
			
			<!-- 여기부터 레이아웃 -->
			<div class="col-10">
				<div class="row mt-5">
					<div class="col">
						<span class="fw-bold fs-2">상담원 상세정보</span>
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col-auto">
						<img src="../../resources/img/counselorImage/${counselorDto.profileImage}" class="img-fluid">
					</div>
					
					<div class="col">
						<div class="row align-items-center">
							<div class="col-2">
								<span class="fw-bold fs-5">이름</span>	
							</div>
							<div class="col">
								<span class="fw-bold fs-3">${counselorDto.name}</span> 상담사	
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">상담원번호</span>	
							</div>
							<div class="col">
								<span class="">${counselorDto.id}</span>	
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">나이</span>	
							</div>						
							<div class="col">
								<span class="">${counselorDto.age}</span>	
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">성별</span>	
							</div>
							<div class="col">
								<c:choose>
								<c:when test="${counselorDto.gender == 'M'}">
									<span class="">남</span>
								</c:when>
								<c:otherwise>
									<span class="">여</span>
								</c:otherwise>
								</c:choose>									
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">전화번호</span>	
							</div>						
							<div class="col">
								<span class="">${counselorDto.phonenumber}</span>	
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">이메일</span>	
							</div>						
							<div class="col">
								<span class="">${counselorDto.email}</span>	
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">주소</span>	
							</div>						
							<div class="col">
								<span class="">${counselorDto.address}</span>	
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">상담분야</span>	
							</div>						
							<c:forEach items="${counselorTypeList}" var="counselorTypeList">
								<div class="col-auto">
									<span class="">${counselorTypeList.CATEGORYNAME}</span>	
								</div>
							</c:forEach>							
						</div>						
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">
						<div class="row">
							<div class="col">
								<span class="fw-bold fs-5">경력사항</span>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col border rounded">
								<span>${counselorDto.career}</span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">
						<div class="row">
							<div class="col">
								<span class="fw-bold fs-5">상담원 자격정보</span>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col">
								<c:forEach items="${licenseList}" var="licenseList">
								<div class="row">
									<div class="col">
										<img src="../../resources/img/counselorImage/license/${licenseList.license}" class="img-fluid">
									</div>
								</div>
								</c:forEach>								
							</div>
						</div>
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">
						<div class="row">
							<div class="col">
								<span class="fw-bold fs-5">상담이력</span>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col border rounded">
								<span>온라인, 오프라인, 집단상담 완료 이력 로그 출력</span>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>