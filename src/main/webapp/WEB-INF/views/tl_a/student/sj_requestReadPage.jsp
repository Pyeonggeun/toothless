<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                	<div class="col">
                	
                		<div class="my-3 mb-4">
						  	<label for="exampleFormControlInput1" class="form-label">
						  	<span class="fw-bold">제목</span>
						  	</label>
						  	
						  	<input class="form-control" type="text" value="${one.repairDto.title }" readonly>
						</div>
						<div class="my-3 mb-4">
							<label for="exampleFormControlInput1" class="form-label">
								<span class="fw-bold">작성자</span>
							</label>
							<input class="form-control" type="text" value="${one.studentInfo.name }" readonly>
						</div>
						<div class="my-3 mb-4">
						 	<label for="exampleFormControlTextarea1" class="form-label">
						 		<span class="fw-bold">내용</span>
						 	</label>
						  	<input class="form-control py-5 " type="text" value="${one.repairDto.content}" aria-label="readonly input example" readonly>

						</div>
						<div class="mb-3">
						  <label for="formFileMultiple" class="form-label">
						  	<span class="fw-bold"> 파손시설 사진</span>
						  </label><br>
						  <img src="/requestRepairImg/${one.repairDto.image_link }" class="img-fluid">
						  
						</div>
												
							<div class="row">
							
								<div class="col d-flex justify-content-start my-2">
	                				<a class="btn btn-primary rounded-0" href="./sj_requestRepairPage">목록으로</a>
	                			</div>
	                		
	                		<c:if test="${!empty sessionStudentInfo && sessionStudentInfo.student_pk == one.dormStudentDto.student_pk }">
	                			<div class="col d-flex justify-content-end my-2">
	                				<a class="btn btn-success rounded-0 me-2" href="./sj_requestEditPage?request_repair_pk=${one.repairDto.request_repair_pk }" role="button">수정하기</a>
	                				<a class="btn btn-danger rounded-0" href="./deleteRequestRepairProcess?request_repair_pk=${one.repairDto.request_repair_pk }" role="button">삭제하기</a>
	                				
	                			</div>
	                		</c:if>
							</div>
						
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