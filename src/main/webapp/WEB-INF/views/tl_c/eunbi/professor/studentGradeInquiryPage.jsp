<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
						학생성적조회
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col px-4 py-4 mt-2" style="background-color:#e6ecf5">
						<div class="row">
							<div class="col mx-2 py-2">
								<i class="bi bi-exclamation-triangle"></i>&nbsp;&nbsp;교수평가 미완료 항목은 현장실습 상세 페이지로 이동하셔서 평가를 마무리해주시기 바랍니다.
							</div>
						</div>
					</div>
				</div>
				
				<div class="row mt-4" style="height:22em">
					<div class="col border-secondary border-top border-bottom overflow-y-scroll mt-1">
						<div class="row text-center bg-body-secondary border-bottom border-secondary py-1 fw-semibold">
							<div class="col-1 border-end">
								학번
							</div>
							<div class="col-2 border-end">
								이름
							</div>
							<div class="col-4 border-end">
								현장실습 과정명
							</div>
							<div class="col-2 border-end">
								진행기간
							</div>
							<div class="col-1 border-end">
								학생정보
							</div>
							<div class="col-1 border-end">
								평가상세
							</div>
							<div class="col-1">
								성적확인
							</div>
						</div>
						
						<jsp:useBean id="now" class="java.util.Date"/>
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
						<c:forEach items="${internList}" var="intern">
							<c:choose>
								<c:when test="${intern.internshipCourseDto.internship_end_date <= now}">
								<div class="row text-center py-1 border-bottom" style="font-size:0.95em">
									<div class="col-1 align-self-center fw-semibold border-end">
										${intern.studentDto.student_id}
									</div>
									<div class="col-2 align-self-center fw-semibold border-end">
										${intern.studentDto.name}
									</div>
									<div class="col-4 align-self-center border-end fw-semibold">
										<a class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="./viewInternshipCourseDetailPage?internship_course_pk=${intern.internshipCourseDto.internship_course_pk}">
										${intern.internshipCourseDto.course_title}</a>
									</div>
									<div class="col-2 align-self-center border-end">
										<fmt:formatDate value="${intern.internshipCourseDto.internship_start_date}" pattern="yyyy.MM.dd"/>
										 - <fmt:formatDate value="${intern.internshipCourseDto.internship_end_date}" pattern="yyyy.MM.dd"/>
									</div>
									<div class="col-1 align-self-center border-end d-grid">
										<a href="./viewStudentDetailPage?student_pk=${intern.studentDto.student_pk}" class="btn btn-outline-secondary btn-sm rounded-1">상세보기</a>
									</div>
									<div class="col-1 align-self-center d-grid px-2 border-end">
										<a href="./viewInternEvaluationDetailPage?student_intern_pk=${intern.internDto.student_intern_pk}" class="btn btn-secondary btn-sm rounded-1">상세보기</a>
									</div>
									<c:choose>
										<c:when test="${intern.didProfessorEvaluateIntern eq '1'}">
											<c:choose>
												<c:when test="${intern.grade eq 'Fail' or intern.grade eq 'Pass'}">
													<div class="col-1 align-self-center fw-bold">
														${intern.grade}
													</div>
												</c:when>
												<c:when test="${intern.grade == '0'}">
													<div class="col-1 align-self-center text-secondary fw-bold" style="font-size:0.9em">
														산업체 평가중
													</div>
												</c:when>
											</c:choose>
										</c:when>
										<c:when test="${intern.didProfessorEvaluateIntern eq '0'}">
											<c:choose>
												<c:when test="${intern.grade == '0'}">
													<div class="col-1 align-self-center text-secondary fw-bold" style="font-size:0.88em">
														교수평가 미완료
													</div>
												</c:when>
											</c:choose>
										</c:when>
									</c:choose>
								</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</div>
				
				<div id="notice" class="row border mt-5" style="font-size:0.85em">
					<div class="col px-4 py-4 text-dark-emphasis">
						<div class="row">
							<div class="col fw-semibold">
								성적 열람시 주의사항
							</div>
						</div>
						<div class="row">
							<div class="col mt-2">
								- 현장실습 성적은 "Pass" 와 "Fail"로 표기됩니다.
							</div>
						</div>
						<div class="row">
							<div class="col mt-2">
								- 평가 수정은 이의신청 기간에 한해서 가능합니다.
							</div>
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