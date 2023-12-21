<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		   <jsp:include page="../commons/student/leftButtons4.jsp"></jsp:include>
		<div class="col">
		<div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">기숙사 자유게시판</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙사 커뮤니티 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 기숙사 자유게시판</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                    </div>
                </div>
			 <div class="row"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                        <div class="row mt-1">
                            <div class="col-1 pb-3 text-center fw-bold" style="font-size: large;">
                                글번호
                            </div>
                            <div class="col-5 text-center fw-bold" style="font-size: large;">
                                제목
                            </div>
                            <div class="col text-center fw-bold" style="font-size: large;">
                                작성자
                            </div>
                            <div class="col text-center fw-bold" style="font-size: large;">
                                접수상태
                            </div>
                            
                            <div class="col text-center fw-bold" style="font-size: large;">
                                작성일
                            </div>
                        </div>
                    </div>
                </div>
	
		
		
		<c:forEach items="${list }" var="map">
           <div class="row mb-2">
           <div class="col">
			<div class="row border rounded-2 py-3 text-center shadow-sm  bg-body-tertiar">
				<div class="col-1">
					${map.dormFreeboardDto.dorm_freeboard_pk}
				</div>
				<div class="col-5">
					<a class="navbar-brand" href="./readGasipan?id=${map.dormFreeboardDto.dorm_freeboard_pk}">${map.dormFreeboardDto.title}</a> 
				</div>
				<div class="col">
					<i class="bi bi-person-circle"> </i> ${map.studentInfoDto.name}
				</div>
				<div class="col text-secondary">
					접수완료
				</div>
				
				<div class="col">
					<fmt:formatDate value="${map.dormFreeboardDto.created_at}" pattern="yyyy.MM.dd"/>
				</div>
				
			</div>
           </div>
       </div>
                </c:forEach>
		
			<div class="row mt-3">
				
			<c:if test="${!empty sessionStudentInfo}">
			<div class="col-2 text-end ms-auto d-grid pe-0">
				<a class="btn rounded-0 " style="background-color:#504528; color:#FFFFFF;" href="./writeGasipan">글쓰기</a>
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
