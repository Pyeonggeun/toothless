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
				
				
					<div class="row mt-4">
							<div class="col">
								<p style="font-weight:bold; font-size:1.2em" ><i class="bi bi-arrow-right"></i>&nbsp;&nbsp;프로그램 신청 내역</p>							 	
							</div>		
						</div>
			
				<div class="row">
						<div class="col border border-1 border-dark"></div>
					</div>
						
				
				
	
				<c:forEach items="${applyprogramList}" var = "list">
				<div class="row">
				
				<div class="col-1"></div>
				
				<div class="col-10">
				<div class="row ms-5 mt-5 mx-5 border text-center;" style= "border-radius:10px;"  >
				
								
								
								
							    <div class="col-2 d-flex justify-content-center align-items-center px-0 py-0" style="border-radius:50px; ">
							        
							            <img class = "w-100 rounded" src="/Git_imageFile/${list.EduProgramDto.poster_image}" style ="height:150px;">
							        
							    </div>
							    
							    <div class="col-8">
							    
							    	<div class="row">
							    	
							    		<div class="col-6">
							    			<div class="row mt-4 ms-4 ps-5 ">
							        			<div class="col mt-1 ps-5 ">
							        				<p style ="font-weight:bold; font-size:18px;" >${list.EduProgramDto.title}</p>
							        			</div>
							        	
							    			</div>
							        
									        <div class="row mt-4 ms-4 ps-5">
									        	<div class="col ps-5">
									        	
									        	  <span style ="color:#9ea9a5; border-color:black; " class="border rounded  	border-2  ps-2 pe-1 pb-1">[ 2023 ]</span>
					                          
					                              <span style=" border-radius: 5px; border: 2px solid #6D7A93; color:#6D7A93" class="ps-2 pe-1 pb-1">[E-러닝]</span>
		
									       		 </div>
									        
											</div>
							        
							        	</div>
							        
							    	<div class="col-6">
							    			<div class="row mt-3 ms-4">
							        			<div class="col ps-5">
							        				<span style ="color:black"><i class="bi bi-stop-fill"></i></span>&nbsp;
							        				<span class="fw-semibold" style ="font-size:14px; font-weight:semi-bold">신청 인원</span> &nbsp;&nbsp; ${list.getCountPeople} &nbsp;&nbsp;/ &nbsp;
													<span style ="color:gray;">${list.EduProgramDto.maximum_applicant}</span>	
							        			</div>
							        	
							    			</div>
							        
									        <div class="row mt-4 ms-4 ">
									        	<div class="col ps-5" >
									        	
									        		<span style ="color:black"><i class="bi bi-stop-fill"></i></span>&nbsp;
									        		<span class="fw-semibold" style ="font-size:14px; font-weight:semi-bold">접수 기간</span> 
													<span>
														&nbsp;&nbsp; 	
														<fmt:formatDate pattern = "MM-dd" value ="${list.EduProgramDto.created_at}"/>
														~ <fmt:formatDate pattern = "MM-dd" value ="${list.EduProgramDto.deadline_date}"/>	
									       		 	</span>
									       		 </div>
									        
											</div>
								
											<div class="row mt-4 ms-4 ">
									        	<div class="col ps-5">
									        	
									        	
									        	
							        			
									        	
									        		
									        		<span style ="color:black"><i class="bi bi-stop-fill"></i></span>&nbsp;
									        	
													<span class="fw-semibold" style ="font-size:14px; font-weight:semi-bold">지역</span>
														&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
													<span>${list.EduProgramDto.place}</span>
									       		 </div>
									        
											</div>	
							        
							        	</div>	
								</div>
							</div>
				
					</div>	
				</div>
				</div>
				</c:forEach>
				
				
				
				
				
				
				
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
					
				
				<!-- 본문 끝 -->
				</div>
				<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>
			</div>
					
		</div>
	
	</div>
	
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>