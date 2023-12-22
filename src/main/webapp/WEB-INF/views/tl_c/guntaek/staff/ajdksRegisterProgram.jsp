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
<title> AJDKS TEMPLATE FOR STAFF </title>
<style>
	/*교직원좌측메뉴바설정*/
	.staffleftmenubar input {
	    display: none;
	}
	
	.staffleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.staffleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.staffleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.staffleftmenubar input + label + .content {
	    display: none;
	}
	
	.staffleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

</style>

</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<div class="row">
	<div class="col">
		<jsp:include page="../../common/ajdksHighestMenubarForStaff.jsp"></jsp:include>
	</div>
</div>
<div class="row">

	<!-- 좌측메뉴바 -->
	<jsp:include page="../../common/ajdksSideMenubarForStaff.jsp"></jsp:include>
	
	<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
	<div class="col">
		<div class="row">
			<div class="col mx-4">
			<!-- 본문작성공간 -->
			<!-- 로그인 된 경우만 이 페이지를 볼 수 있게 당연히 예외 처리 해야한다. -->
			<c:choose>
				<c:when test ="${!empty staffDto}">
				<div class="row mt-5">
					<div class="col fw-bold">
						<i style ="font-size:1.5em;"class="bi bi-calendar-plus-fill"></i> &nbsp; 교육프로그램 등록
					</div>
				</div>
				<div class="row mt-3">
					<div class="col border border-2"></div>
				</div>
				
				
				<form action="./ajdksRegisterProgramProcess" method ="post" enctype="multipart/form-data">
				<div class="row mt-4">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						프로그램 제목
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="title" type="text" placeholder="예시) 합격하는 이력서의 비결" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
				
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						프로그램 내용
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="content" type="text" placeholder="예시) 인턴 참여를 위한 첫번째 관문 자소서에 대한 첨언과 앞으로의 방향에 대해 알려준다. " style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
				
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						프로그램 장소
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="place" type="text" placeholder="예시) 서울특별시 관악구 난곡로 휴먼시아 아파트 226동 1703호" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
									
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						프로그램 강연자
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="lecturer" type="text" placeholder="예시) 아주대 석사 안계홍" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
				
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						신청가능 인원
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="maximum_applicant" type="number" placeholder="예시) 31" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
				
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						프로그램 진행 날짜
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="progress_date" type="text" placeholder="예시) 2023년 12월 11일" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>

				</div>
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						모집 마감일
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="deadline_date" type="date" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>

				</div>
				
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						이미지 등록
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="imageLink" type="file" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>

				</div>	
									
				<div class="row mt-5">	
				
					<div class="col-9 d-flex justify-content-end" >
					
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
						 	제출
						</button>
						
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">확인</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        	제출하시겠습니까?
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						        <input type ="submit" value ="제출" class="btn btn-primary">
						      </div>
						    </div>
						  </div>
						</div>					
							
					</div>
					<div class="col-3 ">
					</div>
				</div> 	
			</form>
			</c:when>
			
			<c:when test ="${empty staffDto}">
					<div class ="row" style ="margin-top:18em;">
					 	<div class="col"></div>
					 	<div class ="col-6 d-flex justify-content-center"> 	</div>
					 	<div class ="col"></div>
					 </div>
			</c:when>
		</c:choose>
			
			
			
						
				</div>
			</div>
			
				<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>		
		</div>
	
	

	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>