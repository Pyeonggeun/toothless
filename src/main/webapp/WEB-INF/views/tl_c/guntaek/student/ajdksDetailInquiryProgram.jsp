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
							<!-- 본문작성공간 -->
				
					<!-- 프로그램 상세하게 보기... -->				
						<div class="row mt-4">
							<div class="col">
								<p style="font-weight:bold; font-size:1.2em" ><i class="bi bi-amd"></i>&nbsp;&nbsp;${EduDto.title}</p>							 	
							</div>	
						</div>
						<div class = "row" >
							<div class="border border-bottom border-dark border-1	"></div>
						</div>
						<div class="row mt-4">
							<div class = "col-2 d-flex justify-content-center align-items-center border-start border-end border-top border-bottom" style ="background-color:#f9f9f9; height:2.5em" >접수기간</div>
							<div class = "col-4 d-flex align-items-center  border-bottom border-top ">${EduDto.progress_date}</div>
							<div class = "col-2 d-flex justify-content-center align-items-center border-start border-end border-top border-bottom" style ="background-color:#f9f9f9; height:2.5em">모집마감일자</div>
							<div class = "col-4 d-flex align-items-center  border-end border-top border-bottom" >
							<fmt:formatDate pattern = "yyyy-MM-dd" value ="${EduDto.deadline_date}"/>
								
							</div>
						</div>
						<div class="row mt ">
							<div class = "col-2 d-flex justify-content-center align-items-center border-start border-end border-bottom" style ="background-color:#f9f9f9; height:2.5em">장소</div>
							<div class = "col-10 d-flex align-items-center border-bottom border-end"> ${EduDto.place}</div>
						</div>
						<div class="row mt">
							<div class = "col-2 d-flex justify-content-center align-items-center border-start border-end border-bottom" style ="background-color:#f9f9f9; height:2.5em">신청 가능 인원</div>
							<div class = "col-4 ps-3 d-flex align-items-center border-bottom">${EduDto.maximum_applicant}</div>
							<div class = "col-2 d-flex justify-content-center align-items-center border-start border-end border-bottom" style ="background-color:#f9f9f9">교육비</div>
							<div class = "col-4 ps-3 d-flex align-items-center border-bottom border-end">무료</div>
						</div>
						
						
						<div class="row mt-4">
						
				
						<div class="col-12 d-flex justify-content-center px-0 mx-0" style="height:100em;" >
								<img class="w-100 h-100 img-fluid" src="/Git_imageFile/${EduDto.poster_image}">
						</div>
			
						</div>
									
						
						<div class="row mt-5">
						
						<div class="row mt-5">
						<div class="col-10"></div>
						<div class="col-2 d-flex justify-content-end">
							<a href="./ajdksInquiryProgram" class="btn btn-secondary">목록으로 돌아가기</a>
						</div>
						</div>
						</div>
						
						
						<div class="row mt-5">
						<div class="col-2"> <h4 style="font-weight:bold;">상세내용</h4></div>
	 					<div class="col"></div>	
						</div>
						
						<div class="row mt-2">
						<div class="col border px-4 py-2" style ="background-color:#f9f9f9; border-radius:5px;">
									${EduDto.content}
						</div>
						</div>
						
					
					<!-- 이미 신청했다면 empty가 아니다 => 이미 데이터가 있다.-->
					<!-- 즉 이미 신청 했다면? -->
					<c:choose>
						<c:when test ="${!empty DeadProgram}">
									<div class="row mt-5">
									<div class="row mt-5">
									<div class="col-10"></div>
									<div class="col-2 d-flex justify-content-end">
										<button class="btn btn-danger" disabled="disabled">마감되었습니다</button>
									</div>
									<div class="col-1"></div>
									</div>
									</div>
									
									<div class="row mt-5"></div>
						</c:when>
						<c:when test="${!empty EduApplying}">
									<div class="row mt-5">
									<div class="row mt-5">
									<div class="col-10"></div>
									<div class="col-2 d-flex justify-content-end">
										<button disabled="disabled" class ="btn btn-dark">신청완료</button>
									</div>
									</div>
									</div>
									
									<div class="row mt-5"></div>
							
						</c:when>
						<c:when test= "${empty EduApplying}">
							<form action="./ajdksRegisterProgramProcess">
								<div class="row mt-5">
								<div class="row mt-5">
								<div class="col-10"></div>
								<div class="col-2 d-flex justify-content-end">
									<input type = "hidden" value="${EduDto.internedu_program_pk}" name ="internedu_program_pk">
									<input type ="submit" value ="프로그램 신청하기" class ="btn btn-primary">
								</div>
								</div>
								</div>
								<div class="row mt-5"></div>
							</form>		
						</c:when>
						
					
				
						</c:choose>
					</div>	
					<!-- 본문 끝 -->
				</div>
			</div>
			<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>	
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>