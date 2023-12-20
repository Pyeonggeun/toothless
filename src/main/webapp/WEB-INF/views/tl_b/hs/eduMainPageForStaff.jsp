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
        <title>교육 교직원 메인</title>
        <script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>
        
        <style>
          .text-over-cut {
	        display: block;
	        max-width: 600px;
	        white-space: nowrap;
	        overflow: hidden;
	        text-overflow: ellipsis;
	   	 }
        
        </style>
        
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col">
               		<jsp:include page="../commonJsp/staffTopBanner.jsp"></jsp:include>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <jsp:include page="../commonJsp/staffSideBar.jsp"></jsp:include>
                                <div class="col pb-5">
                                    <!-- 여기 안에만 사용하면 됨 -->
                                	<div class="row mx-5">
                                        <div class="col">
                                            <div class="row">  
                                                <div class="col pt-4 px-2">
                                                    <div class="row">

                                                        <div class="col"> <!--교육목록-->
                                                            <div class="row">
                                                            	
                                                                <div class="col text-center fw-bold px-0" style="font-size: 1.3em;">
                                                                    교육 프로그램 신청현황
                                                                </div>
                                                                
                                                                <!-- <div class="col-1 text-end">
                                                                    <input name="name" type="text" style="height: 25px;">
                                                                    <i class="bi bi-search-heart"></i>
                                                                </div> -->
                                                            </div>
                                                            <div class="row">
		                                                        <div class="col text-end my-auto" style="font-size: small;">
		                                                                   <a href="./eduApplyListPage" style="text-decoration: none;"
		                                                                   class="text-secondary">
		                                                                   더보기 &gt;
		                                                                   </a>
		                                                         </div>
		                                                    </div>
                                                            <div class="row mt-3">
                                                                <div class="col">
                                                                    <div class="row text-white pb-1 border-bottom border-dark"
                                                                    style="background-color: #133369;">
                                                                        <div class="col fw-bold" style="text-align: center;" >
                                                                            <span>신청자</span>
                                                                        </div>
                                                                        <div class="col fw-bold" style="text-align: center;" >
                                                                            <span>프로그램명</span>
                                                                        </div>
                                                                        <div class="col fw-bold" style="text-align: center;" >
                                                                            <span>신청일</span>
                                                                        </div>
                                                                        <div class="col fw-bold" style="text-align: center;" >
                                                                            <span>상태</span>
                                                                        </div>
                                                                    </div>
                                                                    <c:forEach items="${applyListMain }" var="edu">
                                                                        <div class="row py-1 border-bottom">
                                                                            <div class="col align-self-center text-center" style="text-align: center;">
                                                                                <span>${edu.studentInfoDto.name }</span>
                                                                            </div>
                                                                            <div class="col align-self-center text-start text-over-cut" style="text-align: center;">
                                                                                <span>${edu.eduDto.name }</span>
                                                                            </div>
                                                                            <div class="col align-self-center text-center" style="text-align: center;">
                                                                                <span><fmt:formatDate value="${edu.eduApplyDto.created_at}"
                                                                                pattern="yy년 MM월 dd일"/></span>
                                                                            </div>
                                                                            <!-- <div class="col" style="text-align: center;">
                                                                                <span>1/10</span>
                                                                            </div> -->
                                                                            <div class="col align-self-center text-center">
                                                                            	<c:choose>
                                                                            		<c:when test="${edu.eduApplyDto.status eq 'N'}">
                                                                            			<a class="btn btn-sm px-2 fw-bold text-white rounded-0" href="./updateStatusYProcess?edu_apply_pk=${edu.eduApplyDto.edu_apply_pk}"
	                                                                                	role="button" style="background-color: black;">수료대기</a>
                                                                            		</c:when>
                                                                            		<c:when test="${edu.eduApplyDto.status eq 'Y'}">
                                                                            			<a class="btn btn-sm fw-bold text-white rounded-0" href="./updateStatusNProcess?edu_apply_pk=${edu.eduApplyDto.edu_apply_pk}"
	                                                                                	role="button" style="background-color: #014195;">수료완료</a>
                                                                            		</c:when>
                                                                            		<c:when test="${edu.eduApplyDto.status eq 'D'}">
                                                                            			<a class="btn btn-sm fw-bold rounded-0" href=#
	                                                                                	role="button" style="background-color: #F3F3F3; color: #C4C3C4;">수료완료(만족도O)</a>
                                                                            		</c:when>
                                                                            		
	                                                                                <c:otherwise>
	                                                                                	<a class="btn btn-sm fw-bold rounded-0" href=#
	                                                                                	role="button" style="background-color: #F3F3F3; color: #C4C3C4;" >신청취소</a>
	                                                                                </c:otherwise>
                                                                                </c:choose>
                                                                            </div>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div> <!--교육목록 끝--> 
                                                        <!--만족도 ㅎㅎ-->
                                                        <div class="col-1 px-0"></div>
                                                        <div class="col"> 
                                                            <div class="row">
                                                                <div class="col text-center fw-bold" style="font-size: 1.3em;">
                                                                    만족도 작성현황
                                                                </div>
                                                            </div>
                                                            <div class="row">
		                                                        <div class="col text-end my-auto" style="font-size: small;">
		                                                                   <a href="./eduServeyListPage" style="text-decoration: none;"
		                                                                   class="text-secondary">
		                                                                   더보기 &gt;
		                                                                   </a>
		                                                         </div>
		                                                    </div>
                                                            <div class="row mt-3">
                                                                <div class="col">
                                                                    <div class="row text-white pb-1 border-bottom border-dark"
                                                                    style="background-color: #133369">
                                                                        <div class="col fw-bold" style="text-align: center;" >
                                                                            프로그램명
                                                                        </div>
                                                                        <div class="col fw-bold" style="text-align: center;" >
                                                                            작성자
                                                                        </div>
                                                                        <div class="col fw-bold" style="text-align: center;" >
                                                                            별점
                                                                        </div>
                                                                        <div class="col fw-bold" style="text-align: center;" >
                                                                            평가내용
                                                                        </div>
                                                                    </div>
                                                                    <c:forEach items="${serveyListMain }" var="ser">
                                                                    <div class="row py-1 border-bottom">
                                                                        <div class="col align-self-center text-start text-over-cut" style="text-align: center;">
                                                                            ${ser.eduName }
                                                                        </div>
                                                                        <div class="col align-self-center text-center" style="text-align: center;">
                                                                            <span>${ser.studentName.name }</span>
                                                                        </div>
                                                                        <div class="col align-self-center text-center" style="font-size: 1.28em;">
                                                                        	<c:choose>
																				<c:when test="${ser.eduStsfcSurveyDto.star_rated eq 5}">
																					⭐⭐⭐⭐⭐
																				</c:when>
																				<c:when test="${ser.eduStsfcSurveyDto.star_rated eq 4}">
																					⭐⭐⭐⭐
																				</c:when>
																				<c:when test="${ser.eduStsfcSurveyDto.star_rated eq 3}">
																					⭐⭐⭐
																				</c:when>
																				<c:when test="${ser.eduStsfcSurveyDto.star_rated eq 2}">
																					⭐⭐
																				</c:when>
																				<c:when test="${ser.eduStsfcSurveyDto.star_rated eq 1}">
																					⭐
																				</c:when>
																			</c:choose>
                                                                        </div>
                                                                        <div class="col align-self-center text-center text-over-cut">
                                                                        	${ser.eduStsfcSurveyDto.content }
                                                                        </div>
                                                                    </div>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div> <!--교육목록 끝--> 
                                                        </div>
                                                        <!-- 만족도 끝 -->

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row my-5"> <!--교육현황관리-->
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col text-center fw-bold" style="font-size: 1.3em;">
                                                            교육 프로그램 목록
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="row">
                                                        <div class="col text-end my-auto" style="font-size: small;">
                                                                   <a href="./eduProgListPage" style="text-decoration: none;"
                                                                   class="text-secondary">
                                                                   더보기 &gt;
                                                                   </a>
                                                         </div>
                                                    </div>
													
													
													


                                                    <div class="row mt-4"> <!--목록 출력-->
                                                        <div class="col">
                                                            <div class="row text-white pb-1 border-bottom border-dark"
                                                            style="background-color: #133369;">
                                                                <div class="col-1 fw-bold d-grid" style="text-align: center;" >
                                                                    <span>글번호</span>
                                                                </div>
                                                                <div class="col-4 fw-bold" style="text-align: center;" >
                                                                    <span>프로그램명</span>
                                                                </div>
                                                                <div class="col fw-bold" style="text-align: center;" >
                                                                    <span>신청인원/교육정원</span>
                                                                </div>
                                                                <div class="col fw-bold" style="text-align: center;" >
                                                                    <span>작성자</span>
                                                                </div>
                                                                <div class="col fw-bold" style="text-align: center;" >
                                                                    <span>교육일</span>
                                                                </div>
                                                                <div class="col fw-bold" style="text-align: center;" >
                                                                    <span>작성일</span>
                                                                </div>
                                                            </div>
                                                            <!-- 프로그램 목록 내용 -->
                                                            <c:forEach items="${progListMain }" var="edu">
                                                                <div class="row py-1 border-bottom">
                                                                    <div class="col-1" style="text-align: center;">
                                                                        <span>${edu.eduDto.edu_pk }</span>
                                                                    </div>
                                                                    <div class="col-4 text-start text-over-cut" style="text-align: center;" >
                                                                        <span>
                                                                        <a href="./readEduProgPage?edu_pk=${edu.eduDto.edu_pk}" class="text-black"
                                                                        style="text-decoration: none;">
                                                                        ${edu.eduDto.name }
                                                                        </a></span>
                                                                    </div>
                                                                    <div class="col" style="text-align: center;">
                                                                        <span>${edu.applyStudentCount }/${edu.eduDto.capacity }</span>
                                                                    </div>
                                                                    <div class="col" style="text-align: center;">
                                                                        <span>${edu.staffInfoDto.name }</span>
                                                                    </div>
                                                                    <div class="col" style="text-align: center;">
                                                                        <span><fmt:formatDate value="${edu.eduDto.edu_date }" pattern="yyyy-MM-dd"/></span>
                                                                    </div>
                                                                    <div class="col" style="text-align: center;">
                                                                        <span><fmt:formatDate value="${edu.eduDto.created_at }" pattern="yyyy-MM-dd"/></span>
                                                                    </div>
                                                                   
                                                                </div>
                                                            </c:forEach>
                                                            <div class="row mt-2"> <!--등록버튼이요-->
                                                                <div class="col text-end" >
                                                                    <a class="btn fw-bold text-white rounded-0" href="./eduProgRegisterPage"
                                                                    role="button" style="background-color: #014195;
                                                                    ">프로그램 등록</a>
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
                    </div>
                    
          <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>

                    
                    
                </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>