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
<title> AJDKS TEMPLATE FOR PROFESSOR </title>
<style>
	/*교수좌측메뉴바설정*/
	.professorleftmenubar input {
	    display: none;
	}
	
	.professorleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.professorleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.professorleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.professorleftmenubar input + label + .content {
	    display: none;
	}
	
	.professorleftmenubar input:checked + label + .content {
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
			<jsp:include page="../../common/ajdksHighestMenubarForProfessor.jsp"></jsp:include>
		</div>
	</div>
	<div class="row">
	
		<!-- 좌측메뉴바 -->
		<jsp:include page="../../common/ajdksSideMenubarForProfessor.jsp"></jsp:include>
		
		<!-- 본문 :  자유롭게 이용하세요 화이팅 -->
		<div class="col">
			<div class="row">
				<div class="col mx-5">
				
				<!-- 본문작성공간 -->
					<div class="row mt-5">
						<div class="col fw-semibold" style="font-size:1.3em">
							<span class="text-secondary fs-3">&gt;</span>
							현장실습 진행 관리
						</div>
					</div>
					
					<div class="row mt-4">
						<div class="col">
							<div class="row">
								<div class="col fw-semibold" style="font-size:1.1em">
									학생 기본정보
								</div>
							</div>
							<div class="row mt-2">
								<div class="col border border-secondary border-start-0 border-end-0" style="font-size:0.95em">
									<div class="row">
										<div class="col-2 border-end">
											<div class="row py-3 px-5">
												<div class="col bg-dark-subtle" style="height:10.5em"></div>
											</div>
										</div>
										<div class="col">
											<div class="row border-bottom py-2">
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													이름
												</div>
												<div class="col border-start ps-4 border-end">
													${studentDetails.studentInfoDto.name}
												</div>
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													주민번호
												</div>
												<div class="col border-start ps-4">
													${studentDetails.studentInfoDto.resident_id}
												</div>
											</div>
											<div class="row border-bottom py-2">
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													전공
												</div>
												<div class="col border-start ps-4 border-end">
													${studentDetails.studentDepartment.name}
												</div>
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													이수학기
												</div>
												<div class="col border-start ps-4">
													${studentDetails.countSemester}학기
												</div>
											</div>
											<div class="row border-bottom py-2">
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													생년월일
												</div>
												<div class="col border-start ps-4 border-end">
													<fmt:formatDate value="${studentDetails.studentInfoDto.birth}" pattern="yyyy.MM.dd"/>
												</div>
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													성별
												</div>
												<div class="col border-start ps-4">
													${studentDetails.studentInfoDto.gender}
												</div>
											</div>
											<div class="row border-bottom py-2">
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													전화번호
												</div>
												<div class="col border-start ps-4 border-end">
													${studentDetails.studentInfoDto.phone}
												</div>
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													이메일
												</div>
												<div class="col border-start ps-4">
													${studentDetails.studentInfoDto.email}
												</div>
											</div>
											<div class="row py-2">
												<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
													주소
												</div>
												<div class="col border-start ps-4">
													${studentDetails.studentInfoDto.address}
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
		
	</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>