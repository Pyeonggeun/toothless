<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>


<%-- 별값 바꾸기 --%>
<script>
<%-- onclick으로 추출한 id에따라 value설정후 name hjf_scroe에 세팅 --%>
 	function selectStarValue(element){
	
 		//hidden에있는 별점 위치찾기
 		var hjf_score = document.querySelector("#hjf_score"); 
 		
 		//별값 클래스 전부호출
 		var starClass = document.querySelectorAll(".starValue");
 		
 		//모든 star클래스의 별꽉삭제
 		for(e of starClass){
 	 		e.classList.remove("bi-star-fill");
 	 		e.classList.add("bi-star");
 		}
 		 		 		
 		//1점일떄, 요소끼리 비교가됨
 		if(element==starValue1){
 			element.classList.remove("bi-star");
 			element.classList.add("bi-star-fill");
 			hjf_score.value = "1";
 		}
 		//2점일때
 		if(element==starValue2){
 			var starId = document.querySelector("#starValue1");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill");
 			starId = document.querySelector("#starValue2");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill"); 
 			hjf_score.value = "2";
 		} 		
 		//3점일때
 		if(element==starValue3){
 			var starId = document.querySelector("#starValue1");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill");
 			starId = document.querySelector("#starValue2");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill"); 
 			starId = document.querySelector("#starValue3");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill");
 			hjf_score.value = "3";
 		} 			
 		//4점일때
 		if(element==starValue4){
 			var starId = document.querySelector("#starValue1");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill");
 			starId = document.querySelector("#starValue2");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill"); 
 			starId = document.querySelector("#starValue3");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill"); 
 			starId = document.querySelector("#starValue4");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill");
 			hjf_score.value = "4";
 		} 	
 		//5점일때
 		if(element==starValue5){
 			var starId = document.querySelector("#starValue1");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill");
 			starId = document.querySelector("#starValue2");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill"); 
 			starId = document.querySelector("#starValue3");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill"); 
 			starId = document.querySelector("#starValue4");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill");
			starId = document.querySelector("#starValue5");
 			starId.classList.remove("bi-star");
 			starId.classList.add("bi-star-fill");  
 			hjf_score.value = "5";
 		} 	 		
 	}
</script>


</head>
<body>

<div class="container-fluid">
	
	<div class="row">
		<div class="col">
			<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
		</div>
	</div>
	<div class="row">
		<div class="col-2">
			<jsp:include page="../common/studentMenu.jsp"></jsp:include>
		</div>
		<div class="col-1 border-start"></div>
		<div class="col">
		
					<div class="row">
						<div class="col">
							
								<div class="row border mt-5">
									<div class="col">
										<div class="row pt-2">
											<div class="col fw-bold" style="font-size:1.3em;">
												구직희망 프로그램 만족도 설문조사
											</div>
										</div>
										
										<div class="row pb-2">
											<div class="col text-secondary pt-2" style="font-size:0.7em;">
												* 본 설문지는 향후 학생들에게 더 나은 프로그램을 제공하기 위한 기초자료로 활용 되오니 솔직한 의견을 부탁드립니다
											</div>
										</div>									
									</div>
								</div>
								
								
								
								<div class="row border mt-5">
									<div class="col">
										<form action="./insertHJFProcess" method="post">																	
											<div class="row pt-3">
												<div class="col">
													<span>작성자 </span> <span class="text-secondary" style="font-size:0.8em;">${sessionStudentInfo.name}</span> 
												</div>
											</div>
										
											<div class="row pt-5">
												<div class="col" style="font-size:0.8em; ">
													구직희망 프로그램에 대해 평가 해주세요(1~5점)
												</div>							
											</div>	
											<div class="row pt-1">
												<div class="col" style="font-size:1.5em;">
													<i id="starValue1" onclick="selectStarValue(this)" class="starValue bi bi-star-fill text-warning"></i><i onclick="selectStarValue(this)" id="starValue2" class="starValue bi bi-star-fill text-warning"></i><i onclick="selectStarValue(this)" id="starValue3" class="starValue bi bi-star-fill text-warning"></i><i onclick="selectStarValue(this)"  id="starValue4" class="starValue bi bi-star-fill text-warning"></i><i onclick="selectStarValue(this)"  id="starValue5" class="starValue bi bi-star-fill text-warning"></i>
													<input id="hjf_score" class="border" type="hidden" min="1" max="5" name="hjf_score" value="5" style="width:10%; height:100%; border:none; outline:none;">									
												</div>
											</div>						
			
											<div class="row mt-5">
												<div class="col" style="font-size:0.8em;">
													기타 의견이나 불만사항이 있으면 가감없이 적어주세요
												</div>
											</div>
											<div class="row">
												<div class="col">
													<textarea class=" border" name="hjf_comment" rows="4" cols="50" style="width:100%; height:100%; border:none; outline:none;"></textarea>
													<input type="hidden" name="hope_job_pk" value="${hope_job_pk}" > 
												</div>
											</div>
											
											<div class="row py-3">
												<div class="col">
													<button type="submit" class="btn btn-primary">제출</button>
												</div>
											</div>									
										</form>										
									</div>
								</div>
								

																		
						</div>
					</div>

			</div>
			<div class="col-2"></div>
	</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>