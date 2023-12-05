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
				<div class="col mx-4">
					<!-- 자소서를 하나도 등록하지 않았을때 이력서를 등록해준다.-->
				 	<c:choose>
				 			<c:when test = "${introductionCount == 0}"> 
				 			<form action="ajdksRegisterSelfIntroductionProcess" method="post">
								<div class ="row mt-5 ms-1">
									<div class ="col-4">
										<i class="bi bi-person-circle" style="font-size: 2em;"></i> <span style = "font-size: 20pt">&nbsp;자기소개서 작성</span>
									</div>
								</div>
								
								
								<div class ="row mt-2 ms-2" style="background-color: #DCDCDC;">
									<span style ="color:red; font-weight: bold"> <i class="bi bi-info-circle"></i> NOTICE </span> <br>
									<span class ="ms-4">최소 250자 이상 작성해주세요. (띄어쓰기 포함)</span>
								</div>
								
							
								<div class="accordion accordion-flush" id="accordionFlushExample">
									<div class="accordion-item">
									    <h2 class="accordion-header">
									      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
									        자소서 입력하기
									      </button>
									    </h2>
									    <div id="flush-collapseOne" class="accordion-collapse collapse">
									      <div class="accordion-body">
																
											<div class ="row mt-1 ms-2">
											<div class="col-3 row align-items-center px-5" style="background-color: #B0C4DE; height: 125px; border: 1px solid black; ">
														지원동기
											</div>
											<div class ="col-9">
													   	    <textarea name="answer1" cols= "155" rows="5"></textarea>
											</div>
											</div>
													
											<div class ="row ms-2">
											<div class="col-3 row align-items-center px-5" style="background-color: #B0C4DE; height: 127px; border: 1px solid black; ">
														전공 및 기술 능력
											</div>
											<div class ="col-9">
													    <textarea name="answer2" cols= "155" rows="5"></textarea>
											</div>
											</div>
											
											<div class ="row ms-2">
											<div class="col-3 row align-items-center px-5" style="background-color: #B0C4DE; height: 127px; border: 1px solid black; ">
														주요경력 및 자격사항
											</div>
											<div class ="col-9">
													    <textarea name="answer3" cols="155" rows="5"></textarea>
											</div>
											</div>
											
											<div class ="row ms-2">
											<div class="col-3 row align-items-center px-5" style="background-color: #B0C4DE; height: 127px; border: 1px solid black; ">
														성격 및 장단점
											</div>
											<div class ="col-9 ">
													    <textarea name="answer4" cols="155" rows="5"></textarea>
											</div>
											</div>
														
											<div class ="row mt-4">
												<div class = "col-4"></div>	
										 		<div class ="col-4"></div>
										 	 	
												<div class ="col-4	 text-end">
														<input type="submit" value="이력서 등록" class="btn btn-dark bi bi-person">
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
						<i class="bi bi-person-circle" style="font-size: 2em;"></i> <span style = "font-size: 20pt">&nbsp;자기소개서 작성</span>
					</div>
				</div>
				
				
				<div class ="row mt-2 ms-2" style="background-color: #DCDCDC;">
					<span style ="color:red; font-weight: bold"> <i class="bi bi-info-circle"></i> NOTICE </span> <br>
					<span class ="ms-4">최소 250자 이상 작성해주세요. (띄어쓰기 포함)</span>
				</div>
				
			
				<div class="accordion accordion-flush" id="accordionFlushExample">
					<div class="accordion-item">
					    <h2 class="accordion-header">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
					        자소서 입력하기
					      </button>
					    </h2>
					    <div id="flush-collapseOne" class="accordion-collapse collapse">
					      <div class="accordion-body">
												
							<div class ="row mt-1 ms-2">
							<div class="col-3 row align-items-center text-center" style="background-color: #B0C4DE; height: 125px; border: 1px solid black; ">
										지원동기
							</div>
							<div class ="col-9">
									    <textarea name="answer1" cols="155" rows="5">${studentIntroductionDto.answer1}</textarea>
										
							</div>
							</div>
									
							<div class ="row ms-2">
							<div class="col-3 row align-items-center text-center" style="background-color: #B0C4DE; height: 127px; border: 1px solid black; ">
										전공 및 기술 능력
							</div>
							<div class ="col-9">
									    <textarea name="answer2" cols="155" rows="5">${studentIntroductionDto.answer2}</textarea>
							</div>
							</div>
							
							<div class ="row ms-2">
							<div class="col-3 row align-items-center text-center" style="background-color: #B0C4DE; height: 127px; border: 1px solid black; ">
										주요경력 및 자격사항
							</div>
							<div class ="col-9">
									    <textarea name="answer3" cols="155" rows="5">${studentIntroductionDto.answer3}</textarea>
							</div>
							</div>
							
							<div class ="row ms-2">
							<div class="col-3 row align-items-center text-center" style="background-color: #B0C4DE; height: 127px; border: 1px solid black; ">
										성격 및 장단점
							</div>
							<div class ="col-9 ">
									    <textarea name="answer4" cols="155" rows="5">${studentIntroductionDto.answer4}</textarea>
							</div>
							</div>
										
							<div class ="row mt-4">
								<div class = "col-4"></div>			
						 		<div class ="col-4"></div>
						 			<div class ="col-4 text-end">
												<button type="button" class="btn btn-dark" data-bs-toggle="   " data-bs-target="#exampleModal">
														이력서 불러오기
												</button>
												<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h1 class="modal-title fs-5" id="exampleModalLabel">이력서를 불러 오시겠습니까?</h1>
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												      </div>
												      <div class="modal-body">
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

			</form>
 			</c:when>
 		</c:choose>
	   
<div class="accordion accordion-flush" id="accordionFlushExample4"> 	
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#Certification1" aria-expanded="false" aria-controls="flush-collapseThree">
        			자격증 등록
      </button>
    </h2>
    <div id="Certification1" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">
      	
      	<form action="./ajdksRegisterCertification" method ="post" enctype="multipart/form-data" >
     			<div class ="row">
     			
     				<div class="col-3" style="background-color: #B0C4DE; height: 127px; border: 1px solid black;">
     				 자격증 이미지를 등록해주세요<input name="imageLink" type="file" accept="image/*" > 	 	</div>
     			
     			
     				<div class ="col-9" style="background-color: #B0C4DE; height: 127px; border: 1px solid black; "> 
     					<div class="row"><span>학생명 : 로그인한 유저 이름</span></div>
     					
     					<div class="row"><span> 자격증 이름: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     					<input type ="text" name ="certification_name"></span></div>
     						
     					<div class="row"><span> 자격증 취득일:&nbsp;&nbsp;&nbsp;
     					<input type ="text" name ="certification_acquisition_date"></span></div>	
     				</div>
      			</div>

      			<div class ="row mt-3 text-end">
      				
      				<div class="col-9" ></div>
					<div class ="col-3">
						<input type ="submit" value = "자격증 추가+" class ="btn btn-dark">
	      			</div>      				
	      			
	      					
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
</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>