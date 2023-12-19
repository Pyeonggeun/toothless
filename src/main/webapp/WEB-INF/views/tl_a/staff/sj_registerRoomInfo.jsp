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

<title>Insert title here</title>
<script>
	function roomSubmit(){
		const roomRegister = document.getElementById("roomRegister");
		const choiceRoomName = document.getElementById("choiceRoomName");
		const personnel2 = document.getElementById("personnel2");
		const personnel4 = document.getElementById("personnel4");
		const floor = document.getElementById("floor");
		const choiceGenderW = document.getElementById("choiceGenderW");
		const choiceGenderM = document.getElementById("choiceGenderM");
		
		if(choiceRoomName.value == ""){
			alert("호실 이름을 입력하지 않았습니다.");
			choiceRoomName.focus();
			return;
		}
		
	  if (!personnel2.checked && !personnel4.checked) {
		  //2인실과 4인실이 체크되지 않았다면~!
	        alert("정원을 선택하지 않았습니다.");
	        personnel2.focus();
	        return;
	    }
		
	  
	  if(floor.value==""){
		  alert("층수가 입력되지 않았습니다.");
		  floor.value="";
		  floor.focus();
		  return;
	  }
	  
	  if(!choiceGenderW.checked && !choiceGenderM.checked){
		  alert("성별을 입력하지 않았습니다.");
		  choiceGenderM.focus();
		  return;
	  }
	  
	  
		
		roomRegister.submit();
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
					호 정보 등록
				</div>
			</div>
			
			
             	
			
			<!-- 기숙사명 -->
			<form action="./registerRoomProcess" id="roomRegister" method="post" enctype="multipart/form-data">
		    <div class="row border rounded p-3">
		        <div class="col">
		            <div class="row">
		                <div class="col fs-5 fw-bold">
		                    기숙사명
		                </div>
		            </div>
		            <div class="row">
		                <div class="col my-2">
		                    <select class="form-select" name="dorm_pk" id="choiceDorm" aria-label="기숙사 동을 선택하세요">
		                        <c:forEach items="${dormBuilding}" var="dorm">						
		                            <option value="${dorm.dorm_pk}">${dorm.name}</option>
		                        </c:forEach>
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
		                    <input class="form-control" id="choiceRoomName" name="room_name" type="text" placeholder="호실명을 입력해주세요.">
		                </div>
		            </div>
		        </div>
		    </div>
		
		    <!-- 정원 -->
		    <div class="row mt-3 border rounded p-3">
		        <div class="col">
		            <div class="row">
		                <div class="col">
		                    <span class="fs-5 fw-bold my-1">정원</span>
		                </div>
		            </div>
		            <div class="row">   
		                <div class="col-1 fs-6 fw-bold my-1">
		                    <input type="radio" name="dorm_amount_pk" value="2" id="personnel2">2인실
		                </div>
		                <div class="col-1 fs-6 fw-bold my-1">
		                    <input type="radio" name="dorm_amount_pk" value="4" id="personnel4">4인실
		                </div>
		            </div>
		        </div>
		    </div>
		
		    <!-- 층수 -->
		    <div class="row mt-3 border rounded p-3">
		        <div class="col">
		            <div class="row">
		                <div class="col fs-5 fw-bold">
		                    층수
		                </div>
		            </div>
		            <div class="row">
		                <div class="col my-2">
		                    <input class="form-control" id="floor" name="dorm_floor" type="number" placeholder="몇 층인지 입력해주세요." min="1" max="10">
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
		                <div class="col-1">
		                    <input type="radio" name="gender" value="M" id="choiceGenderM">남
		                </div>
		                <div class="col-1">
		                    <input type="radio" name="gender" value="F" id="choiceGenderW">여
		                </div>
		            </div>
		        </div>
		    </div>
		
		    <div class="row mt-3">
		        <div class="col-5"></div>
		        <div class="col px-0 text-end">
		            <button type="button" onclick="roomSubmit()" class="rounded-0 fw-bold btn btn-lg btn-secondary text-white ms-1">정보 등록</button>
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