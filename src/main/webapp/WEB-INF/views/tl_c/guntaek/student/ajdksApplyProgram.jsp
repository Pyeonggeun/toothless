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
				
					<div class="row mt-5 ms-3">
					<div class="col fw-bold">
							<h3> <i class="bi bi-list-task"></i> &nbsp;&nbsp;교육 프로그램 신청 내역</h3>
							 
					</div>
					</div>
					<div class="row mt-3">
						<div class="col border border-2 border-dark"></div>
					</div>
					
				<c:forEach items="${applyprogramList}" var = "list">
					<div class="row mt-5">
						<div class="col-1"></div>
						<div class="col border" style ="height:12em; border-radius:10px;">
						
							<div class="row ps-5 mt-3">
							 
    
								<div class="col ms-4">
								<span class="border-3 border text-secondary ps-2 pe-1 pb-1">
									<fmt:formatDate pattern = "yyyy" value ="${list.EduProgramDto.created_at}"/> 
								</span>
								&nbsp;
								<span style ="border:solid; border-color:#00EF91; color:#00EF91" class=" ps-2 pe-1 pb-1" >
									E-러닝
								</span>
								</div>
								<div class="col-1"></div>
								<div class="col-7"></div>
								
								
								<div class="col-2 d-flex justify-content-end "> 
									
								</div>
							
							
							</div>
							<div class="row mt-2 ms-2 ps-5">
								<div class="col"><h4 style="font-weight:bold;">${list.EduProgramDto.title}</h4></div>
							</div>
							<div class="row mt-2 ">
								<div class="col">	</div>
							</div>
							<div class="row mt-3 ps-5">
								<div class="col-1 d-flex justify-content-end"><span style="font-weight:bold;">접수 기간</span>	</div> 
								<div class="col-2" style ="color:gray;">
								<fmt:formatDate pattern = "MM-dd" value ="${list.EduProgramDto.created_at}"/>
								~ <fmt:formatDate pattern = "MM-dd" value ="${list.EduProgramDto.deadline_date}"/>								
								</div> 
								<div class="col-1 d-flex justify-content-end"><span style="font-weight:bold;">신청 인원</span></div> <div class="col-2"> ${list.getCountPeople} &nbsp; / &nbsp;
								
								<span style ="color:gray;">${list.EduProgramDto.maximum_applicant}</span>								
								</div>
								
								<div class="col-6"></div>
							</div>
							<div class ="row mt-2 ps-5">
								<div class="col-1 d-flex justify-content-end">
								  		<span style="font-weight:bold;">교육 날짜</span>	
								  </div> 
								  <div class="col-2" style ="color:gray;">${list.EduProgramDto.progress_date}</div> 
								<div class="col-1 d-flex justify-content-end"><span style="font-weight:bold;">지역</span>	</div> <div class="col-2" style ="color:gray;">${list.EduProgramDto.place}</div>
								
								
								<div class="col-6 d-flex justify-content-end pe-0" style ="padding-top:0.8em">
									<c:if test ="${list.applyDto.completion == 'Y'}">
											<button disabled ="disabled" class="btn btn-primary">수료 완료</button>
									</c:if>
									<c:if test ="${list.applyDto.completion == 'N'}">
											<button disabled ="disabled" class="btn btn-danger">미수료</button>
									</c:if>
								</div>
							</div>
							</div>
							<div class="col-1"></div></div>	 
				</c:forEach>
				
				
				
				
				
				
				
				
				<!-- 본문 끝 -->
				</div>
			</div>
		</div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>