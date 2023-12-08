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
<title> AJDKS TEMPLATE FOR STUDENT </title>
<style>

/*학생좌측메뉴바설정*/
	.studentleftmenubar input {
	    display: none;
	}
	
	.studentleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.studentleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.studentleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.studentleftmenubar input + label + .content {
	    display: none;
	}
	
	.studentleftmenubar input:checked + label + .content {
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
		<jsp:include page="../../common/ajdksHighestMenubarForStudent.jsp"></jsp:include>
	</div>
</div>
<div class="row">

	<!-- 좌측메뉴바 -->
	<jsp:include page="../../common/ajdksSideMenubarForStudent.jsp"></jsp:include>
	
	<!-- 본문 : 자유롭게 이용하세요 화이팅 -->	
		<div class="col">
			<div class="row">
				<div class="col mx-3">
				<!-- 본문작성공간 (이력서 조회 공간) -->
					<div class ="row" style="margin-top:100px;">
							<div class="col-1 d-flex align-items-center justify-content-center">
								<span><i class="bi bi-play-circle" style="color:red;  font-size:2em;"></i>
								<strong>&nbsp;기본정보</strong>
								</span>
								
							</div>
							<div class="col-11"></div>
							<br>
							  <hr style="border-top:2px solid; margin-bottom: 0;">
    				</div>
					
					
					<div class="row">
							<div class="col-2 text-center" style ="margin:auto;">
								<div class="row border" style="height:300px;">
								<img src="C:\images\증명사진.jpg">
								</div>	
							</div>									
							<div class="col-3">
							    <div class="row border d-flex align-items-center justify-content-center" style="height:75px; background-color: #B0C4DE; color:#7C0A02;font-weight:bold;" >
							        학생명/성별 *
							    </div>
							    <div class="row border d-flex align-items-center justify-content-center" style="height:75px; background-color: #B0C4DE; color:#7C0A02;font-weight:bold;">
							        전화번호/휴대폰 *
							    </div>
							    <div class="row border d-flex align-items-center justify-content-center" style="height:75px; background-color: #B0C4DE; color:#7C0A02;font-weight:bold;">
							        이메일 *
							    </div>
							    <div class="row border d-flex align-items-center justify-content-center" style="height:75px; background-color: #B0C4DE; color:#7C0A02;font-weight:bold;">
							        주소 *
							    </div>
							</div>


						<div class="col-7  text-center">
								<div class="row border d-flex align-items-center justify-content-center" style="height:75px;">
							        ${Student.studentDto.name} /  ${Student.studentDto.gender} 
							    </div>
							    <div class="row border d-flex align-items-center justify-content-center" style="height:75px;">
							        ${Student.studentDto.phone}
							    </div>
							    <div class="row border d-flex align-items-center justify-content-center" style="height:75px;">
							        ${Student.studentDto.email}
							    </div>
							    <div class="row border d-flex align-items-center justify-content-center" style="height:75px;">
							        ${Student.studentDto.address}
							    </div>
						</div>
						 <hr style="border-top:2px solid; margin-bottom: 0;">	
					</div>
					
					<div class="row" style="margin-top:85px;" ><hr style="border:2px solid;"></div>
					
					<div class ="row" style="margin-top:2px;">
							<div class="col-1 d-flex align-items-center justify-content-center">
								<span><i class="bi bi-play-circle" style="color:red;  font-size:2em;"></i>
									
									<strong>&nbsp;학적 정보</strong>
									
								</span>
							</div>
							<div class="col-11"></div>
							<br>		 
    				</div>
					
				
					<div class="row ">
						
						
						
						<!--  1열  왼쪽--> 
						<div class="col-2">
							   <div class="row border d-flex align-items-center justify-content-center" style="height:50px; background-color: #B0C4DE; color:#7C0A02;font-weight:bold;" >
							        이름
							    </div>
						</div>
						<div class="col-3">
							   <div class="row border d-flex align-items-center justify-content-center" style="height:50px;">
							        ${Student.studentDto.name} 
							    </div>
						</div>
						<!--  1열 중간 -->
						<div class="col-2"></div>
						
						
						<!-- 1열 오른쪽 -->
						<div class="col-2">
								   <div class="row border d-flex align-items-center justify-content-center" style="height:50px; background-color: #B0C4DE;color:#7C0A02;font-weight:bold; ">
							       	현재학기
									</div>
						</div>
						<div class="col-3">
						 	 	<div class="row border d-flex align-items-center justify-content-center" style="height:50px; ">
							        ${Student.semester}학기
							    </div>
						</div>
					</div>
					
					<!--  2열 왼쪽 -->
						<div class="row">
						<div class="col-2">
							   <div class="row border d-flex align-items-center justify-content-center" style="height:50px; background-color: #B0C4DE; color:#7C0A02;font-weight:bold;">
							        전공
							    </div>
						</div>
						<div class="col-3">
							   <div class="row border d-flex align-items-center justify-content-center" style="height:50px;">
							        ${Student.departmentName}
							    </div>
						</div>
						
						<div class="col-2"></div>
						
						<!-- 2열 오른쪽 -->
						<div class="col-2">
								   <div class="row border d-flex align-items-center justify-content-center" style="height:50px; background-color: #B0C4DE; color:#7C0A02;font-weight:bold;;">
								   취득학점
								   </div>
						</div>
						<div class="col-3">
						 	 	<div class="row border d-flex align-items-center justify-content-center" style="height:50px ;">
						 	 	전자공학과
						 	 	</div>
						</div>
					</div>
					
					<!-- 3열 왼쪽  -->
						<div class="row">
						<div class="col-2">
							   <div class="row border d-flex align-items-center justify-content-center" style="height:50px; background-color: #B0C4DE; color:#7C0A02;font-weight:bold;">
							    담당교수
							   </div>
						</div>
						<div class="col-3">
							   <div class="row border d-flex align-items-center justify-content-center" style="height:50px;">
							  	${Student.proffessorName}
							  	
							   </div>	
						</div>		
						<hr style="border-top:2px solid; margin-top: 0;">	
					
					</div>
						
					<!-- 학적 정보 row 끝 -->
				
					<div class ="row" style="margin-top:100px;">
							<div class="col-1 d-flex align-items-center justify-content-center">
								<span><i class="bi bi-play-circle" style="color:red;  font-size:2em;"></i>
								<strong style ="margin-bottom:10px;">&nbsp;자격증</strong>
							
								</span>
								
							</div>
					<hr style="border-top:2px solid; margin-bottom: 0;">	
					</div>
					
					<div class="row">
				
					<!--맨 위 제목 -->
				
							<div class="col-6 border d-flex align-items-center justify-content-center" style="height:50px; background-color: #B0C4DE; color:#7C0A02;font-weight:bold;">
							         자격증 사진   
							</div>
									
							<div class="col-3 border d-flex align-items-center justify-content-center" style="height:50px; background-color: #B0C4DE; color:#7C0A02;font-weight:bold;" ">
							    
							        자격증명
							</div>


						<div class="col-3 border d-flex align-items-center justify-content-center" style="height:50px; background-color: #B0C4DE; color:#7C0A02;font-weight:bold;" ">	 	
							        
							        취득일자
						</div>
						 	
					</div>
					
					
					<!-- 자격증 Dto 리스트를 통해서 이 학생이 취득한 자격증들을 다 나열한다.	 -->					
					<div class="row"> 
					
						<c:forEach items="${Student.certificationDtoList}" var="certificationDtoList">
						<div class="col-6 border d-flex align-items-center justify-content-center" style="height:50px;">
											
											<a style ="color:black;" href = "./ajdksShowCertification?imageLink=${certificationDtoList.certification_file}">${certificationDtoList.certification_name}
											</a>
											
											
						</div>
						<div class="col-3 border d-flex align-items-center justify-content-center" style="height:50px;">
											${certificationDtoList.certification_name}
						</div>
						<div class="col-3 border d-flex align-items-center justify-content-center" style="height:50px;">
											${certificationDtoList.certification_acquisition_date}
						</div>
						</c:forEach>
					</div>
					<hr style="border-top:2px solid; margin-top: 0;">
				</div>
			</div>
		</div>
	
	</div>
	</div>
<!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>