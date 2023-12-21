<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <div class="row border-top border-dark border-2 mt-3 pt-3">
                	<div class="col">
                		<div class="row">
                			<div class="col fs-5 fw-bold">
                				${one.repairDto.title }
                			</div>
                		</div>
                		<div class="row text-end pb-2">
                			<div class="col">
                				${one.studentInfo.name }
                				<fmt:formatDate value="${one.repairDto.request_date }" pattern="yyyy.MM.dd"/>
                			</div>
                		</div>
                	
                	</div>
                </div>
                <div class="row border-bottom border-dark pb-4" style="border-top: 1px dotted;">
                	<div class="col mt-4">
                		${one.repairDto.content} <br>
                		<img src="/requestRepairImg/${one.repairDto.image_link }" class="img-fluid">
                	</div>
                </div>

				<div class="row my-4 ">
					<div class="col my-2 text-start">
           				<a class="btn rounded-0" style="background-color:#504528; color:#FFFFFF;" href="./sj_requestRepairPage">목록으로</a>
           			</div>
              		
              		<c:if test="${!empty sessionStudentInfo && sessionStudentInfo.student_pk == one.dormStudentDto.student_pk }">
              			<div class="col d-flex justify-content-end my-2 pe-0">
              				<a class="btn btn-outline-primary rounded-0 me-2" href="./sj_requestEditPage?request_repair_pk=${one.repairDto.request_repair_pk }" role="button">수정하기</a>
              				<a class="btn btn-outline-danger rounded-0" href="./deleteRequestRepairProcess?request_repair_pk=${one.repairDto.request_repair_pk }" role="button">삭제하기</a>
              			</div>
              		</c:if>
				</div>
                
            </div>
            </div>
        </div>
        
        <pre>
        
        
        
        
        
        
        
        
        </pre>

<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>