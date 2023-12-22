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
<title> AJDKS TEMPLATE FOR STAFF </title>
<style>
	/*교직원좌측메뉴바설정*/
	.staffleftmenubar input {
	    display: none;
	}
	
	.staffleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.staffleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.staffleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.staffleftmenubar input + label + .content {
	    display: none;
	}
	
	.staffleftmenubar input:checked + label + .content {
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
		<jsp:include page="../../common/ajdksHighestMenubarForStaff.jsp"></jsp:include>
	</div>
</div>
<div class="row">

	<!-- 좌측메뉴바 -->
	<jsp:include page="../../common/ajdksSideMenubarForStaff.jsp"></jsp:include>
	
	<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
	<div class="col">
		<div class="row">
			<div class="col mx-4">
			<!-- 본문작성공간 -->
				
				
				<div class="row mt-5">
					<div class="col fw-bold">
						<i style ="font-size:1.5em;" class="bi bi-person-video3"></i> &nbsp; 이수내역 관리
					</div>
				</div>
				
				<div class="row mt-3">
					<div class="col border border-2"></div>
				</div>
				
				
				<div class="row mt-5 g-0 py-0 border mt-3 fw-bold" style="font-size: 0.9em; height: 3em; background-color:#F8F8F8; " >
				    <div class="col-1 d-flex justify-content-center  align-items-center border-end h-100">No</div>
				    <div class="col-3 d-flex justify-content-center align-items-center border-end h-100">제목</div>
				    <div class="col-1 d-flex justify-content-center align-items-center border-end h-100">강연자</div>
				    <div class="col-2 d-flex justify-content-center align-items-center border-end h-100">장소</div>
				    <div class="col d-flex justify-content-center align-items-center border-end h-100">마감일</div>
				    <div class="col d-flex justify-content-center align-items-center border-end h-100">진행 날짜</div>
				    <div class="col d-flex justify-content-center align-items-center border-end h-100">작성일자</div>
				</div>


					<c:forEach items="${EduListByStaff}" var="a">
					
						<div class="row g-0 py-0 "style="font-size: 0.9em; height: 3em;">
					    <div class="col-1 d-flex justify-content-center  align-items-center border-end border-start border-bottom h-100">${a.internedu_program_pk}</div>
					    <div class="col-3 d-flex justify-content-center align-items-center border-bottom border-end h-100">
					    		<a href="./ajdksDetailManageProgram?internedu_program_pk=${a.internedu_program_pk}" style ="color:black;">
									${a.title}
								</a>	</div>
					    <div class="col-1 d-flex justify-content-center align-items-center border-bottom  border-end  h-100">${a.lecturer}</div>
					    <div class="col-2 d-flex justify-content-center align-items-center border-bottom border-end  h-100">${a.place}</div>
					    <div class="col d-flex justify-content-center align-items-center border-bottom border-end  h-100"><fmt:formatDate pattern = "yyyy/MM/dd" value="${a.deadline_date}"/></div>
					    <div class="col d-flex justify-content-center align-items-center border-bottom border-end  h-100">${a.progress_date}</div>
					    <div class="col d-flex justify-content-center align-items-center border-bottom border-end  h-100"><fmt:formatDate pattern = "yyyy/MM/dd" value="${a.created_at}"/></div>
						</div>		
					
					</c:forEach>
				
						
							
					
						
			</div>
		</div>
		
					<div class="row mt-5"></div>
					<div class="row mt-5"></div>
					<div class="row mt-5"></div>	
					<div class="row mt-5"></div>
					<div class="row mt-5"></div>
					<div class="row mt-5"></div>
					<div class="row mt-5"></div>
					<div class="row mt-5"></div>
					<div class="row mt-5"></div>
					<div class="row mt-5"></div>
					<div class="row mt-5"></div>
					<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>
	</div>	
	

	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>