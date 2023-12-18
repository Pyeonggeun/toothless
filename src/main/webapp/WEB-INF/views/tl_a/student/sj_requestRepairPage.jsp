<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <jsp:include page="../commons/student/leftButtons4.jsp"></jsp:include>
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">고장수리요청</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙사 커뮤니티 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 고장수리요청</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="row my-2">
                	<div class="col-9"></div>
                	<div class="col">
                		<nav class="navbar bg-body-tertiary">
						  <div class="container-fluid">
						    <form class="d-flex" role="search">
						      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
						      <button class="btn btn-outline-success" type="submit">Search</button>
						    </form>
						  </div>
						</nav>
                	</div>
                </div>
                
                <!-- 게시판 ㄱㄱ -->
                <div class="row border-top border-bottom text-center fs-5 fw-bold my-2  "><!-- 게시판 ㄲ --> 
                    <div class="col">
                    	No
                    </div>
                    <div class="col">
                    	제목
                    </div>
                    <div class="col">
                    	작성자
                    </div>
                    <div class="col">
                    	날짜
                    </div>
                </div>
                <!-- 게시판 우하하 -->
                <c:forEach items="${repairList }" var="repair">
                <div class="row text-center my-4 border-top border-bottom "><!-- 게시판 ㄲ --> 
                    <div class="col">
                    	${repair.request_repair_pk }
                    </div>
                    <div class="col">
                    	${repair.title }
                    </div>
                    <div class="col">
                   	 	<%-- <c:if test="${(repair.dorm_student_pk == dormStudent.dorm_student_pk) &&
                   	 		dormStudent.studnt_pk ==printing.student_pk  }">
                   	 		${printing.NAME }
                   	 	</c:if>
                   	 	--%>
                    </div>
                    <div class="col">
                    	<fmt:formatDate value="${repair.request_date }" pattern="yyyy.MM.dd"/>  
                    </div>
                </div>
                </c:forEach>
                <div class="row">
                	<div class="col-6"></div>
                	<div class="col d-flex justify-content-end my-2">
                		<a class="btn btn-outline-danger" href="./sj_requestWritePage" role="button">수리접수</a>
                		
                	</div>
                </div>
            </div>
            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>

<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>