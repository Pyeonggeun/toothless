<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="http://code.jquery.com/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@0.0.2/score.js"></script>

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
	
	.select {
    padding: 15px 10px;
}
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height:	2em;
    width: 5em;
    border: 1px solid #333;
    line-height: 1.5em;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.select input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
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
						<p style="font-weight:bold; font-size:1.2em" ><i class="bi bi-pencil-square"></i>&nbsp;&nbsp; 리뷰 작성</p>							 	
					</div>		
				</div>
				
				
				<div class="row">
						<div class="col border border-1 border-dark"></div>
				</div>
						
		 <c:forEach items="${ProgramList}" var="list">   
         
         
         	 <div class="row mt-5">   
               <div class="col-2"></div>
  
                    <div class="col-8 mt-5">
                    <!-- 박스 시작-->
                        <div class="row px-0 py-0 border mt-3" style ="height:12em; border-radius:10px;">
                               
                               
                               
                               
                                
                                <div class="px-0 py-0 col-3 d-flex justify-content-start align-items-center"> 
                                
                                	<img class ="w-100 py-0 px-0 img-fluid" src ="/Git_imageFile/${list.eduList.poster_image}" style ="height:12em; border-radius: 5px;"> 
                                </div>
                                <!-- 제목, 이외 여러 프로그램 정보들-->
                                <div class="col ms-5">
                                    <div class="row mt-4 ms-5"> 
                                        <div class="col ms-5 d-flex justify-content-center" style ="font-weight: bold; font-size:1.2em"> ${list.eduList.title}</div>
                                    </div>
                                    <div class="row mt-4"></div>
                                    
                                    
                                    
                                    <div class="row mt-5"> 
                                       <div class="col-9">
                                       			진행 날짜
	                                    	<span style="color:gray;">
	                                    	   &nbsp;&nbsp; ${list.eduList.progress_date}
											</span>
										</div>
                                    </div>
                                    <div class="row mt-1"> 
                                        <div class="col-9 ">마감 날짜 &nbsp;&nbsp; 
                                        
											<span style ="color:gray;">
												<fmt:formatDate pattern = "yyyy-MM-dd" value ="${list.eduList.deadline_date}"/> 
                                        	</span>
                                        </div>    
                                    </div>
                                </div>
                                
                            <!-- 리뷰 등록했으면 안나오게 예외처리 -->
                       		<c:if test="${empty list.checkList}">
                                <div class ="col-3 d-flex justify-content-end align-items-end px-0 py-0">
                                    <div class ="row">
                                        <div class="col ">
                                        <!-- Button trigger modal -->
											<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
											  	리뷰 등록하기
											</button>
										</div>
										
											
											<!-- Modal -->
											<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h5 class="modal-title" id="exampleModalLabel">
											        	리뷰 작성
											        </h5>
											        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											      </div>
											      <div class="modal-body">
													    <div class="row">
													        <form id="reviewForm" action="./ajdksRegisterProgramReviewProcess" method="get">
													            <!-- 별점 라디오 버튼 -->
													            <div class="row">
													    		<div class="col">		
													          		 <div class="select">
																	     <input type="radio" id="select1" name="rating" value="1"><label for="select1">★</label>
																	     <input type="radio" id="select2" name="rating" value="2"><label for="select2">★★</label>
																	     <input type="radio" id="select3" name="rating" value="3"><label for="select3">★★★</label>
																	     <input type="radio" id="select4" name="rating" value="4"><label for="select4">★★★★</label>
																	     <input type="radio" id="select5" name="rating" value="5"><label for="select5">★★★★★</label>
																	</div>
																</div>      
																</div>
																<div class="row">
													            <!-- 리뷰 내용 입력 -->
													            <input type ="hidden" value="${list.eduList.internedu_program_pk}" name ="internedu_program_pk">
													            <textarea id="reviewText" name="review" placeholder="리뷰 내용을 작성해주세요"></textarea>
																</div>
													            <div class="row">
													                <div class="col-8"></div>
													                <div class="col-4">
													                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style ="margin-top:1em">닫기</button>
													                    <input type="submit" value="등록" class="btn btn-primary" style ="margin-top:1em">
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
                                   </c:if>
                                   <c:if test="${!empty list.checkList}">
                                   	<div class="col-3"></div>
                                   </c:if>
                                </div>
                           
                            
                            
                        </div>
                        <div class="col-2	"></div>
                    </div>
         
   			
   			</c:forEach>

				
				
				
				
				
				
				
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