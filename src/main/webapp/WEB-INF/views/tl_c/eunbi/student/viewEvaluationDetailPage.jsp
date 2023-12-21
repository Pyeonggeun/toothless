<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title> AJDKS TEMPLATE FOR STUDENT </title>
<style>
	/*학생좌측메뉴바설정*/
	.studentleftmenubar input {
	    display: none;
	}
	
	.studentleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.studentleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.studentleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.studentleftmenubar input + label + .content {
	    display: none;
	}
	
	.studentleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

</style>
</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<div class="row">
	<div class="col">
		<jsp:include page="../../common/ajdksHighestMenubarForStudent.jsp"></jsp:include>
	</div>
</div>
<div class="row">

	<!-- 좌측메뉴바 -->
	<jsp:include page="../../common/ajdksSideMenubarForStudent.jsp"></jsp:include>
	
	<!-- 본문 : 자유롭게 이용하세요 화이팅 -->	
	<div class="col">
		<div class="row">
			<div class="col mx-5">
			
			<!-- 본문작성공간 -->
				<div class="row mt-5">
					<div class="col fw-semibold mt-2" style="font-size:1.3em">
						<span class="text-secondary fs-3">&gt;</span>
						평가 상세보기
					</div>
				</div>
				
				<div class="row">
					<div class="col-6 pe-4">
						<div class="row mt-4">
							<div class="col fw-semibold text-dark-emphasis" style="font-size:1.23em">
								<i class="bi bi-check2-square me-2"></i>기업평가
							</div>
						</div>
						<div class="row mt-2 border py-4 px-3" style="height:28em">
							<div class="col">
								<div class="row pt-2">
									<div class="col-3 fw-semibold text-dark-emphasis align-self-center">
										- 성실성 평가점수
									</div>
									<div class="col align-self-center">
									<c:choose>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 5}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 4}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 3}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 2}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 1}">
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
									</c:choose>
									</div>
									<div class="col-3 fw-semibold text-dark-emphasis align-self-center ms-2">
										- 책임감 평가점수
									</div>
									<div class="col align-self-center">
									<c:choose>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 5}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 4}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 3}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 2}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 1}">
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
									</c:choose>
									</div>
								</div>
								
								<div class="row border-bottom pb-4">
									<div class="col-3 fw-semibold text-dark-emphasis align-self-center">
										- 협조성 평가점수
									</div>
									<div class="col align-self-center">
									<c:choose>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 5}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 4}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 3}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 2}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 1}">
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
									</c:choose>
									</div>
									<div class="col-3 fw-semibold text-dark-emphasis align-self-center ms-2">
										- 업무달성도
									</div>
									<div class="col align-self-center">
									<c:choose>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 5}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 4}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 3}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 2}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.companyEvaluation.diligence_score == 1}">
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
									</c:choose>
									</div>
								</div>

								<div class="row mt-4">
									<div class="col fw-semibold text-dark-emphasis mt-2" style="font-size:1.1em">
										총 평가
									</div>
								</div>
								<div class="row mt-3">
									<div class="col overflow-y-scroll" style="height:14em">
										${evaluations.companyEvaluation.review}
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-6 ps-4">
						<div class="row mt-4">
							<div class="col fw-semibold text-dark-emphasis" style="font-size:1.23em">
								<i class="bi bi-check2-square me-2"></i>교수평가
							</div>
						</div>
						<div class="row mt-2 border py-4 px-3" style="height:28em">
							<div class="col">
								<div class="row pt-2">
									<div class="col-3 fw-semibold text-dark-emphasis align-self-center">
										- 성실성 평가점수
									</div>
									<div class="col align-self-center">
									<c:choose>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 5}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 4}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 3}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 2}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 1}">
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
									</c:choose>
									</div>
									<div class="col-3 fw-semibold text-dark-emphasis align-self-center ms-2">
										- 책임감 평가점수
									</div>
									<div class="col align-self-center">
									<c:choose>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 5}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 4}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 3}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 2}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 1}">
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
									</c:choose>
									</div>
								</div>
								
								<div class="row border-bottom pb-4">
									<div class="col-3 fw-semibold text-dark-emphasis align-self-center">
										- 협조성 평가점수
									</div>
									<div class="col align-self-center">
									<c:choose>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 5}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 4}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 3}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 2}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 1}">
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
									</c:choose>
									</div>
									<div class="col-3 fw-semibold text-dark-emphasis align-self-center ms-2">
										- 업무달성도
									</div>
									<div class="col align-self-center">
									<c:choose>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 5}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 4}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 3}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 2}">
											<i class="bi bi-star-fill text-warning fs-5 me-1"></i>
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
										<c:when test="${evaluations.professorEvaluation.diligence_score == 1}">
											<i class="bi bi-star-fill text-warning fs-5"></i>
										</c:when>
									</c:choose>
									</div>
								</div>

								<div class="row mt-4">
									<div class="col fw-semibold text-dark-emphasis mt-2" style="font-size:1.1em">
										총 평가
									</div>
								</div>
								<div class="row mt-3">
									<div class="col overflow-y-scroll" style="height:14em">
										${evaluations.professorEvaluation.review}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div id="notice" class="row border mt-4" style="font-size:0.85em">
					<div class="col px-4 py-4 text-dark-emphasis">
						<div class="row">
							<div class="col fw-semibold">
								평가 상세 주의사항
							</div>
						</div>
						<div class="row">
							<div class="col mt-2">
								- 현재 페이지에서 성적 이의제기 신청을 할 수 없습니다.
							</div>
						</div>
						<div class="row">
							<div class="col mt-2">
								- 평가에 대한 문의사항은 교수 및 담당 산업체에 문의하여 주시길 바랍니다.
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>
	</div>
	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>