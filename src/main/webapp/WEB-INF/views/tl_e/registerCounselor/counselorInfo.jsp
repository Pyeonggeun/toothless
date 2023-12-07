<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>상담원 등록 페이지</title>
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
						   		<li><a class="dropdown-item" href="../registerCounselor/managementCounselor">상담원 관리(JS)</a></li>
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
						<span class="fw-bold fs-2">상담원 조회</span>
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">
						<div class="row border-bottom">
							<div class="col text-start">
								<span class="fw-bold fs-4">성격문제</span>
							</div>
						</div>
						<div class="row">							
							<c:forEach items="${counselorList}" var="counselorList">
							<c:if test="${counselorList.TYPECATEGORY == 1}">							
							<div class="col-2">
								<div class="row mt-2">
									<c:choose>
									<c:when test="${!empty counselorList.PROFILEIMAGE}">
									<div class="col">
										<a href="./counselorDetail?id=${counselorList.ID}">
											<img src="../../resources/img/counselorImage/${counselorList.PROFILEIMAGE}" class="img-fluid img-thumbnail">
										</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="col">
										<a href="./counselorDetail?id=${counselorList.ID}">
											<img src="../../resources/img/counselorImage/no_image.jpg" class="img-fluid img-thumbnail">
										</a>
									</div>
									</c:otherwise>
									</c:choose>									
								</div>
								<div class="row mt-2">
									<div class="col text-center">
										<a href="./counselorDetail?id=${counselorList.ID}" role="button" class="btn btn-white">
											<span class="fw-bold">${counselorList.NAME}</span> 상담사
										</a>
									</div>
								</div>								
							</div>
							</c:if>
							</c:forEach>							
						</div>
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">
						<div class="row border-bottom">
							<div class="col text-start">
								<span class="fw-bold fs-4">대인/가족관계</span>
							</div>
						</div>
						<div class="row">							
							<c:forEach items="${counselorList}" var="counselorList">
							<c:if test="${counselorList.TYPECATEGORY == 2}">							
							<div class="col-2">
								<div class="row mt-2">
									<c:choose>
									<c:when test="${!empty counselorList.PROFILEIMAGE}">
									<div class="col">
										<a href="./counselorDetail?id=${counselorList.ID}">
											<img src="../../resources/img/counselorImage/${counselorList.PROFILEIMAGE}" class="img-fluid img-thumbnail">
										</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="col">
										<a href="./counselorDetail?id=${counselorList.ID}">
											<img src="../../resources/img/counselorImage/no_image.jpg" class="img-fluid img-thumbnail">
										</a>
									</div>
									</c:otherwise>
									</c:choose>									
								</div>
								<div class="row mt-2">
									<div class="col text-center">
										<a href="./counselorDetail?id=${counselorList.ID}" role="button" class="btn btn-white">
											<span class="fw-bold">${counselorList.NAME}</span> 상담사
										</a>
									</div>
								</div>								
							</div>
							</c:if>
							</c:forEach>							
						</div>
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">
						<div class="row border-bottom">
							<div class="col text-start">
								<span class="fw-bold fs-4">이성문제</span>
							</div>
						</div>
						<div class="row">							
							<c:forEach items="${counselorList}" var="counselorList">
							<c:if test="${counselorList.TYPECATEGORY == 3}">							
							<div class="col-2">
								<div class="row mt-2">
									<c:choose>
									<c:when test="${!empty counselorList.PROFILEIMAGE}">
									<div class="col">
										<a href="./counselorDetail?id=${counselorList.ID}">
											<img src="../../resources/img/counselorImage/${counselorList.PROFILEIMAGE}" class="img-fluid img-thumbnail">
										</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="col">
										<a href="./counselorDetail?id=${counselorList.ID}">
											<img src="../../resources/img/counselorImage/no_image.jpg" class="img-fluid img-thumbnail">
										</a>
									</div>
									</c:otherwise>
									</c:choose>									
								</div>
								<div class="row mt-2">
									<div class="col text-center">
										<a href="./counselorDetail?id=${counselorList.ID}" role="button" class="btn btn-white">
											<span class="fw-bold">${counselorList.NAME}</span> 상담사
										</a>
									</div>
								</div>								
							</div>
							</c:if>
							</c:forEach>							
						</div>
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">
						<div class="row border-bottom">
							<div class="col text-start">
								<span class="fw-bold fs-4">우울/불안문제</span>
							</div>
						</div>
						<div class="row">							
							<c:forEach items="${counselorList}" var="counselorList">
							<c:if test="${counselorList.TYPECATEGORY == 4}">							
							<div class="col-2">
								<div class="row mt-2">
									<c:choose>
									<c:when test="${!empty counselorList.PROFILEIMAGE}">
									<div class="col">
										<a href="./counselorDetail?id=${counselorList.ID}">
											<img src="../../resources/img/counselorImage/${counselorList.PROFILEIMAGE}" class="img-fluid img-thumbnail">
										</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="col">
										<a href="./counselorDetail?id=${counselorList.ID}">
											<img src="../../resources/img/counselorImage/no_image.jpg" class="img-fluid img-thumbnail">
										</a>
									</div>
									</c:otherwise>
									</c:choose>									
								</div>
								<div class="row mt-2">
									<div class="col text-center">
										<a href="./counselorDetail?id=${counselorList.ID}" role="button" class="btn btn-white">
											<span class="fw-bold">${counselorList.NAME}</span> 상담사
										</a>
									</div>
								</div>								
							</div>
							</c:if>
							</c:forEach>							
						</div>
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">
						<div class="row border-bottom">
							<div class="col text-start">
								<span class="fw-bold fs-4">진로문제</span>
							</div>
						</div>
						<div class="row">							
							<c:forEach items="${counselorList}" var="counselorList">
							<c:if test="${counselorList.TYPECATEGORY == 5}">							
							<div class="col-2">
								<div class="row mt-2">
									<c:choose>
									<c:when test="${!empty counselorList.PROFILEIMAGE}">
									<div class="col">
										<a href="./counselorDetail?id=${counselorList.ID}">
											<img src="../../resources/img/counselorImage/${counselorList.PROFILEIMAGE}" class="img-fluid img-thumbnail">
										</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="col">
										<a href="./counselorDetail?id=${counselorList.ID}">
											<img src="../../resources/img/counselorImage/no_image.jpg" class="img-fluid img-thumbnail">
										</a>
									</div>
									</c:otherwise>
									</c:choose>									
								</div>
								<div class="row mt-2">
									<div class="col text-center">
										<a href="./counselorDetail?id=${counselorList.ID}" role="button" class="btn btn-white">
											<span class="fw-bold">${counselorList.NAME}</span> 상담사
										</a>
									</div>
								</div>								
							</div>
							</c:if>
							</c:forEach>							
						</div>
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">
						<div class="row border-bottom">
							<div class="col text-start">
								<span class="fw-bold fs-4">학업문제</span>
							</div>
						</div>
						<div class="row">							
							<c:forEach items="${counselorList}" var="counselorList">
							<c:if test="${counselorList.TYPECATEGORY == 6}">							
							<div class="col-2">
								<div class="row mt-2">
									<c:choose>
									<c:when test="${!empty counselorList.PROFILEIMAGE}">
									<div class="col">
										<a href="./counselorDetail?id=${counselorList.ID}">
											<img src="../../resources/img/counselorImage/${counselorList.PROFILEIMAGE}" class="img-fluid img-thumbnail">
										</a>
									</div>
									</c:when>
									<c:otherwise>
									<div class="col">
										<a href="./counselorDetail?id=${counselorList.ID}">
											<img src="../../resources/img/counselorImage/no_image.jpg" class="img-fluid img-thumbnail">
										</a>
									</div>
									</c:otherwise>
									</c:choose>									
								</div>
								<div class="row mt-2">
									<div class="col text-center">
										<a href="./counselorDetail?id=${counselorList.ID}" role="button" class="btn btn-white">
											<span class="fw-bold">${counselorList.NAME}</span> 상담사
										</a>
									</div>
								</div>								
							</div>
							</c:if>
							</c:forEach>							
						</div>
					</div>
				</div>
								
			</div>			
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>