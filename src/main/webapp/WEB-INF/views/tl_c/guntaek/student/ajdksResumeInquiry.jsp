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
				<!-- 본문작성공간 (이력서 조회 공간) -->
				<div class ="row ms-2 mt-5">
							
		
    
					
		
					
					<!-- 학생 정보 조회-->
					<div class ="row">
							
							<div class="col-4 d-flex align-items-center">
							<i class="bi bi-mortarboard-fill" style="font-size: 2em;"></i> <span style = "font-size: 16pt">&nbsp; 학생 정보</span></div>
							<div class="col-8"></div>
							  <hr style="border-top:2px solid; margin-bottom: 0;">
    				</div>

				
					<div class="row">
                        <div class="col-2 d-flex justify-content-center align-items-center border" style ="height: 12em;">
                            
                           
                                	<img class="img-fluid w-100" src="/Git_imageFile/${imageLink}" style ="height:11em">
                              
                          
                                

                        </div>
                        <div class="col-5">
                            <div class="row" style ="height: 3em;">
                                <div class="col-4 d-flex justify-content-center align-items-center border-bottom border-end" style ="background-color:#F8F8F8">이름</div>
                                <div class="col-8 d-flex justify-content-center align-items-center border-bottom border-end"> ${Student.studentDto.name}</div>
                            </div>
                            <div class="row" style ="height: 3em;">
                                <div class="col-4 d-flex justify-content-center align-items-center border-bottom border-end" style ="background-color:#F8F8F8">학번</div>
                                <div class="col-8 d-flex justify-content-center align-items-center border-bottom border-end"> ${Student.studentDto.student_id}</div>
                            </div>
                            <div class="row" style ="height: 3em;">
                                <div class="col-4 d-flex justify-content-center align-items-center border-bottom border-end" style ="background-color:#F8F8F8">이메일</div>
                                <div class="col-8 d-flex justify-content-center align-items-center border-bottom border-end">${Student.studentDto.email}</div>
                            </div>
                            <div class="row" style ="height: 3em;">
                                <div class="col-4 d-flex justify-content-center align-items-center  border-end" style ="background-color:#F8F8F8">주소</div>
                                <div class="col-8 d-flex justify-content-center align-items-center border-end">${Student.studentDto.address}</div>
                            </div>  
                        </div>

                        <div class="col-5">
                            <div class="row" style ="height: 3em;">
                                <div class="col-4 d-flex justify-content-center align-items-center border-bottom border-end" style ="background-color:#F8F8F8">주민번호</div>
                                <div class="col-8 d-flex justify-content-center align-items-center border-bottom border-end">${Student.studentDto.resident_id}</div>
                            </div>
                            <div class="row" style ="height: 3em;">
                                <div class="col-4 d-flex justify-content-center align-items-center border-bottom border-end"style ="background-color:#F8F8F8" >생년월일</div>
                                
                                <div class="col-8 d-flex justify-content-center align-items-center border-bottom border-end">
                            			<fmt:formatDate pattern = "yyyy-MM-dd" value ="${Student.studentDto.birth}"/></div>
                            </div>
                            <div class="row" style ="height: 3em;">
                                <div class="col-4 d-flex justify-content-center align-items-center border-bottom border-end" style ="background-color:#F8F8F8">성별</div>
                                <div class="col-8 d-flex justify-content-center align-items-center border-bottom border-end">${Student.studentDto.gender}</div>
                            </div>
                             <div class="row" style ="height: 3em;">
                                <div class="col-4 d-flex justify-content-center align-items-center border-end" style ="background-color:#F8F8F8">학과 </div>
                                <div class="col-8 border-end d-flex justify-content-center align-items-center">
                                		${departName}
                                </div>
                                
                            </div>
                       	  
                        </div>
                        <hr style="border-top:2px solid; margin-bottom: 0;">
					</div>

		
					    				
					<!-- 지원 동기, 그런 이력서 나오게 하기 -->
					    				
					<div class ="row mt-5">
							<div class="col-4 d-flex align-items-center">
							<i class="bi bi-person-vcard"  style="font-size: 2em;"></i> <span style = "font-size: 16pt">&nbsp; 자기소개서</span></div>
							<div class="col-8"></div>
							  
    				</div>
					
					<div class="row">
						<div class="col-3">
                            <div class="row">
                                <div class="col d-flex justify-content-center align-items-center border" style="height:8em; background-color: #F8F8F8;">지원동기</div>
                            </div>
						
						</div>
						<div class="col-9">
                            <div class="row">
                                <div class="overflow-y-auto col border-top border-bottom border-end justify-content-center align-items-center" style="height:8em;">
                                ${Student.introductionDto.answer1}
                                </div>
                            </div>    
                        </div>
                        
					</div>	
					
					<div class="row">
						<div class="col-3">
                            <div class="row">
                                <div class="col d-flex justify-content-center align-items-center border-start border-end border-bottom" style="height:8em; background-color: #F8F8F8;">전공 및 기술 능력</div>
                            </div>
						
						</div>
						<div class="col-9">
                            <div class="row">
                                <div class="overflow-y-auto col border-bottom border-end justify-content-center align-items-center" style="height:8em;">${Student.introductionDto.answer2}</div>
                            </div>    
                        </div>
                        
					</div>
					
					<div class="row">
						<div class="col-3">
                            <div class="row">
                                <div class="col d-flex justify-content-center align-items-center border-bottom border-start border-end" style="height:8em; background-color: #F8F8F8;">주요경력 및 자격사항
								</div>
                            </div>
						
						</div>
						<div class="col-9">
                            <div class="row">
                                <div class=" overflow-y-auto col  border-bottom border-end justify-content-center align-items-center" style="height:8em;">${Student.introductionDto.answer3}</div>
                            </div>    
                        </div>
                        
					</div>
					
					<div class="row">
						<div class="col-3">
                            <div class="row">
                                <div class="col d-flex justify-content-center align-items-center border-bottom border-start border-end" style="height:8em; background-color: #F8F8F8;"> 성격 및 장단점
								</div>
                            </div>
						
						</div>
						<div class="col-9">
                            <div class="row">
                                <div class="overflow-y-auto col border-bottom border-end justify-content-center align-items-center" style="height:8em;">${Student.introductionDto.answer4}</div>
                            </div>    
                        </div>
                        
					</div>
				
				
				
					<!-- 자격증 맨 위 제목 -->
					<div class ="row mt-5">
							<div class="col-4 d-flex align-items-center">
							<i class="bi bi-postcard-fill" style="font-size: 2em;"></i> <span style = "font-size: 16pt">&nbsp; 자격증 정보</span></div>
							<div class="col-8"></div>
							  
    				</div>
					<div class="row">
							<div class="col-6 border d-flex align-items-center justify-content-center" style="height:3em;background-color: #F8F8F8 ">
							         자격증 사진   
							</div>
									
							<div class="col-3 border-top border-bottom d-flex align-items-center justify-content-center" style="height:3em; background-color: #F8F8F8 ">
							        자격증명
							</div>


						<div class="col-3 border d-flex align-items-center justify-content-center" style="height:3em; background-color: #F8F8F8;">	 	
							        
							        취득일자
						</div>
						 	
					</div>
					
					<c:forEach items="${Student.certificationDtoList}" var="certificationDtoList">
						<div class="row">
							<div class="col-6 border-start border-end border-bottom d-flex align-items-center justify-content-center" style="height:3em;">
							         <a style ="color:black;" href = "./ajdksShowCertification?imageLink=${certificationDtoList.certification_file}">${certificationDtoList.certification_name}</a>
							</div>
									
							<div class="col-3  border-bottom d-flex align-items-center justify-content-center" style="height:3em; ">
							        ${certificationDtoList.certification_name}
							</div>


						<div class="col-3 border-start border-end border-bottom d-flex align-items-center justify-content-center" style="height:3em;">	 	
							        
							        ${certificationDtoList.certification_acquisition_date}
						</div>
						 	
						</div>
					</c:forEach>
					
										
					
					
					<!-- 자격증 Dto 리스트를 통해서 이 학생이 취득한 자격증들을 다 나열한다.	 -->					
		
					
					
				
					</div>
				</div>
			</div>
				 	<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>		
		</div>

	</div>
	
<!-- 전체 container 출구 -->
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>