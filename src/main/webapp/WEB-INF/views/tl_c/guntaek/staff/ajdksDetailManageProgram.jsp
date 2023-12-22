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
<div class="container-fluid">
<!-- 전체 container 입구 -->

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
				
				<!-- 프로그램 상세하게 보기... -->	
				
					
						
					
				
					<div class="row mt-5">
					<div class="col fw-bold">
								<h3 style="font-weight:bold"> <i class="bi bi-list-task"></i>&nbsp;&nbsp;&nbsp;${programDto.title}</h3>	
					</div>
					</div>
					
					<div class="row mt-3">
						<div class="col border border-2 border-dark"></div>
					</div>
					
					<!-- 이미지 그림 -->					
					<div class ="row">
						<div class="col-1"></div>
						
							<div class="col-10 d-flex justify-content-center"><img class="img-fluid" src="/Git_imageFile/${programDto.poster_image}"
							style ="height :30em;">
							</div>
						<div class="col-1"></div>
						</div>
					
					
					
					
					
					<c:if test ="${!empty myStudentApplyList}">
					
					<div class="row mt-4 ">
						
						<div class ="col-1"></div>
						<div class = "col-2 d-flex align-items-center justify-content-center border " style ="background-color:#f9f9f9">이름</div>
						<div class = "col-2 d-flex justify-content-center align-items-center  border-top border-bottom border-end" style ="background-color:#f9f9f9">학번</div>
						<div class = "col-1 d-flex justify-content-center align-items-center  border-end border-top border-bottom" style ="background-color:#f9f9f9">수료여부</div>
						<div class = "col-1 d-flex justify-content-center align-items-center  border-end border-top border-bottom" style ="background-color:#f9f9f9">성별</div>
						<div class = "col-2 d-flex justify-content-center align-items-center  border-end border-top border-bottom" style ="background-color:#f9f9f9">신청일자</div>
						<div class = "col-2 d-flex justify-content-center align-items-center  border-top border-bottom  border-end" style ="background-color:#f9f9f9">수료완료 버튼</div>
						<div class ="col-1"></div>
					</div>
					</c:if>
					
					<c:if test ="${empty myStudentApplyList}">
					
						<div class="row mt-4 text-center">
							<h4 style ="font-weight: bold;">아직 등록한 학생이 없습니다.</h4>
						</div>
					</c:if>
					
					
					
					<c:forEach items ="${myStudentApplyList}" var = "a">				
					<div class="row">
					
						<div class="col-1"></div>
						<div class = "col-2 d-flex align-items-center justify-content-center border-start border-bottom" style ="height:3em;">
							${a.sDto.name}
						</div>
						<div class = "col-2 d-flex justify-content-center align-items-center  border-start border-end border-bottom">
							${a.sDto.student_id}
						</div>
						<div class = "col-1 d-flex justify-content-center align-items-center  border-end border-bottom">
							${a.aDto.completion}
						</div>
						<div class = "col-1 d-flex justify-content-center align-items-center border-end  border-bottom">
							${a.sDto.gender}
						</div>
						<div class = "col-2 d-flex justify-content-center align-items-center border-end  border-bottom">
							<fmt:formatDate pattern ="yyyy-MM-dd" value="${a.aDto.applying_date}"/>			
						</div>
					
						
						
						<c:if test="${a.aDto.completion == 'N'}">
							<div class = "col-2 d-flex justify-content-center align-items-center border-bottom">
								<form action ="./ajdksChangeCompletion">
									<input type ="hidden" value ="${internedu_program_pk}" name="internedu_program_pk">
									<input type ="hidden" value ="${a.sDto.student_pk}" name ="student_pk">
										<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
										  	 수료
										</button>
										<!-- Modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="exampleModalLabel">수료 등록</h5>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body">
										        	수료를 등록하시겠습니까? 되돌릴 수 없으니 신중히 선택하세요.
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										        <input type ="submit" class="btn btn-primary" value ="수료 등록">
										        
										      </div>
										    </div>
										  </div>
										</div>

								</form>
								
							</div>
							</c:if>
							
						<c:if test="${a.aDto.completion == 'Y'}">
							<div class = "col-2 d-flex justify-content-center align-items-center border-end border-bottom">
									
									<input class="btn btn-primary" value = "수료 완료"  type ="submit" disabled ="disabled"	>
							</div>
							</c:if>
					</div>
					</c:forEach>
					
					
					
						<div class="col-1"></div>
					
					
					
					
					<!-- 본문 작성 공간 -->			
				</div>
			</div>
			<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>	
		</div>	
		
	</div>
</div>
			<!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>