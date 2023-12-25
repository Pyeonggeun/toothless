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
        <title>교육 교직원 만족도 목록</title>
        <script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>
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
                                    <div class="row my-5"> <!--교육현황관리-->
                                        <div class="col-1"></div>
                                        <div class="col">
                                            <div class="row">
                                                <div class="col text-center fw-bold" style="font-size: 1.5em;">
                                                	만족도 작성 현황
                                                </div>
                                            </div>
                                            
                                            <!--검색바  -->
                                            <div class="row">
                                                <div class="col justify-content-end">
                                                    <form action="./eduServeyListPage" method="get">
                                                    <div class="row mt-3 text-end"><!-- 검색  -->
                                                        <div class="col-7"></div>
                                                        <div class="col">
                                                            <div class="row justify-content-end">
                                                                <div class="col-2"></div>
                                                                <div class="col-3 px-1 text-end">
                                                                    <select name="searchType" class="form-select form-select-sm">
                                                                        <option value="eduname" selected>프로그램명</option>
                                                                        <option value="name">신청자</option>
                                                                        <option value="content">평가내용</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="row justify-content-end">
                                                                        <div class="col-11 text-end">
                                                                            <input  name="searchWord" 
                                                                            type="text" 
                                                                            class="form-control form-control-sm">
                                                                        </div>
                                                                        <div class="col text-start p-0 ">
                                                                            <button type="submit" 
                                                                            class="p-0 btn btn-white btn-sm w-10">
                                                                                <i class="bi bi-search-heart"
                                                                                style="font-size: 18px;"></i>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>	
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </form>
                                                </div>
                                            </div>
                                            
                                            


                                            <div class="row mt-4"> <!--목록 출력-->
                                                <div class="col">
                                                    <div class="row text-white pb-1 border-bottom border-dark"
                                                    style="background-color: #133369;">
                                                        <div class="col-1 fw-bold" style="text-align: center;" >
                                                            <span>작성자</span>
                                                        </div>
                                                        <div class="col fw-bold d-grid" style="text-align: center;" >
                                                            <span>프로그램명</span>
                                                        </div>
                                                        
                                                        <div class="col-1 fw-bold" style="text-align: center;" >
                                                            <span>별점</span>
                                                        </div>
                                                        <div class="col fw-bold" style="text-align: center;" >
                                                            <span>평가내용</span>
                                                        </div>
                                                    </div>
                                                    <!-- 만족도 목록 -->
                                                     <c:forEach items="${allServeyList }" var="ser">
                                                        <div class="row py-1 border-bottom">
                                                            <div class="col-1 align-self-center text-center" style="text-align: center;">
                                                                <span>${ser.studentName.name }</span>
                                                            </div>
                                                            <div class="col align-self-center text-center" style="text-align: center;">
                                                                ${ser.eduName }
                                                            </div>
                                                            
                                                            <div class="col-1 align-self-center text-start">
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
                                                            <div class="col align-self-center text-start ms-5">
                                                                ${ser.eduStsfcSurveyDto.content }
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <!-- 목록출력 끝 -->

                                        </div>
                                        <div class="col-1"></div>
                                    </div>    
                                   
                                    
                               
                                </div>
                            </div>
                        </div>
                    </div>
                    
          <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
                </div>        
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>