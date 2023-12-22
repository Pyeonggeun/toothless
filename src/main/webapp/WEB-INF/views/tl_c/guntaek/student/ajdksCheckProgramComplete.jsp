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
			<div class="row ">	
				<div class="col mx-5">
				
				
				<div class="row mt-4">
					<div class="col">
						<p style="font-weight:bold; font-size:1.2em" ><i class="bi bi-list"></i>&nbsp;&nbsp;교육 프로그램 이수 내역</p>							 	
					</div>		
				</div>
				
				<div class="row">
						<div class="col border border-1 border-dark"></div>
				</div>
				  
			    <div class="row mt-5 border-1" style = "background-color:#F8F8F8" >
			        
			            <div class="col-1 d-flex justify-content-center border-start border-top border-bottom ">No</div>
			            <div class="col-3 d-flex justify-content-center border-start border-top border-bottom ">제목</div>
			            <div class="col-1 d-flex justify-content-center border-start border-top border-bottom ">강연자</div>
			            <div class="col-2 d-flex justify-content-center border-start border-top border-bottom ">장소</div>
			            <div class="col d-flex justify-content-center border-start border-top border-bottom ">마감일</div>
			            <div class="col d-flex justify-content-center border-start border-top border-bottom ">진행 날짜</div>
			            <div class="col d-flex justify-content-center border-start border-top border-bottom border-end	">상태</div>
			    </div>
				
				<c:forEach items="${CompleteList}" var="a">
			    	<div class="row" style="height: 3em;">
			        <div class="col-1 border-start border-bottom d-flex justify-content-center align-items-center">${a.internedu_program_pk}</div>
			        <div class="col-3 border-start border-bottom d-flex justify-content-center align-items-center">${a.title}</div>
			        <div class="col-1 border-start border-bottom d-flex justify-content-center align-items-center">${a.lecturer}</div>
			        
			        <div class="col-2 border-start border-bottom d-flex justify-content-center align-items-center">${a.place}</div>
			        
			        <div class="col border-start border-bottom d-flex justify-content-center align-items-center">
			            <fmt:formatDate pattern="yyyy/MM/dd" value="${a.deadline_date}" />
			        </div>
			        <div class="col border-start border-bottom d-flex justify-content-center align-items-center">${a.progress_date}</div>
			        <div class="col border-end border-start border-bottom d-flex justify-content-center align-items-center">
			            <label for ="gg">이수</label> &nbsp;
			            <i id ="gg" class="bi bi-check-circle-fill" style ="color:navy;"></i>
			        </div>
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
		<!-- 본문 끝 -->
		
		</div>
		
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>