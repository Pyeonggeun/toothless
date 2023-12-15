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
<script>

	function internshipCourseList(){
		 
	}


</script>
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
				<span>&#035;&nbsp;ㅇㅇㅇ 님 환영합니다</span>
			</div>	
			<div class="col pe-2 text-end nolinenoblue">
				<a href="./ajdksCompanyLogoutProcess">로그아웃</a>
			</div>	
		</div>
		
		<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
		
		<div class="col">
		<div class="row">
			<div class="col mx-4">
			
			<!-- 본문작성공간 -->
				<div class="row mt-5">
					<div class="col fw-bold">
						현장실습과정 조회
					</div>
				</div>
				<div class="row mt-3">
					<div class="col border border-2"></div>
				</div>
				
				<div class="row mt-4">
					<div class="col border border-1 border-dark"></div>
				</div>
				<div class="row mt-3 pb-3  border-2 text-center fw-bold" style="font-size: 0.9em;">
					<div class="col-1">No</div>
					<div class="col-4">과정제목</div>
					<div class="col-1">실습인원</div>
					<div class="col-3">실습 기간</div>
					<div class="col">선발 발표일</div>
					<div class="col">등록일자</div>
				</div>
				<div class="row mt-1">
					<div class="col border-bottom border-secondary-subtle"></div>
				</div>
				<c:forEach items="${list}" var="il">
					<div class="row mt-3 text-center" style="font-size: 0.8em;">
						<div class="col-1">${il.internship_course_pk}</div>
						<div class="col-4">${il.course_title}</div>
						<div class="col-1">${il.internship_total_member}</div>
						<div class="col-3">${il.applying_start_date - li.applying_end_date}</div>
						<div class="col">${il.announcement_date}</div>
						<div class="col">${il.created_at}</div>
					</div>
					<div class="row mt-3">
						<div class="col border border-secondary-subtle"></div>
					</div>
				</c:forEach>
				<div class="row mt-2">
					<div class="col"></div>
					<div class="col-1">
						<a class="btn btn-secondary" href="../../eunbi/external/viewEvaluationCourseListPage">메인</a>
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