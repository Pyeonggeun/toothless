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
        <title>교육 교직원 프로그램 목록</title>
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
                                                    교육 프로그램 목록
                                                </div>
                                            </div>
                                            
                                            <!--검색바  -->
                                            <div class="row">
                                                <div class="col justify-content-end">
                                                    <form action="./eduProgListPage" method="get">
                                                    <div class="row mt-3 text-end"><!-- 검색  -->
                                                        <div class="col-7"></div>
                                                        <div class="col">
                                                            <div class="row justify-content-end">
                                                                <div class="col-2"></div>
                                                                <div class="col-3 px-1 text-end">
                                                                    <select name="searchType" class="form-select form-select-sm">
                                                                        <option value="eduName" selected>프로그램명</option>
                                                                        <option value="name">작성자</option>
                                                                        <option value="content">내용</option>
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
                                                    <!-- 프로그램 신청 현황목록 내용 -->
                                                    <c:forEach items="${list }" var="edu">
                                                        <div class="row py-1 border-bottom">
                                                            <div class="col-1" style="text-align: center;">
                                                                <span>${edu.eduDto.edu_pk }</span>
                                                            </div>
                                                            <div class="col-4 text-start sss" style="text-align: center;" >
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
                                                    <div class="row mt-4"> <!--등록버튼이요-->
                                                        <div class="col text-end" >
                                                            <a class="btn fw-bold text-white rounded-0" href="./eduProgRegisterPage"
                                                            role="button" style="background-color: #014195;
                                                            ">프로그램 등록</a>
                                                        </div>
                                                    </div>
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