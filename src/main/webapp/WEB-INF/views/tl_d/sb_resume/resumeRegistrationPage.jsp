<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<title>resumeRegistrationPage</title>

<script>


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
			
			<%-- 내용 시작 --%>
			<div class="col">
				
				<div class="row">
					<div class="col fs-4 fw-bold mt-5 pb-3 border-bottom border-3">이력서 등록</div>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="row border-bottom border-2 border-black pb-3 mt-5">
							<div class="col fw-bold"><i class="bi bi-person-fill"></i>인적사항</div>
							
						</div>
					</div>
				</div>
				
				<div class="row border-bottom">
					<div class="col">
						<div class="row ms-2 mt-1">		
							<div class="col">이름 : ${sessionStudentInfo.name }</div>
							<div class="col">성별 : ${sessionStudentInfo.gender }</div>
							<div class="col">
								생일 : <fmt:formatDate value="${sessionStudentInfo.birth }" pattern="yyyy-MM-dd"/>
							</div>
							
							<div class="col-1"></div>
						</div>
						<div class="row ms-2 mt-2">
							<div class="col">핸드폰 번호 : ${sessionStudentInfo.phone }</div>
							<div class="col">이메일 주소 : ${sessionStudentInfo.email }</div>
							<div class="col"></div>
							<div class="col-1"></div>
						</div>
						<div class="row ms-2 mt-2 mb-2">
							<div class="col">주소 : ${sessionStudentInfo.address }</div>
							<div class="col-1"></div>
						</div>
					</div>
				</div>
				
				<form action="./resumeRegisterProcess" method="post">
					<input name="student_pk" type="hidden" value="${sessionStudentInfo.student_pk }">
				
				
				<div class="row">
					<div class="col">
						<div class="row border-bottom border-2 border-black pb-3 mt-5">
							<div class="col fw-bold"><i class="bi bi-check-lg"></i>메인 이력서 선택</div>
							
						</div>
					</div>
				</div>
				
				<div class="row border-bottom">
					<div class="col">
						<div class="row mt-2">
							<div class="radioBox col ms-2">
								<input id="main_resume" name="main_resume" type="radio" value="Y"> 메인이력서
								<input id="main_resume" name="main_resume" type="radio" value="N"> 추가이력서 <br>
								
								<input name="is_public" type="hidden" value="N"><br>
							</div>
						</div>
					</div>
				</div>
					
				<div class="row">
					<div class="col">
						<div class="row border-bottom border-2 border-black pb-3 mt-5">
							<div class="col fw-bold"><i class="bi bi-file-earmark-text"></i>이력서 제목</div>
							
						</div>
					</div>
				</div>
				
				<div class="row ">
					<div class="col">
						<div class="row mt-2">
							<div class="col">
							<textarea id="resume_title" name="resume_title" rows="2" cols="120"></textarea>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="row border-bottom border-2 border-black pb-3 mt-5">
							<div class="col fw-bold"><i class="bi bi-file-earmark-text"></i>자소서</div>
							
						</div>
					</div>
				</div>
				
				<div class="row ">
					<div class="col">
						<div class="row mt-2">
							<div class="col">
							<textarea id="cover_letter" name="cover_letter" rows="30" cols="120"></textarea>
							
							</div>
						</div>
					</div>
				</div>
				
				<div class="row mt-4">
					<div class="col-10"></div>
					<div class="col ">
						<button type="submit" class="btn btn-outline-dark">이력서 등록</button>
					</div>
				</div>
				</form>
				<div class="row border-top mt-5">
					<div class="col"></div>
					<div class="col-2 mt-3">
						<form action="./resumeManagementPage" method="post">
							<input type="hidden" name="student_pk" value="${sessionStudentInfo.student_pk }">
							<button type="submit" class="btn btn-outline-secondary">돌아가기</button>
						</form>
					</div>
				</div>
				
			</div>
			<%-- 내용 끝 --%>
			
		
			
			
			
			<div class="col-2"></div>
		</div>
			
	</div>
	
	<div class="container">
		<div style="height: 200px;"></div>
	</div>
	<div class="row">
		<div class="col">
			<jsp:include page="../common/futter.jsp"></jsp:include>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>