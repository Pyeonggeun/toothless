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
<div class="row py-2" style="box-shadow: 2px 2px 2px gray; font-size: 0.9em;">
	<div class="col ps-2">
		<span>&#035;&nbsp;${ajdksCompanyInfoDto.company_name } 님 환영합니다</span>
	</div>	
	<div class="col pe-2 text-end nolinenoblue">
		<a href="../../taeho/external/ajdksCompanyLogoutProcess">로그아웃</a>
	</div>	
</div>
	
<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
<div class="row">
	<div class="col">

		<div class="row pt-4 pb-3 px-5">
			<div class="col border-bottom fw-bold pb-2" style="font-size: 1.1em;">
				<i class="bi bi-check2-circle fs-5"></i>&nbsp;현재 진행 과정
			</div>
		</div>
				
		<div class="row row-cols-4 px-5">
			<c:forEach items="${ingInternshipCourseList }" var="ingInternshipCourseMap">
				<div class="col py-3">
					<div class="card" style="height: 13em; cursor: pointer;" onclick="location.href='./writeCompanyTimecardPage?internshipCoursePk=${ingInternshipCourseMap.INTERNSHIP_COURSE_PK}'">
					  <div class="card-header text-center" style="background-color: #F5F2FC; border-color: #F5F2FC;">
					    ${ingInternshipCourseMap.COURSE_TITLE }
					  </div>
					  <div class="card-body py-0">
					    <p class="card-text">
					    	<div class="row">
					    		<div class="col">
								    실습기간 : 		
					    		</div>
					    	</div>
					    	<div class="row">
					    		<div class="col">
					    			<fmt:formatDate value="${ingInternshipCourseMap.INTERNSHIP_START_DATE }" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${ingInternshipCourseMap.INTERNSHIP_END_DATE }" pattern="yyyy.MM.dd"/> 		
					    		</div>
					    	</div>
					    	<div class="row mt-2">
					    		<div class="col">
					    			실습정원 : ${ingInternshipCourseMap.INTERNSHIP_TOTAL_MEMBER }
					    		</div>
					    	</div>
					    	<div class="row mt-2">
					    		<div class="col">
					    			실습담당자 : 이장금
					    		</div>
					    	</div>
					    </p>
					  </div>
					</div>
				</div>
			</c:forEach>	
		</div>
		
	</div>
</div>

<div class="row py-5">
	<div class="col py-5"></div>
</div>
<div class="row py-5">
	<div class="col py-5"></div>
</div>

<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>		

</div><!-- 메인화면 출구 -->
	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>