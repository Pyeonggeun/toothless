<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
				<div class="row">
					<div class="col">
						<div class="row mt-5">
							<div class="col fw-semibold" style="font-size:1.3em">
								<span class="text-secondary fs-3">&gt;</span>
								담당 현장실습 진행상황
							</div>
						</div>
					
						<div class="row row-cols-3 mt-3">
						<c:forEach items="${chargedInternshipCourse}" var="internshipCourse">
							<div class="col px-4 py-2">
								<div class="row">
									<div class="col border px-2 py-2 d-grid">
										<a class="btn btn-light rounded-0 border py-3" href="./viewInternshipCourseDetailPage?internship_course_pk=${internshipCourse.internshipCourseDto.internship_course_pk}">
											<div class="row">
												<div class="col">
												<jsp:useBean id="now" class="java.util.Date"/>
												<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
													<c:choose>
														<c:when test="${internshipCourse.internshipCourseDto.applying_start_date < now && internshipCourse.internshipCourseDto.applying_end_date > now}">
															<span class="badge rounded-pill text-bg-success">모집중</span>
														</c:when>
														<c:when test="${internshipCourse.internshipCourseDto.applying_end_date < now && internshipCourse.internshipCourseDto.announcement_date > now}">
															<span class="badge rounded-pill text-bg-warning">결과발표 대기중</span>
														</c:when>
														<c:when test="${internshipCourse.internshipCourseDto.announcement_date <= now && internshipCourse.internshipCourseDto.internship_start_date > now}">
															<span class="badge rounded-pill text-bg-info">결과발표 완료</span>
														</c:when>
														<c:when test="${internshipCourse.internshipCourseDto.internship_start_date < now && internshipCourse.internshipCourseDto.internship_end_date > now}">
															<span class="badge rounded-pill text-bg-primary">실습과정 진행중</span>
														</c:when>
														<c:when test="${internshipCourse.internshipCourseDto.internship_end_date < now && internshipCourse.isExistProfessorEvaluation < internshipCourse.countInternBycoursePk}">
															<span class="badge rounded-pill text-bg-danger">평가 미완료</span>
														</c:when>
														<c:when test="${internshipCourse.internshipCourseDto.internship_end_date < now && internshipCourse.isExistProfessorEvaluation == internshipCourse.countInternBycoursePk}">
															<span class="badge rounded-pill text-bg-secondary">평가 완료</span>
														</c:when>
													</c:choose>
												</div>
											</div>
											<div class="row mt-2">
												<div class="col fw-semibold" style="font-size:1.1em">
													${internshipCourse.internshipCourseDto.course_title}
												</div>
											</div>
											<div class="row">
												<div class="col fw-semibold" style="font-size:0.8em">
													${internshipCourse.companyInfoDto.company_name}
												</div>
											</div>
											<div class="row mt-3">
												<div class="col">
													<span class="fw-semibold">${internshipCourse.countInternBycoursePk}</span>명 진행
												</div>
											</div>
											<div class="row mt-2">
												<div class="col text-secondary fw-semibold" style="font-size:0.9em">
													모집기간 : 
													<fmt:formatDate value="${internshipCourse.internshipCourseDto.applying_start_date}" pattern="yyyy.MM.dd"/>
													 - <fmt:formatDate value="${internshipCourse.internshipCourseDto.applying_end_date}" pattern="yyyy.MM.dd"/>
												</div>
											</div>
											<div class="row">
												<div class="col text-secondary fw-semibold" style="font-size:0.9em">
													현장실습 진행기간 : 
													<fmt:formatDate value="${internshipCourse.internshipCourseDto.internship_start_date}" pattern="yyyy.MM.dd"/>
													 - <fmt:formatDate value="${internshipCourse.internshipCourseDto.internship_end_date}" pattern="yyyy.MM.dd"/>
												</div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
					</div>
				</div>
			
				
			</div>
		</div>
	</div>
	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>