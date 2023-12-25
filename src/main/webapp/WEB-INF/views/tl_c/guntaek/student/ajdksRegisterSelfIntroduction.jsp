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

	    
	.accordion-button {
    background-color: #CFE2FF; /* 활성화된 배경 색상 지정 */
	}
	
	/* 클릭된 아코디언 헤더의 배경 색상 변경 (활성화 상태에서 focus일 때) */
	.accordion-color:   {
	    background-color: #CFE2FF; /* 활성화된 배경 색상 지정 */
	}
	
	
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
					
		
		
	<%-- 답변도 안했을 경우 안내문만 출력 (자소서 먼저 등록하라고)--%>
<c:choose>
					
		<c:when test = "${empty selfIntroductionDto}"> 
			<div class="row ms-2 mt-5 border rounded" style ="height:15em;">
            
            <div class="col-2 border-end d-flex align-items-center">
          	  
            	<div class="row  ">	
        
	    				
		    				<div class="col d-flex justify-content-center ">             					
	                      			 <strong>자소서를 먼저 등록해주세요.</strong>	
	                       	</div>
                    
                        
                      
                    
                    
                
                </div>
            </div> 
     <div class="col-10">
                <div class="row">
                    <div class="col-6">
                       
                        <div class="row ms-5" style="margin-top:2em">

                            <span>
                                <a style="color:black;  font-size:1.3em" class="fw-semibold text-decoration-none" >${loginUser.name} </a>
                                
                                <c:if test ="${loginUser.gender == 'M'}">
                                	<a style="color:gray">&nbsp;&nbsp;&nbsp;남자</a>
                            	</c:if>
                            	
                            	<c:if test ="${loginUser.gender == 'F'}">
                                	<a style="color:gray">&nbsp;&nbsp;&nbsp;여자</a>
                            	</c:if>
                            </span>
                        </div>
                        <div class="row ms-5 mt-5">

                            <span>&nbsp;주소<a style="color:gray"> <span style="color:orange">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginUser.address}</a></span>
                        </div>
                        <div class="row ms-5 mt-5">
                            <span>휴대폰<a style="color:gray"><span style="color:orange">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginUser.phone}</a></span>
                        </div>
                       
                    </div>
                    
                  
                  <div class="col-6">
                       
                        <div class="row" style="margin-top:2em;">
							
							<div class="col-10"></div>
                            
                            	<div class="col-2">
                            		<span><a style="color:gray;  font-size:1.3em"><i class="bi bi-gear"></i> </a></span>
                        		</div>
                        </div>
                        <div class="row ms-5 mt-5">

                            <span>학과<a style="color:gray"> <span style="color:orange">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${departName}</a></span>
                        </div>
                        <div class="row ms-5 mt-5">
                            <span>이메일<a style="color:gray"><span style="color:orange">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginUser.email}</a></span>
                        </div>
                       
                    </div>
               </div>     
                    
              </div> 
			</div>
		</c:when>
						
					
	<%-- 자소서만 등록한 경우 (이미지 아직 X) --%>
			<c:when test = "${selfIntroductionDto.self_introduction_img_pk==0}"> 
								<div class="row ms-2 mt-5 border rounded" style ="height:15em;">
							            
							            <div class="col-2 border-end">
							          	  
							            	<div class="row d-flex justify-content-center align-items-center">	
							                	<form action="./ajdksRegisterIntroductionImage" enctype="multipart/form-data" method ="post" >
								    
								    
								    				<div class="row">
									    				<div class="col d-flex justify-content-center" style="padding-top:2em">
								                          <label for= "kuntek">
								                                
								                                    <img src = "../../../resources/img/tl_c/profile.png" style="height:9em;"> 
								                         
								                          </label> 
								                       	</div>
							                        </div>
							                        
							                        <div class="row">
							                        	<div class="col">
							                              <input class="d-none" id = "kuntek" name="imageLink" type="file">		                       
							                            </div>
							                        </div>
							                        
							                        <div class="row">
							                      		<div class="col mt-4 d-flex justify-content-center">
							                        	 <input type ="submit" value="사진제출">                            
							                			</div>   	
							                        </div>
							                       </form>
							                
							                </div>
							            </div> 
							     <div class="col-10">
							                <div class="row">
							                    <div class="col-6">
							                       
							                        <div class="row ms-5" style="margin-top:2em">
							
							                            <span>
							                                <a style="color:black;  font-size:1.3em" class="fw-semibold text-decoration-none" >${loginUser.name} </a>
							                                
							                                <c:if test ="${loginUser.gender == 'M'}">
							                                	<a style="color:gray">&nbsp;&nbsp;&nbsp;남자</a>
							                            	</c:if>
							                            	
							                            	<c:if test ="${loginUser.gender == 'F'}">
							                                	<a style="color:gray">&nbsp;&nbsp;&nbsp;여자</a>
							                            	</c:if>
							                            </span>
							                        </div>
							                        <div class="row ms-5 mt-5">
							
							                            <span>&nbsp;주소<a style="color:gray"> <span style="color:orange">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginUser.address}</a></span>
							                        </div>
							                        <div class="row ms-5 mt-5">
							                            <span>휴대폰<a style="color:gray"><span style="color:orange">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginUser.phone}</a></span>
							                        </div>
							                       
							                    </div>
							                    
							                  
							                  <div class="col-6">
							                       
							                        <div class="row" style="margin-top:2em;">
														
														<div class="col-10"></div>
							                            
							                            	<div class="col-2">
							                            		<span><a style="color:gray;  font-size:1.3em"><i class="bi bi-gear"></i> </a></span>
							                        		</div>
							                        </div>
							                        <div class="row ms-5 mt-5">
							
							                                <span>학과<a style="color:gray"> <span style="color:orange">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${departName}</a></span>
							                        </div>
							                        <div class="row ms-5 mt-5">
							                            <span>이메일<a style="color:gray"><span style="color:orange">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginUser.email}</a></span>
							                        </div>
							                       
							                    </div>
							               </div>     
							                    
							              </div> 
										</div>
					
			</c:when>
	<%-- 만약 이미지를 등록했다면!? --%>					
			<c:when test = "${selfIntroductionDto.self_introduction_img_pk != 0}">
		<div class="row ms-2 mt-5 border rounded" style ="height:15em;">
            
            <div class="col-2 d-flex justify-content-center align-items-center border-end px-0 py-0 mx-0" style ="height: 15em;">
                            <div class="row w-100 px-0 py-0">
                            	<div class="col w-100">
                                	<img class="img-fluid rounded border w-100 px-0 py-0 " src="/Git_imageFile/${imageLink}" style ="height:14.8em">
                                </div>
                            </div>
                                

			</div>
     <div class="col-10">
                <div class="row">
                    <div class="col-6">
                       
                        <div class="row ms-5" style="margin-top:2em">

                            <span>
                                <a style="color:black;  font-size:1.3em" class="fw-semibold text-decoration-none" >${loginUser.name} </a>
                                
                                <c:if test ="${loginUser.gender == 'M'}">
                                	<a style="color:gray">&nbsp;&nbsp;&nbsp;남자</a>
                            	</c:if>
                            	
                            	<c:if test ="${loginUser.gender == 'F'}">
                                	<a style="color:gray">&nbsp;&nbsp;&nbsp;여자</a>
                            	</c:if>
                            </span>
                        </div>
                        <div class="row ms-5 mt-5">

                            <span>&nbsp;주소<a style="color:gray"> <span style="color:orange">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginUser.address}</a></span>
                        </div>
                        <div class="row ms-5 mt-5">
                            <span>휴대폰<a style="color:gray"><span style="color:orange">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginUser.phone}</a></span>
                        </div>
                       
                    </div>
                    
                  
                  <div class="col-6">
                       
                        <div class="row" style="margin-top:2em;">
							
							<div class="col-10"></div>
                            
                            	<div class="col-2">
                            		<span><a style="color:gray;  font-size:1.3em"><i class="bi bi-gear"></i> </a></span>
                        		</div>
                        </div>
                        <div class="row ms-5 mt-5">

                               <span>학과<a style="color:gray"> <span style="color:orange">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${departName}</a></span>
                        </div>
                        <div class="row ms-5 mt-5">
                            <span>이메일<a style="color:gray"><span style="color:orange">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginUser.email}</a></span>
                        </div>
                       
                    </div>
               </div>     
                    
              </div> 
			</div>
					
					
			</c:when>	
</c:choose>
			
			
			
			
			
			
			<!-- 자소서를 하나도 등록하지 않았을때 이력서를 등록해준다.-->
			<c:choose>
				<c:when test = "${introductionCount == 0}"> 
 			
 			
 				<form action="ajdksRegisterSelfIntroductionProcess" method="post">
				

					<div class ="row mt-5 ms-2">		
							<div class="col-4 d-flex align-items-center">
							
							<i class="bi bi-stack" style="font-size: 2em;"></i> <span style = "font-size: 16pt">&nbsp; 자소서 등록</span></div>
							<div class="col-8"></div>
							
    				</div>

				
				<div class ="row py-2 mt-2 ms-2 border " style="background-color: #F8F8F8;">
					<span class="ps-4 fw-semibold" style ="color:#A63641;  font-weight: bold " > <i class="bi bi-info-circle"></i> NOTICE </span> <br>
					<span class ="ps-4 fw-semibold ">최소 250자 이상 작성해주세요. (띄어쓰기 포함)</span>	
				</div>
				
				
				<div class="row ms-2">
						<div class="col-3">
                            <div class="row">
                                <div class="col d-flex justify-content-center align-items-center border-start border-end border-bottom" style="height:8em; background-color: #F8F8F8;">지원동기</div>
                            </div>
						
						</div>
						<div class="col-9">
                            <div class="row	">
                                <div class="col border-bottom border-end justify-content-center align-items-center px-0 py-0" style="height:8em;">
                                	<textarea name="answer1" class="w-100 h-100" style="border:none">${introductionDto.answer1}</textarea>
                                </div>
                            </div>    
                        </div>     
				</div>
				<div class="row ms-2">
						<div class="col-3">
                            <div class="row">
                                <div class="col d-flex justify-content-center align-items-center border-start border-end border-bottom" style="height:8em; background-color: #F8F8F8;">전공 및 기술 능력</div>
                            </div>
						
						</div>
						<div class="col-9">
                            <div class="row	">
                                <div class="col border-bottom border-end justify-content-center align-items-center px-0 py-0" style="height:8em;">
                                	<textarea name="answer2" class="w-100 h-100" style="border:none">${introductionDto.answer2}</textarea>
                                </div>
                            </div>    
                        </div>     
				</div>
				<div class="row ms-2">
						<div class="col-3">
                            <div class="row">
                                <div class="col d-flex justify-content-center align-items-center border-start border-end border-bottom" style="height:8em; background-color: #F8F8F8;">주요경력 및 자격사항</div>
                            </div>
						
						</div>
						<div class="col-9">
                            <div class="row	">
                                <div class="col border-bottom border-end justify-content-center align-items-center px-0 py-0" style="height:8em;">
                                	<textarea name="answer3" class="w-100 h-100" style="border:none">${introductionDto.answer3}</textarea>
                                </div>
                            </div>    
                        </div>     
				</div>
				<div class="row ms-2">
						<div class="col-3">
                            <div class="row">
                                <div class="col d-flex justify-content-center align-items-center border-start border-end border-bottom" style="height:8em; background-color: #F8F8F8;">성격 및 장단점</div>
                            </div>
						
						</div>
						<div class="col-9">
                            <div class="row	">
                                <div class="col border-bottom border-end justify-content-center align-items-center px-0 py-0" style="height:8em;">
                                	<textarea name="answer4" class="w-100 h-100" style="border:none">${introductionDto.answer4}</textarea>
                                </div>
                            </div>    
                        </div>     
				</div>
				
				<div class ="row mt-4">
						<div class = "col-4"></div>			
				 		<div class ="col-4"></div>
				 			<div class ="col-4 text-end">
								<input type="submit" value="이력서 등록" class="btn btn-dark bi bi-person">
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
							<div class="col-4 d-flex align-items-center">
							
							<i class="bi bi-stack" style="font-size: 2em;"></i> <span style = "font-size: 16pt">&nbsp; 자소서 등록</span></div>
							<div class="col-8"></div>
							
    				</div>
				
				
				<div class ="row py-2 mt-2 ms-2 border " style="background-color: #F8F8F8;">
					<span class="ps-4 fw-semibold" style ="color:#A63641;  font-weight: bold " ><i class="bi bi-info-circle"></i> NOTICE </span> <br>
					<span class ="ps-4 fw-semibold ">최소 250자 이상 작성해주세요. (띄어쓰기 포함)</span>	
				</div>
				
							<div class="row ms-2">
									<div class="col-3">
			                            <div class="row">
			                                <div class="col d-flex justify-content-center align-items-center border-start border-end border-bottom" style="height:8em; background-color: #F8F8F8;">지원동기</div>
			                            </div>
									
									</div>
									<div class="col-9">
			                            <div class="row	">
			                                <div class="col border-bottom border-end justify-content-center align-items-center px-0 py-0" style="height:8em;">
			                                	<textarea name="answer1" class="w-100 h-100" style="border:none">${selfIntroductionDto.answer1}</textarea>
			                                </div>
			                            </div>    
			                        </div>     
							</div>
							
								<div class="row ms-2">
									<div class="col-3">
			                            <div class="row">
			                                <div class="col d-flex justify-content-center align-items-center border-start border-end border-bottom" style="height:8em; background-color: #F8F8F8;">전공 및 기술능력</div>
			                            </div>
									
									</div>
									<div class="col-9">
			                            <div class="row	">
			                                <div class="col border-bottom border-end justify-content-center align-items-center px-0 py-0" style="height:8em;">
			                                	<textarea name="answer2" class="w-100 h-100" style="border:none">${selfIntroductionDto.answer2}</textarea>
			                                </div>
			                            </div>    
			                        </div>     
								</div>
							
								<div class="row ms-2">
									<div class="col-3">
			                            <div class="row">
			                                <div class="col d-flex justify-content-center align-items-center border-start border-end border-bottom" style="height:8em; background-color: #F8F8F8;">주요경력 및 자격사항</div>
			                            </div>
									
									</div>
									<div class="col-9">
			                            <div class="row	">
			                                <div class="col border-bottom border-end justify-content-center align-items-center px-0 py-0" style="height:8em;">
			                                	<textarea name="answer3" class="w-100 h-100" style="border:none">${selfIntroductionDto.answer3}</textarea>
			                                </div>
			                            </div>    
			                        </div>     
								</div>
								<div class="row ms-2">
										<div class="col-3">
				                            <div class="row">
				                                <div class="col d-flex justify-content-center align-items-center border-start border-end border-bottom" style="height:8em; background-color: #F8F8F8;">성격 및 장단점</div>
				                            </div>
										
										</div>
										<div class="col-9">
				                            <div class="row	">
				                                <div class="col border-bottom border-end justify-content-center align-items-center px-0 py-0" style="height:8em;">
				                                	<textarea name="answer4" class="w-100 h-100" style="border:none">${selfIntroductionDto.answer4}</textarea>
				                                </div>
				                            </div>    
				                        </div>     
								</div>
				
								<div class ="row mt-4">
								<div class = "col-4"></div>			
						 		<div class ="col-4"></div>
						 			<div class ="col-4 text-end">
												<button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
														내용 불러오기
												</button>
												<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <div class="modal-header" style="border-bottom: none;">
												        
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												        
												      </div>
												        <div class="modal-body">
														<span class="modal-title fs-5 d-flex justify-content-center" id="exampleModalLabel" style="font-size: 1em;"">저장된 이력서를 불러오시겠습니까?</span>	       
														</div>
												    
												      <div class="modal-footer" style="border-top: none;">
												        <a href ="./ajdksRegisterSelfIntroduction" class="btn btn-secondary">아니오</a>
												        <a href ="./ajdksRegisterSelfIntroduction?Student_pk=${selfIntroductionDto.student_pk}" class="btn btn-primary">네</a>
												      	
												      </div>
												    </div>
												  </div>
												</div>
												
										<input type="submit" value="이력서 수정" class="btn btn-secondary bi bi-person">
						 		</div>
						 	</div>
								 	
								 		
								</form>
							</c:when>
						</c:choose>	
								
					
						 
						 

				<div class="row mt-5"></div>
				<div class="row ms-2">
					<div class ="row">		
							<div class="col-4 d-flex align-items-center">
							
							<i class="bi bi-postcard-fill" style="font-size: 2em;"></i> <span style = "font-size: 16pt">&nbsp; 자격증 등록</span></div>
							<div class="col-8"></div>
							
    				</div>
       			</div>
				<!--  자격증 등록  -->
				<div class = "row ms-2">	   
				      		<div class = "col-2 text-center border-start border-top border-bottom d-flex justify-content-center align-items-center" style = "background-color:#F8F8F8;  height:2.5em"> 자격증명 </div> 
				      		<div class = "col-4 text-center border-start border-top border-bottom d-flex justify-content-center align-items-center" style="background-color: #F8F8F8; " > 취득일자 </div>
				      		<div class = "col-4 text-center border-start border-top border-bottom d-flex justify-content-center align-items-center"  style="background-color: #F8F8F8; " > 이미지 파일 링크</div>
				      		<div class = "col-2 text-center border-start border-top border-bottom border-end d-flex justify-content-center align-items-center"  style="background-color: #F8F8F8;"> 삭제</div>
				</div>
				
				 <c:forEach var="certificationList" items="${certificationList}">
			        	<div class="row ms-2"> 				        	 	
			      		<div class = "col-2 justify-content-center border-start  border-bottom d-flex align-items-center" style ="height:2em">
			      			${certificationList.certification_name}
			      				
			      		</div>
			      		
			      		<div class = "col-4 justify-content-center border-start  border-bottom d-flex align-items-center" >
			      			${certificationList.certification_acquisition_date}
			      		</div>
			      		<div class = "col-4 justify-content-center border-start  border-bottom d-flex align-items-center">
			      		<a style ="color:black;" href = "./ajdksShowCertification?imageLink=${certificationList.certification_file}">${certificationList.certification_name}</a>
			    		</div>
			      		<div class ="col-2 justify-content-center  border-end border-start  border-bottom d-flex align-items-center">
							
							<a href ="./ajdksDeleteCertification?certification_file=${certificationList.certification_file}" style ="color:black"><i class="bi bi-x"></i></a>     			
			  	    	</div>		
			  	    	      		
			      		</div>
			        		
				</c:forEach>	
					
					<!-- Button trigger modal -->
					<div class="row ms-2 mt-5">
					
					<div class="col-10"></div>
					<div class="col-2 d-flex justify-content-end">
						<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal2">
						   				자격증 등록
						</button>
					</div>
					</div>
					
<!-- Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabe2" aria-hidden="true">
  
  
  <div class="modal-dialog modal-xl"> <!-- modal-lg도 사용 가능 -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabe2">자격증 등록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>


<form action="./ajdksRegisterCertificationProcess" method="post" enctype="multipart/form-data">
	
      <div class="modal-body">
      
      <div class="row ms-4">
     	<div class="row" style="height:2em">	
     	
     	  <div class="col"></div>	
          <div class="col-2 px-0 border d-flex justify-content-center" style = "background-color:#F8F8F8;">
         		자격증 이름 
          </div>
          <div class="col-4 px-0 border-top border-bottom border-end d-flex justify-content-center" style = "background-color:#F8F8F8;">
            	취득일
         </div>
         
         
         <div class="col-4 px-0 border-top border-bottom border-end d-flex justify-content-center" style = "background-color:#F8F8F8;">
            	파일선택
         </div>
        
        <div class="col"></div>  
        
        </div>
     	
     	
     	<div class="row " style="height:3em">		
     	
     		<div class="col"></div>
          <div class="col-2 px-0">
            <input class="w-100 h-100 border" type="text" name="certification_name " >
          </div>
          <div class="col-4 px-0">
            <input class="w-100 h-100 border text-center" type="date" name="certification_acquisition_date">
          </div>
          <div class="col-4 px-0 text-center">
            <input class="w-100 h-100 border" name="imageLink" type="file" accept="image/*">
          </div>
         <div class="col"></div>
        
        </div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        
        <input class="btn btn-primary" type="submit" value="등록">
	      </div>
	 </form>
							    </div>
							  </div>
							</div>
				 	</div>	 
				</div>
			 
	 		
		<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>		
		</div>		 	
		
	</div>		        
  
 
</div>
	
		
		
		


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>