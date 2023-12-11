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
<title> AJDKS TEMPLATE FOR COMPANY </title>
<style>
	/*산업체좌측메뉴바설정*/
	.companyleftmenubar input {
	    display: none;
	}
	
	.companyleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #22212E;
	    transition: ease .1s;
	}
	
	.companyleftmenubar label:hover {
	    background: #22212E;
	    opacity: 50%;
	}
	
	.companyleftmenubar .content {
	    background: #1C1C26;
   	    transition: ease .5s;    
	}
	
	.companyleftmenubar input + label + .content {
	    display: none;
	}
	
	.companyleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

	/*산업체좌측메뉴바설정*/
	.timecardAccordion input[type=checkbox]{
	    display: none;
	}

	.timecardAccordion input[type=number]{
	    width: 4em;
	    height: 1.5em;
	}
	
	.timecardAccordion label {
	    display: block;    
	    cursor: pointer;
	    background: #F9F9F9;
	    transition: ease .1s;
	}
	
	.timecardAccordion label:hover {
	    background: #F9F9F9;
	    opacity: 50%;
	}
	
	.timecardAccordion .content {
	    background: #ffffff;
   	    transition: ease .5s;    
	}
	
	.timecardAccordion input + label + .content {
	    display: none;
	}
	
	.timecardAccordion input:checked + label + .content {
	    display: block;
	}	


</style>
</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<div class="row">

<!-- 좌측메뉴바 : col-2 -->
<jsp:include page="../../common/ajdksTemplateForCompany.jsp"></jsp:include>

<!-- 메인화면 -->
<div class="col">

	<!-- 안내문구 -->
	<div class="row py-2" style="box-shadow: 1px 1px 1px gray; font-size: 0.9em;">
		<div class="col ps-2">
			<span>&#035;&nbsp;${ajdksCompanyInfoDto.company_name } 님 환영합니다</span>
		</div>	
		<div class="col pe-2 text-end nolinenoblue">
			<a href="./ajdksCompanyLogoutProcess">로그아웃</a>
		</div>	
	</div>

	
<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
<div class="row">
	<div class="col">
		
		<!-- 현재 접속 과정 정보 -->
		<div class="row border-bottom px-5" style="box-shadow: 1px 1px 1px gray;">
			<div class="col">
				<div class="row pt-3">			
					<div class="col fw-bold">
						${internshipCourseMap.COURSE_TITLE }
					</div>
				</div>			
				<div class="row pt-2">
					<div class="col">
						실습정원 : ${internshipCourseMap.INTERNSHIP_TOTAL_MEMBER } 
					</div>
				</div>
				<div class="row pt-2">
					<div class="col">
						담당교수 : ${internshipCourseMap.PROFESSOR_NAME }
					</div>
					<div class="col">
						연락처 : ${internshipCourseMap.PHONE }
					</div>
				</div>
				<div class="row pt-2 pb-3">
					<div class="col">
						협력학과 : ${internshipCourseMap.DEPARTMENT_NAME } 
					</div>
					<div class="col">
						실습기간 : <fmt:formatDate value="${internshipCourseMap.INTERNSHIP_START_DATE }" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${internshipCourseMap.INTERNSHIP_END_DATE }" pattern="yyyy.MM.dd"/> 
					</div>
				</div>
			</div>
		</div>
		
		<div class="row py-3">
			<div class="col ps-5">
				<i class="bi bi-pencil-square"></i>&nbsp;출근부 작성
			</div>
		</div>


		<div class="row">
			<div class="col">
				<c:forEach items="${studentInternList }" var="studentInternMap">
					<div class="row timecardAccordion">
						<div class="col px-5">
							<input type="checkbox" id="title${studentInternMap.STUDENT_INTERN_PK }"/>
							<label class="pt-3 pb-2	ps-3 border-bottom border-white" for="title${studentInternMap.STUDENT_INTERN_PK }"><i class="bi bi-person-bounding-box"></i>&nbsp;${studentInternMap.NAME }</label>			
							<div class="content" style="font-size: 0.9em;">
								<form action="./writeTimecardProcess" method="get">
								<input name="internshipCoursePk" type="hidden" value="${internshipCourseMap.INTERNSHIP_COURSE_PK }">
								<input name="student_intern_pk" type="hidden" value="${studentInternMap.STUDENT_INTERN_PK }">
								<div class="row border mx-1 my-1 px-2 py-2">
								
									<div class="col ps-2">
										<div class="row pb-1">
											<div class="col">출결관리&nbsp;:</div>
										</div>									
										<div class="row py-1">
											<div class="col">출근일자&nbsp;&nbsp;
												<c:set var="today" value="<%=new java.util.Date()%>" />		
												<input name="timecard_year" type="number" min="1" max="2500" value='<fmt:formatDate value="${today }" pattern="yyyy"/>'>&nbsp;년&nbsp;
												<input name="timecard_month" type="number" min="1" max="12" value='<fmt:formatDate value="${today }" pattern="MM"/>'>&nbsp;월&nbsp;
												<input name="timecard_date" type="number" min="1" max="31" value='<fmt:formatDate value="${today }" pattern="dd"/>'>&nbsp;일&nbsp;											
											</div>
										</div>
										<div class="row py-1">
											<div class="col">출근시간&nbsp;&nbsp;
											<input name="getin_hour" type="number" min="0" max="23">&nbsp;시&nbsp;
											<input name="getin_minute" type="number" min="0" max="59">&nbsp;분&nbsp;
											</div>
										</div>
										<div class="row py-1">
											<div class="col">퇴근시간&nbsp;&nbsp;
											<input name="getoff_hour" type="number" min="0" max="23">&nbsp;시&nbsp;
											<input name="getoff_minute" type="number" min="0" max="59">&nbsp;분&nbsp;											
											</div>
										</div>
										<div class="row py-1">
											<div class="col">출결상태&nbsp;&nbsp;
												<input name="timecard_category_pk" type="radio" value="1">&nbsp;출근&nbsp;
												<input name="timecard_category_pk" type="radio" value="2">&nbsp;지각&nbsp;
												<input name="timecard_category_pk" type="radio" value="3">&nbsp;조퇴&nbsp;
												<input name="timecard_category_pk" type="radio" value="4">&nbsp;결근&nbsp;
											</div>
										</div>
									</div>
									
									<div class="col">
										<div class="row pb-2">
											<div class="col ps-0">지도일지&nbsp;:</div>
										</div>
										<div class="row">
											<textarea name="company_log" rows="5" cols="70"></textarea>
										</div>										
									</div>
									
									<div class="col-2 pt-4 text-end">
										<button class="btn btn-sm btn-outline-secondary" type="submit">제출하기</button>
									</div>
									
								</div>
							</form>	

							</div>
						</div>
					</div>
				</c:forEach>

			</div>		
		</div>

	</div><!-- 본문 col 출구 -->
</div>
	
</div><!-- 메인화면 출구 -->
	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>