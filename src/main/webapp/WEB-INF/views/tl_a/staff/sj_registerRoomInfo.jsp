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
			
			<!-- 카테고리명 -->
			<div class="row my-3">
				<div class="col fs-4 fw-bold">
					호 정보 등록
				</div>
			</div>
			
			<form action="./registerItemProcess" method="post" enctype="multipart/form-data">
             	<input type="hidden" name="seller_id" value="${sessionSeller.id }">
			
			<!-- 기숙사명 -->
			<div class="row border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							기숙사명
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<select class="form-select" aria-label="기숙사 동을 선택하세요">							
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 호실명 -->
			<div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							호실명
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<input class="form-control" name="itemName" type="text" placeholder="호실명을 입력해주세요.">
						</div>
					</div>
				</div>
			</div>
			
			<!-- 정원 -->
			<div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							정원
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							정원카테고리에서 고르도록
						</div>
					</div>
				</div>
			</div>
			
			<!-- 성별 -->
			<div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							성별
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							radio -> gender
						</div>
					</div>
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
        	</form>
			
			
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