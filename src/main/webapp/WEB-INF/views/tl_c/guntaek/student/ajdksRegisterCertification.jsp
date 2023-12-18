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
			
			
			<div class ="row ms-2" style="margin-top:6.25em;">
							
							<div class="col-4 d-flex align-items-center">
							<i class="bi bi-person-badge-fill" style="font-size: 2em;"></i> <span style = "font-size: 20pt">&nbsp;이력서 사진 등록</span></div>
							<div class="col-7"></div>
							
							<br>
							  <hr style="border-top:2px solid; margin-bottom: 0;">
    		</div>
			
			<div class="row ms-2">		
					<c:choose>
					
						<c:when test = "${empty selfIntroductionDto}"> 
							<div class="col-2 border d-flex align-items-center justify-content-center" style="height:18.75em;">
								<strong> 자소서 먼저 입력해주세요.</strong>
							</div>
						</c:when>
						
					
					<%-- 답변만 했을 경우 (이미지 아직 X) --%>
						<c:when test = "${selfIntroductionDto.self_introduction_img_pk == 0}"> 
							<div class="col-2">
								<form action="./ajdksRegisterIntroductionImage"  enctype="multipart/form-data" method ="post" >					
									<div class="row border d-flex align-items-center justify-content-center">
	 
									 	<input name="imageLink" type="file" accept="image/*" >		
									 
									 		<br><br><br><br><br><br><br><br><br><br><br>
									 
									 	<input type ="submit" value="제출">
									</div>	
								</form>
							</div>
						</c:when>
					<%-- 만약 자격증을 등록했다면!? 이미지가 보이게~--%>					
						<c:when test = "${selfIntroductionDto.self_introduction_img_pk != 0}">
								<div class= "col-2 border d-flex align-items-center justify-content-center" style="height:300px;">
												<img class="img-fluid " src="/Git_imageFile/${imageLink}">
								</div>
						</c:when>	
					</c:choose>
							
							
							
							
							
							
							
							
																
					<div class="col-3">
							    <div class="row border d-flex align-items-center justify-content-center" style="height:4.7em; background-color: #CFE2FF;" >
							        학생명/성별 *
							    </div>
							    <div class="row border d-flex align-items-center justify-content-center" style="height:4.7em; background-color: #CFE2FF;">
							        전화번호/휴대폰 *
							    </div>
							    <div class="row border d-flex align-items-center justify-content-center" style="height:4.7em; background-color: #CFE2FF;">
							        이메일 *
							    </div>
							    <div class="row border d-flex align-items-center justify-content-center" style="height:4.7em; background-color: #CFE2FF;">
							        주소 *
							    </div>
							</div>


						<div class="col-7  text-center">
								<div class="row border d-flex align-items-center justify-content-center" style="height:4.7em;">
							        ${loginUser.name} /  ${loginUser.gender} 
							    </div>
							    <div class="row border d-flex align-items-center justify-content-center" style="height:4.7em;">
							        ${loginUser.phone}
							    </div>
							    <div class="row border d-flex align-items-center justify-content-center" style="height:4.7em;">
							        ${loginUser.email}
							    </div>
							    <div class="row border d-flex align-items-center justify-content-center" style="height:4.7em;">
							        ${loginUser.address}
							    </div>
						</div>
						 <hr style="border-top:2px solid; margin-bottom: 0;">	
					</div>
			
			
			
			
			
			
			
					
			<!-- 자소서를 하나도 등록하지 않았을때 이력서를 등록해준다.-->
			<c:choose>
				<c:when test = "${introductionCount == 0}"> 
 			
 			<form action="ajdksRegisterSelfIntroductionProcess" method="post">
				<div class ="row mt-5 ms-2">
					<div class ="col-4">
						<i class="bi bi-person-vcard-fill" style="font-size: 2em;"></i> <span style = "font-size: 20pt">&nbsp;자기소개서 작성</span>
					</div>
				</div>
				
				
				<div class ="row mt-2 mx-3" style="background-color: #DCDCDC;">
					<span style ="color:red; font-weight: bold"> <i class="bi bi-info-circle"></i> NOTICE </span> <br>
					<span class ="ms-4">최소 250자 이상 작성해주세요. (띄어쓰기 포함)</span>
				</div>
				
				<div class="row mt-2">
				
				<div class="accordion accordion-flush" id="accordionFlushExample">
					<div class="accordion-item">
					    <h2 class="accordion-header">
					   <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
					        자소서 입력하기
					   </button>
					    </h2>
					    
					    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse">
							<div class="accordion-body">
												
							<div class ="row mt-1 ms-2">
							<div class="col-3 row align-items-center text-center" style="background-color: #CFE2FF; height: 7.8em; border: 1px solid black; ">
										지원동기
							</div>
							<div class ="col-9">
									    <textarea name="answer1" cols="180" style="height: 100%; width: 100%; box-sizing: border-box;">${studentIntroductionDto.answer1}</textarea>
										
							</div>
							
							<div class="col-3 row align-items-center text-center" style="background-color: #CFE2FF ; height: 7.8em; border: 1px solid black;">
										전공 및 기술 능력
							</div>
							<div class ="col-9">
									    <textarea name="answer2" cols="180" style="height: 100%; width: 100%; box-sizing: border-box;">${studentIntroductionDto.answer2}</textarea>
							</div>
							
							<div class="col-3 row align-items-center text-center" style="background-color: #CFE2FF; height: 7.8em; border: 1px solid black;">
										주요경력 및 자격사항
							</div>
							<div class ="col-9">
									   <textarea name="answer3" cols="180" style="height: 100%; width: 100%; box-sizing: border-box;">${studentIntroductionDto.answer3}</textarea>
							</div>
							<div class="col-3 row align-items-center text-center" style="background-color: #CFE2FF; height: 7.8em; border: 1px solid black;">
										성격 및 장단점
							</div>
							<div class ="col-9 ">
									    <textarea name="answer4" cols="180" style="height: 100%; width: 100%; box-sizing: border-box;">${studentIntroductionDto.answer4}</textarea>
							</div>
							
		
							<div class ="row mt-4">
								<div class = "col-4"></div>			
						 		<div class ="col-4"></div>
						 			<div class ="col-4 text-end">
										<input type="submit" value="이력서 등록" class="btn btn-dark bi bi-person">
						 		</div>
						 	</div>
						 </div>
						</div>
					</div>
				</div>
				
				</div>
				</div>
			</form>
 			</c:when>
 		</c:choose>
					
	<!-- 이미 자소서가 1개로 등록이 되어있을때 자소서를 업데이트 한다. -->
	   <c:choose>
 			<c:when test = "${introductionCount == 1}"> 
 			
 			<form action="ajdksUpdateSelfIntroductionProcess" method="post">
				<div class ="row mt-5 ms-2">
					<div class ="col-4">
						<i class="bi bi-person-vcard-fill" style="font-size: 2em;"></i> <span style = "font-size: 20pt">&nbsp;자기소개서 작성</span>
					</div>
				</div>
				
				
				<div class ="row mt-2 mx-3" style="background-color: #DCDCDC;">
					<span style ="color:red; font-weight: bold"> <i class="bi bi-info-circle"></i> NOTICE </span> <br>
					<span class ="ms-4">최소 250자 이상 작성해주세요. (띄어쓰기 포함)</span>
				</div>
				
				<div class="row mt-2">
				
				<div class="accordion accordion-flush" id="accordionFlushExample">
					<div class="accordion-item">
					    <h2 class="accordion-header">
					      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
					        자소서 입력하기
					      </button>
					    </h2>
					    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse ">
					      <div class="accordion-body">
												
							<div class ="row mt-1 ms-2">
							<div class="col-3 row align-items-center text-center" style="background-color: #CFE2FF; height: 7.9em; border: 1px solid black;">
										지원동기
							</div>
							<div class ="col-9">
									    <textarea name="answer1" cols="180" style="height: 100%; width: 100%; box-sizing: border-box;"placeholder="${selfIntroductionDto.answer1}">${studentIntroductionDto.answer1}</textarea>
										
							</div>
							
							<div class="col-3 row align-items-center text-center" style="background-color: #CFE2FF; height: 7.9em; border: 1px solid black;">
										전공 및 기술 능력
							</div>
							<div class ="col-9">
									    <textarea name="answer1" cols="180" style="height: 100%; width: 100%; box-sizing: border-box;" placeholder="${selfIntroductionDto.answer2}">${studentIntroductionDto.answer2}</textarea>
							</div>
							
							<div class="col-3 row align-items-center text-center" style="background-color: #CFE2FF; height: 7.9em; border: 1px solid black;">
										주요경력 및 자격사항
							</div>
							<div class ="col-9">
									     <textarea name="answer3" cols="180" style="height: 100%; width: 100%; box-sizing: border-box;" placeholder="${selfIntroductionDto.answer3}">${studentIntroductionDto.answer3}</textarea>
							</div>
							<div class="col-3 row align-items-center text-center" style="background-color: #CFE2FF; height: 7.9em; border: 1px solid black;">
										성격 및 장단점
							</div>
							<div class ="col-9 ">
									     <textarea name="answer4" cols="180" style="height: 100%; width: 100%; box-sizing: border-box;" placeholder="${selfIntroductionDto.answer4}">${studentIntroductionDto.answer4}</textarea>
							</div>
							
		
							<div class ="row mt-4">
								<div class = "col-4"></div>			
						 		<div class ="col-4"></div>
						 			<div class ="col-4 text-end">
												<button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">
														이력서 불러오기
												</button>
												<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h1 class="modal-title fs-5" id="exampleModalLabel">이력서를 불러 오시겠습니까?</h1>
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												      </div>
												      <div class="modal-body text-center">
												         불러오기
												      </div>
												      <div class="modal-footer">
												        <a href ="./ajdksRegisterSelfIntroduction" class="btn btn-secondary">No</a>
												        <a href ="./ajdksRegisterSelfIntroduction?Student_pk=${selfIntroductionDto.student_pk}" class="btn btn-primary">Yes</a>
												      	
												      </div>
												    </div>
												  </div>
												</div>
												
										<input type="submit" value="이력서 수정" class="btn btn-dark bi bi-person">
						 		</div>
						 	</div>
						 </div>
						</div>
					</div>
				</div>
				
				</div>
				</div>
			</form>
 			</c:when>
 		</c:choose>
 		
 		
<div class ="row ms-2" style ="margin-top:4.3em;">
		<div class="col-4 d-flex align-items-center">
				<i class="bi bi-postcard-fill" style="font-size: 2em;"></i> <span style = "font-size: 20pt">&nbsp; 자격증 등록</span></div>
		<div class="col-7"></div>
							
</div>
<div class = "row mt-2">	   
	<div class="accordion accordion-flush" id="accordionFlushExample4">
	  	<div class="accordion-item">
	    		<h2 class="accordion-header">
	    		
	    		
	      			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#Certification1" aria-expanded="false" aria-controls="flush-collapseThree">
	        			자격증 등록
	      			</button>
	    		</h2>
	    	<div id="Certification1" class="accordion-collapse collapse show" data-bs-parent="#accordionFlushExample">
	      	
	    <div class="accordion-body">

							     
							      	<div class="row mt-2" > 
							      		<div class = "col-2 text-center border" style = "background-color: #CFE2FF; "> 	자격증명 </div> 
							      		<div class = "col-4 text-center border" style="background-color: #CFE2FF; " > 취득일자 </div>
							      		<div class = "col-4 text-center border" style="background-color: #CFE2FF; " > 이미지 파일 링크</div>
							      		<div class ="col-2 text-center border"  style="background-color: #CFE2FF;"> 삭제</div>
							      	</div>
							      	
	
							   <c:forEach var="certificationList" items="${certificationList}">
							        	<div class="row"> 		
							        	
							        	 	
							      		<div class = "col-2 justify-content-center border d-flex align-items-center" >
							      			${certificationList.certification_acquisition_date}
							      		</div>
							      		
							      		<div class = "col-4 justify-content-center border d-flex align-items-center" >
							      			${certificationList.certification_name}
							      		</div>
							      		<div class = "col-4 justify-content-center border d-flex align-items-center">
							      		<a style ="color:black;"href = "./ajdksShowCertification?imageLink=${certificationList.certification_file}">${certificationList.certification_name}</a>
							    		</div>
							      		<div class ="col-2 justify-content-center  border d-flex align-items-center">
											
											<a href ="./ajdksDeleteCertification?certification_file=${certificationList.certification_file}" style ="color:black"><i class="bi bi-x-square" style ="font-size:2.5em;"></i></a>     			
							  	    	</div>		      		
							      	</div>
							          		
								 </c:forEach>
						     			
						     			
						     	<div class="row" style="margin-top:4.7em;">
									<div class="col-2 text-center">
											자격증명
									</div>
							      	<div class="col-4 text-center" >
									   		취득일자
									</div>
								    <div class="col-4 text-center" >
										이미지 파일 등록									    
									</div>
									<div class="col-2" >
																			    
									</div>
									
								</div>
						     	
						     	<form class="row"  action="./ajdksRegisterCertificationProcess" method ="post" enctype="multipart/form-data" >
						    		
						    		<div class="col-2 text-center ">
											<input style ="width:15em; "type ="text" name ="certification_name">
									</div>
							      	<div class="col-4 text-center" >
									   		<input style = "width: 30.5625em;"type ="date" name ="certification_acquisition_date">
									</div>
								    <div class="col-4 text-center" >
											 <input style ="width:18.0625;" name="imageLink" type="file" accept="image/*" >								    
									</div>
									<div class="col-2 text-end">

										<input type ="submit" class="btn btn-dark" value = "자격증 등록">
																			    
									</div>
									
								</form>
							
						      		
						      	
						    
						    
						    </div>
						  
						  
						  </div>
					</div>
				</div>
		</div>
	</div>
	
		
		
		
		</div>
	</div>
<!--  row 끝 -->
</div>
<!-- 본문 끝 -->
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>