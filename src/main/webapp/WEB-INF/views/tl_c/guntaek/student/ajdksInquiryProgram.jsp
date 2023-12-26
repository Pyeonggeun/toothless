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
			
	<!-- 모집중인 교육 프로그램 리스트 -->
			<div class="row mt-5">
				 
				 <div class="row ms-4">
				
				 	 <c:forEach var="a" items="${eduListProgram.recrueProgram}">
							  
							  <div class="col-2 ${loopStatus.index % 4 == 0 ? 'mt-5' : ''}"  style ="margin-left: 5em;" >
  							  		
  							  	<div class="row ">
  							  		<div class="rounded-top col-12 d-flex justify-content-center align-items-center" style="height: 2.5em; background-color: #6D7A93; color: white;">
									    <span class ="d-flex align-itmes-center"style="font-size: 0.9em; font-weight: bold; font-family: 'Arial', sans-serif;">
									        ${a.title}
									    </span>
									</div>

  							  	</div>	
  							  	
  							  	<div class="row border-bottom border-start border-end">
  							  	
  							  		
  							  		 	
  							  		<div class="col-12 px-0 mx-0 border-start border-end " style ="height:20em;">
  							 				 	<a href="./ajdksDetailInquiryProgram?internedu_program_pk=${a.internedu_program_pk}">
				  							  		<img class ="w-100 h-100 img-fluid" src ="/Git_imageFile/${a.poster_image}">
											  	</a>
  							  		</div>
  							  		
  							  	
  							  	</div>
								
								
								<div class="row border-start border-end border-bottom rounded-bottom">
										<div class="col d-flex justify-content-end ">
										    <i class="bi bi-person-fill-add" style="font-style: normal;">모집중</i>
										</div>
								</div>			  		
						
							  </div>
							
					</c:forEach>
			</div>
	
		
		
		
		
		 <div class="row ms-4">
				
				 	   <c:forEach var="a" items ="${eduListProgram.deadProgram}">
							  
							  <div class="col-2 ${loopStatus.index % 4 == 0 ? 'mt-5' : ''}"  style ="margin-left: 5em;" >
  							  		
  							  	<div class="row ">
  							  		<div class="rounded-top col-12 d-flex justify-content-center align-items-center" style="height: 2.5em; background-color: #6D7A93; color: white;">
									    <span class ="d-flex align-itmes-center"style="font-size: 0.9em; font-weight: bold; font-family: 'Arial', sans-serif;">
									        ${a.title}
									    </span>
									</div>

  							  	</div>	
  							  	
  							  	<div class="row border-bottom border-start border-end">
  							  	
  							  		
  							  		 	
  							  		<div class="col-12 px-0 mx-0 border-start border-end " style ="height:20em;">
  							 				 	<a href="./ajdksDetailInquiryProgram?internedu_program_pk=${a.internedu_program_pk}">
				  							  		<img class ="w-100 h-100 img-fluid" src ="/Git_imageFile/${a.poster_image}">
											  	</a>
  							  		</div>
  							  		
  							  	
  							  	</div>
								
								<div class="row border-start border-end border-bottom rounded-bottom">
										<div class="col d-flex justify-content-end">
										    <i class="bi bi-person-fill-x" style="font-style:normal; color:#a63641;">마감</i>
										</div>
								</div>			  		
						
							  </div>
							
					</c:forEach>	
					</div>
				   </div>
				</div>			
			</div>
	
	
	
	
					<div class="row mt-5"></div>
					<div class="row mt-5"></div>
					<div class="row mt-5"></div>
					<div class="row mt-5"></div>
				<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>
		</div>
		
	</div>
	
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>