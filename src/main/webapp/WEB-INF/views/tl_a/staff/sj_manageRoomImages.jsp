<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
	<!-- 최상단 -->
	<jsp:include page="../commons/staff/topNavi.jsp"></jsp:include>
	
	<!-- 기숙사관리 탭 페이지 -->
	<jsp:include page="../commons/staff/topNavi3.jsp"></jsp:include>
	
	
	<!-- 내용시작 -->
	<div class="row">
		<!-- 좌측 카테고리 -->
		<jsp:include page="../commons/staff/leftCategory2.jsp"></jsp:include>
		
		<!-- 우측내용 -->
		<div class="col mx-5">
			
			
			<!-- 카테고리 
			<div class="row mt-2">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					
					<ul class="nav nav-tabs">
					<li class="nav-item ta">
					    <a class="nav-link active text-black" href="./sj_manageRoomImages">전체보기</a>
					  </li>
					<c:forEach items="${dormAmount }" var="da">
					  <li class="nav-item ">
					    <a class="nav-link text-secondary" href="./sj_manageRoomImagesReadPage?dorm_amount_pk=${da.dorm_amount_pk }">${da.dorm_amount }인실</a>
					  </li>
					  </c:forEach>
					  
					</ul>
				</div>
			</div>
			-->
			
			
			
			
			<!-- 상세이미지링크 -->
            <div class="row">
				<div class="col text-center fs-5 fw-bold my-4">
					인실 별 이미지
				</div>
			</div>			
			<div class="row border rounded py-3">
				<div class="col">
					<div class="row text-center fw-bold  fs-5">
						<div class="col ">
							인실
						</div>
						<div class="col">
							상세 이미지
						</div>
						
						<div class="col">삭제</div>
					</div>
					
					<c:forEach items="${dormAmount }" var="ct">
						<div class="row text-center my-5 border-bottom">
							<div class="col">
								
								${ct.dorm_amount }인실
							</div>
							<div class="col">
								<img src="/uploadRoomImgs/${ct.dorm_imgs }" class="img-fluid img-thumbnail">
							</div>
							<div class="col">
								<a href="./deleteForRoomDatailProcess?dorm_amount_pk=${ct.dorm_amount_pk }">삭제</a>
							</div>
						</div>
					</c:forEach>
				    
					
				</div>
			</div>
			
	
			
			<div class="row mt-3">
				<div class="col px-0">
					<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary me-1"> &nbsp;&nbsp; 취소 &nbsp;&nbsp;</button>
					<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary me-1">미리보기</button>
					<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary">중간저장</button>
				</div>			
				<div class="col-5"></div>
                <div class="col px-0 text-end">
					<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary">임시 저장</button>
                    <button type="submit" class="rounded-0 fw-bold btn btn-lg btn-secondary text-white ms-1">정보 등록</button>
                </div>                    
             </div>
        
			
			
			<pre>
			
			
			</pre>
			
		</div>
		<!-- 우측내용 끝 -->
            
        
	</div> <!-- main row 끝 -->
	

</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>