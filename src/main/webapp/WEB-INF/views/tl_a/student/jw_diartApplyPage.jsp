<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
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
           <jsp:include page="../commons/student/leftButtons5.jsp"></jsp:include>
            <!-- 왼쪽 목차 끝 -->
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">일지 등록</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙사 커뮤니티 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;">일지 등록</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <form class="row" action="./jw_diartApplyProcess" method="post">
                    <div class="col">
                    	<div class="row mt-2">
                    		<div class="col-2 py-3 fw-bold" style="font-size: 1.1rem;">
                    			<span>이름</span>
                    		</div>
                    		<div class="col py-3 text-start" style="font-size: 1.0rem;">
                    			${sessionStudentInfo.name}
                    		</div>
                    	</div>
                    	<input type="hidden" name="executive_pk" value="${executiveDto.executive_pk}">
                        <div class="row mt-3">
                        	<div class="col-2 fw-bold" style="font-size: 1.1rem;">
								<span>내용</span>
							</div>
							<div class="col" style="font-size: 1.0rem;">
								<textarea name="content" style="height:20rem; width:45rem"></textarea>
							</div>
                        </div>
                        <div class="row my-3">
							<div class="col py-3 fw-bold d-md-flex justify-content-md-end" style="font-size: 1.1rem;">
								<input type="submit" class="btn btn-secondary">
							</div>
                        </div>
                    </div>
            	</form>
              </div>
                <!-- 공고 끝 -->
            </div>
        </div>
        

<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>

   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>