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


    <div class="container mt-3 ">
        <div class="row">
            <jsp:include page="../commons/student/leftButtons4.jsp"></jsp:include>
            <!-- 왼쪽 목차 끝 -->
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">상벌점 확인</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙사 커뮤니티 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;">상벌점 확인</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="row"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                    	<div class="row my-2">
                    		<div class="col-1 py-3 fw-bold" style="font-size: 1.1rem;">
                    			<span>이름</span>
                    		</div>
                    		<div class="col py-3 text-start" style="font-size: 1.0rem;">
                    			${sessionStudentInfo.name}
                    		</div>
                    	</div>
                        <div class="row my-3">
                        	<div class="col-2 fw-bold" style="font-size: 1.1rem;">
								<span>상벌점 내역</span>
							</div>
							<div class="col text-end">
							<span class="fw-bold">총 점수 &nbsp;</span>${sumTotalPoint}
							</div>
                        </div>
                        <div class="row my-4 border">
                        	<div class="col">
                        		<div class="row py-2 mb-0 text-center border border-bottom-1 border-start-0 border-top-1 border-end-0 text-white" style="background-color: #8C7430;">
                        				<div class="col fw-bold border border-bottom-0 border-start-0 border-top-0 border-end-1">상/벌점 Category</div>
                        				<div class="col fw-bold border border-bottom-0 border-start-0 border-top-0 border-end-1">사유</div>
                        				<div class="col-1 w-bold border border-bottom-0 border-start-0 border-top-0 border-end-1" align="center">점수</div>
                        				<div class="col-3 fw-bold">부여일</div>
                        			</div>
                        		<c:forEach items="${pointSituationListMap}" var="pointSituationListMap">
                        			<div class="row py-2 border border-bottom-1 border-start-0 border-top-0 border-end-0">
                        				<div class="col d-grid align-items-center border border-bottom-0 border-start-0 border-top-0 border-end-1">${pointSituationListMap.pointCategoryDto.content}</div>
                        				<div class="col d-grid align-items-center border border-bottom-0 border-start-0 border-top-0 border-end-1">${pointSituationListMap.pointDto.reason}</div>
                        				<div class="col-1 d-grid text-center align-items-center border border-bottom-0 border-start-0 border-top-0 border-end-1">${pointSituationListMap.pointCategoryDto.point}</div>
                        				<div class="col-3 d-grid align-items-center text-center"><fmt:formatDate value="${pointSituationListMap.pointDto.created_at}" pattern="yyyy-MM-dd"/></div>
                        			</div>
                        		</c:forEach>
							</div>
                        </div>
                    </div>
            	</div>
              </div>
                <!-- 공고 끝 -->
            </div>
        </div>
        
        <pre>
        
        <!-- 밑에 너무 붙어있어서 떼느라 씀. 추후 필요시 삭제해도됨 -by MJ -->
        
        
        
        
        </pre>
        

<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>
   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>