<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>교직원 메인페이지</title>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<!-- 취업팀 상단 네비 바 -->
			<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>
		</div>
		<div class="row">
			<!-- 취업팀 메뉴 바 -->
			<div class="col-2">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			<div class="col border-start">
				<!-- 이제 여따가 진행 구직희망, 구직희망 신청,기업 -->
				<div class="row ms-5 mt-5 pt-3">
					
					<!-- 진행 구직희망 -->
					<div class="col me-4">
					
						<div class="row fw-bold fs-5 pb-1 mb-2 border-bottom border-bd-border border-2">
							<div class="col">진행 구직희망</div>
							<div class="col text-end fw-bold fs-5">
								<a href="../jm_consulting/staffViewOnlineConsultingPage" class="btn"><i class="bi bi-plus-lg text-black"></i></a>	
							</div>
						</div>
						 
						<div class="row">
							<div class="col">
								<c:forEach items="${progressOnlinceConsultingNumFive}" var="e">
										<div class="row border-bottom border-bs-border pb-2 mb-2">
											<div class="col-1 text-center fw-bold pt-1">${e.onlineConsultingDto.on_consulting_pk}</div>
											<div class="col"><a class="btn ms-4" href="../jm_consulting/viewDetailStudentInfoPage?hope_job_pk=${e.HOPE_JOB_PK}">${e.studentInfoDto.name}</a></div>
											<div class="col-3 text-center pt-1">
												${e.studentInfoDto.student_id}									
											</div>
										</div>
								</c:forEach> 							
							</div>						
						</div>
					</div>
					
					
					<!-- 구직희망 신청 -->
					<div class="col me-4">
						<div class="row fw-bold fs-5 pb-1 mb-2 border-bottom border-bd-border border-2">
							<div class="col">구직희망 신청</div>
							<div class="col text-end fw-bold fs-5">
								<a href="../jm_consulting/viewStudentListPage" class="btn"><i class="bi bi-plus-lg text-black"></i></a>	
							</div>
						</div>
						
						<div class="row">
							<div class="col">
								<c:forEach items="${getHopeJobInfoNumFive}" var="e">
										<div class="row border-bottom border-bs-border pb-2 mb-2">
											<div class="col-1 text-center fw-bold pt-1">${e.HOPE_JOB_PK}</div>
											<div class="col"><a class="btn ms-4" href="../jm_consulting/viewDetailStudentInfoPage?hope_job_pk=${e.HOPE_JOB_PK}">${e.NAME}</a></div>
											<div class="col-3 text-center pt-1" style="font-size:0.8em;">
												<fmt:formatDate pattern="yyyy-MM-dd" value="${e.CREATED_AT}"/>											
											</div>
										</div>
								</c:forEach> 							
							</div>												
						</div>
					</div>
					
					 
					<!-- 기업 -->
					<div class="col me-4">
						<div class="row fw-bold fs-5 pb-1 mb-2 border-bottom border-bd-border border-2">
							<div class="col">기업</div>
							<div class="col text-end fw-bold fs-5">
								<a href="../gw_company/companyManagementPage" class="btn"><i class="bi bi-plus-lg text-black"></i></a>	
							</div>
						</div>
						
						<div class="row">
							<div class="col">
								<c:forEach items="${companyList}" var="list" varStatus="loop">
									<c:if test="${loop.index < 5}">
										<div class="row border-bottom border-bs-border pb-2 mb-2">
											<div class="col-1 text-center fw-bold pt-1">${list.companyDto.com_pk}</div>
											<div class="col"><a class="btn ms-4" href="../gw_company/companyViewDetailsPage?com_pk=${list.companyDto.com_pk}">${list.companyDto.com_name}</a></div>
											<div class="col-3 text-center pt-1">
												<c:choose>
													<c:when test="${list.companyDto.is_family_company=='Y'}">
														<span class="badge text-bg-primary">가족기업</span>
													</c:when>
													
													<c:when test="${list.companyDto.is_family_company=='N'}">
														<span class="badge text-bg-secondary">일반기업</span>
													</c:when>
												</c:choose>
												
											
											</div>
										</div>
									</c:if>
								</c:forEach> 
								
							</div>
						</div>
					</div>
					
					<div class="col-2"></div>
				</div>
				
				
				<!-- 프로그램 -->
				<div class="row ms-5 mt-5 pt-3">
				
					<div class="col me-4">
						<div class="row fw-bold fs-5 pb-1 border-bottom border-bd-border border-2">
							<div class="col">프로그램</div>
							<div class="col text-end fw-bold fs-5">
								<a href="../gw_program/programListPage" class="btn"><i class="bi bi-plus-lg text-black"></i></a>	
							</div>
						</div>
						
						<div class="row mt-4"> 
							<c:set var="currentTime" value="<%= new java.util.Date() %>" />
							<c:forEach items="${programList}" var="list" varStatus="loop">
								<c:if test="${loop.index < 4}">
									<div class="col border border-secondery rounded-4 p-0 m-4">
										<div class="row"> 
											<img class="img-fluid" src="../../resources/img/employment/${list.programDto.prg_main_image}" style="height: 10em; weight: 10em;">
											
										</div>  
										<div class="row mt-2">  
											<div class="col mt-1 ms-2 ps-3">
												<c:choose>
									                <c:when test="${list.programDto.prg_apply_deadline.before(currentTime)}">
									                	<span class="text-center badge text-bg-secondary">마감</span>
									                </c:when>
									                <c:otherwise>
									                	 <span class="text-center badge text-bg-primary">모집중</span>
									                </c:otherwise>
									            </c:choose>
									          </div>
								        </div> 
										<div class="row">
											<div class="col">
												<a class="btn text-truncate fw-bold" href="../gw_program/programViewDetailsForStudentPage?program_pk=${list.programDto.program_pk}" style="font-size: 1.1em">${list.programDto.prg_name}</a>
											</div>
										</div>
										<div class="row">
											<div class="col-1"></div>
											<div class="col border-bottom"></div>
											<div class="col-1"></div>
										</div> 
										<div class="row mt-2 ps-3">
											<div class="col-4 fw-bold">모집기간</div>
											<div class="col ps-0">
												<fmt:formatDate value="${list.programDto.prg_apply_deadline}" pattern="yyyy.MM.dd"/>
											</div>
										</div>
										
										<div class="row ps-3 pb-4">
											<div class="col-4 fw-bold">운영기간</div>
											<div class="col ps-0">
												<fmt:formatDate value="${list.programDto.prg_schedule}" pattern="yyyy.MM.dd"/>
											</div>
										</div>
										
									</div>
								</c:if>
							</c:forEach> 
						</div>
					</div>
					<div class="col-2"></div>
				</div>
			</div>
		</div>
		<div class="row mb-5 pb-5"><div class="col"></div></div>
		<!-- futter -->
		<div class="row">
			<div class="col">
				<jsp:include page="./futter.jsp"></jsp:include>
			</div>
		</div>	
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>