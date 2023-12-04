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
					학년도/학기 추가
				</div>
			</div>
			
			<form action="./mj_registerYearProcess" method="post">
			
			<!-- 년도 -->
			<div class="row border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							년도
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<input class="form-control" name="semester_year" type="text" placeholder="추가할 년도를 입력해주세요. (ex - 2023)">
						</div>
					</div>
				</div>
			</div>
			
			<!-- 학기 -->
			<div class="row border mt-3 rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							학기
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<div class="row border rounded-3 px-1 py-2 mx-1">
			                    <div class="col text-center">
			                        <div class="form-check form-check-inline">
			                            <input class="form-check-input" type="radio" name="semester" value="1">
			                            <label class="form-check-label" for="inlineRadio1">1학기</label>
			                        </div>                                
			                    </div>
			                    <div class="col text-center">
			                        <div class="form-check form-check-inline">
			                            <input class="form-check-input" type="radio" name="semester" value="2">
			                            <label class="form-check-label" for="inlineRadio2">여름학기</label>
			                        </div>
			                    </div>
			                    <div class="col text-center">
			                        <div class="form-check form-check-inline">
			                            <input class="form-check-input" type="radio" name="semester" value="3">
			                            <label class="form-check-label" for="inlineRadio3">2학기</label>
			                        </div>
			                    </div>
			                    <div class="col text-center">
			                        <div class="form-check form-check-inline">
			                            <input class="form-check-input" type="radio" name="semester" value="4">
			                            <label class="form-check-label" for="inlineRadio4">겨울학기</label>
			                        </div>
			                    </div>                       
			                </div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row mt-3">
				<div class="col px-0">
					<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary me-1"> &nbsp;&nbsp; 취소 &nbsp;&nbsp;</button>
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