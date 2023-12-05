<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	// 현재 날짜와 시간을 가져오기
	Date currentDate = new Date();
	
	// 날짜 포맷 지정
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	// 포맷에 맞게 날짜를 문자열로 변환
	String formattedDate = dateFormat.format(currentDate);
%>    
    
    
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .menus{
            text-align: center;
            float: inline-block;
        }
        .gold{
            color: #8C7430;
        }
        
        
 
    </style>
    <script>
        //js주석
        /*여러줄 주석*/
        
    </script>
</head>
<body>
    <jsp:include page="../commons/student/topNavi.jsp"></jsp:include>
    <div class="row">
        <div class="col">
            <img src="../../resources/img/dormitory/studentMainLogo.jpg">
        </div>
    </div>


    <div class="container mt-3">
        <div class="row">
        	<!-- 여기부분은 목차부분 -->
            <div class="col-3 me-3">
                <div class="row rounded-1 opacity-90" style="background-color: #504528;">
                    <div class="col py-4 text-center">
                        <span class="fw-bold" style="color: white; font-size: x-large;">모집안내</span>
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">모집공고</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">선발안내</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">거리배점표</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">납부금안내</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.2em solid #504528;">
                    <div class="col py-3 fw-bold" style="font-size: large;">
                        <span style="color: #504528;">입사신청</span>       
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">합격안내</span>         
                    </div>
                </div>                
            </div>
            <!-- 왼쪽 목차 끝 -->
            
            <!-- 입사신청 시작 -->
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">입사신청</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 모집안내 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 입사신청</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <!--여기가 안에 들어갈 내용들-->
                <div class="row">
                    <div class="col">
                        
						<!-- 기숙사명 -->
						<div class="row text-center">
							<div class="col">
							    <div class="row border mt-2 mb-5">
							    	<div class="col p-1 bg-light">
								    	<div class="row m-3">
								            <div class="col border bg-white">
								                <!-- 가입완료 -->
								                <div class="row my-3 text-center">
								                    <div class="col">
								                        <div class="row my-3">
								                            <div class="col">
								                                <i class="fs-1 text-primary bi bi-check2-circle"></i>
								                            </div>
								                        </div>
								                        <div class="row my-3">
								                            <div class="col fs-1 fw-bold">
								                                신청 완료
								                            </div>
								                        </div>
								                        <div class="row my-3">
								                            <div class="col fs-2">
								                                기숙사 신청이 완료되었습니다
								                            </div>
								                        </div>
								
								                    </div>
								                </div>
								
								                <!-- 관심카테고리 -->
								                <div class="row p-4 mt-2">
								                    <div class="col p-3 border bg-light">
								                        <!-- 관심 카테고리 -->
								                        <div class="row my-4 text-center">
								                            <div class="col fs-4">
								                                합격자 발표일은 
								                                <span class="fw-bold fs-3 text-primary">
								                                <fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.pass_anncm_date }" pattern="MM월 dd일" />
								                                </span>입니다.
								                            </div>
								                        </div>
								                        <!-- 특정 페이지로  -->
								                        <div class="row my-3">
								                            <div class="col text-end">
								                            	<a href="#">
								                                <button type="button" class="p-2 me-2 border rounded-0 btn btn-secondary text-white"> 모집공고 확인하기 </button>
								                                </a>
								                            </div>
								                            <div class="col text-start">
								                            	<a href="#">
								                                <button type="button" class="p-2 ms-2 border rounded-0 btn btn-secondary text-white"> 선발안내 확인하기 </button>
								                                </a>
								                            </div>
								                        </div>
								                        <!-- main바로가기/1:1문의하기 -->
								                        <div class="row my-4 text-center">
								                        	<div class="col"></div>
								                            <div class="col">
								                            	<a href="#" class=" text-secondary" style="text-decoration: none; font-size: 0.9em;">
								                                기숙사 Main 바로가기 >
								                                </a>
								                            </div>
								                            <div class="col">
								                            	<a href="#" class=" text-secondary" style="text-decoration: none; font-size: 0.9em;">
								                                문의하기 >
								                                </a>			                           			                               
								                            </div>
								                            <div class="col"></div>
								                        </div>
								
								                    </div>
								                </div>
								            </div>
								        </div>
							    	</div>
							    </div>
							
							</div>
							
						</div>
						
                    </div>
                </div>
                <!-- 여기까지-->
            </div>
            <!-- 입사신청페이지 끝 -->
        </div>
    </div>
        
        <!-- footer 부분-->
        <div class="row" style="background-color: #181C23;">
            <div class="col-2 pt-4">
                
            </div>
            <div class="col-6 py-4">
                <div class="row">
                    <div class="col-2 px-0 fw-bold text-center" style="color: #FFC00B; font-size: medium;">
                        개인정보처리방침
                    </div>
                    <div class="col px-0 pt-2 fw-bold text-center" style="color: #BABBBD; font-size: 0.3em;">
                        <span class="bi bi-circle-fill"></span>
                    </div>
                    <div class="col-2 px-0 fw-bold text-center" style="color: #BABBBD;">
                        이메일무단수집거부
                    </div>
                    <div class="col px-0 pt-2 fw-bold text-center" style="color: #BABBBD; font-size: 0.3em;">
                        <span class="bi bi-circle-fill"></span>
                    </div>
                    <div class="col-2 px-0 fw-bold text-center" style="color: #BABBBD;">
                        대학정보공시
                    </div>
                    <div class="col pt-2 px-0 fw-bold text-center" style="color: #BABBBD; font-size: 0.3em;">
                        <span class="bi bi-circle-fill"></span>
                    </div>
                    <div class="col-2 px-0 fw-bold text-center" style="color: #BABBBD;">
                        오시는길
                    </div>
                </div>
                <div class="row ms-1 mt-4" style="border-bottom: 0.01em solid #303339;">
                    <div class="col"></div>
                </div>
                <div class="row mt-5">
                    <div class="col fw-bold" style="color: #BABBBD; font-size: medium;">
                        서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층)
                    </div>
                </div>
                <div class="row mt-1 mb-5">
                    <div class="col fw-bold" style="color: #505F65; font-size: medium;">
                        COPYRIGHT© 2023 MINGYU UNIVERSITY. ALL RIGHTS RESERVED.
                    </div>
                </div>
                
            </div>
            

        </div>

   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>