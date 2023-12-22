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
<title>프로그램 수정페이지</title>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<!-- 취업팀 상단 네비 바 -->
			<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			<!-- 취업팀 메뉴 바 -->
			<div class="col-2 border-end pb-0">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			
			<!-- 이제 여따가 프로그램 -->
			<div class="col">
				
				<div class="row mt-5 mb-2">
					<div class="col-2"></div>
					<div class="col fw-bold fs-3 pb-2 border-bottom border-light-subtle">프로그램 등록하기</div>
					<div class="col-3"></div>
				</div>
		
				<form action="./updateProgramInfoProcess" method="post" enctype="multipart/form-data">
					<div class="row">
						<div class="col-2"></div>
						<input type="hidden" name="program_pk" value="${program.programDto.program_pk}">
						<div class="col mt-3">
							
							<!-- 프로그램명 입력 -->
							<div class="row mt-3">
								<div class="col">
									<div class="row mb-1">
										프로그램 명
									</div>
									<div class="row">
										<input type="text" name="prg_name" class="form-control" placeholder="프로그램명을 입력해주세요." value="${program.programDto.prg_name}">
									</div>
								</div>
							</div>
							
							<!-- 프로그램 카테고리 입력 -->
							<div class="row mt-3"> 
								<div class="col"> 
									<div class="row mb-1">프로그램 카테고리</div>
									<select class="form-select" name="program_category_pk" >
									  <option selected value="${program.programDto.program_category_pk}">${program.programCategoryDto.program_category_name}</option>
									  <c:forEach items="${programCategory}" var="program">
									  	<option value="${program.program_category_pk}">${program.program_category_name}</option>
									  </c:forEach>
									</select>
								</div>
							</div>
							
							<!-- 프로그램 기간 입력 -->
							<div class="row mt-3">
								<div class="col">
									<div class="row mb-1">
										프로그램 일정
									</div>
									<div class="row d-grid">
										<input type="date" name="prg_schedule" class="form-control" value="<fmt:formatDate value="${program.programDto.prg_schedule}" pattern="yyyy-MM-dd"/>"> 
										
									</div>
									<div class="row mt-1 text-secondery">
										기존 날짜&nbsp;<fmt:formatDate value="${program.programDto.prg_schedule}" pattern="yyyy.MM.dd"/>
									</div>
								</div>
							</div>
							 
							<!-- 대표자 명 입력 -->
							<div class="row mt-3">
								<div class="col">
									<div class="row mb-1">
										프로그램 모집 마감일
									</div>
									<div class="row">
										<input type="date" name="prg_apply_deadline" class="form-control" value="<fmt:formatDate value="${program.programDto.prg_apply_deadline}" pattern="yyyy-MM-dd"/>"> 
									</div>
									<div class="row mt-1 text-secondery">
										기존 날짜&nbsp;<fmt:formatDate value="${program.programDto.prg_apply_deadline}" pattern="yyyy.MM.dd"/>
									</div>
								</div>
							</div>
							
							<!-- 기업 주소 입력 -->
							<div class="row mt-3">
								<div class="col">
									<div class="row mb-1">
										프로그램 이미지 업로드 
									</div>
									<div class="row mb-3">
										<input class="form-control" name="updateimageFile" type="file" accept="image/*">
									</div>
									
									<div class="row mb-1">
										수정 전 이미지
									</div>
									 <div class="row">
										<img src="../../resources/img/employment/${program.programDto.prg_main_image}" class="image-fluid">
									</div>	
								</div>
							</div>
							
							<!-- 프로그램 내용 입력 -->
							<div class="row mt-3">
								<div class="col">
									<div class="row mb-1">
										프로그램 내용
									</div>
									<div class="row mb-3">
										<textarea class="form-control" name="prg_contents" rows="20" placeholder="프로그램 내용을 입력해주세요."> ${program.programDto.prg_contents}</textarea>
										
									</div>
								</div>
							</div>
							
							<!-- 프로그램 장소 입력 -->
							<div class="row mt-3">
								<div class="col">
									<div class="row mb-1">
										장소
									</div>
									<div class="row mb-3">
										<textarea class="form-control" name="prg_location" placeholder="프로그램 내용을 입력해주세요."> ${program.programDto.prg_location} </textarea>
									</div>
								</div>
							</div>
							
							<!-- 프로그램 수용인원 입력 -->
							<div class="row mt-3">
								<div class="col">
									<div class="row mb-1">
										수용인원
									</div>
									<div class="row mb-3">
										<input class="form-control form-control-sm" name="prg_apply_number" type="text" value="${program.programDto.prg_apply_number}">
									</div>
								</div>
							</div> 
							
							<!-- 프로그램 출석체크여부 입력 -->
							<div class="row mt-3">
								<div class="col">
									<div class="row mb-3">
										출석체크 여부
									</div>
									<div class="row mb-4">
										<div class="col"> 
											<input type="radio" name="prg_is_attend" class="form-check-input" value="Y"
												
											>&nbsp; 출석체크 있음
										</div>
										
										<div class="col">
											<input type="radio" name="prg_is_attend" class="form-check-input" value="N"
												>&nbsp; 출석체크 없음
										</div>
										<div class="col"></div>
									</div>
								</div>
							</div>
							
						</div>
						
						
						<div class="col-3"></div>
					</div>
					
					<div class="row mt-3 mb-2"> 
					
						<div class="col-3"></div>
						<div class="col d-grid"><input class="btn btn-primary" type="submit" value="등록하기"></div>
						<div class="col-4"></div>
						
					</div>
					
				</form>
					
			</div>
			
		</div>	
		<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
		<!-- futter -->
		<div class="row">
			<div class="col">
				<jsp:include page="../common/futter.jsp"></jsp:include>
			</div>
		</div>
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>