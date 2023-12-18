<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>       
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
		<title>교육프로그램 신청완료</title>
	</head>
	<body>
        <div class="container-fluid">
            <jsp:include page="../hs/eduStudentTopBanner.jsp"></jsp:include>
            
            <div class="row">
                <div class="col">
                    <div class="row">
						<div class="col"></div>
						<div class="col-8 text-start">
							<a href="./eduMainPageForStudent" class="btn btn-sm fw-bold" 
							style="color: #4c4a4c;">메인페이지</a>
							<a href="./eduMyPageForStudent" class="btn btn-sm fw-bold"
							style="color: #4c4a4c;">마이페이지</a>
						</div>
						<div class="col"></div>
					</div>
                </div>
            </div>

			<!-- 페이지내용 -->
            <div class="row mt-4">
                <div class="col"></div>

                <div class="col-6" >
					
                 	<div class="row border-bottom border-dark border-2">
                        <div class="col mb-3 fw-bold text-center" style="font-size: 1.5em;">
							신청 완료
						</div>
                    </div>

                    <div class="row border-bottom ">
                        <div class="col"></div>
                        <div class="col-8 px-0 mt-2">
                            

                            <div class="row">
                                <div class="col fw-bold text-center" 
								style="font-size: 40px;
                                color: #2969B0;">
                                    <i class="bi bi-check-circle"></i>
                                </div>
                            </div>
                            <div class="row mt-3">
                            	<div class="col fw-bold text-center"
                            	style="font-size: 24px;">
                            		교육프로그램 신청이 완료되었습니다.
                            	</div>
                            </div>
                            
                            <div class="row mt-4">
                                <div class="col fw-bold text-center">
                                    <span style="font-size: 18px;">
                                         <img class="img img-fluid"
				                            src="../../resources/img/healthRoom/edu/${eduDto.img_link }"
				                            style="max-height: 350px; width: 300px;"
				                         >
                                    </span>
                                </div>
                            </div>
                            
                            
                            <div class="row mt-4">
                                <div class="col-3 fw-bold text-center">
                                    <span style="font-size: 18px;">
                                        프로그램명
                                    </span> 
                                </div>

                                <div class="col">
                                    <span style="font-size: 18px;">
                                        ${eduDto.name}
                                   </span>
                                </div>
                            </div>
                            
                            <div class="row mt-3">
                                <div class="col-3 fw-bold text-center">
                                    <span style="font-size: 18px;">
                                        교&nbsp;&nbsp;&nbsp;육&nbsp;&nbsp;&nbsp;일
                                    </span> 
                                </div>

                                <div class="col">
                                    <span style="font-size: 18px;">
                                        <fmt:formatDate 
                                        value="${eduDto.edu_date }"
                                        pattern="yy년 MM월 dd일 hh시"
                                        />
                                    </span>
                                </div>
                            </div>
                            
                            <div class="row mt-3">
                                <div class="col-3 fw-bold text-center">
                                    <span style="font-size: 18px;">
                                        교&nbsp;육&nbsp;장&nbsp;소
                                    </span> 
                                </div>

                                <div class="col">
                                    <span style="font-size: 18px;">
                                        ${eduDto.place}
                                   </span>
                                </div>
                            </div>
                            
                            <div class="row mt-3 mb-4">
                                <div class="col-3 fw-bold text-center">
                                    <span style="font-size: 18px;">
                                        강&nbsp;&nbsp;&nbsp;사&nbsp;&nbsp;&nbsp;명
                                    </span> 
                                </div>

                                <div class="col">
                                    <span style="font-size: 18px;">
                                    	이민규
                                   	</span>
                                </div>
                            </div>
                            
                        </div>
						<div class="col"></div>
                    </div>
                    
                    <!-- 버튼 -->
					<div class="row mt-3">
					
                        <div class="col text-center">
                            <button class="btn fw-bold ms-4 me-1" 
                                    style="background-color: #EFF0F2;" 
                                    onclick="location.href='./eduMainPageForStudent'">
                                    목록
                            </button>
                            <button class="btn fw-bold text-white ms-1" 
                            style="background-color: #014195;" 
                            onclick="location.href='./eduMyPageForStudent'">
                            나의 신청내역
                            </button>
                        </div>
                        
                      
					</div>	


                </div>
                <div class="col"></div>
            </div>
		</div>
		
		<pre>
		
		
		</pre>

            <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	</body>
</html>