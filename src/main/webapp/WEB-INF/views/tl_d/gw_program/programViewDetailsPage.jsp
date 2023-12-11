<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<meta charset="UTF-8">
<title>프로그램 상세보기</title>
</head>
<body>

<div class="containar">
	<div class="row">
			<!-- 취업팀 상단 네비 바 -->
			<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>
	</div>
	<div class="row">
		<div class="col-1"></div>
		<!-- 취업팀 메뉴 바 -->
		<div class="col-2 me-5 border-end">
			<jsp:include page="../common/staffMenu.jsp"></jsp:include>
		</div>
		
		
		<div class="col">
			<div class="row border-bottom border-3 border-bs-border mt-5 mb-3 pb-3 fs-4 fw-bold">
				<div class="col-3">프로그램 상세정보</div>
			</div> 
			<div class="row">
				<div class="col"> 
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">프로그램명</div>
						<div class="col p-1 ps-4">${program.programDto.prg_name}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">프로그램 카테고리</div>
						<div class="col p-1 ps-4">${program.programDto.program_category_pk}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">프로그램 일정</div>
						<div class="col p-1 ps-4">
							<fmt:formatDate value="${program.programDto.prg_schedule}" pattern="yyyy.MM.dd"/>
						</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">프로그램 신청 마감일</div>
						<div class="col p-1 ps-4">
							<fmt:formatDate value="${program.programDto.prg_apply_deadline}" pattern="yyyy.MM.dd"/>
						</div>
					</div>
					
					<div class="row border-bottom py-3">
						<img src="../../resources/img/employment/${program.programDto.prg_main_image}">
					</div>
					
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">프로그램 내용</div>
						<div class="col p-1 ps-4">${program.programDto.prg_contents}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">장소</div>
						<div class="col p-1 ps-4">${program.programDto.prg_location}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">수용인원</div>
						<div class="col p-1 ps-4">${program.programDto.prg_apply_number}</div>
					</div>
					<div class="row border-bottom py-3">
						<div class="col-2 border-end border-bs-border p-1 ps-2 fw-bold">출석체크여부</div>
						<div class="col p-1 ps-4">${program.programDto.prg_is_attend}</div>
					</div>
				</div>
			</div>
			<!-- 버튼들 여따 -->
			
			<div class="row mt-4 mb-5"> 
				
				<div class="col-2 mx-0 text-start">
					<a class="btn btn-primary" href="./updateProgramInfoPage?program_pk=${program.programDto.program_pk}">프로그램 수정</a> 
				</div>
				<div class="col-2 mx-0 text-start">
					<a class="btn btn-outline-primary" href="./deleteCompanyInfoProcess?program_pk=${program.programDto.program_pk}" role="button">프로그램 삭제</a>
				</div> 
				<!-- 여백용 -->
				<div class="col"></div> 
				<div class="col text-end">
					<a class="btn btn-primary" href="./programListPage" role="button">프로그램 목록으로</a>
				</div>
			</div>
			
		</div>
		
		<div class="col-1"></div>
		
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>