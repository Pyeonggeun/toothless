<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>동 정보 등록</title>
<script>
	function dormSubmit(){
		const dormRegister = document.getElementById("dormRegister");
		const dormName = document.getElementById("dormName");
		const dormAddress = document.getElementById("dormAddress");
		const dormImg = document.getElementById("dormImg");
		
		if(dormName.value == ""){
			alert("기숙사 동 이름이 입력되지 않았습니다.");
			dormName.value="";
			dormName.focus();
			return;
		}
		
		if(dormAddress.value ==''){
			alert("기숙사 주소가 입력되지 않았습니다.");
			dormAddress.value="";
			dormAddress.focus();
			return;
		}
		
		if(dormImg.value==""){
			alert("기숙사 이미지가 선택되지 않았습니다.")
			dormImg.focus();
			return;
		}
		
		dormRegister.submit();
	}
</script>
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
					동 정보 등록
				</div>
			</div>
			
			<form action="./registerDormProcess" id="dormRegister" method="post" enctype="multipart/form-data">
             	<!-- <input type="hidden" name="staff_pk" value="${sessionStaffInfo.staff_pk }"> -->
			
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
							<input class="form-control" id="dormName" name="name" type="text" placeholder="기숙사명을 입력해주세요.">
						</div>
					</div>
				</div>
			</div>
			
			<!-- 주소 -->
			<div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							주소
						</div>
					</div>
					<div class="row">
						<div class="col my-2">
							<input class="form-control" id="dormAddress" name="address" type="text" placeholder="주소를 입력해주세요.">
						</div>
					</div>
				</div>
			</div>
			
			<!-- 이미지 -->
			<div class="row mt-3 border rounded p-3">
				<div class="col">
					<div class="row">
						<div class="col fs-5 fw-bold">
							기숙사 이미지
						</div>
					</div>
					<!-- 메인이미지링크 -->
                     <div class="row my-2">
                     	<div class="col-1 align-self-center">
                     		대표이미지
                     	</div>
                        <div class="col align-self-center">
                     		<input class="form-control" id="dormImg" name="mainImage" type="file" accept="image/*">
                     	</div>
                     </div>
                     
				</div>
			</div>
			
			<div class="row mt-3">
			
				<div class="col-5"></div>
                <div class="col px-0 text-end">
				
                    <button type="button" onclick="dormSubmit()" class="rounded-0 fw-bold btn btn-lg btn-secondary text-white ms-1">정보 등록</button>
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