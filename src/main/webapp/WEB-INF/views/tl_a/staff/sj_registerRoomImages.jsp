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
					호실별 이미지 등록 - 양식만 복붙해서 넣어놨오. 필요한거 수정/추가하면될듯여 ㅎㅎ 감사함니다
				</div>
			</div>
			
			<form action="./registeRoomImagesProcess" method="post" enctype="multipart/form-data">
             	<!-- <input type="hidden" name="staff_pk" value="${sessionStaffInfo.staff_pk }"> -->
			
			
			<!-- 정원 -->
			<div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col">
							<span class="fs-5 fw-bold my-1">정원</span>
						</div>
					</div>
					<div class="row">
						<div class="col fs-6 fw-bold my-1">
							<c:forEach items="${dormAmount }" var="da">
								<input type="radio" name="dorm_amount_pk" value="${da.dorm_amount_pk }">${da.dorm_amount }인실

							</c:forEach>
						</div>
					</div>
					
				</div>
			</div>
			
			
			<!-- 상세이미지링크 -->
            <div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							기숙사 이미지
						</div>
					</div>
					
                     <!-- 상세이미지링크 -->
                     <div class="row my-2">
                     	<div class="col-1 align-self-center">
                     		상세이미지
                     	</div>
                        <div class="col align-self-center">
                     		<input class="form-control" name="roomImgs" type="file" accept="image/*" multiple>
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