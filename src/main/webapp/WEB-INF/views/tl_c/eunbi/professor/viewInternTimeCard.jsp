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
<title> AJDKS TEMPLATE FOR PROFESSOR </title>
<style>
	/*교수좌측메뉴바설정*/
	.professorleftmenubar input {
	    display: none;
	}
	
	.professorleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.professorleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.professorleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.professorleftmenubar input + label + .content {
	    display: none;
	}
	
	.professorleftmenubar input:checked + label + .content {
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
		<jsp:include page="../../common/ajdksHighestMenubarForProfessor.jsp"></jsp:include>
	</div>
</div>
<div class="row">

	<!-- 좌측메뉴바 -->
	<jsp:include page="../../common/ajdksSideMenubarForProfessor.jsp"></jsp:include>
	
	<!-- 본문 :  자유롭게 이용하세요 화이팅 -->
	<div class="col">
		<div class="row">
			<div class="col mx-5">
			
				<!-- 본문작성공간 -->
				<div class="row mt-5">
					<div class="col fw-semibold" style="font-size:1.3em">
						<span class="text-secondary fs-3">&gt;</span>
						업무일지조회
					</div>
				</div>
				
				<c:if test="${empty timecatedReport}">
					<div class="row mt-3">
					<div class="col px-4 py-4 mt-2" style="background-color:#e6ecf5">
						<div class="row">
							<div class="col mx-2 py-2">
								<i class="bi bi-exclamation-triangle"></i>&nbsp;&nbsp;아직 작성된 업무일지가 없습니다.
							</div>
						</div>
					</div>
				</div>
				</c:if>
				
				<div class="row">
					<div class="col">
						<div class="row mt-4">
							<div class="col fw-semibold" style="font-size:1.2em">
								출근부
							</div>
						</div>
						<div class="row">
							<div class="col px-4">
								<div class="row border-top border-bottom text-center py-3 mt-3 border-secondary">
									<div class="col-3 border-end">
										<div class="row">
											<div class="col fw-semibold" style="font-size:1.05em">
												<i class="bi bi-check-circle text-success me-2"></i>출근
											</div>
										</div>
										<div class="row mt-2">
											<div class="col text-secondary">
												<span class="fs-5 fw-semibold text-dark">${countTimecard.countAttendance}</span> 회
											</div>
										</div>
									</div>
									<div class="col-3 border-end">
										<div class="row">
											<div class="col fw-semibold" style="font-size:1.05em">
												<i class="bi bi-dash-circle text-warning me-2"></i>지각
											</div>
										</div>
										<div class="row mt-2">
											<div class="col text-secondary">
												<span class="fs-5 fw-semibold text-dark">${countTimecard.countLate}</span> 회
											</div>
										</div>
									</div>
									<div class="col-3 border-end">
										<div class="row">
											<div class="col fw-semibold" style="font-size:1.05em">
												<i class="bi bi-dash-circle text-primary me-2"></i>조퇴
											</div>
										</div>
										<div class="row mt-2">
											<div class="col text-secondary">
												<span class="fs-5 fw-semibold text-dark">${countTimecard.countEarlyleave}</span> 회
											</div>
										</div>
									</div>
									<div class="col-3">
										<div class="row">
											<div class="col fw-semibold" style="font-size:1.05em">
												<i class="bi bi-x-circle text-danger me-2"></i>결근
											</div>
										</div>
										<div class="row mt-2">
											<div class="col text-secondary">
												<span class="fs-5 fw-semibold text-dark">${countTimecard.countAbsent}</span> 회
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row mb-5">
					<div class="col mb-4">
						<div class="row mt-4">
							<div class="col fw-semibold mt-3" style="font-size:1.2em">
								출근일지
							</div>
						</div>
						<div class="row row-cols-5">
							
							<c:forEach items="${timecatedReport}" var="report">
								<div class="col mt-3 px-4">
									<div class="row border rounded-1" style="height:28em">
										<div class="col">
											<div class="row">
												<div class="col py-2 fw-semibold bg-body-secondary">
													<fmt:formatDate value="${report.timecard.created_at}" pattern="yyyy-MM-dd"/>
												</div>
												<div class="col text-end py-2 fw-semibold bg-body-secondary">
													<c:choose>
														<c:when test="${report.timecard.timecard_category_pk == 1}">
															<i class="bi bi-check-circle text-success"></i>
														</c:when>
														<c:when test="${report.timecard.timecard_category_pk == 2}">
															<i class="bi bi-dash-circle text-warning"></i>
														</c:when>
														<c:when test="${report.timecard.timecard_category_pk == 3}">
															<i class="bi bi-dash-circle text-primary"></i>
														</c:when>
														<c:when test="${report.timecard.timecard_category_pk == 4}">
															<i class="bi bi-x-circle text-danger"></i>
														</c:when>
													</c:choose>
												</div>
											</div>
											<c:choose>
												<c:when test="${report.timecard.timecard_category_pk == 4}">
													<div class="row mt-2">
														<div class="col text-secondary fw-semibold">
															결근
														</div>
													</div>
												</c:when>
												<c:when test="${report.timecard.timecard_category_pk == 1 or report.timecard.timecard_category_pk == 2 or report.timecard.timecard_category_pk == 3}">
													<div class="row mt-2">
															<div class="col text-secondary" style="font-size:0.8em">
																출근시각 : ${report.timecard.getin_hour}시 ${report.timecard.getin_minute}분
															</div>
														</div>
														<div class="row">
															<div class="col text-secondary" style="font-size:0.8em">
																퇴근시각 : ${report.timecard.getoff_hour}시 ${report.timecard.getoff_minute}분
															</div>
														</div>
														<div class="row mt-2">
															<div class="col fw-semibold" style="font-size:0.9em">
																지도일지
															</div>
														</div>
														<div class="row mt-1">
															<div class="col" style="font-size:0.8em; height:12em;">
																${report.timecard.company_log}
															</div>
														</div>
														<div class="row mt-2">
															<div class="col fw-semibold" style="font-size:0.9em">
																실습생 업무일지
															</div>
														</div>
														
														<c:forEach items="${internReport}" var="internReport">
															<fmt:formatDate value="${internReport.created_at}" pattern="yyyyMMdd" var="reportDate"/>
															<fmt:formatDate value="${report.timecard.created_at}" pattern="yyyyMMdd" var="cardDate"/>
															
															<c:choose>
																<c:when test="${reportDate == cardDate}">
																	<div class="row mt-1">
																		<div class="col" style="font-size:0.8em; height:13em;">
																			${internReport.report_content}
																		</div>
																	</div>
																</c:when>
															</c:choose>
															
														</c:forEach>
	
												</c:when>
												
											</c:choose>
											
										</div>
									</div>
								</div>
							</c:forEach>
							
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
		<c:if test="${empty timecatedReport}">
			<div class="row my-5">
				<div class="col my-5">
				</div>
			</div>
		</c:if>
		<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>
	</div>
	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>