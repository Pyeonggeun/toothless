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
	<jsp:include page="../commons/staff/topNavi2.jsp"></jsp:include>
	
	
	<!-- 내용시작 -->
	<div class="row">
		<!-- 좌측 카테고리 -->
		<jsp:include page="../commons/staff/leftCategory.jsp"></jsp:include>
		
		<!-- 우측내용 -->
		<div class="col mx-5">
			<!-- 카테고리명 -->
			<div class="row my-3">
				<div class="col fs-4 fw-bold">
					공고 관리
				</div>
			</div>
			
			<!-- 카테고리 -->
			<div class="row mt-2">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active text-black" href="#">공고 등록</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link text-black" href="#">조회/수정</a>
					  </li>
					</ul>
				</div>
			</div>

			<form action="./mj_registerInfoProcess" method="post" enctype="multipart/form-data">
             	<input type="hidden" name="seller_id" value="${sessionSeller.id }">
			
			<!-- 기숙사명 -->
			<div class="row border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							제목
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<input class="form-control" name="title" type="text" placeholder="제목을 입력해주세요.">
						</div>
					</div>
				</div>
			</div>
			
			<!-- 상세설명 -->
			<div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							상세 내용
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<textarea class="form-control" name="detail_expln" placeholder="내용을 입력해주세요."></textarea>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 신청 시작일 -->
			<div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							신청 시작일
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<input class="form-control" name="apply_start_date" type="date">
						</div>
					</div>
				</div>
				
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							신청 종료일
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<input class="form-control" name="apply_end_date" type="date">
						</div>
					</div>
				</div>
			</div>			
			
			<!-- 선발인원 -->
			<div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							선발 인원
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<input class="form-control" name="selection_amount" type="text" placeholder="선발 인원을 정수로 입력해주세요.">
						</div>
					</div>
				</div>
			</div>
			
			<!-- 합격자발표 -->
			<div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							합격자 발표일
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<input class="form-control" name="pass_anncm_date" type="date">
						</div>
					</div>
				</div>
			</div>
			
			<!-- 관비납부시작일 -->
			<div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							관비 납부 시작일
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<input class="form-control" name="payment_start_date" type="date">
						</div>
					</div>
				</div>
				
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							관비 납부 종료일
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<input class="form-control" name="payment_end_date" type="date">
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- 배정통보일 -->
			<div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							배정 통보일
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<input class="form-control" name="asgnm_anncm_date" type="date">
						</div>
					</div>
				</div>
			</div>
			
			<!-- 입주일 -->
			<div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							입주일
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<input class="form-control" name="join_dorm_date" type="date">
						</div>
					</div>
				</div>
			</div>
						
			<!-- 제출 -->
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
			
		</div> <!-- 우측내용 col 끝 -->
            
        
	</div> <!-- main row 끝 -->
	

</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>